import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

/// widget for displaying animated rating choose numbers
///
/// When [selectedColor] or [selectedBorderColor] is set, the animation is disabled
/// if the number of selectable ratings is lower than 5,
/// it will build a [Row] with spaceEvenly alignment
/// otherwise it will be an vertical scrolling Listview
class NumberedRating extends StatefulWidget {
  NumberedRating(
      {Key key,
      int minRating,
      int maxRating,
      this.fixedItemWidth,
      this.color,
      this.borderColor,
      this.selectedColor,
      this.selectedBorderColor,
      this.onSelectRating})
      : minRating = minRating ?? 1,
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
      ratings.add(_buildRating(context, i));
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

  Widget _buildRating(BuildContext context, int index) {
    final isSelected = _selectedValue == index;
    final hasSelectedColors =
        widget.selectedBorderColor != null || widget.selectedColor != null;
    final color = isSelected
        ? widget.selectedColor ?? Theme.of(context).backgroundColor
        : widget.color ?? Theme.of(context).scaffoldBackgroundColor;
    final borderColor = isSelected
        ? widget.selectedBorderColor ?? Theme.of(context).buttonColor
        : widget.borderColor ?? Theme.of(context).textTheme.body1.color;
    final borderWidth = isSelected ? 4.0 : 1.0;
    final lowerCircle = hasSelectedColors
        ? Container()
        : isSelected
            ? _buildSpinningAnimation(borderColor, "Spinning Circle")
            // i draw a smaller idle Animation below the not selected Circle
            // for smoother click feeling, because
            // flare flashes when it is built with animation,
            // maybe there is a better solution
            : _buildSpinningAnimation(borderColor, "idle");
    final upperCircle = !hasSelectedColors && isSelected
        ? Container()
        : _buildCircle(color, borderColor, borderWidth);
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          lowerCircle,
          upperCircle,
          _buildText(index),
        ],
      ),
      onTap: () => _select(index),
    );
  }

  Center _buildText(int index) {
    return Center(
      child: Container(
        height: _ratingWidth,
        // color: Colors.brown,
        width: _ratingWidth,
        child: Center(
          child: Text(
            index.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Container _buildCircle(Color color, Color borderColor, double borderWidth) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: _ratingWidth,
      height: _ratingWidth,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: borderColor, width: borderWidth)),
        ),
      ),
    );
  }

  _select(int index) {
    setState(() {
      _selectedValue = index;
      if (widget.onSelectRating != null) {
        widget.onSelectRating(index);
      }
    });
  }

  Widget _buildSpinningAnimation(Color borderColor, String animation) {
    final edgeinsets = (animation == 'idle') ? 10.0 : 4.0;

    return Container(
      padding: EdgeInsets.all(edgeinsets),
      width: _ratingWidth,
      height: _ratingWidth,
      child: Center(
        child: FlareActor("packages/numbered_rating/flare/spinning.flr",
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            animation: animation),
      ),
    );
  }
}
