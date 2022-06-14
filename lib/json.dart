// To parse this JSON data, do
//
//     final msg = msgFromJson(jsonString);

import 'dart:convert';
// Msg
Msg msgFromJson(String str) => Msg.fromJson(json.decode(str));

String msgToJson(Msg data) => json.encode(data.toJson());

class Msg {
  Msg({
    required this.message,
    required this.status,
  });

  String message;
  int status;

  factory Msg.fromJson(Map<String, dynamic> json) =>
      Msg(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() =>
      {
        "message": message,
        "status": status,
      };
}
//Login valid
LoginValid loginValidFromJson(String str) => LoginValid.fromJson(json.decode(str));

String loginValidToJson(LoginValid data) => json.encode(data.toJson());

class LoginValid {
  LoginValid({
    required this.userValid,
    required this.username,
    required this.email,
  });

  bool userValid;
  String username;
  String email;

  factory LoginValid.fromJson(Map<String, dynamic> json) => LoginValid(
    userValid: json["user_valid"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "user_valid": userValid,
    "username": username,
    "email": email,
  };
}
Bookid bookidFromJson(String str) => Bookid.fromJson(json.decode(str));

String bookidToJson(Bookid data) => json.encode(data.toJson());

class Bookid {
  Bookid({
    required this.id,
    required this.title,
    required this.author,
    required this.dateAdded,
  });

  int id;
  String title;
  String author;
  String dateAdded;

  factory Bookid.fromJson(Map<String, dynamic> json) => Bookid(
    id: json["id"],
    title: json["title"],
    author: json["author"],
    dateAdded: json["date_added"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "date_added": dateAdded,
  };
}

// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//   User({
//     required this.username,
//     required this.email,
//     required this.password,
//     required this.phone,
//   });
//
//   String username;
//   String email;
//   String password;
//   String phone;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     username: json["username"],
//     email: json["email"],
//     password: json["password"],
//     phone: json["phone"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "username": username,
//     "email": email,
//     "password": password,
//     "phone": phone,
//   };
// }

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    required this.total,
    required this.books,
  });

  String total;
  List<Booking> books;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    total: json["total"],
    books: List<Booking>.from(json["books"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Booking {
  Booking({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    title: json["title"],
    subtitle: json["subtitle"],
    isbn13: json["isbn13"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "isbn13": isbn13,
    "price": price,
    "image": image,
    "url": url,
  };
}


