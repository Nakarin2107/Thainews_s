// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/darwer.dart';
import 'package:hunter/test.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://img.freepik.com/premium-photo/news-3d-text_2227-174.jpg",
              fit: BoxFit.contain,
              height: 230,
            ),
            SizedBox(height: 20),
            Text(
              "สนุกกับประสบการณ์การอ่านข่าว",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'เริ่มการสำรวจข่าวของเราอย่างง่ายดายเพียงแค่\nไม่กี่คลิ๊ก พบเหตุการณ์ที่น่าสนใจ และความสำคัญทันทีที่คลิกเข้ามา',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(() => TestLogin());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 149, 150, 151),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
