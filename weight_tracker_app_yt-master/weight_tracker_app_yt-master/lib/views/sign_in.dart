import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker_app_yt/views/home.dart';
import 'package:weight_tracker_app_yt/views/mainpage.dart';

class homeapp extends StatelessWidget {
  const homeapp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "weight_tracker_app_yt Developers' Group, Qaiwan",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  fetchCredentials() {
    var username = "username";
    var password = "password123";
    return [username, password];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 200,
            ),
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 10,
            ),
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Wrong credentials entered",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Container(
              height: 140,
              width: 530,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },

                    controller: passwordController, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    obscureText: _isObscure,
                  ),
                ],
              ),
            ),
            Container(
              width: 570,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (kDebugMode) {
                      print(
                          "Username: ${usernameController.text}, password: ${passwordController.text}");
                      if (usernameController.text == fetchCredentials()[0] &&
                          passwordController.text == fetchCredentials()[1]) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        setState(() {
                          _isVisible = true;
                        });
                      }
                    }
                  }),
            ),
          ],
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 100,
                width: 570,
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: RaisedButton(
                    color: Colors.pink,
                    child:
                        Text("goto doc", style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => home1()),
                        (Route<dynamic> route) => false,
                      );
                    }),
              ),
            ),
            Container(
              height: 100,
              width: 570,
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                  color: Colors.pink,
                  child:
                      Text("goto Home", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                    );
                  }),
            )
          ],
        ));
  }
}
