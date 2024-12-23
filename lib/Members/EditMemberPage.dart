import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/memberModel.dart';

class EditMemberPage extends StatefulWidget {
  final Member member;

  EditMemberPage({required this.member});

  @override
  _EditMemberPageState createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _membershipStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.member.name;
    _emailController.text = widget.member.email;
    _addressController.text = widget.member.address;
    _phoneController.text = widget.member.phone;
    _membershipStatusController.text = widget.member.membershipStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDFC0A0),
        title: Text(
          'Edit Member',
          style: TextStyle(
            fontFamily: "Det",
            color: Color(0xff704929),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/n3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                ),
              ),  
              SizedBox(height: 12.0),

 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                ),
              ),  
              SizedBox(height: 12.0),

 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                ),
              ),  
              SizedBox(height: 12.0),

 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                ),
              ),  
              SizedBox(height: 12.0),

 Container(        margin: EdgeInsets.all(1),
                padding: EdgeInsets.all( 15),
                decoration:   BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),gradient: LinearGradient(colors: [ Color(0xFFBD7B46),
                  Color(0xFFDFC0A0), ],begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,)),
                child: TextField(
                controller: _membershipStatusController,
                decoration: InputDecoration(labelText: 'Membership Status'),
                ),
              ),  
              SizedBox(height: 12.0),

              ElevatedButton(
                onPressed: () {
                  _updateMember();
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateMember() {
    String updatedName = _nameController.text;
    String updatedEmail = _emailController.text;
    String updatedAddress = _addressController.text;
    String updatedPhone = _phoneController.text;
    String updatedMembershipStatus = _membershipStatusController.text;

    Member updatedMember = Member(
      id: widget.member.id,
      name: updatedName,
      email: updatedEmail,
      address: updatedAddress,
      phone: updatedPhone,
      membershipStatus: updatedMembershipStatus,
    );

    LibraryService().updateMember(widget.member.id, updatedMember).then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to update member: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _membershipStatusController.dispose();
    super.dispose();
  }
}