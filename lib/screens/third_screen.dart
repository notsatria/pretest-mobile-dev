import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pretest_suitmedia/constant/theme.dart';
import 'package:pretest_suitmedia/screens/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  static const routeName = '/third-screen';

  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final String _apiUrl = 'https://reqres.in/api/users?page=1&per_page=10';
  final List _items = [];

  Future<void> _fetchDataUser() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        _items.addAll(data['data']);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future refresh() async {
    setState(() {
      _items.clear();
    });
    await _fetchDataUser();

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataUser();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String? name = args['name'];

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
          'Third Screen',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget _userCard({
      required String firstname,
      required String lastname,
      required String email,
      required String avatar,
    }) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, SecondScreen.routeName, arguments: {
                'name': name,
                'username': '$firstname $lastname'
              });
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         SecondScreen(username: '$firstname $lastname'),
              //   ),
              // );
            },
            splashColor: Colors.deepPurple[100],
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(avatar, fit: BoxFit.cover),
              ),
            ),
            title: Text(
              '$firstname $lastname',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              email,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
          const Divider(thickness: 0.3),
        ],
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final data = _items[index];
                if (_items.isNotEmpty) {
                  return _userCard(
                    firstname: data['first_name'],
                    lastname: data['last_name'],
                    email: data['email'],
                    avatar: data['avatar'],
                  );
                } else if (_items.isEmpty) {
                  return const Text('No data found');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
