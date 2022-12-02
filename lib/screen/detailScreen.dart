import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final DetailScreenArguments args =
        ModalRoute.of(context)?.settings.arguments as DetailScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            Row(
              children: [
                const Text(
                  'From: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(args.from),
              ],
            ),
            const Divider(
              height: 25,
              color: Color.fromARGB(255, 222, 85, 85),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(args.subject),
                Text(
                  args.fecha.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 25,
              color: Color.fromARGB(255, 222, 85, 85),
            ),
            Text(args.body),
          ],
        ),
      ),
    );
  }
}

class DetailScreenArguments {
  final String from;
  final String subject;
  final String body;
  final DateTime fecha;

  DetailScreenArguments(this.from, this.subject, this.body, this.fecha);
}
