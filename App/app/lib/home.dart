import 'package:app/from_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final String pattern = r'^[0-9]{10}$';
  var name = TextEditingController();
  var ph = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message to Number"),
        backgroundColor: const Color.fromARGB(255, 232, 118, 156),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: ph,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(pattern)),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () async {
                var phoneNumber = ph.text.toString();
                final _text = 'sms:$phoneNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              color: Colors.blue,
              child: const Text(
                "text",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
