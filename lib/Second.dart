import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("หน้า 2"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(



          mainAxisAlignment: MainAxisAlignment.center,

          children: [
              CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/icon/po.jpg'),
            ),


            const Icon(Icons.check_circle, size: 100, color: Colors.green),
             SizedBox(height: 20),
            const Text(
              "ยินดีต้อนรับสู่หน้า 2",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                "กลับหน้าหลัก",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}