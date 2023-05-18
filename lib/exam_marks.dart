
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class examMarks extends StatefulWidget {
  const examMarks({Key? key}) : super(key: key);

  @override
  State<examMarks> createState() => _examMarksState();
}

class _examMarksState extends State<examMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exam marks",
          style: TextStyle(
            fontSize: 31,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('examMarks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: (snapshot.data! as QuerySnapshot).docs.map((document) {
              return Container(
                child: Center(child: Text(document['g9orEXlVK5TswtYyeVCF'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
