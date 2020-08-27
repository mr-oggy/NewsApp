import 'package:flutter/material.dart';
import 'package:news/common/constants.dart';
import 'package:news/common/loading.dart';
import 'package:news/src/loginDetails/services/auth.dart';

class LogIn extends StatefulWidget {
  final Function toggleView;
  LogIn({this.toggleView});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/login.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 100.0,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'N',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  )),
                              TextSpan(
                                  text: 'EW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  )),
                              TextSpan(
                                  text: 'S',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ])),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            decoration: textInputDecoration.copyWith(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textInputDecoration.copyWith(
                                suffixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Colors.white),
                                labelText: 'Password'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter Password more then 6 characters long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20),
                          Text(
                            error,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.red[800],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton.icon(
                              elevation: 4,
                              icon: Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(
                                      () {
                                        error =
                                            'Invalid credentials check your email or password';
                                        loading = false;
                                      },
                                    );
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color: Colors.green, width: 2.0)),
                              label: Text(
                                'LogIn',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              color: Colors.transparent,
                              splashColor: Colors.orange,
                              hoverColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton.icon(
                              elevation: 4,
                              icon: Icon(
                                Icons.app_registration,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                widget.toggleView();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              label: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              color: Colors.transparent,
                              splashColor: Colors.green,
                              hoverColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
