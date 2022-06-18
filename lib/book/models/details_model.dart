

class DetailsModel {
  DetailsModel({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,

  });

  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;


  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    error: json["error"] == null ? null : json["error"],
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    authors: json["authors"] == null ? null : json["authors"],
    publisher: json["publisher"] == null ? null : json["publisher"],
    language: json["language"] == null ? null : json["language"],
    isbn10: json["isbn10"] == null ? null : json["isbn10"],
    isbn13: json["isbn13"] == null ? null : json["isbn13"],
    pages: json["pages"] == null ? null : json["pages"],
    year: json["year"] == null ? null : json["year"],
    rating: json["rating"] == null ? null : json["rating"],
    desc: json["desc"] == null ? null : json["desc"],
    price: json["price"] == null ? null : json["price"],
    image: json["image"] == null ? null : json["image"],
    url: json["url"] == null ? null : json["url"],

  );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "authors": authors == null ? null : authors,
    "publisher": publisher == null ? null : publisher,
    "language": language == null ? null : language,
    "isbn10": isbn10 == null ? null : isbn10,
    "isbn13": isbn13 == null ? null : isbn13,
    "pages": pages == null ? null : pages,
    "year": year == null ? null : year,
    "rating": rating == null ? null : rating,
    "desc": desc == null ? null : desc,
    "price": price == null ? null : price,
    "image": image == null ? null : image,
    "url": url == null ? null : url,

  };
}

class Pdf {
  Pdf({
    required this.chapter2,
    required this.chapter5,
  });

  String chapter2;
  String chapter5;

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    chapter2: json["Chapter 2"] == null ? null : json["Chapter 2"],
    chapter5: json["Chapter 5"] == null ? null : json["Chapter 5"],
  );

  Map<String, dynamic> toJson() => {
    "Chapter 2": chapter2 == null ? null : chapter2,
    "Chapter 5": chapter5 == null ? null : chapter5,
  };
}
