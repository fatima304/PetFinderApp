# Pet Finder App 🐱

A Flutter application for discovering and managing cat breeds with a beautiful, modern UI. This app allows users to browse cat breeds, view detailed information, and manage their favorite cats.

## Features ✨

- **Cat Breed Discovery**: Browse through various cat breeds with detailed information
- **Search Functionality**: Search for specific cat breeds
- **Favorites Management**: Add and remove cats from your favorites list
- **Detailed Views**: View comprehensive information about each cat breed
- **Modern UI**: Clean, responsive design with custom theming
- **State Management**: Built with Flutter Bloc for efficient state management
- **API Integration**: Real-time data from cat breed APIs
- **Comprehensive Testing**: Unit, widget, and integration tests

## Project Structure 📁

```
lib/
├── core/                    # Core functionality
│   ├── di/                 # Dependency injection
│   ├── helper/             # Helper classes and constants
│   ├── network/            # Network configuration
│   ├── routes/             # App routing
│   ├── theme/              # App theming
│   └── widgets/            # Reusable widgets
├── features/               # Feature modules
│   ├── details/            # Cat details feature
│   ├── favourite/          # Favorites feature
│   ├── home/               # Home screen feature
│   ├── onboarding/         # Onboarding feature
│   └── splash/             # Splash screen feature
└── main.dart               # App entry point
```

## Configuration ⚙️

### API Configuration

The app uses external APIs for cat breed data. API configuration can be found in:
- `lib/core/network/api_constants.dart`
- `lib/core/network/dio_factory.dart`

### Theme Configuration

Custom theming is configured in:
- `lib/core/theme/app_color.dart`
- `lib/core/theme/app_text_style.dart`
- `lib/core/theme/font_family_helper.dart`

## Testing 🧪

This project includes comprehensive testing:

### Unit Tests
- **Repository Tests**: Testing data layer functionality
- **Cubit Tests**: Testing state management logic
- **Widget Tests**: Testing UI components

### Integration Tests
- **End-to-End Tests**: Testing complete user flows
- **Navigation Tests**: Testing screen transitions
- **API Integration Tests**: Testing real API interactions

### Test Results

✅ **Unit Tests**: 19/19 passed  
✅ **Integration Tests**: 6/6 passed  
✅ **Widget Tests**: All components tested


### Branch Strategy
- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/*`: Feature development branches
- `api_branch`: link API with UI 
- `test_branch`: Testing and validation branch


### Pull Request Process
1. Create feature branch from `develop`
2. Implement changes with tests
3. Create pull request with detailed description
4. Code review and approval
5. Merge to `develop` 

- **Base URL**: Configured in `api_constants.dart`
- **Endpoints**: 
  - `/breeds` - Get all cat breeds

## Screenshots 📱
<img width="300" height="500" alt="splash" src="https://github.com/user-attachments/assets/b122f73a-45a7-4e7b-9f0e-ec31cff44281" />
<img width="300" height="500" alt="onboarding" src="https://github.com/user-attachments/assets/026eef15-643b-4608-b66d-09f2708a0d41" />
<img width="300" height="500" alt="home" src="https://github.com/user-attachments/assets/5cd5b543-0aaf-4f24-8e3f-40532ab83dcc" />
<img width="300" height="500" alt="home_" src="https://github.com/user-attachments/assets/78180ab7-4949-41f1-a195-17444d54c9c4" />
<img width="300" height="500" alt="fav" src="https://github.com/user-attachments/assets/657fdc90-aba2-40f6-b45b-480573fc6f9c" />
<img width="300" height="500" alt="details" src="https://github.com/user-attachments/assets/2db1d6e3-a955-446a-9117-55b7070c2f5f" />
