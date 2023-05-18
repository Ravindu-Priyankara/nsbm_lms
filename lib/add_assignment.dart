
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class addAssignment extends StatefulWidget {
  const addAssignment({Key? key}) : super(key: key);

  @override
  State<addAssignment> createState() => _addAssignmentState();
}

class _addAssignmentState extends State<addAssignment> {

  TextEditingController _upload = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Assignment",
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
          Lottie.asset("assets/uploadAssignment.json"),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _upload,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.upload_file),
              border: OutlineInputBorder(),
              labelText: 'Type assignment download link',
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
              FirebaseFirestore.instance.collection('addAssignment').add({"links": _upload.text});
            },
            child: Text(
              'Upload Assignment',
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
