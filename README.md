# ID_FA_10 — Flutter Authentication UI

A Flutter application implementing a purple watercolor-themed authentication flow based on provided UI mockups.

## Screens

| Screen | File | Description |
|--------|------|-------------|
| Welcome Back | `splash_screen.dart` | Full-screen watercolor BG + Next button |
| Sign In | `signin_screen.dart` | Email & password login |
| Sign Up | `signup_screen.dart` | Email, password & confirm register |
| Home | `home_screen.dart` | Post-authentication screen |

## Design

- **Primary color**: `#6B3FA0` (deep purple)
- **Background**: Custom `CustomPainter` with gradient, paint splatter dots, wash patches, and concentric wave lines
- **Navigation**: Splash → Sign In ↔ Sign Up → Home

## Getting Started

```bash
flutter pub get
flutter run
```

Requires Flutter SDK ≥ 3.10.0 and Dart ≥ 3.0.0.
