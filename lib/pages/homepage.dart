import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final String apiGetUrl = "https://jsonplaceholder.typicode.com/posts";
bool runApi = false;
String data = "";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RestAPI")),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              setState(() {
                runApi = true;
              });

              final response = await http.get(Uri.parse(apiGetUrl));

              setState(() {
                data = response.body;
                runApi = false;
              });
            },
            child: const Text("Call Api"),
          ),
          Container(
            child: runApi ? CircularProgressIndicator() : Text(data),
          ),
        ],
      )),
    );
  }
}
