import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HashtagsScreen extends StatefulWidget {
  const HashtagsScreen({super.key});

  @override
  State<HashtagsScreen> createState() => _HashtagsScreenState();
}

class _HashtagsScreenState extends State<HashtagsScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _hashtags = [];

  void _generateHashtags() {
    if (_controller.text.isEmpty) {
      setState(() => _hashtags = ['اكتب موضوع الفيديو اول']);
      return;
    }

    // وهمي لحد ما نربط جيميني
    setState(() {
      _hashtags = [
        '#${_controller.text.replaceAll(' ', '')}',
        '#ترند_${_controller.text}',
        '#العراق_${_controller.text}',
        '#نصائح_${_controller.text}',
        '#فولو',
        '#اكسبلور',
        '#viral',
        '#tiktok_iraq',
        '#مشاهير',
        '#اكتشف',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('#️⃣ مولد الهاشتاكات', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'اكتب موضوع الفيديو: طبخ، رقص، كوميديا',
                hintStyle: GoogleFonts.tajawal(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF17171F),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _generateHashtags,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('ولدلي 10 هاشتاكات', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _hashtags.map((tag) {
                  return Chip(
                    label: Text(tag, style: GoogleFonts.tajawal(color: Colors.black, fontWeight: FontWeight.bold)),
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
