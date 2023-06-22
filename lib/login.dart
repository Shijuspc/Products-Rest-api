import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmail = prefs.getString('email') ?? '';
    String storedPassword = prefs.getString('password') ?? '';

    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      // Login successful
      // Redirect to another page or perform desired actions

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    } else {
      // Login failed
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 36, 43, 101),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: Text('LOGIN',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 229, 229),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(50, 255, 255, 255),
                          thickness: 3,
                          indent: 15,
                          endIndent: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ));
                          },
                          child: Text('REGISTER',
                              style: TextStyle(
                                  color: Color.fromARGB(50, 255, 255, 255),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 231, 231, 237),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 35),
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 43, 101),
                              ),
                            ),
                            Text(
                              'Sign In with your account',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 36, 43, 101),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 10,
                                      bottom: 10),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your Email";
                                      }
                                      if (!value.contains("@")) {
                                        return "Enter Valid Email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: Text('Email'),
                                      hintText: "Enter Your Email",
                                      contentPadding: EdgeInsets.only(left: 30),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(82, 36, 42, 101),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 10,
                                      bottom: 10),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: passwordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your Password";
                                      } else if (value.length < 6) {
                                        return "atleast 6 characters";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Password",
                                      label: Text('Password'),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color:
                                              Color.fromARGB(82, 36, 42, 101),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: 30, right: 30),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:
                                              Color.fromARGB(255, 36, 42, 101),
                                        ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible =
                                                  !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {
                                      _login();
                                    }
                                  },
                                  height: 50,
                                  minWidth: 240,
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.blue.shade700,
                                  shape: const StadiumBorder(),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Forgot your password?  '),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text('Reset here'))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 1,
                                      color: Color.fromARGB(82, 36, 42, 101),
                                      width: 100,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade600,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: Color.fromARGB(82, 36, 42, 101),
                                      width: 100,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            Stack(children: [
                              Center(
                                child: Container(
                                  width: 300,
                                  height: 150,
                                  margin: EdgeInsets.only(top: 25),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 211, 226, 251),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Login with Face ID',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            'Your Face is Now your password use',
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child:
                                            Text('your Face ID and get started',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                      child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.asset(
                                                  'lib/Image/Face-ID.png'),
                                            ),
                                          )))),
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
