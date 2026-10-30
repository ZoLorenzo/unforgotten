import SwiftUI

struct SettingsView: View {
    @Environment(\.appTheme) private var theme
    @AppStorage("theme") private var themeRaw: String = AppTheme.azakana.rawValue

    var body: some View {
        NavigationStack {
            ZStack {
                AuroraBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        PageTitle(eyebrow: "PERSONALIZE", title: "Theme")

                        ForEach(AppTheme.allCases) { option in
                            ThemeTile(option: option, selected: option.rawValue == themeRaw) {
                                withAnimation(.easeInOut(duration: 0.5)) { themeRaw = option.rawValue }
                            }
                        }

                        SectionCard(title: "About", icon: "info.circle.fill", accent: theme.secondary) {
                            Text("Unforgotten is a personal Yone field guide: matchup sheets, kit breakdowns and a standard build. Champion portraits load live from Riot's Data Dragon, so they stay current each patch.")
                                .font(.system(size: 14))
                                .foregroundStyle(.white.opacity(0.8))
                                .fixedSize(horizontal: false, vertical: true)
                            Text("Unofficial fan project. Not endorsed by Riot Games. League of Legends and its champions are trademarks of Riot Games, Inc.")
                                .font(.system(size: 12))
                                .foregroundStyle(.white.opacity(0.5))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, 8)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

private struct ThemeTile: View {
    let option: AppTheme
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Circle()
                    .fill(option.angular)
                    .frame(width: 52, height: 52)
                    .overlay(Circle().fill(Color.ink).padding(14))
                    .shadow(color: option.primary.opacity(0.5), radius: 10)

                VStack(alignment: .leading, spacing: 3) {
                    Text(option.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                    Text(option.subtitle)
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.65))
                }
                Spacer()
                Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22))
                    .foregroundStyle(selected ? option.secondary : Color.white.opacity(0.3))
            }
            .padding(16)
            .glass(cornerRadius: 22, glow: selected)
            .overlay {
                if selected {
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .strokeBorder(option.linear, lineWidth: 1.5)
                }
            }
        }
        .buttonStyle(PressableStyle())
    }
}
