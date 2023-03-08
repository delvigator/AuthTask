import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logintask/service/UserService.dart';

import 'models/User.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _State();
}

class _State extends State<Auth> {
  User? _user;
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void getData() {
    var username = _usernameTextController.text;
    var password = _passwordTextController.text;
    UserService().getUser(username, password).then((value) {
      setState(() => _user = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsetsDirectional.all(5),
              child: TextField(
                controller: _usernameTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              )),
          Container(
              padding: const EdgeInsetsDirectional.all(5),
              child: TextField(
                controller: _passwordTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              )),
          Container(
            child: TextButton(
              child: Text("ОК"),
              onPressed: () {
                getData();
              },

            ),
          ),
          Container(
              child: (_user == null)
                  ? const Center(child: CircularProgressIndicator())
                  : connectionStructure()),
        ],
      ),
    ));
  }

  Widget connectionStructure() {
    return Container(
        height: 80,
        child: ListView(children: [
          ListTile(
              leading: const Icon(Icons.account_circle),
              subtitle: Text("${_user!.lastName} ${_user!.firstName} ${_user!.patronymic}  ${_user!.position} ")),
        ]));
  }
}
