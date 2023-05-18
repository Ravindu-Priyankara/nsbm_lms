
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class assignmentMarks extends StatefulWidget {
  const assignmentMarks({Key? key}) : super(key: key);

  @override
  State<assignmentMarks> createState() => _assignmentMarksState();
}

class _assignmentMarksState extends State<assignmentMarks> {

  TextEditingController _id = TextEditingController();
  TextEditingController _marks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Materials",
          style: TextStyle(
            fontSize: 31,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.asset("assets/assesment.json"),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _id,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.upload_file),
              border: OutlineInputBorder(),
              labelText: 'Type Student id',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 20,
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _marks,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.upload_file),
              border: OutlineInputBorder(),
              labelText: 'Type Student marks',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 50,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 16,
              ),
            ),
            onPressed: () async{
              FirebaseFirestore.instance.collection('assignmentMarks').add({"id": _id.text,"marks":_marks.text});
            },
            child: Text(
              'Submit marks',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ),
        ],
      ),
    );
  }
}
