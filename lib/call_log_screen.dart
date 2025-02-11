import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  List<CallLogEntry> callLogs = [];

  @override
  void initState() {
    super.initState();
    fetchCallLogs();
  }

  Future<void> fetchCallLogs() async {
    if (await Permission.phone.request().isGranted) {
      Iterable<CallLogEntry> logs = await CallLog.get();
      setState(() {
        callLogs = logs.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Call History")),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          CallLogEntry entry = callLogs[index];
          return ListTile(
            title: Text(entry.name ?? entry.number ?? "Unknown"),
            subtitle: Text("Duration: ${entry.duration} sec"),
          );
        },
      ),
    );
  }
}
