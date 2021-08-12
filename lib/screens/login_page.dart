import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
 
import 'package:metr_reading/widgets/loading_utils.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10),
              child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.lightGreen[600],
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 10.0),
              child: Container(
                //color: Colors.green,
                height: 200,
                width: 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                    ),
                    TweenAnimationBuilder(
                      child: Center(
                        child: Text(
                          'Any Text About Your App Placed Here',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.lightGreen[600],
                          ),
                        ),
                      ),
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(milliseconds: 4000),
                      builder:
                          (BuildContext context, double _val, Widget child) {
                        return Opacity(
                          opacity: _val,
                          child: Padding(
                            padding: EdgeInsets.only(top: _val * 15),
                            child: child,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'PLACE LOGO HERE',
              style: TextStyle(
                color: Colors.lightGreen[600],
                fontSize: 40,
              ),
            ),
            //child: Image.asset('assets/logob.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Fontisto.email,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'E-mail'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: TextFormField(
            controller: _passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Feather.unlock,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.white,
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                ),
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                  //borderSide: const BorderSide(),
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                filled: true,
                fillColor: Colors.lightGreen[600],
                hintText: 'Password'),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            height: 50.0,
            child: GestureDetector(
              onTap: () async {
                showLoaging();
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim());
                  showSuccess(message: 'Login Successfully');
                } on FirebaseAuthException catch (error) {
                  showError(
                    error: error.message,
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightGreen[600],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.lightGreen[600],
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
