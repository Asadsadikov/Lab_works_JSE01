import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Your App!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            FutureBuilder(
              future: fetchUserEmailFromFirebase(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'User Email: ${snapshot.data}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false).signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> fetchUserEmailFromFirebase(BuildContext context) async {
    final user = Provider.of<AuthProvider>(context).user;
    if (user != null) {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
        if (userSnapshot.exists) {
          return userSnapshot['email'];
        }
      } catch (e) {
        print('Error fetching user email: $e');
        return null;
      }
    }
    return null;
  }
}
