# AI-Weather

AI-Weather is a Flutter-based mobile application that provides real-time weather updates and AI-based activity predictions. The app leverages clean architecture principles to ensure maintainability and scalability.

## Features

- **User Authentication**: Login and registration using Firebase.

## App Architecture

The app follows clean architecture, structured in three layers:

- **Presentation Layer**: Manages the UI and state with BLoC/Cubit for smooth state management.
- **Domain Layer**: Contains the core business logic, use cases, and entities.
- **Data Layer**: Interacts with external APIs (Weather API) and Firebase for authentication.

## Technologies Used

- **Flutter**: For cross-platform mobile development.
- **Firebase**: For user authentication.

## Installation

### Clone the repository:
```bash
git clone https://github.com/osamaabdo536/AI-Weather.git
```
### Navigate to the project directory:
```bash
cd AI-Weather
```
### Install the dependencies:
```bash
flutter pub get
```
### Run the app:
```bash
flutter run
```
