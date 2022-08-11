import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medium-Node-Flutter',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool haveResponse = false;
  String url = "https://b312-27-58-113-97.in.ngrok.io";
  final requestController = new TextEditingController();
  late String _response;

  Future getResponse() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: requestController,
              decoration: InputDecoration(
                hintText: "Enter request query",
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              child: Chip(
                elevation: 4.0,
                backgroundColor: Colors.white,
                label: Text(
                  "Send Request",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onTap: () async {
                var response = await http.get(Uri.parse(url));
                if (response.statusCode == 200) {
                  String responseString = response.body;
                  setState(() {
                    _response = responseString;
                    haveResponse = true;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            haveResponse
                ? Text(_response,
                    style: TextStyle(color: Colors.deepOrangeAccent))
                : Text("No Response yet")
          ],
        ),
      ),
    );
  }
}
