import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  final List<String> templates = const [
    'قالب ترند تيك توك',
    'قالب يوتيوب شورتس',
    'قالب انستغرام ريلز',
    'قالب منشور فيسبوك',
    'قالب ستوري VIP',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قوالب الأغلفة', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF17171F),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFBB86FC).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.image_rounded, color: const Color(0xFFBB86FC), size: 30),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    templates[index],
                    style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(Icons.download_rounded, color: Colors.white38)
              ],
            ),
          );
        },
      ),
    );
  }
}
