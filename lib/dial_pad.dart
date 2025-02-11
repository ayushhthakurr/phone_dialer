import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialPad extends StatefulWidget {
  @override
  _DialPadState createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  String phoneNumber = "";

  void dialNumber() async {
    final Uri callUri = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      print("Could not launch $phoneNumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Dialer")),
      body: Column(
        children: [
          Text(
            phoneNumber,
            style: TextStyle(fontSize: 24),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              String buttonText = index < 9 ? '${index + 1}' : index == 9 ? "*" : index == 10 ? "0" : "#";
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    phoneNumber += buttonText;
                  });
                },
                child: Text(buttonText, style: TextStyle(fontSize: 24)),
              );
            },
          ),
          ElevatedButton(
            onPressed: dialNumber,
            child: Text("Call", style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
