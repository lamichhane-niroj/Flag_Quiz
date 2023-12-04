import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // logo
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            "assets/images/countries.png",
            width: 300,
          ),
        ),

        const SizedBox(
          height: 80,
        ),

        // text
        const Text(
          "Memorize the flags of countries in a fun way!",
          style: TextStyle(fontSize: 19),
        ),

        const SizedBox(
          height: 20,
        ),

        // text button
        ElevatedButton.icon(
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 21, 98)),
        ),
      ]),
    );
  }
}
