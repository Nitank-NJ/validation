import 'package:flutter/material.dart';
import 'package:validation/screens/login_screen.dart';

class ResDone extends StatefulWidget {
  const ResDone({Key? key}) : super(key: key);

  @override
  State<ResDone> createState() => _ResDoneState();
}

class _ResDoneState extends State<ResDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Text('Welcome To Star Wars',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal,
                  ),),
                ),
                Text('Congratulations',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                  ),),
                Text('Your Account has been successfully created.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                    child: Text('Click Here to Login')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
