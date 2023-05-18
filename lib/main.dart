import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nsbm_lms/admin_dashboard.dart';
import 'firebase_options.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/splash.json'),
            SizedBox(
              height: 20,
            ),
            Text('Welcome to NSBM Admin Portal',style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///Initialized firebase app
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}):super(key : key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///Login Function
  static Future<User?> loginusingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print(" No users in this email");
      }
    }
    return user;
  }


  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    //create the text field controller

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        //backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("NSBM Admin Login Page"),
      ),
      body: Container(
        child: Column(
          children: [
            /*Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 160
              ),
            ),*/
            Lottie.asset('assets/admin2.json'),
            SizedBox(
              height: 0,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _emailController,
              style: TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email Address',
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
            SizedBox(height: 12,),
            TextField(
              controller: _passwordController,
              style: TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.red,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
                helperText:"Password must contain special character",
                helperStyle:TextStyle(color:Colors.blue),
                contentPadding: EdgeInsets.all(25.0),
                isDense: true,
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                          () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
                filled: true,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 32,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                ),
              ),
              onPressed: () async{
                User? user = await loginusingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                if(user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                }else if(user == null){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)=> const wrongCredential(),
                    ),
                  );
                }
              },
              child: Text(
              'Login',
                style: TextStyle(
                  fontSize: 20
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class wrongCredential extends StatefulWidget {
  const wrongCredential({Key? key}) : super(key: key);

  @override
  State<wrongCredential> createState() => _wrongCredentialState();
}

class _wrongCredentialState extends State<wrongCredential> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Wrong Credential"
        ),
      ),
      body:Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Lottie.asset("assets/wrong-password.json"),
          SizedBox(
            height: 50,
          ),
          Text("You entered username\n or password is wrong!",
            style: TextStyle(
              fontSize: 31,
              color: Colors.pink[800],
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',

            ),
          ),
        ],
      )
    );
  }
}
