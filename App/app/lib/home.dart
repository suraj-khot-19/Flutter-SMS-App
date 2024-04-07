import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var ph = TextEditingController();
  var msg = TextEditingController();
  RegExp mobileNumberPattern = RegExp(r'[0-9]{10}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Message To Number",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 91, 113),
      ),
      body: Column(
        children: [
          //mobile number TextField
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: ph,
              decoration: InputDecoration(
                hintText: 'enter 10 degit Mobile number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          //message TextField
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: msg,
              decoration: InputDecoration(
                hintText: 'enter message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Adjust as needed
                ),
              ),
              onPressed: () async {
                final phoneNumber = ph.text.toString();
                if (mobileNumberPattern.hasMatch(phoneNumber)) {
                  String _text =
                      "sms:$phoneNumber?body=${Uri.encodeQueryComponent(msg.text.toString())}";
                  if (await canLaunch(_text)) {
                    await launch(_text);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Invalid phone number'),
                    duration: Duration(seconds: 5),
                  ));
                }
              },
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
