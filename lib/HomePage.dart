import 'package:flutter/material.dart';
import 'package:library_ms/Books/BookPage.dart';
import 'package:library_ms/Members/MembersPage.dart';
import 'package:library_ms/Admins/AdminPAge.dart';
import 'package:library_ms/Transactions/TransactionsPage.dart';
import 'package:library_ms/Transactions/CreateTransactionPage.dart';
import 'package:library_ms/Widgets/home_page_bottoms.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Book Haven",style: TextStyle(color: Colors.white,fontFamily: "HomePage",fontSize: 50,fontWeight: FontWeight.w800),),
     ),backgroundColor: Colors.transparent,flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient( colors: [
                  Color(0xFFBDBDB4), 
                  Color(0xFF472B13), 
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,)),),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Background2.jpg"),fit:BoxFit.cover)
          ,
        ),
        child: ListView(
          children:[ Column(
            children: [
                 SizedBox(height: 15,),
              Row(
                children: [
               
                Spacer(flex: 1,),  
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BooksPage()),
                  );
                },
                child: HomePageBottoms(lable: "Books",image: 'assets/images/Books.jpg',)
              ),
                 Spacer(flex: 1,),  
                  GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MembersPage()),
                  );
                },
                child: HomePageBottoms(lable: "Members",image: 'assets/images/Members.jpg',)
              ),
                 Spacer(flex: 1,),  
                ],
              ),
          
              SizedBox(height: 15,),
              Row(
                children: [
               
                Spacer(flex: 1,),  
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminsPage()),
                  );
                },
                child: HomePageBottoms(lable: "Mangers",image: 'assets/images/Mangers.jpg',)
              ),
                 Spacer(flex: 1,),  
                  GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionsPage()),
                  );
                },
                child: HomePageBottoms(lable: "Transactions",image: 'assets/images/Transactions.jpg',)
              ),
                 Spacer(flex: 1,),  
                ],
              ),
 SizedBox(height: 15,),
              Row(
                children: [
               
                Spacer(flex: 1,),  
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateTransactionPage()),
                  );
                },
                child: HomePageBottoms(lable: "New Transactions",image: 'assets/images/NewTransactions.jpg',)
              ),
                 Spacer(flex: 1,),  

                  
                ],
              ),
            ],
          ),
          ]  
        ),
        
        
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Library Management System',
    home: HomePage(),
  ));
}
