import SwiftUI

@main
struct UnforgottenApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @AppStorage("theme") private var themeRaw: String = AppTheme.azakana.rawValue
    @State private var showSplash = true

    private var theme: AppTheme { AppTheme(rawValue: themeRaw) ?? .azakana }

    var body: some View {
        ZStack {
            MainTabView()
                .opacity(showSplash ? 0 : 1)

            if showSplash {
                SplashView {
                    withAnimation(.easeInOut(duration: 0.6)) { showSplash = false }
                }
                .transition(.opacity)
            }
        }
        .environment(\.appTheme, theme)
        .tint(theme.secondary)
        .preferredColorScheme(.dark)
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Matchups", systemImage: "square.grid.2x2.fill") }
            KitView()
                .tabItem { Label("Kit", systemImage: "wand.and.rays") }
            BuildView()
                .tabItem { Label("Build", systemImage: "hammer.fill") }
            SettingsView()
                .tabItem { Label("Theme", systemImage: "paintpalette.fill") }
        }
    }
}

#Preview {
    RootView()
}
