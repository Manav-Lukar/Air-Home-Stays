import 'package:air_home_stay/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get enteredName => _nameController.text;
  String get enteredEmail => _emailController.text;
  String get enteredDOB => _dobController.text;
  String get enteredMobile => _mobileController.text;
  String get enteredPassword => _passwordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCircularTextField(
                      controller: _nameController,
                      labelText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20.0),
                    _buildCircularTextField(
                      controller: _emailController,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20.0),
                    _buildCircularTextField(
                      controller: _dobController,
                      labelText: "Date of Birth",
                      keyboardType: TextInputType.datetime,
                    ),
                    const SizedBox(height: 20.0),
                    _buildCircularTextField(
                      controller: _mobileController,
                      labelText: "Mobile Number",
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20.0),
                    _buildCircularTextField(
                      controller: _passwordController,
                      labelText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _saveSignUpInfo();

                            // Navigate to the ProductScreen
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(),
                              ),
                            );
                          }
                        },
                        child: Text("Sign Up"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to the LoginScreen for existing users
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Already have an account? Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Future<void> _saveSignUpInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", enteredName);
    prefs.setString("email", enteredEmail);
    prefs.setString("dob", enteredDOB);
    prefs.setString("mobile", enteredMobile);
    prefs.setString("password", enteredPassword);
  }

  Widget _buildCircularTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $labelText";
        }
        return null;
      },
    );
  }
}
