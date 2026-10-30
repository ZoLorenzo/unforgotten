import SwiftUI

enum SortMode: String, CaseIterable, Identifiable {
    case hardest = "Hardest first"
    case easiest = "Easiest first"
    case name = "A–Z"
    var id: String { rawValue }
}

struct HomeView: View {
    @Environment(\.appTheme) private var theme
    @State private var search = ""
    @State private var lane: Lane? = nil
    @State private var sort: SortMode = .hardest
    @State private var path = NavigationPath()

    private let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]

    private var filtered: [Matchup] {
        var list = MatchupData.all
        if let lane { list = list.filter { $0.lanes.contains(lane) } }
        let query = search.trimmingCharacters(in: .whitespaces)
        if !query.isEmpty {
            list = list.filter {
                $0.name.localizedCaseInsensitiveContains(query) || $0.role.localizedCaseInsensitiveContains(query)
            }
        }
        switch sort {
        case .hardest:
            return list.sorted { ($0.difficulty.rawValue, $1.name) > ($1.difficulty.rawValue, $0.name) }
        case .easiest:
            return list.sorted { ($0.difficulty.rawValue, $0.name) < ($1.difficulty.rawValue, $1.name) }
        case .name:
            return list.sorted { $0.name < $1.name }
        }
    }

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                AuroraBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        HomeHeader()
                        HeroCard(count: MatchupData.all.count)
                        SearchField(text: $search)
                        FilterBar(lane: $lane, sort: $sort)
                        grid
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 8)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
                .scrollDismissesKeyboard(.immediately)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Matchup.self) { matchup in
                MatchupDetailView(matchup: matchup)
            }
        }
    }

    @ViewBuilder
    private var grid: some View {
        if filtered.isEmpty {
            VStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 28))
                Text("No matchups found")
                    .font(.headline)
            }
            .foregroundStyle(.white.opacity(0.6))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 40)
        } else {
            LazyVGrid(columns: columns, spacing: 14) {
                ForEach(filtered) { matchup in
                    NavigationLink(value: matchup) {
                        MatchupCard(matchup: matchup)
                    }
                    .buttonStyle(PressableStyle())
                }
            }
        }
    }
}

// MARK: - Pieces

private struct HomeHeader: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("UNFORGOTTEN")
                .font(.system(size: 12, weight: .bold))
                .tracking(4)
                .foregroundStyle(theme.linear)
            Text("Matchups")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(.white)
        }
        .padding(.top, 6)
    }
}

private struct HeroCard: View {
    @Environment(\.appTheme) private var theme
    let count: Int

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Yone_0.jpg")) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFill()
                } else {
                    Rectangle().fill(theme.linear).opacity(0.5)
                }
            }
            .frame(height: 190)
            .frame(maxWidth: .infinity)
            .clipped()
            .overlay {
                LinearGradient(colors: [.clear, Color.black.opacity(0.7)], startPoint: .top, endPoint: .bottom)
            }

            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Yone")
                        .font(.system(size: 26, weight: .bold))
                    Text("Tap a character sheet to scout the lane.")
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.75))
                }
                Spacer()
                VStack(spacing: 0) {
                    Text("\(count)")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Text("sheets")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .glass(cornerRadius: 16)
            }
            .foregroundStyle(.white)
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .strokeBorder(theme.linear, lineWidth: 1.2)
                .opacity(0.7)
        )
        .shadow(color: theme.primary.opacity(0.3), radius: 24, y: 12)
    }
}

private struct SearchField: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white.opacity(0.6))
            TextField("", text: $text, prompt: Text("Search champion or role").foregroundColor(.white.opacity(0.45)))
                .foregroundStyle(.white)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white.opacity(0.5))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 13)
        .glass(cornerRadius: 18)
    }
}

private struct FilterBar: View {
    @Environment(\.appTheme) private var theme
    @Binding var lane: Lane?
    @Binding var sort: SortMode

    var body: some View {
        HStack(spacing: 8) {
            chip("All", selected: lane == nil) { lane = nil }
            ForEach(Lane.allCases) { item in
                chip(item.rawValue, selected: lane == item) { lane = item }
            }
            Spacer()
            Menu {
                Picker("Sort", selection: $sort) {
                    ForEach(SortMode.allCases) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 38, height: 38)
                    .glass(cornerRadius: 19)
            }
        }
    }

    private func chip(_ title: String, selected: Bool, action: @escaping () -> Void) -> some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) { action() }
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(selected ? .white : .white.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
                .background {
                    if selected {
                        Capsule().fill(theme.linear).opacity(0.85)
                    }
                }
                .glass(cornerRadius: 20)
        }
        .buttonStyle(PressableStyle())
    }
}

// MARK: - Character sheet card

struct MatchupCard: View {
    @Environment(\.appTheme) private var theme
    let matchup: Matchup

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                ChampionAvatar(key: matchup.id, name: matchup.name, size: 54)
                Spacer()
                PillTag(text: matchup.difficulty.label, color: matchup.difficulty.color)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(matchup.name)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                Text(matchup.role)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
                    .lineLimit(1)
            }

            DifficultyMeter(difficulty: matchup.difficulty, height: 5)

            HStack(spacing: 6) {
                ForEach(matchup.lanes) { lane in
                    Text(lane.rawValue.uppercased())
                        .font(.system(size: 10, weight: .bold))
                        .tracking(1)
                        .foregroundStyle(.white.opacity(0.55))
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white.opacity(0.4))
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glass(cornerRadius: 22)
    }
}
