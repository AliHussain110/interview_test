# Speedforce Interview Task

This is a Flutter app built as part of the Speedforce hiring task. It includes a **login screen**, **signup screen**, **home screen**, and **profile screen**. The app follows best practices for Flutter development, including state management, responsive design, and error handling.

---

## Features

1. **Login Screen**:
   - Users can log in using their email and password.
   - Validates email and password fields.
   - Uses static credentials for login:
     - Email: `user@speedforce.com`
     - Password: `password`
   - Simulates a mock API call for login.
   - Includes a "Remember Me" feature using **Shared Preferences**.
   - Displays error messages for invalid credentials or validation errors.
   - Navigates to the home screen upon successful login.

2. **Signup Screen**:
   - Allows new users to register with name, email, password, and confirm password fields.
   - Validates all fields:
     - Name: Not empty.
     - Email: Valid format.
     - Password: Minimum length requirement.
     - Confirm Password: Matches the password field.
   - Navigates to the home screen after successful validation.

3. **Home Screen**:
   - Displays a welcome message with the user’s email.
   - Shows basic details and total earnings in the header.
   - Includes an invitation to join the app.

4. **Profile Screen**:
   - Displays user information fetched from the mock API.
   - Includes a button to Log out.

---
## Dependencies

- **[flutter_riverpod](https://pub.dev/packages/flutter_riverpod)**: For state management.
- **[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)**: For responsive design.
- **[go_router](https://pub.dev/packages/go_router)**: For navigation.
- **[shared_preferences](https://pub.dev/packages/shared_preferences)**: For local storage (Remember Me feature).


---

## Screenshots

### Splash Screen
![Splash Screen](/preview/1.jpg)[width = 200, height = 200]

### Login Screen
![Login Screen](/preview/2.png)
![Login Screen](/preview/3.png)

### Signup Screen
![Signup Screen](/preview/10.png)
![Signup Screen](/preview/11.png)

### Home Screen
![Home Screen](/preview/6.png)

### Profile Screen
![Profile Screen](/preview/8.png)

---

## Demo Video

[![Demo Video](/preview/1.jpg)](/preview/video.mp4)

---

## Setup Instructions


1. **Clone the repository**:
   ```bash
   git clone https://github.com/AliHussain110/interview_test.git
   cd interview_test

2. **APK FILE ATTACHED**:
   -see the apk file for preview

2. **Run the app**:
   -easy solution would be if you just download the lib, assets and pub.dependency folder and create a new flutter project in your local pc and paste these file in the folder and do flutter pub get
   the project will run easily