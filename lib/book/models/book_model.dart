

class BookModel {
  BookModel({
    required this.author,
    required this.cover,
    required this.dateAdded,
    required this.id,
    required this.rating,
    required this.title,
  });

  String author;
  String cover;
  String dateAdded;
  var id;
  String rating;
  String title;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    author: json["author"] == null ? "null" : json["author"],
    cover: json["cover"] == null ? "null" : json["cover"],
    dateAdded: json["date_added"] == null ? "null" : json["date_added"],
    id: json["id"] == null ? "null" : json["id"],
    rating: json["rating"] == null ? "null" : json["rating"],
    title: json["title"] == null ? "null" : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "author": author == null ? "null" : author,
    "cover": cover == null ? "null" : cover,
    "date_added": dateAdded == null ? "null" : dateAdded,
    "id": id == null ? "null" : id,
    "rating": rating == null ? "null" : rating,
    "title": title == null ? "null" : title,
  };
}
