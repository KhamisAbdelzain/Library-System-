import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/transactionModel.dart';

class CreateTransactionPage extends StatefulWidget {
  @override
  _CreateTransactionPageState createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _bookIdController = TextEditingController();
  final TextEditingController _issueDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final LibraryService _libraryService = LibraryService();

  @override
  void dispose() {
    _memberIdController.dispose();
    _bookIdController.dispose();
    _issueDateController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFDFC0A0),
        title: Text(
          'Create Transaction',
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
              image: AssetImage("assets/images/n4.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                  controller: _memberIdController,
                  decoration: InputDecoration(labelText: 'Member Name'),
                ),
              ),   SizedBox(height: 5,),
                          Container(          margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                              controller: _bookIdController,
                decoration: InputDecoration(labelText: 'Book Name'),
                ),
              ),
              SizedBox(height: 5,),
              Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                            controller: _issueDateController,
                decoration: InputDecoration(labelText: 'Issue Date'),
                ),
              ),
                 SizedBox(height: 5,),
              Container( 
                padding: EdgeInsets.all( 15),
                decoration:   const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                              controller: _dueDateController,
                decoration: InputDecoration(labelText: 'Due Date'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Create a new transaction using the entered data
                    Transaction newTransaction = Transaction(
                      id: '', // Leave ID empty as it will be assigned by the backend
                      memberId: _memberIdController.text,
                      bookId: _bookIdController.text,
                      issueDate: _issueDateController.text,
                      dueDate: _dueDateController.text,
                    );
        
                    // Call the createTransaction method from LibraryService to add the new transaction
                    await _libraryService.createTransaction(newTransaction);
        
                    // If the transaction is successfully created, navigate back to the previous page
                    Navigator.pop(context);
                  } catch (e) {
                    // Handle any errors that occur during the creation process
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Failed to create transaction: $e'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}