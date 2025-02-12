# Phone Dialer App

## Overview
This is a Phone Dialer application built using Flutter. The app allows users to make phone calls, view recent call logs, and manage contacts. It effectively utilizes device permissions to fetch call logs and manage contacts efficiently.

## Features
### 1. Dial Pad
- A user-friendly dial pad resembling a traditional phone keypad.
- Users can input numbers and initiate a call.

### 2. Call History
- Displays recent call logs (incoming, outgoing, and missed calls).
- Fetches call logs using device permissions.

### 3. Contacts Management
- Save new contacts.
- List stored contacts.
- Implemented a simple search functionality.

### 4. Error Handling & Debugging
- Proper handling of permissions.
- Displays appropriate error messages when necessary.

## Technical Implementation
- **Framework:** Flutter
- **State Management:** Provider
- **Dependencies:**
    - `call_log` (for accessing call logs)
    - `contacts_service` (for managing contacts)
    - `permission_handler` (for requesting necessary permissions)
- **Platform Support:** Android (API 24 and above)
- **UI/UX:** Modern and efficient design for an enhanced user experience.

## Issues Faced & Resolutions
### 1. Build.gradle Issues
- **Issue:** The build was failing due to outdated `build.gradle` files in external plugins (`call_log` and `contacts_service`).
- **Resolution:**
    - Updated the `build.gradle` files to include `namespace` (as required by newer Gradle versions).
    - Modified dependencies to align with the latest Flutter and Android versions.

### 2. Namespace Error
- **Issue:** Error stating `Namespace not specified`.
- **Resolution:** Added `namespace` in the `android` section of `build.gradle`.

### 3. AndroidManifest.xml Conflict
- **Issue:** Incorrect package declaration in `AndroidManifest.xml` for `contacts_service`.
- **Resolution:** Removed `package` attribute and defined `namespace` in `build.gradle`.

## Installation & Setup
### Prerequisites
- Flutter installed ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install))
- Android SDK configured

### Steps to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/ayushhthakurr/phone_dialer.git
   ```
2. Navigate to the project directory:
   ```bash
   cd phone_dialer
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```



