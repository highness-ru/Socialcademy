# Socialcademy

Socialcademy is a social media app for iOS built with SwiftUI and Firebase. It lets users create accounts, publish posts, comment, save favourites and manage a simple profile.

I originally built the project while following the Codecademy iOS Developer path and used it to practise structuring a larger SwiftUI app around views, view models, repositories and services rather than keeping backend and UI logic together.

## Features

* Create an account and sign in with email and password
* Create posts with a title, text and optional image
* View posts in a shared feed
* Add or remove posts from favourites
* Browse saved posts in a separate Favourites tab
* Open an author's posts from the feed
* Add and delete comments
* Delete posts when permitted
* Choose and update a profile image
* Sign out of the current account

## Tech Stack

* Swift
* SwiftUI
* Firebase Authentication
* Cloud Firestore
* Firebase Storage
* Swift Concurrency (`async` / `await`)
* `AsyncImage`

## Architecture

The project separates UI, state and data access into different layers:

* **Models** define users, posts and comments.
* **Views** contain the SwiftUI interface.
* **View Models** manage screen state and user actions.
* **Repositories** handle Firestore operations for posts and comments.
* **Services** handle authentication and profile updates.
* **Utilities** contain shared loading, state and Firebase storage helpers.
* **ViewModelFactory** creates view models with the dependencies they need.

This structure made it easier to keep Firebase code out of the views and to trace where data was being loaded or changed.

## Firebase

Socialcademy uses Firebase for its backend:

* **Authentication** for account creation, sign-in and sign-out
* **Cloud Firestore** for posts, comments and favourites
* **Firebase Storage** for post images and profile images

To run the project locally, you will need to connect it to your own Firebase project and add the appropriate `GoogleService-Info.plist` file.

## What I Learned

This project gave me practical experience with:

* connecting a SwiftUI app to a backend
* handling authentication state
* reading and writing Firestore data asynchronously
* uploading and retrieving images with Firebase Storage
* separating views from data-access logic
* using repositories and view models to keep responsibilities clearer
* handling loading states and errors around network-backed actions
* working with related data such as users, posts, comments and favourites

It also helped me understand how much easier a larger app is to maintain when UI, state and backend responsibilities are separated instead of being handled in the same view.

## Project Background

Socialcademy was built as part of my iOS development learning. The project gave me a chance to work with Firebase and practise organising a multi-screen SwiftUI application with authentication, persistent data and user-generated content.

## Author

Created by [Alisa Shuginova](https://github.com/highness-ru).
