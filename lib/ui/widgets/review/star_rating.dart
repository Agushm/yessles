part of '../widgets.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int? starCount;
  final double? rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final double? size;
  final MainAxisAlignment? mainAxisAlignment;
  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      this.onRatingChanged,
      this.color,
      this.size,
      this.mainAxisAlignment});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating!) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.grey,
        size: size,
      );
    } else if (index > rating! - 1 && index < rating!) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children:
              List.generate(starCount!, (index) => buildStar(context, index))),
    );
  }
}
