import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

import '../models/email.dart';
import '../screen/detailScreen.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function funtionMarkAsReady;
  final Function funtionDeleteEmail;

  const EmailWidget(
      {super.key,
      required this.email,
      required this.funtionMarkAsReady,
      required this.funtionDeleteEmail});

  @override
  Widget build(BuildContext context) {
    final readEmail = email.read;
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(email.dateTime);
    if (kDebugMode) {
      print(formattedDate);
    }
    return Column(
      children: <Widget>[
        GestureDetector(
          onLongPress: () => funtionMarkAsReady(email),
          onTap: () => {
            funtionMarkAsReady(email),
            Navigator.pushNamed(
              context,
              'DetailScreen',
              arguments: DetailScreenArguments(
                email.from,
                email.subject,
                email.body,
                email.dateTime,
              ),
            ),
          },
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              funtionDeleteEmail(email);
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              funtionDeleteEmail(email);
            }
          },
          child: Row(
            children: [
              // Icon(!readEmail ? Icons.circle : null),
              Icon(
                !readEmail ? Icons.circle : null,
                color: Colors.red,
              ),
              const SizedBox(width: 40),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      email.from,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(email.subject),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 25,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ],
    );
  }
}
