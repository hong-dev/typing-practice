import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String originalText = "이것과 동일하게 입력하시오";

  int totalSeconds = 0;
  bool isTimerRunning = false;
  late Timer timer;

  bool isSubmitted = false;
  String answerResult = "";

  final textController = TextEditingController();

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds + 1;
    });
  }

  void onStartTyping() {
    if (isSubmitted == true) {
      isSubmitted = false;
    }
    if (isTimerRunning == false) {
      isTimerRunning = true;
      totalSeconds = 0;
    } else {
      return;
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF021631),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF021631),
        foregroundColor: Colors.white,
        title: const Text(
          "Welcome to 한컴타자연습",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Row(
        children: [
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF021631),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF021631),
                  ),
                  child: Text(
                    originalText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                TextFormField(
                  controller: textController,
                  onTap: onStartTyping,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hoverColor: Colors.white,
                    hintText: '입력창',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (String text) {
                    setState(() {
                      submitAnswer();
                    });
                  },
                ),
                Center(
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        submitAnswer();
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                  visible: isSubmitted,
                  child: Text(
                    answerResult,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '$totalSeconds',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF021631),
              ),
            ),
          )
        ],
      ),
    );
  }

  void submitAnswer() {
    timer.cancel();
    isSubmitted = true;
    isTimerRunning = false;
    if (originalText == textController.text) {
      answerResult = "정답입니다!";
    } else {
      answerResult = "틀렸습니다.";
    }
    textController.text = "";
  }
}
