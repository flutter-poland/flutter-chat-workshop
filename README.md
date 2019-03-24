# Flutter Chat

This is a simple chat app written in Flutter with Firestore backend. It was inspired by this [dribbble shot](https://dribbble.com/shots/5167230-Messenger/attachments/1134622).

![Screenshot on Android and iOS](img/screenshots.png "Screenshots on Android and iOS")

It was created during Flutter Warsaw workshop #1 on March 23, 2019.

It contains already prepared google-services.json and GoogleService-Info.plist files, but they will stop working soon in the future, so you may need to recreate them in your own Firebase console by following [this guide](https://firebase.google.com/docs/flutter/setup). 

## Getting Started

This project uses Firebase and Firestore to work.

Please run `flutter upgrade` before. The project was developed with Flutter 1.3.8 initially.

## Prepare Firestore database

Before starting you should have prepared your Firestore database as follows:

1. Add collection `rooms`
2. In `rooms` add new document with auto id and following fields:
  - `name` : string
  - `lastMessage` : map
    - `avatar` : string
    - `from` : string
    - `content` : string
    - `id` : string
    - `timestamp` : timestamp
3. Initially set all the security rules as public. Remember to [turn them off](https://firebase.google.com/docs/firestore/security/get-started) later to protect your account quota.

# Part 1

Commits `82f9648` - `6cf58d1`

At this point you have a simple one page app with Firebase and other small details preconfigured like file structure or required packages and plugins.

In this part we're going to write a basic login page `login_page.dart`, `chat_rooms_page.dart` and initial layout of `messages_page.dart`.

# Part 2

Commits `a1ec3a4` - `742dd3b`

In this part we're goting to develop models for storing chat rooms and messages across the app in:

- `chat_room.dart`
- `chat_rooms_model.dart`
- `message.dart`
- `messages_model.dart`

We're going to use Scoped Model to update views after fetching from or uploading data to Firestore.

# Part 3

Bugfixes in later commits

We found that on iOS there's a problem with parsing timestamps, so in order to solve this we had to convert timestamp to date i.e.

```diff
    return Message._new()
      ..id = map['id']
      ..content = map['content']
      ..from = map['from']
-      ..timestamp = map['timestamp']
+      ..timestamp = convertTimestamp(map['timestamp']);
```

# About

Thank you all for helping Flutter Warsaw team to organize our first workshop ever.

See more on [Flutter Warsaw Meetup](https://www.meetup.com/Flutter-Warsaw/).