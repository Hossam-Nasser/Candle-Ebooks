

import 'dart:convert';

import 'package:candle_ebookv2/book/models/details_model.dart';

import '../models/book_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;


class BookController extends GetxController{


  var isLoading = false.obs;


  var books = <BookModel?>[].obs;

  BookModel? bookModelSearch;


  @override
  void onInit() {
    getBook();

    super.onInit();
  }

  getBook()async {

    http.Response response = await http.get(
        Uri.parse("https://candle-ebooks.herokuapp.com/api/books"));

    final parsed = jsonDecode(response.body);
    print("oooooooooooooooooooooooooooo");
    print(parsed);

    try {
      isLoading(true);
      books.value= parsed["Books"]
          .map<BookModel>((json) => BookModel.fromJson(json))
          .toList();
      update();

    } catch (e) {
      print("//////////////************////////////////////}");
      print(e.toString());
    }finally{
      isLoading(false);
    }
  }





  getSearchBook(String? title)async {

    http.Response response = await http.get(
        Uri.parse("https://candle-ebooks.herokuapp.com/api/books/search/$title"));

    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();;
    print("oooooooooooooooooooooooooooo");
    print(parsed);

    try {
      isLoading(true);
      bookModelSearch= BookModel.fromJson(parsed["Books"]);


      update();

    } catch (e) {
      print("//////////////************////////////////////}");
      print(e.toString());
    }finally{
      isLoading(false);
    }
  }







}