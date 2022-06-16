class ReviewModel {
  List<ReviewDocs>? docs;
  int? total;
  int? limit;
  int? page;
  int? pages;

  ReviewModel({this.docs, this.total, this.limit, this.page, this.pages});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <ReviewDocs>[];
      json['docs'].forEach((v) {
        docs!.add(ReviewDocs.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }


}

class ReviewDocs {
  int? id;
  int? movieId;
  String? title;
  String? type;
  String? review;
  String? date;
  String? author;

  ReviewDocs(
      {this.id,
        this.movieId,
        this.title,
        this.type,
        this.review,
        this.date,
        this.author});

  ReviewDocs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movieId'];
    title = json['title'];
    type = json['type'];
    review = json['review'];
    date = json['date'];
    author = json['author'];
  }


}