part of 'models.dart';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    this.review,
    this.user,
  });

  ReviewClass? review;
  User? user;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        review: ReviewClass.fromJson(json["review"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "review": review!.toJson(),
        "user": user!.toJson(),
      };
}

class ReviewClass {
  ReviewClass({
    this.rating,
    this.message,
    this.images,
    this.createdAt,
  });

  double? rating;
  String? message;
  List<String>? images;
  dynamic createdAt;

  factory ReviewClass.fromJson(Map<String, dynamic> json) => ReviewClass(
        rating: json["rating"],
        message: json["message"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "message": message,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "createdAt": createdAt,
      };
}

var jsonReview = {
  "review": {
    "rating": 4.0,
    "message": "Tentornya bagus mudah dipahami",
    "images": [
      'https://images.pexels.com/photos/5428011/pexels-photo-5428011.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
    ],
    "createdAt": DateTime.now().toString()
  },
  "user": {
    "name": "James Lawson",
    "image":
        "https://image.freepik.com/free-photo/half-profile-image-beautiful-young-woman-with-bob-hairdo-posing-gazing-with-eyes-full-reproach-suspicion-human-facial-expressions-emotions-reaction-feelings_343059-4660.jpg"
  }
};

List<Review> reviews = [
  Review.fromJson(jsonReview),
  Review.fromJson(jsonReview),
];
