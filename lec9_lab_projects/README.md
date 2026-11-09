# Lecture 9 Lab Projects

Flutter navigation and routing examples for the five practical labs and the
Student Portal mini project. Run the app and choose a lab from the home screen.

## Practical labs

1. **Stack Navigation** - pushes a details route with `Navigator.push` and pops
   it with the AppBar Back button or `Navigator.pop`.
2. **Passing Data** - opens product details with a typed `Product` object.
3. **Returning a Result** - awaits a selected department and handles a `null`
   result when the selection route is dismissed.
4. **Drawer** - navigates among Home, Profile, and Settings after closing the
   drawer; Back returns through the pushed route stack.
5. **Tabs** - filters All, Active, and Completed courses with a `TabBar` and
   pushes course details from the selected tab.

## Student Portal mini project

The login screen collects a demo student name. Login uses
`Navigator.pushAndRemoveUntil` to replace the login and lab launcher history
with the dashboard. The Dashboard, Courses, Profile, and Settings destinations
are available from a shared drawer. Courses contains All, Active, and Completed
tabs; selecting a course pushes typed `PortalCourse` data to Course Details.
Profile pushes Edit Profile and receives the updated name when that route pops.
System/AppBar Back follows the regular route stack, including returning from
course details to the previously selected course tab.

## Route structure

```text
Lecture 9 lab launcher
├── Practical Lab 1: Home -> Details
├── Practical Lab 2: Product List -> Product Details
├── Practical Lab 3: Department Home -> Select Department -> result
├── Practical Lab 4: Home <-> Profile / Settings (drawer routes)
├── Practical Lab 5: All | Active | Completed -> Course Details
└── Student Portal Login
    └── Dashboard (login + launcher history removed)
        ├── Dashboard
        ├── Courses: All | Active | Completed -> Course Details
        ├── Profile -> Edit Profile -> updated name result
        └── Settings
```

Run checks from this folder:

```sh
flutter analyze
flutter test
```
