import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nsbm_lms/lec_shedule.dart';
import 'package:nsbm_lms/add_exams.dart';
import 'package:nsbm_lms/add_materials.dart';
import 'package:nsbm_lms/add_assignment.dart';
import 'package:nsbm_lms/examark_Upload.dart';
import 'package:nsbm_lms/assignment_mark.dart';
import 'package:nsbm_lms/feedback.dart';
import 'package:nsbm_lms/special_requests.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Panel",
          style: TextStyle(
            fontSize: 31,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.verified_user, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
            if(_page == 1){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>secondProfile()));
            }else if(_page == 2){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>thirdProfile()));
            }
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/calendar.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/exams.json"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>lecSchedule()));
                    },
                    child: Text(
                      "lec schedules",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>addExams()));
                    },
                    child: Text(
                      "Add Exams",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                  ),
                ),
              ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 32,
            ),
          ),
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/school.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/assign.json"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>addMaterials()));
                    },
                    child: Text(
                      "Add materials",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>addAssignment()));
                    },
                    child: Text(
                      "Add assignments",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class secondProfile extends StatefulWidget {
  const secondProfile({Key? key}) : super(key: key);

  @override
  State<secondProfile> createState() => _secondProfileState();
}

class _secondProfileState extends State<secondProfile> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Panel",
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
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/examarks.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/stdmarks.json"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>examMarkUpload()));
                    },
                    child: Text(
                      "Exam marks",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 90.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>assignmentMarks()));
                    },
                    child: Text(
                      "Assignment marks",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 32,
            ),
          ),
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/feedbacks.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/comments.json"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>feedback()));
                    },
                    child: Text(
                      "Feedbacks",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: () async{
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>specialRequests()));
                    },
                    child: Text(
                      "Special Requests",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class thirdProfile extends StatefulWidget {
  const thirdProfile({Key? key}) : super(key: key);

  @override
  State<thirdProfile> createState() => _thirdProfileState();
}

class _thirdProfileState extends State<thirdProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Panel",
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
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/calendar.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/exams.json"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: (){},
                    child: Text(
                      "Calendar",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: (){},
                    child: Text(
                      "Add Exams",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 32,
            ),
          ),
          Row(
            children: [
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      "assets/calendar.json"
                  ),
                ),
              ),
              Container(
                height: 208.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/exams.json"),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: (){},
                    child: Text(
                      "calendar",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                width: 208.0,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                    onPressed: (){},
                    child: Text(
                      "Add Exams",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
