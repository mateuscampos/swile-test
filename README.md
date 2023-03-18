# Welcome to Swile-Test

This repository contains source code for Swile Technical Test, so it follows some guidelines and must-haves, and it's 100% `SwiftUI`. Here you can find more.


# This app does the following:
## Required
- Create the transaction list;
- Be able to enter a view with transaction details by selecting a cell in the transaction list;
- Animate the transition between the transaction list and the detail of a transaction;
- Allow the user to go back to the transaction list using an animation that is the reverse of the one used to appear;
- Follow the design provided in the Figma project;
- - In Figma, the specification of the Font is `Segma`, but this Font was not available to download, and it's not free to use, so I decided to use the `Montserrat` Font because `Montserrat` is a widely used font that has a similar geometric feel to Segma, with clean lines and rounded edges;
- - Icons `cornerRadius`, this is a specification that I didn't find on Figma; I tried to approximate the "feel" using `cornerRadius`, but I got intrigued with not finding this specification, so I looked more into it and found [this content](https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui) from Paul Hudson, about custom paths and shapes, so with more time I would get through this way. 
- Uses MVVM architecture;
- Unit tests for the ViewModels
- - The total coverage of the files in percentual is 58% 
<img width="300" alt="Captura de Tela 2023-03-17 às 23 32 42" src="https://user-images.githubusercontent.com/5294550/226078742-422f73b1-e1a7-4969-94b1-f6ef5a2b9791.png">

## Not Required
- Supports Light and Dark Mode;
- - I used the tool [Adobe Color](https://color.adobe.com/pt/create/color-wheel) to find a suitable color match to dark mode since, in the Figma specifications, we have only the light mode, I decided to implement this to enrich the user's experience and to use as a concept in the color-tokens.
- Design System;
- - Here, I'm willing to show some handy options to deal with design tokens and components to gain in reuse and maintainability using this concept.
- Network and Services;
- - Here I'm willing to demonstrate a simple abstraction of `URLSession` and generic protocols to communicate with it, it was protocol based to facilitate tests with mocks;
- Helpers/Extensions;
- - Here, I'm looking to demonstrate how we can gain in reuse and maintainability by grouping these helpers in extensions accessible for all app contexts.
- Pull to Refresh.
- - It's a simple implementation but enriches the user's experience.

# This app does not:
- Infinite pagination (using the same list);
- Available offline;
- Reactive programming (Rx, Coroutines, etc.);
- - Besides SwiftUI reactive variables, nothing more solid was added to the project about Reactive programming.
- Dependency injection;
- - Some classes were based on this pattern but were not 100% applied, so I prefer not to include this as an extra delivery. 

# Demo
## light-mode
https://user-images.githubusercontent.com/5294550/226079397-3f1745e6-fafa-48b0-9b8f-4e897c95267d.mp4

## dark-mode
https://user-images.githubusercontent.com/5294550/226079411-22e89376-2992-4445-9bfc-1f71cad9b2b4.mp4


