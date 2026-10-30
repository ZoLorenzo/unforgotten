import SwiftUI

struct MatchupDetailView: View {
    @Environment(\.appTheme) private var theme
    let matchup: Matchup

    var body: some View {
        ZStack(alignment: .top) {
            AuroraBackground()
            ScrollView {
                VStack(spacing: 0) {
                    DetailHeader(matchup: matchup)
                    VStack(spacing: 14) {
                        AtAGlance(matchup: matchup)

                        SectionCard(title: "Play around", icon: "scope", accent: matchup.difficulty.color) {
                            Text(matchup.keyThreat)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionCard(title: "Respect", icon: "exclamationmark.triangle.fill", accent: Color(hex: 0xFF8A4C)) {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(matchup.respect, id: \.self) { line in
                                    BulletRow(text: line, symbol: "diamond.fill", color: Color(hex: 0xFF8A4C))
                                }
                            }
                        }

                        SectionCard(title: "Your game plan", icon: "checkmark.seal.fill", accent: theme.secondary) {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(Array(matchup.gamePlan.enumerated()), id: \.offset) { index, line in
                                    StepRow(index: index + 1, text: line)
                                }
                            }
                        }

                        SectionCard(title: "Power spikes", icon: "bolt.fill", accent: theme.primary) {
                            Text(matchup.powerSpikes)
                                .font(.system(size: 15))
                                .foregroundStyle(.white.opacity(0.88))
                                .fixedSize(horizontal: false, vertical: true)
                        }

                        SectionCard(title: "Build adjustment", icon: "hammer.fill", accent: theme.tertiary) {
                            Text(matchup.buildAdjust)
                                .font(.system(size: 15))
                                .foregroundStyle(.white.opacity(0.88))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .padding(.horizontal, 18)
                    .padding(.top, -40)
                    .padding(.bottom, 40)
                }
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

private struct DetailHeader: View {
    @Environment(\.appTheme) private var theme
    let matchup: Matchup

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            SplashArt(url: matchup.splashURL, height: 340)

            HStack(spacing: 14) {
                ChampionAvatar(key: matchup.id, name: matchup.name, size: 68)
                VStack(alignment: .leading, spacing: 4) {
                    Text("YONE VS")
                        .font(.system(size: 11, weight: .bold))
                        .tracking(3)
                        .foregroundStyle(theme.linear)
                    Text(matchup.name)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                    Text(matchup.role)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 56)
        }
    }
}

private struct AtAGlance: View {
    let matchup: Matchup

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                PillTag(text: matchup.difficulty.label, color: matchup.difficulty.color)
                ForEach(matchup.lanes) { lane in
                    PillTag(text: lane.rawValue)
                }
                Spacer()
                Text("\(matchup.difficulty.rawValue)/5")
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .foregroundStyle(matchup.difficulty.color)
            }
            DifficultyMeter(difficulty: matchup.difficulty, height: 7)
            Text(matchup.summary)
                .font(.system(size: 15))
                .foregroundStyle(.white.opacity(0.9))
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(18)
        .glass(cornerRadius: 22, glow: true)
    }
}

private struct StepRow: View {
    @Environment(\.appTheme) private var theme
    let index: Int
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(index)")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .frame(width: 22, height: 22)
                .background(Circle().fill(theme.linear))
            Text(text)
                .font(.system(size: 15))
                .foregroundStyle(.white.opacity(0.88))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
