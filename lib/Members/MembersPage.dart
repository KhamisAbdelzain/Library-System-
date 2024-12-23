import 'package:flutter/material.dart';
import 'package:library_ms/Members/CreateMemberPage.dart';
import 'package:library_ms/Members/EditMemberPage.dart';
import 'package:library_ms/Members/MemberDetailsPage.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/memberModel.dart';


class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<Member> _members = [];
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  Future<void> _fetchMembers() async {  
    setState(() {
      _isLoading = true;
    });
    try {
      final members = await LibraryService().getMembers();
      setState(() {
        _members = members;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  void _navigateToMemberDetails(Member member) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MemberDetailsPage(member: member)),
    );
  }

  void _navigateToCreateMember() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateMemberPage()),
    ).then((_) {
      // Refresh members list after adding a new member
      _fetchMembers();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Members",style: TextStyle(color: Color(0xFF472B13),fontFamily: "HomePage",fontSize: 50,fontWeight: FontWeight.w800),),backgroundColor: Colors.transparent,flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient( colors: [
                  Color(0xFFBD7B46), 
                  Color(0xFFDFC0A0), 
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,)),),),
      body: Container(
          height: double.infinity,
        width: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Members3.jpg"),fit:BoxFit.cover)
          ,
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _isError
            ? Center(
          child: Text(
            'Error loading members',
            style: TextStyle(color: Colors.red),
          ),
        )
            : ListView.builder(
          itemCount: _members.length,
          itemBuilder: (context, index) {
            final member = _members[index];
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
  child: ListTile(
    title: Text(
      member.name,
      style: TextStyle(fontFamily: "Det", color: Colors.black),
    ),
    subtitle: Text(member.email),
    onTap: () => _navigateToMemberDetails(member),
    trailing: GestureDetector(
      onTap: () {
        // Navigate to another page when the trailing icon is tapped
        // Replace YourPageY with the appropriate widget or route
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditMemberPage(member: member,)),
        );
      },
      child: Icon(Icons.edit), // Change the icon as needed
    ),
  ),
);

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateMember,
        child: Icon(Icons.add),
      ),
    );
  }
}
