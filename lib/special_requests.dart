
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class specialRequests extends StatefulWidget {
  const specialRequests({Key? key}) : super(key: key);

  @override
  State<specialRequests> createState() => _specialRequestsState();
}

class _specialRequestsState extends State<specialRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Assignment Marks",
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
        stream: FirebaseFirestore.instance.collection('requests').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: (snapshot.data! as QuerySnapshot).docs.map((document) {
              return Container(
                child: Center(child: Column(
                  children: [
                    Lottie.asset("assets/requests.json"),
                    SizedBox(
                      height: 16,
                    ),

                    Text(document['req'],style: TextStyle(
                      fontSize: 23,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                    ),
                    ),

                  ],
                ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
