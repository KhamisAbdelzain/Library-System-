import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/book';

class EditBookPage extends StatefulWidget {
  final Book book;

  EditBookPage({required this.book});

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _ISBNController;
  late TextEditingController _genreController;
  late TextEditingController _publicationDateController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book.title);
    _authorController =
        TextEditingController(text: widget.book.author.join(', '));
    _ISBNController = TextEditingController(text: widget.book.ISBN);
    _genreController = TextEditingController(text: widget.book.genre);
    _publicationDateController =
        TextEditingController(text: widget.book.publicationDate);


  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _ISBNController.dispose();
    _genreController.dispose();
    _publicationDateController.dispose();
    super.dispose();
  }

  void _updateBook() {
    String title = _titleController.text;
    List<String> author = _authorController.text.split(',');
    String ISBN = _ISBNController.text;
    String genre = _genreController.text;
    String publicationDate = _publicationDateController.text;


    Book updatedBook = Book(
      id: widget.book.id,
      title: title,
      author: author,
      ISBN: ISBN,
      genre: genre,
      publicationDate: publicationDate,

    );

    LibraryService().updateBook(widget.book.title, updatedBook).then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      print('Error updating book: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC0A0),
        title: Text(
          'Edit Book',
          style: TextStyle(
              fontFamily: "Det",
              color: Color(0xff704929),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          height: double.infinity,
        width: double.infinity,
                decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/n3.jpg"), fit: BoxFit.cover),),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                ),
              ),  
              SizedBox(height: 12.0),
Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author(s)'),
                ),
              ),   
              SizedBox(height: 12.0),
Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _ISBNController,
                decoration: InputDecoration(labelText: 'ISBN'),
                ),
              ),  
              SizedBox(height: 12.0),
Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Genre'),
                ),
              ),  
              SizedBox(height: 12.0),
Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _publicationDateController,
                decoration: InputDecoration(labelText: 'Publication Date'),
                ),
              ),   SizedBox(height: 5,),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _updateBook,
                child: Text('Update Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
