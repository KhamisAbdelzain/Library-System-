import 'package:flutter/material.dart';
import 'package:library_ms/LibraryService.dart';
import 'package:library_ms/Models/adminModel.dart';

class EditAdminPage extends StatefulWidget {
  final Admin admin;

  EditAdminPage({required this.admin});

  @override
  _EditAdminPageState createState() => _EditAdminPageState();
}

class _EditAdminPageState extends State<EditAdminPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _passwordController = TextEditingController(); // Add password controller

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.admin.username;
    _roleController.text = widget.admin.role;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Hide password text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call method to update admin
                _updateAdmin();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateAdmin() {
    // Extract updated values from text controllers
    String updatedUsername = _usernameController.text;
    String updatedRole = _roleController.text;
    String updatedPassword = _passwordController.text;

    // Create an updated Admin object
    Admin updatedAdmin = Admin(
      id: widget.admin.id,
      username: updatedUsername,
      role: updatedRole,
      password: updatedPassword, // Pass the updated password
    );

    // Call the updateAdmin method from LibraryService
    LibraryService().updateAdmin(widget.admin.id, updatedAdmin).then((_) {
      // Navigate back to previous page
      Navigator.pop(context);
    }).catchError((error) {
      // Handle error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to update admin: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
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
    _usernameController.dispose();
    _roleController.dispose();
    _passwordController.dispose(); // Dispose password controller
    super.dispose();
  }
}
