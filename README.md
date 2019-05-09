# numbered_rating

A new Flutter package project.

## How to use

    NumberedRating(
        onSelectRating: (val) {
          _selected = val;
        },
    )

## Screenshot

## Parameters

    /// starting number of rating
    final int minRating;

    ///end number of rating
    final int maxRating;

    /// set the width for one rating circle
    ///
    /// if this is not set, the widtch ranges from 70 to 100
    final double fixedItemWidth;

    /// Color of the circle
    final Color color;

    /// borderColor of the circle
    final Color borderColor;

    /// Color of the circle when selected
    ///
    /// this option also disables the animation!
    final Color selectedColor;

    /// Color of the border when selected
    ///
    /// this option also disables the animation!
    final Color selectedBorderColor;

    /// this is called when a user taps on a number
    final ValueChanged<int> onSelectRating;

## Getting Started

For help getting started with Flutter, view our
[online documentation](https://flutter.io/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
