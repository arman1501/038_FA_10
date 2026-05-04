# Purple Auth Flow — Flutter UI

A modern Flutter authentication UI built with a purple watercolour-inspired design.
This project focuses on creating a visually appealing and smooth user authentication experience.

## Key Features

* Simple and user-friendly authentication flow
* Custom-designed background using `CustomPainter`
* Smooth screen transitions
* Adaptive layout for multiple screen sizes

## Navigation Flow

* Welcome → Sign In
* Sign In ↔ Sign Up
* Successful login → Home

## Screens

* **Welcome Screen** (`splash_screen.dart`)

  * Full-screen styled background
  * Entry point of the app

* **Sign In Screen** (`signin_screen.dart`)

  * Email and password input interface

* **Sign Up Screen** (`signup_screen.dart`)

  * Registration with password confirmation

* **Home Screen** (`home_screen.dart`)

  * Main dashboard after authentication

## Design Specifications

* Primary Color: `#6B3FA0` (Purple tone)
* Background rendering via Flutter `CustomPainter`
* Visual elements include gradients, paint splashes, and layered wave patterns

## Installation & Run

Execute the following commands:

```bash
flutter pub get
flutter run
```

## System Requirements

* Flutter SDK ≥ 3.10.0
* Dart SDK ≥ 3.0.0

## Author Information

© 2026 Md. Arman Hussan | Student ID: 0182410012101038 | Section: 63A

This project is developed for academic purposes.
Copying without proper modification is strongly discouraged.
