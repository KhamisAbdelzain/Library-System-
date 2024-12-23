import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';

import 'dart:math';

import 'package:library_ms/Models/book';
class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFDFC0A0),
        title: Text('Book Details',style: TextStyle(fontFamily: "Det",color: Color(0xff704929),fontWeight: FontWeight.bold),),
        
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Book.jpg"),fit:BoxFit.cover)
          ,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( flex: 6,child: Container(height: 50,)),
        
              Expanded( flex: 4,child: Container(
  
                width: double.infinity,
      
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [  
                Text(' ${book.title}',style: TextStyle(fontSize: 22,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                ,SizedBox(height: 15,),
                  SizedBox(width: 35,)
                ,Row(children: [
              Spacer(),
                  Column(children: [
                     Text('Author',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                     Text("${book.author}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                  ],),
                  SizedBox(width: 15,),
                  Container( height:38,child:  VerticalDivider(width: 10,color: Color(0xff704929),),)
,SizedBox(width: 15,),
                  Column(children: [
                     Text('Genre',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                     Text("${book.genre}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                  ],),
                  SizedBox(width: 15,),
                  Container( height:38,child:  VerticalDivider(width: 10,color: Color(0xff704929),),),
                  SizedBox(width: 15,),
                  Column(children: [
                    Text('Rate',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                     Text("${Random().nextInt(11)}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                  ],),
Spacer()                ],),
SizedBox(height: 20,),
                Column(       
                  children: [
                    Row(children: [ Spacer(flex: 1,),Text('Publication Date',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                    Container(height: 20,
                      child:  VerticalDivider( color: Color(0xff704929),)),
                     Text("${book.publicationDate}",style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold
                     ),
                     ),
                      Spacer(flex: 3,)
                     ],
                     ),
                         SizedBox(height: 20,),                Row(children: [ Spacer(flex: 2,),Text('Number of read operations',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                    Container(height: 20,
                      child:  VerticalDivider( color: Color(0xff704929),)),
                                           Text("${Random().nextInt(10000)}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)

                      ,Spacer(flex: 5,)
                     ],
                     ),
                     
                  ],
                )
              ],),  
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60)),gradient: LinearGradient(colors: [Color(0xFFDFC0A0),Color(0xFFCC955E)],begin: Alignment.topCenter,end: Alignment.bottomCenter)),)),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
/*Text('Title: ${book.title}'),
            Text('Author: ${book.author}'),
            Text('Genre: ${book.genre}'),
            Text('Publication Date: ${book.publicationDate}'),
            Text('Quantity: ${book.quantity}'),
            Text('Availability: ${book.availability}'),*/