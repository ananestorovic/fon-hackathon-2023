import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
//import 'package:qr_scanner/pages/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String parentEmail = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? "Unesite ime" : null,
                    onChanged: (value) {
                      setState(() {
                        firstname = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ime',
                        hintText: 'Unesite ime'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Unesite prezime" : null,
                    onChanged: (value) {
                      setState(() {
                        lastname = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Prezime',
                        hintText: 'Unesite prezime'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Unesite e-mail adresu" : null,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Unesite e-mail adresu'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) => value!.length < 6
                        ? "Unesite sifru od 6+ karaktera"
                        : null,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Unesite sifru'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Obavezno polje" : null,
                    onChanged: (value) {
                      setState(() {
                        parentEmail = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adresa',
                        hintText: 'Unesite adresu'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(firstname,
                                lastname, email, password, parentEmail);

                        if (result == null) {
                          setState(() async {
                            error = 'Neuspesna registracija';
                          });
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
