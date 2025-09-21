# 📱 Contact Management App

A modern Flutter application for managing contacts with a beautiful dark theme UI and comprehensive input validation.

## ✨ Features

### 📋 Contact Management
- **Add Contacts**: Create new contacts with name, email, phone, and profile image
- **View Contacts**: Grid layout displaying contact cards with all information
- **Delete Contacts**: Remove contacts with confirmation dialog for safety
- **Empty State**: Beautiful Lottie animation when no contacts exist

### 🔐 Input Validation
- **Name Field**: Letters and spaces only, 2-50 characters
- **Email Field**: Comprehensive email validation with proper regex pattern
- **Phone Field**: Numbers only, 8-15 digits with international support
- **Real-time Validation**: Instant feedback with clear error messages

### 🎨 UI/UX Features
- **Dark Theme**: Modern navy blue and cream color scheme
- **Responsive Design**: Grid layout that adapts to different screen sizes
- **Custom Widgets**: Reusable components with consistent styling
- **Image Picker**: Add profile photos from gallery with Lottie animations
- **Smooth Animations**: Polished user experience with proper transitions

## 🏗️ Architecture

### 📁 Project Structure
```
lib/
├── core/
│   ├── utils/
│   │   ├── app_colors.dart     # Color palette constants
│   │   └── app_assets.dart     # Asset path constants
│   └── widgets/
│       ├── app_text_field.dart # Custom text input widget
│       └── contact_card.dart   # Contact display widget
├── models/
│   └── contact_model.dart      # Contact data model
├── screens/
│   ├── home_screen.dart        # Main contact list screen
│   └── add_contact_screen.dart # Add contact form screen
└── main.dart                   # App entry point
```

### 🎯 Key Components
- **Contact Model**: Simple data class with id, name, email, phone, and imagePath
- **Home Screen**: Displays contact grid with add/delete functionality
- **Add Contact Screen**: Bottom sheet form with validation and image picker
- **Contact Card**: Reusable widget showing contact info with delete button
- **App Text Field**: Custom input field with validation support

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Git

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/Aliahmed1202/contact-app-.git
   cd contact-app-
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### Core Dependencies
- `flutter_svg: ^2.0.10` - SVG image support
- `google_fonts: ^6.2.1` - Poppins font family
- `lottie: ^3.0.0` - Animations for empty state and image picker
- `image_picker: ^1.0.7` - Gallery image selection
- `intl: ^0.19.0` - Internationalization support

### Dev Dependencies
- `flutter_test` - Testing framework
- `flutter_lints: ^5.0.0` - Linting rules
- `flutter_native_splash: ^2.4.1` - Splash screen configuration

## 🎨 Design System

### Color Palette
- **Primary**: Navy Blue (`#1E293B`)
- **Secondary**: Cream (`#FFF1D4`)
- **Background**: Dark Blue (`#0F172A`)
- **Accent**: Light Beige (`#F9EEDC`)
- **Error**: Red (`#E74C3C`)

### Typography
- **Font Family**: Poppins (Google Fonts)
- **Weights**: Regular (400), Medium (500), SemiBold (600)

## 🔧 Configuration

### Assets
Make sure to add your custom icons to:
- `assets/icons/email.png` - Email icon
- `assets/icons/phone.png` - Phone icon

### Lottie Animations
- `assets/images/empty_list.json` - Empty state animation
- `assets/images/image_picker.json` - Image picker animation

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📱 Supported Platforms
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Ali Ahmed** - [@Aliahmed1202](https://github.com/Aliahmed1202)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for the beautiful Poppins font
- Lottie team for smooth animations
- Community contributors and testers

---

⭐ **Star this repository if you found it helpful!**
