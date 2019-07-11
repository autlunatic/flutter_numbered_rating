import 'package:flutter/material.dart';
import 'package:selectable_circle/selectable_circle.dart';

export 'package:selectable_circle/selectable_circle.dart';

/// widget for displaying animated rating choose numbers
///
/// When [selectedColor] or [selectedBorderColor] is set, the animation is disabled
/// if the number of selectable ratings is lower than 5,
/// it will build a [Row] with spaceEvenly alignment
/// otherwise it will be an vertical scrolling Listview
class NumberedRating extends StatefulWidget {
  NumberedRating({
    Key key,
    int minRating,
    int maxRating,
    this.onSelectRating,
    this.fixedItemWidth,
    this.color,
    this.borderColor,
    this.selectedColor,
    this.selectedBorderColor,
    this.selectMode,
  })  : minRating = minRating ?? 1,
        maxRating = maxRating ?? 5,
        super(key: key);

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

  /// changes the selectmode
  ///
  /// Possible Values:
  /// simple: no animation, only selectedColors are used
  /// animatedCircle: Animation is used (default)
  /// check: Check Icon Animation is used
  final SelectMode selectMode;

  _NumberedRatingState createState() => _NumberedRatingState();
}

class _NumberedRatingState extends State<NumberedRating> {
  int _selectedValue = 0;
  double _ratingWidth = 70.0;

  @override
  Widget build(BuildContext context) {
    if (widget.fixedItemWidth == null) {
      final screenWidth = (MediaQuery.of(context).size.width - 20);
      final maxWidth = screenWidth / 5;
      _ratingWidth = screenWidth / (widget.maxRating - widget.minRating + 1);
      if (_ratingWidth < 70.0) {
        _ratingWidth = 70.0;
      }
      if (_ratingWidth > maxWidth) {
        _ratingWidth = maxWidth;
      }
    } else {
      _ratingWidth = widget.fixedItemWidth;
    }

    final ratings = <Widget>[];
    for (var i = widget.minRating; i <= widget.maxRating; i++) {
      ratings.add(new SelectableCircle(
        isSelected: _selectedValue == i,
        width: _ratingWidth,
        color: widget.color,
        borderColor: widget.borderColor,
        selectedColor: widget.selectedColor,
        selectedBorderColor: widget.selectedBorderColor,
        selectMode: widget.selectMode,
        key: widget.key,
        onTap: () => _select(i),
        child: _buildText(i.toString()),
      ));
    }
    final container = ratings.length < 5
        ? Row(
            children: ratings, mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        : ListView(
            scrollDirection: Axis.horizontal,
            children: ratings,
          );
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: _ratingWidth,
        child: container);
  }

  _select(int index) {
    setState(() {
      _selectedValue = index;
      if (widget.onSelectRating != null) {
        widget.onSelectRating(index);
      }
    });
  }

  Center _buildText(String text) {
    return Center(
      child: Container(
        height: _ratingWidth,
        width: _ratingWidth,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
