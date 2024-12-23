import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/memberModel.dart';


class MemberDetailsPage extends StatelessWidget {
  final Member member;

  const MemberDetailsPage({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFDFC0A0),
        title: Text('Member Details',style: TextStyle(fontFamily: "Det",color: Color(0xff704929),fontWeight: FontWeight.bold),),
        
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Members4.jpg"),fit:BoxFit.cover)
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
                Text(' ${member.name}',style: TextStyle(fontSize: 22,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                ,SizedBox(height: 15,),
                  SizedBox(width: 35,)
                ,Row(children: [
              Spacer(),
                  Column(children: [
                     Text('Name',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                     Text("${member.name}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                  ],),
                  SizedBox(width: 15,),
                  Container( height:38,child:  VerticalDivider(width: 10,color: Color(0xff704929),),)
,SizedBox(width: 15,),

                  SizedBox(width: 15,),
                  Container( height:38,child:  VerticalDivider(width: 10,color: Color(0xff704929),),),
                  SizedBox(width: 15,),
                  Column(children: [
                     Text('Status',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                     Text("${member.membershipStatus}",style: TextStyle(fontSize: 14,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),)
                  ],),
Spacer()                ],),
SizedBox(height: 20,),
                Column(       
                  children: [
                    Row(children: [ Spacer(flex: 1,),Text('Address',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                    Container(height: 20,
                      child:  VerticalDivider( color: Color(0xff704929),)),
                     Text("${member.address}",style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold
                     ),
                     ),
                      Spacer(flex: 3,)
                     ],
                     ),
                         SizedBox(height: 20,),                Row(children: [ Spacer(flex: 2,),Text('Email',style: TextStyle(fontSize: 16,color: Color(0xff704929),fontFamily: "Det",fontWeight: FontWeight.bold),),
                    Container(height: 20,
                      child:  VerticalDivider( color: Color(0xff704929),)),
                     Text("${member.email}",style: TextStyle(fontSize: 16,color: Color(0xff704929,),fontFamily: "Det",fontWeight: FontWeight.bold
                     ),
                     )
                     , Spacer(flex: 6,)
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
/* Text('Name: ${member.name}'),
            Text('Email: ${member.email}'),
            Text('Address: ${member.address}'),
            Text('Phone: ${member.phone}'),
            Text('Books Issued: ${member.booksIssued.join(', ')}'),
            Text('Membership Status: ${member.membershipStatus}'),*/ 