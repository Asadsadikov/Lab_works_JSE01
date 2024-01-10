import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Provider.of<AuthProvider>(context, listen: false).signUp(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );

                  await storeUserDataInFirestore(
                    userUid: Provider.of<AuthProvider>(context, listen: false).user!.uid,
                    email: _emailController.text.trim(),
                  );

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                } catch (e) {
                  print(e.toString());
                }
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> storeUserDataInFirestore({
    required String userUid,
    required String email,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userUid).set({
        'email': email,
      });
    } catch (e) {
      print('Error storing user data in Firestore: $e');
      throw e;
    }
  }
}
