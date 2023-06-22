import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_ui2/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final key = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    // Save the email and password to SharedPreferences
    await prefs.setString('email', enteredEmail);
    await prefs.setString('password', enteredPassword);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  final TextEditingController conpassword = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                                color: Color.fromARGB(50, 255, 255, 255),
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
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                        const SizedBox(height: 25),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 36, 43, 101),
                          ),
                        ),
                        Text(
                          'Sign Up with your account',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 36, 43, 101),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Form(
                          key: key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10,
                                    bottom: 10),
                                child: TextFormField(
                                  controller: firstname,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Enter Correct First Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      label: Text('First Name'),
                                      hintText: "Enter Your First Name",
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
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10,
                                    bottom: 10),
                                child: TextFormField(
                                  controller: lastname,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Enter Correct Last Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      label: Text('Last Name'),
                                      hintText: "Enter Your Last Name",
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
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      )),
                                ),
                              ),
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
                                      )),
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
                                        color: Color.fromARGB(82, 36, 42, 101),
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
                                        color: Color.fromARGB(255, 36, 42, 101),
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
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
                                  controller: conpassword,
                                  obscureText: passwordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Confirm Password";
                                    }
                                    if (value != passwordController.text) {
                                      return "Passwords do not match";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Confirm Password",
                                    label: Text('Confirm Password'),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromARGB(82, 36, 42, 101),
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
                                        color: Color.fromARGB(255, 36, 42, 101),
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
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
                                      )),
                                  Container(
                                    height: 1,
                                    color: Color.fromARGB(82, 36, 42, 101),
                                    width: 100,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset('lib/Image/Face-ID.png'),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Use Your Face ID',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 36, 42, 101),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              _register(context);
                            }
                          },
                          height: 50,
                          minWidth: 240,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          textColor: Colors.white,
                          color: Colors.blue.shade700,
                          shape: const StadiumBorder(),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
