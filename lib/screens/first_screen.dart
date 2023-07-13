import 'package:flutter/material.dart';
import 'package:pretest_suitmedia/constant/theme.dart';
import 'package:pretest_suitmedia/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    palindromeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPalindrome(String word) {
      String newString;
      List reversedWord = [];
      newString = word
          .replaceAll(',', '')
          .replaceAll(':', '')
          .replaceAll('.', '')
          .replaceAll('@', '')
          .replaceAll('#', '')
          .replaceAll('%', '')
          .replaceAll('_', '')
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('\\', '')
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll('"', '')
          .replaceAll('\'', '')
          .replaceAll('-', '')
          .replaceAll('?', '')
          .replaceAll(';', '')
          .replaceAll('!', '')
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('`', '');
      newString = newString.toLowerCase().split(' ').join();

      for (var i = newString.length - 1; i >= 0; i--) {
        reversedWord.add(newString[i]);
      }

      if (newString.length <= 1) return true;

      if (newString == reversedWord.join()) return true;

      return false;
    }

    bool nameValidation() {
      if (nameController.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }

    Widget _inputName() {
      return Container(
        margin: const EdgeInsets.only(top: 58),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        width: 310,
        height: 52,
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration.collapsed(
              hintText: 'Name',
            ),
          ),
        ),
      );
    }

    Widget _inputPalindrome() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        width: 310,
        height: 52,
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: TextFormField(
            controller: palindromeController,
            decoration: const InputDecoration.collapsed(
              hintText: 'Palindrome',
            ),
          ),
        ),
      );
    }

    Widget _checkButton() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        width: 310,
        height: 52,
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: secondaryColor,
          onPressed: () {
            if (isPalindrome(palindromeController.text) == true) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Palindrome Check'),
                      content: const SingleChildScrollView(
                        child: Text('Text is a Palindrome'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Palindrome Check'),
                      content: const SingleChildScrollView(
                        child: Text('Text is Not a Palindrome'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Try Again'),
                        ),
                      ],
                    );
                  });
            }
            palindromeController.clear();
          },
          child: Text(
            'Check',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget _nextButton() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        width: 310,
        height: 52,
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: secondaryColor,
          onPressed: () {
            if (nameValidation() == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please input your name'),
                ),
              );
              return;
            }
            Navigator.pushNamed(context, SecondScreen.routeName,
                arguments: {'name': nameController.text});
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SecondScreen(
            //       name: nameController.text,
            //     ),
            //   ),
            // );
            // nameController.clear();
          },
          child: Text(
            'Next',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(1, -1),
            radius: 0.8,
            colors: [
              Color.fromARGB(131, 251, 217, 93),
              Color(0xff2B637B),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_photo.png',
              width: 116,
              height: 116,
            ),
            _inputName(),
            _inputPalindrome(),
            _checkButton(),
            _nextButton(),
          ],
        ),
      ),
    );
  }
}
