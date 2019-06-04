# MyResume Application

This is a simple application to show the Oliver Perez's knowledge, skills and experience as an iOS developer. 

## Summary
This application implements a coordinator architecture to favor the single responsability principle and testability, removing all the logic from the view controllers and letting the coordinator to handle the logic and navigation flows. The app also implements unit and UI tests. The networking layer is desinged using the singleton pattern. 

## Instructions
The targets of the project are written in Swift 4.2, so Xcode 10.1 or higher is needed to run them.

All the navigation flow and logic can be found in the  ```Coordinator``` class,  the networking layer is implemented in the ```Service``` class.  You can find the model in the   ```Profile``` file. In the  ```Constants``` enum, you can find the global constants, like names, custom colors and type aliases.  The  ```Storyboarded``` protocol it's extremely useful to instantiate view controllers both in the coordinator and the unit tests,  The rest of the app are the controllers, wich you can find them inside the  ```Controllers``` group. The app is almost fully tested, and all the tests methods are self descriptive, and are separated by tests classes, so you can refactor all the things you want and then run the Unit and UI tests to see if something were messed up.

_@Oliver Perez - ©2019_
