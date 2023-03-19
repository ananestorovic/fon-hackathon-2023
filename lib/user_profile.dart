import 'package:flutter/material.dart';
import 'package:flutter_application_1/pet.dart';
import 'package:flutter_application_1/pet_details.dart';
import 'package:flutter_application_1/services/auth.dart';

class UserProfile extends StatelessWidget {
  final String uid;
  final AuthService _auth = AuthService();
  UserProfile({required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: "assets/images/user.jpeg",
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/user.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Nikola Krstic",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.green,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[600],
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Lokacija",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "(" + "5" + "km)",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed condimentum tempor lorem, sed facilisis lectus sollicitudin a. Vivamus a quam.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300]!.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.blue[300],
                      ),
                      child: Center(
                        child: Text(
                          "Dodaj oglas",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300]!.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.blue[300],
                      ),
                      child: Center(
                        child: Text(
                          "Omiljeni oglasi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300]!.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.blue[300],
                      ),
                      child: Center(
                        child: Text(
                          "Moji oglasi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300]!.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.blue[300],
                      ),
                      child: Center(
                        child: Text(
                          "Istorija",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: Text(
                    "Odjavi se",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
