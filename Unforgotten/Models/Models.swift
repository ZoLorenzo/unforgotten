import SwiftUI

enum Lane: String, CaseIterable, Identifiable, Hashable {
    case mid = "Mid"
    case top = "Top"
    var id: String { rawValue }
}

enum Difficulty: Int, CaseIterable, Comparable, Hashable {
    case favored = 1
    case skill = 2
    case even = 3
    case tough = 4
    case counter = 5

    static func < (lhs: Difficulty, rhs: Difficulty) -> Bool { lhs.rawValue < rhs.rawValue }

    var label: String {
        switch self {
        case .favored: return "Favored"
        case .skill: return "Skill lane"
        case .even: return "Even"
        case .tough: return "Tough"
        case .counter: return "Counter"
        }
    }

    var color: Color {
        switch self {
        case .favored: return Color(hex: 0x3DDC97)
        case .skill: return Color(hex: 0x7BD3FF)
        case .even: return Color(hex: 0xF5C451)
        case .tough: return Color(hex: 0xFF8A4C)
        case .counter: return Color(hex: 0xFF4D6A)
        }
    }
}

struct Matchup: Identifiable, Hashable {
    /// Data Dragon champion key, e.g. "DrMundo". Used for portraits.
    let id: String
    let name: String
    let role: String
    let lanes: [Lane]
    let difficulty: Difficulty
    let summary: String
    let keyThreat: String
    let respect: [String]
    let gamePlan: [String]
    let powerSpikes: String
    let buildAdjust: String

    var portraitPath: String { "img/champion/\(id).png" }
    var splashURL: URL? { URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(id)_0.jpg") }
}

struct Ability: Identifiable {
    let key: String
    let name: String
    let detail: String
    let tip: String
    var id: String { key }
}

struct Combo: Identifiable {
    let name: String
    let inputs: [String]
    let use: String
    var id: String { name }
}

struct NoteItem: Identifiable {
    let name: String
    let note: String
    var id: String { name }
}
