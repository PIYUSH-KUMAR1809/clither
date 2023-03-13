// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:clither/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'loading_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sunset.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Clither',
                      style: kCityScreenTitle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90.0,
                width: 100.0,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                    ),
                height: 100.0,
                width: 300.0,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const LoadingScreen();
                      }),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'PTSansNarrow',
                        fontSize: 50.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90.0,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
