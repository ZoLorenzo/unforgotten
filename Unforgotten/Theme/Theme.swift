import SwiftUI

// MARK: - Color helpers

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        let r = Double((hex >> 16) & 0xFF) / 255
        let g = Double((hex >> 8) & 0xFF) / 255
        let b = Double(hex & 0xFF) / 255
        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }

    static let ink = Color(hex: 0x07070D)
    static let inkRaised = Color(hex: 0x11111C)
}

// MARK: - Themes

/// Two looks: "Azakana" pulls from Yone's crimson demon blade and spirit-blue blade,
/// "Prismatic" runs the full rainbow.
enum AppTheme: String, CaseIterable, Identifiable {
    case azakana
    case prismatic

    var id: String { rawValue }

    var title: String {
        switch self {
        case .azakana: return "Azakana"
        case .prismatic: return "Prismatic"
        }
    }

    var subtitle: String {
        switch self {
        case .azakana: return "Crimson blade · spirit blue"
        case .prismatic: return "Full-spectrum chroma"
        }
    }

    var primary: Color {
        switch self {
        case .azakana: return Color(hex: 0xE5384F)
        case .prismatic: return Color(hex: 0xFF4FA3)
        }
    }

    var secondary: Color {
        switch self {
        case .azakana: return Color(hex: 0x46B8FF)
        case .prismatic: return Color(hex: 0x3DE6FF)
        }
    }

    var tertiary: Color {
        switch self {
        case .azakana: return Color(hex: 0x7B3FE4)
        case .prismatic: return Color(hex: 0xC6FF3D)
        }
    }

    /// Colors used for accents, strokes and the hero title.
    var spectrum: [Color] {
        switch self {
        case .azakana:
            return [Color(hex: 0xE5384F), Color(hex: 0x9B3FE0), Color(hex: 0x46B8FF)]
        case .prismatic:
            return [Color(hex: 0xFF3B5C), Color(hex: 0xFF9F1C), Color(hex: 0xFFE83D),
                    Color(hex: 0x3DFF8B), Color(hex: 0x3DE6FF), Color(hex: 0x5B6CFF),
                    Color(hex: 0xC03DFF), Color(hex: 0xFF3B5C)]
        }
    }

    var linear: LinearGradient {
        LinearGradient(colors: spectrum, startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    var angular: AngularGradient {
        AngularGradient(colors: spectrum + [spectrum[0]], center: .center)
    }

}

// MARK: - Environment

private struct AppThemeKey: EnvironmentKey {
    static let defaultValue: AppTheme = .azakana
}

extension EnvironmentValues {
    var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
