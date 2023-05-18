
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:intl/intl.dart';
import 'package:nsbm_lms/admin_dashboard.dart';

class addExams extends StatefulWidget {
  const addExams({Key? key}) : super(key: key);

  @override
  State<addExams> createState() => _addExamsState();
}

class _addExamsState extends State<addExams> {

  TextEditingController _dateSelector = TextEditingController();
  TextEditingController _lecName = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Exams",
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
          Lottie.asset("assets/addExam.json"),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _dateSelector,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
              labelText: 'type a date and time',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _lecName,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.person_2_rounded),
              border: OutlineInputBorder(),
              labelText: 'lecturer Name',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,                      // Added this
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            controller: _description,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              icon: Icon(Icons.text_fields),
              border: OutlineInputBorder(),
              labelText: 'Description',
              contentPadding: EdgeInsets.all(25.0),
              isDense: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 20
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 16,
              ),
            ),
            onPressed: () async{
              FirebaseFirestore.instance.collection('addExam').add({'dateAndTime':_dateSelector.text,'description': _description.text,'lecturer': _lecName.text});
            },
            child: Text(
              'Add Exam',
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
