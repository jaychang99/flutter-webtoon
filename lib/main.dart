import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isTitleOpen = false;

  List<int> numbers = [];

  void onClicked() {
    // refresh UI by calling setState
    // it internally calls build method to update UI
    // counter = counter + 1 does not have to be called inside setState
    // however, for the sake of readability, it is called inside setState
    // counter = counter + 1; setState(() {}); is also valid
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      isTitleOpen = !isTitleOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isTitleOpen
                  ? const MyLargeTitle()
                  : const Text("No content to display"),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override // 보통은 일반 변수로 상단에 정의해도 되나... parent 의 상태, API 응답을 상태로 쓰거나 할 때는 이렇게 사용.
  void initState() {
    // initState() 메서드는 항상 build 메서드보다 먼저 호출됩니다.
    super.initState();
    print("initState");
  }

  @override
  void dispose() {
    // dispose() 메서드는 위젯이 제거될 때 호출됩니다.
    // 이 위젯이 widget tree 에서 제거되기 직전에 호출됩니다.
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
