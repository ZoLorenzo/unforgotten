# Unforgotten: a Yone field guide for iPhone

SwiftUI app (iOS 17+). It has four tabs:

- **Matchups**: a glass "character sheet" grid with 27 matchups across mid and top. You can search, filter by lane, and sort by difficulty. Tap a sheet to see the threat to play around, what to respect, your game plan, power spikes and build changes.
- **Kit**: Yone's passive and abilities with tips, plus combo strings.
- **Build**: skill order, runes, core items and situational items.
- **Theme**: switch between **Azakana** (crimson blade + spirit blue) and **Prismatic** (full rainbow).

Champion portraits and splash art load live from Riot's Data Dragon, so they stay current every patch. Offline, the app shows gradient monograms instead.

---

## Install on your iPhone without a Mac

The code builds in the cloud on GitHub's free Mac runners. Sideloadly then signs it and puts it on your phone from Windows.

### 1. Put the project on GitHub
1. Create a **private** repo on github.com (e.g. `unforgotten`).
2. Upload everything in this folder (`project.yml`, `README.md`, and the `Unforgotten/` folder).
3. Browsers often skip hidden folders when you upload, so add the workflow by hand: **Add file → Create new file**, name it `.github/workflows/build-ipa.yml`, paste in the contents of that file from this zip, then commit.

### 2. Build the app
1. Open the repo's **Actions** tab, pick **Build iPhone app (.ipa)**, and click **Run workflow**. Every push to `main` also starts a build.
2. After about 5–8 minutes, open the finished run and download the **Unforgotten-ipa** artifact. Unzip it to get `Unforgotten.ipa`.

### 3. Sideload with Sideloadly (Windows)
1. Install **iTunes** and **iCloud** using the versions from apple.com, not the Microsoft Store versions. Then install **Sideloadly**.
2. Plug in your iPhone and tap **Trust** on the phone.
3. Drag `Unforgotten.ipa` into Sideloadly, enter your Apple ID, and click **Start**.
4. On the iPhone:
   - Go to **Settings → General → VPN & Device Management** and trust your Apple ID.
   - Turn on **Settings → Privacy & Security → Developer Mode** if iOS asks for it.

**How long it lasts:** a free Apple ID re-signs every 7 days. Re-run Sideloadly to refresh, and your data stays. A paid Apple Developer Program account lasts 1 year per install.

If Sideloadly complains about the bundle ID, change `com.zo.unforgotten` in `project.yml` to something unique.

---

## If you ever get a Mac
```bash
brew install xcodegen
xcodegen generate
open Unforgotten.xcodeproj
```
Choose your team under Signing & Capabilities, plug in your iPhone, and press Run.

## Project layout
```
Unforgotten/
  App/          App entry, root view, tab bar
  Theme/        Azakana + Prismatic palettes
  Components/   Glass surfaces, aurora background, portraits, difficulty meter
  Models/       Matchup / Ability / Combo types
  Data/         Matchup sheets + kit/build content (edit these to add matchups)
  Views/        Splash, Matchups grid, Matchup detail, Kit, Build, Theme
```

**Adding a matchup:** append a `Matchup(...)` entry in `Data/MatchupData.swift`. The `id` must be the champion's Data Dragon key (e.g. `DrMundo`, `MonkeyKing` for Wukong) so its portrait loads.

---
Unofficial fan project. Not endorsed by Riot Games.
