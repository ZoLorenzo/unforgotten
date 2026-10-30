import SwiftUI

/// Resolves the latest Data Dragon version once, so portraits stay current every patch.
actor DDragon {
    static let shared = DDragon()
    private var version: String?
    private let fallback = "16.16.1"

    func currentVersion() async -> String {
        if let version { return version }
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/api/versions.json") else { return fallback }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let list = try JSONDecoder().decode([String].self, from: data)
            let resolved = list.first ?? fallback
            version = resolved
            return resolved
        } catch {
            return fallback
        }
    }
}

/// Square champion portrait with a gradient monogram fallback for offline use.
struct ChampionAvatar: View {
    @Environment(\.appTheme) private var theme
    let key: String
    let name: String
    var size: CGFloat = 60

    @State private var url: URL?

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: size * 0.3, style: .continuous)
        ZStack {
            shape.fill(theme.linear).opacity(0.55)
            Text(String(name.prefix(1)))
                .font(.system(size: size * 0.42, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            if let url {
                AsyncImage(url: url, transaction: Transaction(animation: .easeOut(duration: 0.25))) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill().transition(.opacity)
                    } else {
                        Color.clear
                    }
                }
            }
        }
        .frame(width: size, height: size)
        .clipShape(shape)
        .overlay(shape.strokeBorder(Color.white.opacity(0.25), lineWidth: 1))
        .task(id: key) {
            let v = await DDragon.shared.currentVersion()
            url = URL(string: "https://ddragon.leagueoflegends.com/cdn/\(v)/img/champion/\(key).png")
        }
    }
}

/// Wide splash image used for headers; fades to the theme background.
struct SplashArt: View {
    let url: URL?
    var height: CGFloat = 320

    var body: some View {
        AsyncImage(url: url, transaction: Transaction(animation: .easeOut(duration: 0.4))) { phase in
            if let image = phase.image {
                image.resizable().scaledToFill()
            } else {
                Color.inkRaised
            }
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .clipped()
        .overlay {
            LinearGradient(
                colors: [.clear, Color.ink.opacity(0.4), Color.ink],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
}

struct DifficultyMeter: View {
    let difficulty: Difficulty
    var height: CGFloat = 6

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { level in
                Capsule()
                    .fill(level <= difficulty.rawValue ? difficulty.color : Color.white.opacity(0.12))
                    .frame(height: height)
            }
        }
    }
}

struct PillTag: View {
    let text: String
    var color: Color = .white

    var body: some View {
        Text(text)
            .font(.system(size: 11, weight: .semibold))
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.14), in: Capsule())
    }
}
