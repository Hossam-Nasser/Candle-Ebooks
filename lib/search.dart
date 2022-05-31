import 'package:flutter/material.dart';
import 'package:get/get.dart';

class search_screen extends StatefulWidget {
  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  var _controller = TextEditingController();

  String? query = "";


  List<String> searchTerms = [
    'Prisonar of Zinda',
    'Deadpool',
    'Lolita ',
    'The Divine Comedy ',
    'Madame Bovary',
    'The Great Gatsby',
    'Moby Dick',
    'War and Peace',
    'Don Quixote',
    'One Hundred Years of Solitude',
    'Ulysses ',
  ];


  @override
  Widget build(BuildContext context) {

    List<String> matchQuery = [];
    for (var Book in searchTerms) {
      if (Book.toLowerCase().contains(query!.toLowerCase())) {
        matchQuery.add(Book);
      }
    }

    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black45, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 10.5,
          title: Container(
            width: double.infinity,
            height: 40,
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10),border: Border.all(color:Colors.black,width: 1.5,)),
              child: Center(
                child: TextField(
                  controller: _controller,
                  onTap: ()=>CustomSearchDelegate(),
                  onChanged: (val) {
                    setState(() {
                      query = val;
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                          _controller.clear();
                          setState(() {
                            query = "";
                          });
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 20),
        child: SingleChildScrollView(
          child:Container(
            width: 250,
            height: 450,
            child: ListView.builder(
            itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(result),
                        Divider(),
                      ],
                       ),
                );
              },
            ),
          ),

        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Prisonar of Zinda',
    'Deadpool',
    'Lolita ',
    'The Divine Comedy ',
    'Madame Bovary',
    'The Great Gatsby',
    'Moby Dick',
    'War and Peace',
    'Don Quixote',
    'One Hundred Years of Solitude',
    'Ulysses ',
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var Book in searchTerms) {
      if (Book.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(Book);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var Book in searchTerms) {
      if (Book.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(Book);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }
}
