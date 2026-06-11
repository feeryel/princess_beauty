# Princess Beauty — Flutter App

A premium beauty marketplace mobile application faithfully built from the provided Figma designs.

## Screens Implemented

| Screen | Route | Description |
|--------|-------|-------------|
| Splash | `/` | Animated brand intro with model background |
| Onboarding | `/onboarding` | 3-page carousel with feature highlights |
| Welcome | `/welcome` | Landing with social login options |
| Register | `/register` | Email + password sign-up form |
| Fill Profile | `/fill-profile` | Profile completion with avatar picker |
| Login | `/login` | Sign-in form with social options |
| Forget Password | `/forget-password` | Reset method selection (SMS / Email) |
| OTP Verify | `/otp-verify` | 4-digit code input |
| Create Password | `/create-password` | New password form |
| Success | `/success` | Confirmation screen |

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| Rose Mauve | `#C26A82` | Borders, indicators, accents |
| Warm Brown | `#735138` | Wordmark, warm tones |
| Deep Crimson | `#933952` | Primary action buttons |
| Dark Wine | `#4B2A2B` | Cards, deep backgrounds |
| Blush Pink | `#FFD5D7` | Links, highlights |

## Tech Stack

- **Flutter** 3.x
- **google_fonts** — Playfair Display (headings) + Inter (body)
- **smooth_page_indicator** — Onboarding dots
- **pin_code_fields** — OTP input
- State: `setState` (screens are independent; no complex global state needed)

## Project Structure

```
lib/
├── main.dart              # App entry, routes
├── theme/
│   └── app_theme.dart     # Colors, text styles, ThemeData
├── widgets/
│   └── common_widgets.dart # Shared UI components
└── screens/
    ├── splash_screen.dart
    ├── onboarding_screen.dart
    ├── welcome_screen.dart
    ├── register_screen.dart
    ├── fill_profile_screen.dart
    ├── login_screen.dart
    └── auth_screens.dart   # Forget pwd, OTP, Create pwd, Success
assets/
├── images/
│   ├── splash_model.png    # Background model photo
│   ├── logo_mark.png       # Crown mark (white)
│   ├── logo_type.png       # "Princess" wordmark (white)
│   ├── profile_photo.png   # Demo profile avatar
│   ├── onboard_icon1.png   # Tailored Services 3D icon
│   ├── onboard_icon2.png   # Book With Ease 3D icon
│   └── onboard_icon3.png   # Top-Rated Experts 3D icon
```

## Running the App

```bash
# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run

# Build release APK
flutter build apk --release

# Build iOS (requires macOS + Xcode)
flutter build ipa
```

## Design Notes

- All screens use a warm dark gradient (`#5C2030 → #3A1A1C → #4B2A2B`) matching the Figma palette
- Typography pairs **Playfair Display** for headings with **Inter** for UI copy — elegant yet readable
- Glass-morphism input fields with `roseMauve` borders at 30% opacity
- Navigation uses named routes for clear separation; each screen is a self-contained `StatelessWidget` or minimal `StatefulWidget`
- Images gracefully fall back to icon placeholders if assets are missing
