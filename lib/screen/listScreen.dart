import 'package:flutter/material.dart';

import '../models/backend.dart';
import '../models/email.dart';
import '../widgets/emailWidget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final getEmails = Backend().getEmails();

  void changeEmailMarkRead(Email email) {
    setState(() {
      Backend().markEmailAsRead(email.id);
    });
  }

  void deleteEmail(Email email) {
    Backend().deleteEmail(email.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Email App')),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          itemCount: getEmails.length,
          itemBuilder: (context, index) {
            final item = getEmails[index];

            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(
                  () {
                    getEmails.removeAt(index);
                  },
                );

                // Luego muestra un snackbar!
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Email Eliminado"),
                  ),
                );
              },
              background: Container(color: Colors.red),
              child: EmailWidget(
                email: item,
                funtionMarkAsReady: changeEmailMarkRead,
                funtionDeleteEmail: deleteEmail,
              ),
            );
          }),
    );
  }
}
