import SwiftUI

// MARK: - Glass surface

struct GlassSurface: ViewModifier {
    @Environment(\.appTheme) private var theme
    var cornerRadius: CGFloat
    var glow: Bool

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        return content
            .background {
                ZStack {
                    shape.fill(.ultraThinMaterial)
                    shape.fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.10), Color.white.opacity(0.02)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                }
            }
            .overlay {
                shape.strokeBorder(
                    LinearGradient(
                        colors: [Color.white.opacity(0.40), Color.white.opacity(0.06), theme.secondary.opacity(0.35)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
            }
            .shadow(color: glow ? theme.primary.opacity(0.25) : .black.opacity(0.35), radius: 22, x: 0, y: 12)
    }
}

extension View {
    func glass(cornerRadius: CGFloat = 24, glow: Bool = false) -> some View {
        modifier(GlassSurface(cornerRadius: cornerRadius, glow: glow))
    }
}

// MARK: - Animated aurora background

struct AuroraBackground: View {
    @Environment(\.appTheme) private var theme
    @State private var drift = false

    var body: some View {
        ZStack {
            Color.ink

            Circle()
                .fill(theme.primary.opacity(0.55))
                .frame(width: 380, height: 380)
                .blur(radius: 120)
                .offset(x: drift ? -150 : -70, y: drift ? -300 : -220)

            Circle()
                .fill(theme.secondary.opacity(0.45))
                .frame(width: 420, height: 420)
                .blur(radius: 130)
                .offset(x: drift ? 160 : 90, y: drift ? 160 : 260)

            Circle()
                .fill(theme.tertiary.opacity(theme == .prismatic ? 0.30 : 0.35))
                .frame(width: 300, height: 300)
                .blur(radius: 110)
                .offset(x: drift ? 120 : 40, y: drift ? -60 : -140)

            if theme == .prismatic {
                Circle()
                    .fill(theme.angular)
                    .frame(width: 520, height: 520)
                    .blur(radius: 150)
                    .opacity(0.22)
                    .rotationEffect(.degrees(drift ? 180 : 0))
            }

            // subtle grain / vignette
            RadialGradient(colors: [.clear, Color.black.opacity(0.55)], center: .center, startRadius: 200, endRadius: 600)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                drift = true
            }
        }
    }
}

// MARK: - Press feedback

struct PressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

// MARK: - Section card

struct SectionCard<Content: View>: View {
    let title: String
    let icon: String
    let accent: Color
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(accent)
                    .frame(width: 26, height: 26)
                    .background(accent.opacity(0.15), in: Circle())
                Text(title.uppercased())
                    .font(.system(size: 12, weight: .semibold))
                    .tracking(1.4)
                    .foregroundStyle(.white.opacity(0.7))
            }
            content
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glass(cornerRadius: 22)
    }
}

struct BulletRow: View {
    let text: String
    let symbol: String
    let color: Color

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(systemName: symbol)
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(color)
            Text(text)
                .font(.system(size: 15))
                .foregroundStyle(.white.opacity(0.88))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
