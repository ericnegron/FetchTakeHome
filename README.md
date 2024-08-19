# FetchTakeHome
The FetchTakeHome app allows a user to see recipes for popular deserts.
It uses [TheMealDB](https://themealdb.com/api.php) public API to show a list of desserts and their respective recipes.

<img src="https://github.com/user-attachments/assets/d29d2bb0-c076-4fe9-b764-0ee2e6e3b5a7" height="300">
<img src="https://github.com/user-attachments/assets/595c97b8-1a3a-44de-bc00-f6fe10277021" height="300">
<img src="https://github.com/user-attachments/assets/3b51ebdc-6981-4a53-853d-1aa22b0a377d" height="300">
<img src="https://github.com/user-attachments/assets/194fbdf7-bf5e-4859-96d1-2092823a86df" height="300">

## Getting Started
The FetchTakeHome app should run directly in the Xcode simulator for ease of testing.  No external dependencies are required.
1. Ensure you have the latest version of [Xcode](https://developer.apple.com/xcode/)
2. Download the source code from the repo.
3. Open FetchChallenge.xcodeproj
4. Run the active scheme.

## Architecture
The FetchTakeHome app uses the Model-View-ViewModel (MVVM) architecture.

## Structure
- App: The main entry point.
- Components: Shared UI elements used throughout the app.
- Core: The main features of the app.
- Model: The models used by the Views and ViewModels.
- Networking: The main networking and error handling code.
- Extensions: Color and Error extensions.
- Utilities: Helpers for constructing custom errors and alerting.
- Resources: Main application assets.
- Preview Content:  Includes mock data, test data, preivew helpers.
- FetchChallengeTests: Unit testing for the app.

##### &copy; Eric Negrón, 2024

###### Additional Credit:  
###### Launch Screen Image:  Ann Tukhfatullina at [Pexels.com](https://www.pexels.com/photo/close-up-photo-of-dessert-on-top-of-the-jar-2638026/)
