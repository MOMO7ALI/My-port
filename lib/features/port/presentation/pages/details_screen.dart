// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تفاصيل الاتصال",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5b2892),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Text(
              "Alaa Hosni:تم تطويرة بواسطة ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5b2892),
              ),
            ),
            const SizedBox(height: 16),

            // Address Section
            const Text(
              "منطقة تليفونات الفيوم\nسنترال أبشواي",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),

            // Contact Section
            const ListTile(
              leading: Icon(Icons.phone, color: Color(0xFF5b2892)),
              title: Text(
                "  01556070191 : موبايل",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone_android, color: Color(0xFF5b2892)),
              title: const Text(
                "واتساب: https://wa.me/201556070191",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://wa.me/201556070191');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
