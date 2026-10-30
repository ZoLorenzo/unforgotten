import SwiftUI

struct KitView: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        NavigationStack {
            ZStack {
                AuroraBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        PageTitle(eyebrow: "THE UNFORGOTTEN", title: "Kit")

                        ForEach(KitData.abilities) { ability in
                            AbilityCard(ability: ability)
                        }

                        PageTitle(eyebrow: "MUSCLE MEMORY", title: "Combos")
                            .padding(.top, 12)

                        ForEach(KitData.combos) { combo in
                            ComboCard(combo: combo)
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

struct PageTitle: View {
    @Environment(\.appTheme) private var theme
    let eyebrow: String
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(eyebrow)
                .font(.system(size: 12, weight: .bold))
                .tracking(4)
                .foregroundStyle(theme.linear)
            Text(title)
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(.white)
        }
        .padding(.top, 6)
    }
}

private struct AbilityCard: View {
    @Environment(\.appTheme) private var theme
    let ability: Ability

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Text(ability.key)
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous).fill(theme.linear)
                )
                .shadow(color: theme.primary.opacity(0.4), radius: 10, y: 4)

            VStack(alignment: .leading, spacing: 6) {
                Text(ability.name)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                Text(ability.detail)
                    .font(.system(size: 14))
                    .foregroundStyle(.white.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Image(systemName: "sparkle")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(theme.secondary)
                    Text(ability.tip)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(theme.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 2)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glass(cornerRadius: 22)
    }
}

private struct ComboCard: View {
    @Environment(\.appTheme) private var theme
    let combo: Combo

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(combo.name)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(Array(combo.inputs.enumerated()), id: \.offset) { index, input in
                        Text(input)
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Capsule().fill(Color.white.opacity(0.12)))
                            .overlay(Capsule().strokeBorder(theme.secondary.opacity(0.5), lineWidth: 1))
                        if index < combo.inputs.count - 1 {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.white.opacity(0.4))
                        }
                    }
                }
            }

            Text(combo.use)
                .font(.system(size: 14))
                .foregroundStyle(.white.opacity(0.75))
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glass(cornerRadius: 22)
    }
}
