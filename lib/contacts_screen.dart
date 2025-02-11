import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> storedContacts = await ContactsService.getContacts();
      setState(() {
        contacts = storedContacts.toList();
      });
    }
  }

  Future<void> saveContact() async {
    Contact newContact = Contact(
      givenName: "New Contact",
      phones: [Item(label: "mobile", value: "1234567890")],
    );
    await ContactsService.addContact(newContact);
    fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName ?? "No Name"),
            subtitle: Text(contact.phones?.isNotEmpty == true ? contact.phones!.first.value! : "No Number"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveContact,
        child: Icon(Icons.add),
      ),
    );
  }
}
