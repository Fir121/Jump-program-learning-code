import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool> createUser(String name, String password) async {
    var response = await http.post(
        Uri.http("jumpprogramfiras.pythonanywhere.com", "signup"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'name': name, 'password': password}));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (jsonData.status == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      print(response.statusCode);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter name',
            ),
            controller: name,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter password',
            ),
            controller: password,
          ),
          ElevatedButton(
            onPressed: () async {
              // Navigator.pushNamed(context, '/mainapp');
              var op = await createUser(name.text, password.text);
              print(op);
            },
            child: const Text("Sign Up"),
          )
        ]),
      ),
    );
  }
}
