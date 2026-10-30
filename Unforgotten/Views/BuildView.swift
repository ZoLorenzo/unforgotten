import SwiftUI

struct BuildView: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        NavigationStack {
            ZStack {
                AuroraBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        PageTitle(eyebrow: "STANDARD SETUP", title: "Build")

                        SectionCard(title: "Skill order", icon: "list.number", accent: theme.secondary) {
                            HStack(spacing: 10) {
                                ForEach(Array(KitData.skillOrder.enumerated()), id: \.offset) { index, key in
                                    Text(key)
                                        .font(.system(size: 18, weight: .heavy, design: .rounded))
                                        .foregroundStyle(.white)
                                        .frame(width: 44, height: 44)
                                        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(theme.linear))
                                    if index < KitData.skillOrder.count - 1 {
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.white.opacity(0.4))
                                    }
                                }
                                Spacer()
                            }
                            Text("Take R at 6, 11 and 16.")
                                .font(.system(size: 13))
                                .foregroundStyle(.white.opacity(0.65))
                        }

                        SectionCard(title: "Runes", icon: "circle.hexagongrid.fill", accent: theme.primary) {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(KitData.keystones) { keystone in
                                    NamedNote(name: keystone.name, note: keystone.note)
                                }
                                Divider().overlay(Color.white.opacity(0.15))
                                RuneRow(label: "Precision", items: KitData.primaryRunes)
                                RuneRow(label: "Resolve", items: KitData.secondaryRunes)
                                RuneRow(label: "Shards", items: KitData.shards)
                            }
                        }

                        SectionCard(title: "Core items", icon: "shield.lefthalf.filled", accent: theme.secondary) {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(Array(KitData.coreItems.enumerated()), id: \.offset) { index, item in
                                    HStack(alignment: .top, spacing: 12) {
                                        Text("\(index + 1)")
                                            .font(.system(size: 12, weight: .bold, design: .rounded))
                                            .foregroundStyle(.white)
                                            .frame(width: 22, height: 22)
                                            .background(Circle().fill(theme.linear))
                                        NamedNote(name: item.name, note: item.note)
                                    }
                                }
                            }
                        }

                        SectionCard(title: "Situational", icon: "arrow.triangle.branch", accent: theme.tertiary) {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(KitData.situational) { item in
                                    NamedNote(name: item.name, note: item.note)
                                }
                            }
                        }

                        Text("Builds shift every patch. This setup reflects common high-elo Yone builds through Patch 26.19 — double-check in the client before a ranked game.")
                            .font(.system(size: 12))
                            .foregroundStyle(.white.opacity(0.5))
                            .padding(.horizontal, 4)
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

private struct NamedNote: View {
    let name: String
    let note: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
            Text(note)
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.7))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct RuneRow: View {
    let label: String
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label.uppercased())
                .font(.system(size: 10, weight: .bold))
                .tracking(1.5)
                .foregroundStyle(.white.opacity(0.5))
            FlowTags(items: items)
        }
    }
}

/// Simple wrapping row of tags.
private struct FlowTags: View {
    let items: [String]

    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack(spacing: 6) { tags }
            VStack(alignment: .leading, spacing: 6) { tags }
        }
    }

    @ViewBuilder
    private var tags: some View {
        ForEach(items, id: \.self) { item in
            Text(item)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.white.opacity(0.10)))
        }
    }
}
