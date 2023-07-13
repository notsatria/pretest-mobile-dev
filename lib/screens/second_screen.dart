import 'package:flutter/material.dart';
import 'package:pretest_suitmedia/constant/theme.dart';
import 'package:pretest_suitmedia/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/second-screen';
  final String? name;
  final String? username;

  SecondScreen({super.key, this.name, this.username});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String? name = args['name'];
    String? username = args['username'];


    PreferredSizeWidget _appBar() {
      return AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/ic_back.png',
          ),
        ),
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget _header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: reguler,
            ),
          ),
          Text(
            name.toString(),
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ],
      );
    }

    Widget _textSelectedUsername() {
      return Center(
        child: Text(
          (username != null) ? username.toString() : 'Selected Username',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget _chooseUserButton() {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 32),
          width: 310,
          height: 52,
          child: MaterialButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: secondaryColor,
            onPressed: () {
              Navigator.pushNamed(context, ThirdScreen.routeName, arguments: {'name' : name});
            },
            child: Text(
              'Choose a User',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const Spacer(),
            _textSelectedUsername(),
            const Spacer(),
            _chooseUserButton(),
          ],
        ),
      ),
    );
  }
}
