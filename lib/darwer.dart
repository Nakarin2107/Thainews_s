// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hunter/my_home_page.dart';
import 'package:hunter/test.dart';
import 'package:hunter/thai%20news.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Thai News Api',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Welcome'),
            onTap: () {
              Get.to(MyHomePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Get.to(TestLogin());
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper_rounded),
            title: Text('ThaiNews'),
            onTap: () {
              Get.to(ThaiNews());
            },
          ),
        ],
      ),
    );
  }
}