# Expense Tracker App

This is a comprehensive Expense Tracker app developed during my internship at CodeClause. The app allows users to manage their expenses efficiently by categorizing and visualizing their spending patterns. This project was recognized in the Golden category, reflecting its quality and functionality.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Tech Stack](#tech-stack)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **User Authentication:** Secure login and registration with Firebase Authentication.
- **Expense Management:** Add and categorize expenses into Transport, Entertainment, Miscellaneous, and Food.
- **Real-Time Pie Chart:** Visualize your spending with an interactive pie chart using `fl_chart`.
- **Cloud Storage:** Data is stored and managed securely using Firebase Firestore, with real-time updates.

## Installation

To get started with the Expense Tracker app, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/strikleApp/CODECLAUSE_expense_tracker.git
   ```
2. **Navigate to the Project Directory**
   ```bash
   cd CODECLAUSE_expense_tracker
   ```
3. **Install Dependencies**
   ```bash
   flutter pub get
   ```
4. **Set Up Firebase:**
    - Follow the Firebase documentation to set up a Firebase project.
    - Add your `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to the appropriate directory.
5. **Run the App**
   ```bash
   flutter run
   ```

## Usage

1. **Open the App:** Launch the app on your Android or iOS device.
2. **Log In/Register:** Use Firebase Authentication to log in or create a new account.
3. **Manage Expenses:** Add new expenses and categorize them as Transport, Entertainment, Miscellaneous, or Food.
4. **View Spending Patterns:** Use the real-time pie chart to visualize your spending habits.
5. **Toggle Modes:** Adjust settings or preferences as needed.

## Tech Stack

- **Flutter**: Framework for building cross-platform mobile applications.
- **Firebase**: Provides backend services such as Authentication and Firestore.
- **Packages Used**:
    - `intl`: For date and time formatting.
    - `fl_chart`: For creating interactive charts.
    - `firebase_core`, `cloud_firestore`, `firebase_auth`: For Firebase integration.

## Contributing

Contributions are welcome! If you would like to improve the app or suggest new features, please fork this repository and submit a pull request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/YourFeature`)
3. Commit your Changes (`git commit -m 'Add some YourFeature'`)
4. Push to the Branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or feedback, feel free to reach out:

- **Email:** [techaashish05@gmail.com](mailto:techaashish05@gmail.com)
- **LinkedIn:** [Aashish Kumar](https://www.linkedin.com/in/aashish05kumar/)