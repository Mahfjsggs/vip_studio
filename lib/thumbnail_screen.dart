import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThumbnailScreen extends StatefulWidget {
  const ThumbnailScreen({super.key});

  @override
  State<ThumbnailScreen> createState() => _ThumbnailScreenState();
}

class _ThumbnailScreenState extends State<ThumbnailScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _ideas = [];

  void _generate() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _ideas = [
        {'title': 'صدمة! ${_controller.text}', 'subtitle': 'السبب راح يبهرك'},
        {'title': 'كيف سويت ${_controller.text}', 'subtitle': 'بـ 3 خطوات بس'},
        {'title': 'تحديت نفسي بـ ${_controller.text}', 'subtitle': 'والنتيجة؟'},
        {'title': 'الغلط اللي يدمر ${_controller.text}', 'subtitle': 'تجنبه فورا'},
        {'title': 'سر ${_controller.text}', 'subtitle': 'محد راح يكلك ياه'},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('🖼️ مولد صور مصغرة', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.tajawal(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'اكتب موضوع الفيديو: طبخة، جيم، سفر',
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
                onPressed: _generate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('ولدلي 5 عناوين فيروسية', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _ideas.length,
                itemBuilder: (context, index) {
                  final idea = _ideas[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF17171F),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFD4AF37), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(idea['title']!, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(idea['subtitle']!, style: GoogleFonts.tajawal(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
