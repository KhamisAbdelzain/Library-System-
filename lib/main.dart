import 'package:flutter/material.dart';
import 'package:library_ms/HomePage.dart';
import 'package:library_ms/Books/BookPage.dart';
import 'package:library_ms/Members/MembersPage.dart';
import 'package:library_ms/Admins/AdminDetailsPage.dart';
import 'package:library_ms/Transactions/TransactionsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}