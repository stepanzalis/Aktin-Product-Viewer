# Aktin Product Viewer

This repository contains Aktin's home task mobile application.

![Recording](images/record.gif)

&nbsp;

# Getting Started

## ⚙️ Setup

- This project is build with **Flutter 3.24.0** and uses fvm ([Flutter Version Manager](https://fvm.app/))
- Using fvm is highly recommended, because there is .fvm config dir commited in source to sync Flutter versions for all developers

The app has currently 1 environment:

- `DEV`
  - using `https://fakestoreapi.com/` of REST API
  - package name `cz.stepanzalis.aktin_product_viewer`
  - app name `Aktin (dev)`
  - env app suffix `dev`

Append this commands when running run or build command with chosen flavor:

- `--dart-define-from-file=.env/development.json`

  - defines:
    - REST API url
    - defines package name suffix

- When using VSCode, there is a `launch.json` file with predefined configurations for running and building the app with the DEV flavor

### 📚 Libraries

- [flutter_bloc](https://bloclibrary.dev) (state management)
- [get_it](https://pub.dev/packages/get_it) (service locator)
- [Dio](https://pub.dev/packages/dio) (HTTP client)
- [go_router](https://pub.dev/packages/go_router) (routing)
- [drift](https://pub.dev/packages/drift) (SQLite ORM)

# 🏠 Architecture

- State management is done with BLoC (flutter_bloc)
- The app is built with a modified clean architecture approach

- It's divided into features (modules) and each feature has its own folder

  - `application` - contains business logic
  - `domain` - contains entities
  - `config` - contains configuration, DI and navigation
  - `infrastructure` - contains implementation of repositories, DTOs, services
  - `presentation` - contains UI (pages & widgets)

- Each feature should be independent and should not depend on other features except for the core module, which contains shared code
- Each feature has its own `{name}_feature.dart` file, which contains all dependencies for the current feature like blocs, repositories, services, etc.

### How to create a new feature?

1. Create a new folder in the `lib/features` directory
2. Create the following folders inside the new feature folder: `application`, `domain`, `config`, `infrastructure`, `presentation`
3. Create a `{name}_feature.dart` file in the feature folder
4. Create a `{name}_injection.dart` file in the `feature/{name}/config/di` directory which extends the `InjectableFeature` class
5. Feature registration is done in the `config/di/injection.dart` file

# 🐛 Testing

- The app has unit tests for business logic, repositories and services
- The app has widget tests for UI using [Patrol](https://patrol.leancode.co/)
