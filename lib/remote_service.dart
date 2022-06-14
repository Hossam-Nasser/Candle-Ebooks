import 'dart:html';
import 'package:candle_ebookv2/login.dart';
import 'package:http/http.dart' as http;
import 'json.dart';
class RemoteService {
  var username;
  var search_word;
  var api_link = "https://catfact.ninja/";

  var client = http.Client();

  Future<Books?> getBooks() async {
    var uri = Uri.parse(api_link + "books");
    var response = await client.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return booksFromJson(json);
    }
  }

  Future<Bookid?> getBook() async {
    var uri = Uri.parse(api_link + "books");
    var response = await client.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return bookidFromJson(json);
    }
  }

  Future<Msg?> postRegisteration() async {
    var uri = Uri.parse(api_link + "users");
    var response = await client.post(uri, headers: {
      "username": userName.text,
      "email": email.text,
      "password": password.text,
      "phone": phoneNumber.text,
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return msgFromJson(json);
    }
  }

  Future<LoginValid?> postLogin() async {
    var uri = Uri.parse(api_link + "users/validate");
    var response = await client.post(uri, headers: {
      "email": email.text,
      "password": password.text,
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return loginValidFromJson(json);
    }
  }

  Future<Msg?> putLogin() async {
    var uri = Uri.parse(api_link + "fact");
    var response = await client.put(uri, headers: {
      "email": '',
      "password": '',
      "username": ''
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return msgFromJson(json);
    }
  }

  Future<Msg?> delLogin() async {
    var uri = Uri.parse(api_link + "fact");
    var response = await client.delete(uri, headers: {
      "username": ''
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return msgFromJson(json);
    }
  }

  Future<Books?> getSearch() async {
    var uri = Uri.parse(api_link + search_word);
    var response = await client.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      return booksFromJson(json);
    }
  }

  Future<File?> getPic() async {
    var uri = Uri.parse(api_link + "user/picture" + username);
    var response = await client.read(uri);
  }
}
