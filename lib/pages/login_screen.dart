import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) onLogin;
  const LoginScreen({super.key, required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // state
  final _formKey = GlobalKey<FormState>();

  // state input
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  String? inputErrors;

  // sample token result
  final String token = "ABCDEFGH123";

  @override
  void dispose() {
    _inputEmail.dispose();
    _inputPassword.dispose();

    super.dispose();
  }

  void _onSubmit() {
    String email = _inputEmail.text;
    String password = _inputPassword.text;

    // clear state
    setState(() {
      inputErrors = null;
    });

    if (email.isNotEmpty && password.isNotEmpty) {
      widget.onLogin(token);
    } else {
      setState(() {
        inputErrors = "User tidak ditemukan";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Auth Module",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 36),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _inputEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                      ),
                    ),

                    SizedBox(height: 16),

                    TextFormField(
                      controller: _inputPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                      ),
                    ),

                    SizedBox(height: 36.0),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.0),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        _onSubmit();
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Visibility(
                visible: inputErrors != null,
                child: Text(
                  inputErrors ?? "",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
