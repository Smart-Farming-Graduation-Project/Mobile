class ReviewModel {
  final int reviewID;
  final String userID;
  final String firstName;
  final String lastName;
  final String headline;
  final double rating;
  final String reviewText;
  final DateTime reviewDate;
  final int productId;

  ReviewModel({
    required this.reviewID,
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.headline,
    required this.rating,
    required this.reviewText,
    required this.reviewDate,
    required this.productId,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviewID: json["reviewID"] ?? 0,
        userID: json["userID"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        headline: json["headline"] ?? "",
        rating: (json["rating"]).toDouble() ?? 0.0,
        reviewText: json["reviewText"] ?? "",
        reviewDate: json["reviewDate"] != null
            ? DateTime.parse(json["reviewDate"])
            : DateTime.now(),
        productId: json["productId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "reviewID": reviewID,
        "userID": userID,
        "firstName": firstName,
        "lastName": lastName,
        "headline": headline,
        "rating": rating,
        "reviewText": reviewText,
        "reviewDate": reviewDate.toIso8601String(),
        "productId": productId,
      };
}
