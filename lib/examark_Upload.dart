
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class examMarkUpload extends StatefulWidget {
  const examMarkUpload({Key? key}) : super(key: key);

  @override
  State<examMarkUpload> createState() => _examMarkUploadState();
}

class _examMarkUploadState extends State<examMarkUpload> {

  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _marks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exam marks upload",
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
          SizedBox(
            height: 220,
            child: OverflowBox(
              minHeight: 170,
              maxHeight: 170,
              child: Lottie.asset(
                'assets/marksofexam.json',
                repeat: true,
              ),
            ),
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
              labelText: 'Enter student id',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 15,
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _name,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.upload_file),
              border: OutlineInputBorder(),
              labelText: 'Enter Student Name',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 15,
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _subject,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.upload_file),
              border: OutlineInputBorder(),
              labelText: 'Enter subject',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 15,
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
              labelText: 'Enter student mark',
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
              FirebaseFirestore.instance.collection('examMarks').add({"id": _id.text,"name": _name.text,"subject":_subject.text,"Marks":_marks.text});
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
