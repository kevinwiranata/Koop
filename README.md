## Koop
A Flutter project with Node.js Backend.
Flutter frontend follows Provider-Listener Design Pattern

For more information: https://pub.dev/packages/provider

https://medium.com/flutter-community/flutter-statemanagement-with-provider-ee251bbc5ac1

## Getting Started
Clone the project 
```
git clone https://github.com/kevinwiranata/Koop
cd Koop
```

*Important*
Note: Make sure to add your MarketStack API Key in your root level .env file
MARKET_STACK_API_KEY=YOUR_ACCESS_KEY_HERE

### Run the App on iOS/Android Emulator
Open Xcode / Android Studio and configure settings according to:

MacOS: https://flutter.dev/docs/get-started/install/macos

Windows: https://flutter.dev/docs/get-started/install/windows

Linux: https://flutter.dev/docs/get-started/install/linux

In the Koop directory (flutter), click Run -> Run Without Debugging in VSCode (or hit control + F5)

Use the terminal to change directory to the Backend directory, install node depencdencies and start the server.
```
cd Koop Backend
npm install
npm start
```