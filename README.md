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

## Screenshots 📱

The app includes the following screens:
- **Splash Screen**: App initialization and loading
- **Onboarding**: Welcome screen for new users
- **Home Screen**: Main dashboard with cat breed listings
- **Details Screen**: Detailed view of individual cat breeds
- **Favorites Screen**: User's favorite cat breeds

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



**Happy Coding! 🎉**
