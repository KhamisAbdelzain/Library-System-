import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageBottoms extends StatelessWidget {
String lable,image;


 HomePageBottoms({super.key,required this.lable,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(height: 250,
    width: 150,
    
   decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('$image'),fit:BoxFit.cover)
          ,borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: Text(lable,style: TextStyle(color: Colors.white,fontSize: 43,fontFamily: "HomePage",fontWeight: FontWeight.bold),),),);

  }
}