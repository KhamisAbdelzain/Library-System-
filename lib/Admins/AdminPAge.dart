import 'package:flutter/material.dart';
import 'package:library_ms/Admins/AdminDetailsPage.dart';
import 'package:library_ms/Admins/CreateAdminPage.dart';
import 'package:library_ms/Admins/EditAdminPage.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/adminModel.dart';

class AdminsPage extends StatefulWidget {
  @override
  _AdminsPageState createState() => _AdminsPageState();
}

class _AdminsPageState extends State<AdminsPage> {
  List<Admin> _admins = [];
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _fetchAdmins();
  }

  Future<void> _fetchAdmins() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final admins = await LibraryService().getAdmins();
      setState(() {
        _admins = admins;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  void _navigateToAdminDetails(Admin admin) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminDetailsPage(admin: admin)),
    );
  }

  void _navigateToCreateAdmin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAdminPage()),
    ).then((_) {
      // Refresh admins list after adding a new admin
      _fetchAdmins();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admins",style: TextStyle(color: Color(0xFF472B13),fontFamily: "HomePage",fontSize: 50,fontWeight: FontWeight.w800),),backgroundColor: Colors.transparent,flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient( colors: [
                  Color(0xFFBD7B46), 
                  Color(0xFFDFC0A0), 
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,)),),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Admin.jpg"),fit:BoxFit.cover)
          ,
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _isError
            ? Center(
          child: Text(
            'Error loading admins',
            style: TextStyle(color: Colors.red),
          ),
        )
            : ListView.builder(
          itemCount: _admins.length,
          itemBuilder: (context, index) {
            final admin = _admins[index];
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
    title: Text(admin.username),
    subtitle: Text(admin.role),
    onTap: () => _navigateToAdminDetails(admin),
    trailing: GestureDetector(
      onTap: () {
        // Navigate to another page when the trailing icon is tapped
        // Replace YourPageY with the appropriate widget or route
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditAdminPage(admin: admin,)),
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
        onPressed: _navigateToCreateAdmin,
        child: Icon(Icons.add),
      ),
    );
  }
}
