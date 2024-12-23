import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/adminModel.dart';

class AdminDetailsPage extends StatelessWidget {
  final Admin admin;

  const AdminDetailsPage({Key? key, required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC0A0),
        title: Text(
          'Admin Details',
          style: TextStyle(
              fontFamily: "Det",
              color: Color(0xff704929),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/1.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                    height: 50,
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${admin.username}',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff704929),
                              fontFamily: "Det",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xff704929),
                                      fontFamily: "Det",
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${admin.username}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff704929),
                                      fontFamily: "Det",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 38,
                              child: VerticalDivider(
                                width: 10,
                                color: Color(0xff704929),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Role',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xff704929),
                                      fontFamily: "Det",
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " ${admin.role}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff704929),
                                      fontFamily: "Det",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                           
                            Spacer()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFDFC0A0), Color(0xFFCC955E)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
