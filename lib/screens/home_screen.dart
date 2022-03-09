import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Welcome Back'),
              const SizedBox(
                height: 10,
              ),
              const Text('Name'),
              const SizedBox(
                height: 10,
              ),
              const Text('Email'),
              const SizedBox(
                height: 20,
              ),
              ActionChip(label: const Text('Logout'), onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
