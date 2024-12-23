import 'package:flutter/material.dart';
import 'package:library_ms/Books/BookDetailsPage.dart';
import 'package:library_ms/Books/CreateBookPage.dart';
import 'package:library_ms/Books/EditbookPage.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/book';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> _books = [];
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final books = await LibraryService().getBooks();
      setState(() {
        _books = books;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  void _navigateToBookDetails(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookDetailsPage(book: book)),
    );
  }

  void _navigateToCreateBook() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateBookPage()),
    ).then((_) {
      // Refresh books list after adding a new book
      _fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Books",
          style: TextStyle(
            color: Color(0xFF472B13),
            fontFamily: "HomePage",
            fontSize: 50,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFBD7B46),
                Color(0xFFDFC0A0),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Books.2jpg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _isError
                ? Center(
                    child: Text(
                      'Error loading books',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : ListView.builder(
                    itemCount: _books.length,
                    itemBuilder: (context, index) {
                      final book = _books[index];
                      return Container(
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFBD7B46),
                              Color(0xFFDFC0A0),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _navigateToBookDetails(book);
                          },
                          child: ListTile(
                            title: Text(
                              book.title,
                              style: TextStyle(
                                  fontFamily: "Det", color: Colors.black),
                            ),
                            subtitle: Text(book.author.join(', ')),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditBookPage(book: book),
                                  ),
                                );
                              },
                              child: Icon(Icons.edit),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
bottomNavigationBar: BottomAppBar(
  child: Container(
    height: 50.0,
     decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFBD7B46),
                Color(0xFFDFC0A0),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
// Set your desired background color here
    child: Center(
      child: Text(
        "Total Books: ${_books.length}",
        style: TextStyle(
          color: Color(0xFF472B13),
          fontFamily: "Det",
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  ),
),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateBook,
        child: Icon(Icons.add,color: Colors.brown,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
