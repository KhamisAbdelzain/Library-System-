import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/transactionModel.dart';

class TransactionDetailsPage extends StatelessWidget {
  final Transaction transaction;
  final LibraryService _libraryService = LibraryService(); // Create an instance of LibraryService

  TransactionDetailsPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Transaction Details",style: TextStyle(color: Color(0xFFDFC0A0),fontFamily: "HomePage",fontSize: 50,fontWeight: FontWeight.w800),),backgroundColor: Colors.transparent,flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient( colors: [
    Color(0xFF2D2D31),
    Color(0xFFBD7B46),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,)),),),
    body: Container(
    height: double.infinity,
    width: double.infinity,

    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage("assets/images/3.jpg"),fit:BoxFit.cover)
    ,
    ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    margin: EdgeInsets.all(7),
    padding: EdgeInsets.only(left: 10),
    decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
    Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,)),
    child: ListTile(
    title: Text('Transaction ID: ${transaction.id}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    subtitle: Text('Issue Date: ${transaction.issueDate}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    ),
    ),
    Container(
    margin: EdgeInsets.all(7),
    padding: EdgeInsets.only(left: 10),
    decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
    Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,)),
    child: ListTile(
    title: Text('Member Name: ${transaction.memberId}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    subtitle: Text('Due Date: ${transaction.dueDate}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    ),
    ),
    Container(
    margin: EdgeInsets.all(7),
    padding: EdgeInsets.only(left: 10),
    decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
    Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,)),
    child: ListTile(
    title: Text('Book Name: ${transaction.bookId}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    subtitle: Text('Return Date: ${transaction.returnDate ?? "Not returned"}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
    ),
    ),
    Container(
    margin: EdgeInsets.all(7),
    padding: EdgeInsets.only(left: 10),
      decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
        Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,)),
      child: ListTile(
        title: Text('Fine Amount: ${transaction.fineAmount ?? "No fine"}',style:TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
      ),
    ),

    ],
    ),
    ),
    ),
    );
  }
}