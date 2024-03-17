import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '25:00',
                style: TextStyle(
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Center(
                  child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                icon: const Icon(Icons.play_circle_outline),
                onPressed: () {},
              ))),
          Flexible(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
