# Project 4 - Memory Game

Submitted by: **Angelina Kimaz**

**Memory Game** is an app that allows users to play a matching game by flipping cards and finding matching emoji pairs.

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards is visible.
  - Cards are facedown to indicate the start of the game.
- [x] Users can tap cards to toggle their display between the back and the face:
  - Tapping on a facedown card flips it to reveal the emoji.
  - Tapping a second card that is not identical flips both cards back down.
- [x] When two matching cards are found, they both disappear from view:
  - The app checks whether two selected cards match.
  - Matching cards disappear.
  - Non-matching cards return to the facedown position.
- [x] User can reset the game and start a new game via a button:
  - The Reset Game button shuffles the cards and resets the game.

The following **optional** features are implemented:

- [x] User can select the number of pairs to play with.
  - Users can choose between 3, 6, and 10 pairs.
- [x] App allows the user to scroll to see pairs out of view.
- [x] Added custom UI with colored buttons, blue cards, emojis, and animations.

The following **additional** features are implemented:

- [x] Cards use different emojis for each matching pair.
- [x] Cards are shuffled when the game is reset.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

[Video Walkthrough] (https://www.loom.com/share/b2269f302a9342e1ad9d0e3311688398)

## Notes

One challenge was getting the card matching logic and scrolling to work correctly. I also had to make sure the correct number of cards appeared when changing the number of pairs.

## License

    Copyright 2026 Angelina Kimaz

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
