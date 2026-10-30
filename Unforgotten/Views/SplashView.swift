import SwiftUI

/// Two blades — crimson and spirit blue — cut across the screen, then the title settles in.
struct SplashView: View {
    @Environment(\.appTheme) private var theme
    var onFinish: () -> Void

    @State private var bladeProgress: CGFloat = 0
    @State private var showTitle = false
    @State private var glow = false

    var body: some View {
        ZStack {
            Color.ink.ignoresSafeArea()

            Circle()
                .fill(theme.primary.opacity(glow ? 0.35 : 0.0))
                .frame(width: 320, height: 320)
                .blur(radius: 90)
                .offset(x: -60, y: -40)
            Circle()
                .fill(theme.secondary.opacity(glow ? 0.35 : 0.0))
                .frame(width: 320, height: 320)
                .blur(radius: 90)
                .offset(x: 60, y: 40)

            VStack(spacing: 36) {
                ZStack {
                    BladeStroke(leading: true)
                        .trim(from: 0, to: bladeProgress)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .foregroundStyle(theme.primary)
                        .shadow(color: theme.primary, radius: 12)
                    BladeStroke(leading: false)
                        .trim(from: 0, to: bladeProgress)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                        .foregroundStyle(theme.secondary)
                        .shadow(color: theme.secondary, radius: 12)
                }
                .frame(width: 150, height: 150)

                VStack(spacing: 10) {
                    Text("UNFORGOTTEN")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .tracking(8)
                        .foregroundStyle(theme.linear)
                    Text("A Yone field guide")
                        .font(.system(size: 14, weight: .medium))
                        .tracking(2)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 12)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) { bladeProgress = 1 }
            withAnimation(.easeInOut(duration: 1.0).delay(0.3)) { glow = true }
            withAnimation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.6)) { showTitle = true }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { onFinish() }
        }
    }
}

/// A slightly curved diagonal stroke, like a sword slash.
struct BladeStroke: Shape {
    let leading: Bool

    func path(in rect: CGRect) -> Path {
        var p = Path()
        if leading {
            p.move(to: CGPoint(x: rect.minX + rect.width * 0.08, y: rect.maxY - rect.height * 0.04))
            p.addQuadCurve(
                to: CGPoint(x: rect.maxX - rect.width * 0.04, y: rect.minY + rect.height * 0.08),
                control: CGPoint(x: rect.midX - rect.width * 0.12, y: rect.midY - rect.height * 0.12)
            )
        } else {
            p.move(to: CGPoint(x: rect.minX + rect.width * 0.04, y: rect.minY + rect.height * 0.08))
            p.addQuadCurve(
                to: CGPoint(x: rect.maxX - rect.width * 0.08, y: rect.maxY - rect.height * 0.04),
                control: CGPoint(x: rect.midX + rect.width * 0.12, y: rect.midY - rect.height * 0.12)
            )
        }
        return p
    }
}
