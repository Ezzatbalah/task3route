import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const ContactScreen());
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
