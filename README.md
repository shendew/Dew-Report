<div align="center">

# 🦠 Dew Report

**A cross-platform COVID-19 tracking app built with Flutter**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.6+-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/platforms-Android%20|%20iOS%20|%20Web%20|%20Desktop-brightgreen?style=flat-square)](https://github.com/shendew/Dew-Report)

*Stay informed. Stay safe.*

</div>

---

## 📋 About

**Dew Report** is a cross-platform COVID-19 reporting application built with **Flutter & Dart**. It fetches real-time pandemic data via HTTP and presents it in a clean, visually appealing interface with custom typography. The app targets Android, iOS, Web, and Desktop from a single codebase.

---

## ✨ Features

- 📊 **Live COVID-19 Data** — Real-time stats fetched via REST API using the `http` package
- 🌍 **Cross-Platform** — Runs on Android
- 🎨 **Custom Typography** — Styled with **Jaro** and **Poppins** font families
- 🖼️ **Asset Support** — Custom images and icons bundled within the app
- 💡 **Material Design** — Clean, modern UI using Flutter's Material component library

---


## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) **3.x or later**
- Dart SDK **^3.6.0** (bundled with Flutter)
- Android Studio / VS Code with Flutter plugin
- A connected device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/shendew/Dew-Report.git
   cd Dew-Report
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```
   To target a specific platform:
   ```bash
   flutter run -d chrome       # Web
   flutter run -d windows      # Windows desktop
   flutter run -d android      # Android device/emulator
   ```

---

## 🗂️ Project Structure

```
Dew-Report/
├── android/          # Android platform code
├── ios/              # iOS platform code
├── web/              # Web platform entry point
├── linux/            # Linux desktop support
├── macos/            # macOS desktop support
├── windows/          # Windows desktop support
├── lib/              # Dart source code (main app logic)
├── assets/           # Images and other static assets
├── fonts/
│   ├── Jaro-Regular-VariableFont_opsz.ttf
│   └── Poppins-Medium.ttf
├── test/             # Unit and widget tests
├── pubspec.yaml      # Project dependencies & metadata
└── README.md
```

---

## 🛠️ Built With

| Package | Version | Purpose |
|---------|---------|---------|
| [Flutter](https://flutter.dev) | 3.x | Cross-platform UI framework |
| [Dart](https://dart.dev) | ^3.6.0 | Programming language |
| [http](https://pub.dev/packages/http) | ^1.2.2 | REST API calls & data fetching |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | ^1.0.8 | iOS-style icons |
| Jaro & Poppins | — | Custom font families |

---

## 📦 Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

---

## 🤝 Contributing

Contributions are welcome! Here's how:

1. **Fork** the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push the branch: `git push origin feature/your-feature`
5. Open a **Pull Request**

Please ensure your code passes `flutter analyze` before submitting.

---

## 🐛 Reporting Issues

Found a bug? Please [open an issue](https://github.com/shendew/Dew-Report/issues) and include:
- Flutter & Dart version (`flutter --version`)
- Target platform
- Steps to reproduce
- Expected vs. actual behavior

---

## 📄 License

This project is licensed under the **Apache 2.0 License** — see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Shehara Dewanagala**

- GitHub: [@shendew](https://github.com/shendew)

---

<div align="center">

Made with 💙 using [Flutter](https://flutter.dev) by [shendew](https://github.com/shendew)

⭐ If you found this project useful, consider giving it a star!

</div>
