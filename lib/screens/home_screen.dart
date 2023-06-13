import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String originalText = "이것과 동일하게 입력하시오";
  bool isAnswer = false;

  final textController = TextEditingController();

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
                      if (originalText == textController.text) {
                        isAnswer = true;
                      } else {
                        isAnswer = false;
                      }
                    });
                  },
                ),
                Center(
                  child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        if (originalText == textController.text) {
                          isAnswer = true;
                        } else {
                          isAnswer = false;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                    visible: isAnswer,
                    child: const Text(
                      '정답입니다!',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
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
}
