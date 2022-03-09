import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchPeople(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://swapi.dev/api/people/?format=json'));

  var data = await json.decode(response.body);
  return data;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars'),
      ),
      body: FutureBuilder<dynamic>(
        future: fetchPeople(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PeopleList(people: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final dynamic people;

  const PeopleList({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var results = people['results'];

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        var person = results[index];
        var name = person['name'];
        var eyecolor = person['eye_color'];
        var created = person['created'];
        var films = person['films'];
        var url = person['url'];

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.grey,
                  width: 250, child: Text("Name : $name",
                style:const TextStyle(
                    fontSize: 18
                ),)),
              Container(
                width: 250,
                color: Colors.amberAccent,
                child: Text("Eye Color : $eyecolor",
                  style: const TextStyle(
                      fontSize: 18
                  ),),
              ),
              Container(
                width: 250,
                color: Colors.teal,
                child: Text("Created : $created",
                  style: const TextStyle(
                      fontSize: 18
                  ),),
              ),
              Container(
                width: 250,
                color: Colors.cyan,
                child: Text("Films :\n$films",
                  style: const TextStyle(
                      fontSize: 18
                  ),),
              ),
              Container(
                width: 250,
                color: Colors.redAccent,
                child: Text("URL : $url",
                  style: const TextStyle(
                      fontSize: 18
                  ),),
              ),
            ],
          ),
        );
      },
    );
  }
}
