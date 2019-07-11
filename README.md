# numbered_rating

A Flutter package for an numbered rating choser.

## How to use

    NumberedRating(
        onSelectRating: (val) {
          _selected = val;
        },
    )

## Screenshot

<img src="https://github.com/autlunatic/flutter_numbered_rating/blob/master/screenshots/example.png?raw=true" width="240"/>
<img src="https://github.com/autlunatic/flutter_numbered_rating/blob/master/screenshots/screen.gif?raw=true" width="240"/>

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
    final Color selectedColor;

    /// Color of the border when selected
    final Color selectedBorderColor;

    /// this is called when a user taps on a number
    final ValueChanged<int> onSelectRating;

    /// changes the select animation
    ///
    /// Possible Values:
    /// simple: no animation, only selectedColor is used
    /// animatedCircle: Animation is used (default)
    /// check: Check Icon Animation is used
    final SelectMode selectMode;

## Contribution

Contributions and critics are welcome
