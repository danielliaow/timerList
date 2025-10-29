# timerList

<img src="https://github.com/user-attachments/assets/368ac1ba-4364-4889-9d97-6df179b686f8" width="300" />

## Problem:

Efficiently display list of timers with on-screen-only updates

## Solution
Tap to toggle: Tap a row to pause/resume that timer.

Auto-pause off-screen: Timers pause when scrolled off-screen.

User pause persists: User-paused timers stay paused even when off-screen/on reappear.

Single driver: One TimelineView(.periodic(by: 0.01)) updates visible rows.


## Tech Stack

**Languages:** Swift + SwiftUI


## Run Locally

Clone the project

Open timerList-Daniel.xcodeproj in Xcode

Select an iOS Simulator

Build & run

## Notes
UI updates are synced to display refresh (~60 Hz), so 0.01s ticks are clamped visually.

Only visible list rows update, keeping performance smooth with many timers.

