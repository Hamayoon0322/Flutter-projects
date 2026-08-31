# Student Profile App

This is a very simple beginner Flutter project for a student profile assignment.

## Hot Reload explanation

Flutter Hot Reload updates the running app quickly without normally restarting the whole application. It is useful when you make small changes to the code while testing the UI.

During Hot Reload, the current app state is usually preserved. For example, if the biography is currently hidden or shown and you press Hot Reload, the app usually keeps that current state. This is different from Hot Restart, which restarts the whole application and resets the state.

## Widget Tree

MaterialApp
└── StudentProfilePage
    └── Scaffold
        ├── AppBar
        │   └── Text
        └── Padding
            └── Column
                ├── StudentInfo
                │   ├── Text
                │   ├── Text
                │   └── Text
                ├── Theme
                │   └── Text
                ├── ElevatedButton
                └── ElevatedButton
