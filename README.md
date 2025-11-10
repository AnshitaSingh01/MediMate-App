# 💊 MediMate – Flutter Medicine Reminder App

### 📱 Project Overview
*MediMate* is a Flutter-based mobile application that helps users manage their daily medicines and reminders efficiently.  
It provides a clean interface to add medicines, view schedules, and get timely notifications so users never miss a dose.  

Developed as part of the *Excelerate Flutter Internship (Week 4 Final Deliverable)*, this project showcases complete app functionality, UI design, data handling, and GitHub documentation skills.

---

### 🎯 Purpose
MediMate aims to simplify health management by:
- Allowing users to *add and track their medications* easily.  
- Sending *notifications and reminders* for timely doses.  
- Maintaining a smooth and consistent *Flutter-based interface*.  
- Demonstrating core app development concepts for learning and portfolio use.

---

### ⚙ Key Features
- 🔐 *Login Screen* – Entry point for user authentication.  
- 🏠 *Home Screen* – Central dashboard for easy navigation.  
- ➕ *Add Medicine Screen* – Add name, dose, and time for each medicine.  
- 📋 *Medicine List Screen* – View all scheduled medicines.  
- 💬 *Feedback Form* – Submit feedback or registration form.  
- 🔔 *Notification Service* – Local reminders using notification integration.  
- 🧾 *JSON Data Integration* – Loads and stores medicine details locally.  
- 🎨 *Themed UI (Teal)* – Consistent and user-friendly design.  
- ⏱ *Smooth Navigation* – Fast screen transitions with Material Design.  

---

### 🧰 Tech Stack
- *Flutter (Dart)*  
- *Local JSON File* – for data persistence  
- *Notification Service* – for medicine reminders  
- *Material Design* – for modern UI/UX  

---

### 🚀 How to Run the App

```bash
# Clone this repository
git clone https://github.com/AnshitaSingh09/MediMate-App.git

# Navigate into the project folder
cd MediMate-App

# Install required dependencies
flutter pub get

# Run the app
flutter run

| Screen        | Preview                                       |
| ------------- | --------------------------------------------- |
| Login         | ![Login](assets/screenshots/login.png)        |
| Home          | ![Home](assets/screenshots/home.png)          |
| Add Medicine  | ![Add](assets/screenshots/add_medicine.png)   |
| Medicine List | ![List](assets/screenshots/medicine_list.png) |
| Feedback      | ![Feedback](assets/screenshots/feedback.png)  |

lib/
│
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── add_medicine_screen.dart
│   ├── medicine_list_screen.dart
│   └── feedback_screen.dart
│
├── services/
│   └── notification_service.dart
│
└── assets/
    └── medicine_data.json
💡 What I Learned

Setting up Flutter from scratch and building a complete app.

Designing multi-screen navigation with clean UI.

Managing app data using JSON and Dart structures.

Implementing notifications and local reminders.

Using GitHub for version control and collaboration.

🧠 Challenges Overcome

Handling JSON data integration and UI state management.

Debugging notification scheduling issues.

Ensuring smooth navigation and layout consistency.

Structuring app files professionally for submission
👩‍💻 Developer Information

Name: Anshita Singh
Course: B.Tech CSE (2nd Year)
Role: Flutter Developer Intern
Program: Excelerate Global Internship 2025
📍 India
| Version | Update                                |
| ------- | ------------------------------------- |
| v1.0.0  | Initial release with UI screens       |
| v1.1.0  | Added notifications and feedback form |
| v1.2.0  | Integrated JSON data and improved UX  |

📚 Acknowledgements

Special thanks to the Excelerate Team for providing a hands-on learning experience that enhanced my Flutter development, UI design, and project management skills.
📎 Submission Details

GitHub Repository Link: https://github.com/AnshitaSingh09/MediMate-App
Reflection Video:https://drive.google.com/file/d/1lY3WMEX2Uls15Ui1RTeE3Bdw41tMPVlH/view?usp=drive_link

✅ This README fulfills the Excelerate Final Week Deliverable requirements: project overview, purpose, setup guide, screenshots, changelog, and reflection details

