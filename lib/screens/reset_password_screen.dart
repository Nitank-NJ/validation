import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your email");
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: 210,
                    child: Text(
                      'Enter Your Email to reset your password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 350,
                      child: emailField),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: resetPassword,
                      child: Text('Reset Password'),
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
  Future resetPassword() async  {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

    Fluttertoast.showToast(msg: "Password Reset Email Sent:) ");
  }
}
