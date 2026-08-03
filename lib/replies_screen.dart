import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepliesScreen extends StatefulWidget {
  const RepliesScreen({super.key});

  @override
  State<RepliesScreen> createState() => _RepliesScreenState();
}

class _RepliesScreenState extends State<RepliesScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _replies = [];

  void _generate() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _replies = [
        'حبي والله على التعليق ❤️ شنو رأيك بفيديو باجر؟',
        'وجهة نظرك تحترم 👑 بس جرب الطريقة اللي كلت عليها',
        'سؤال حلو! سويت فيديو كامل عنه بالقناة تابعني',
        'هههههه ضحكتني 😂 بس جد انت محق بجزء من كلامك',
        'شكرا لدعمك المستمر 🙏 تحب اسويلك فيديو عن هالموضوع؟'
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('💬 ردود ذكية', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              style: GoogleFonts.tajawal(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'الصق تعليق المتابع هنا...',
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
                  backgroundColor: const Color(0xFF9C27B0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('ولدلي 5 ردود', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _replies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF17171F),
                      borderRadius: BorderRadius.circular(12),
                      border: Border(left: BorderSide(color: const Color(0xFF9C27B0), width: 3)),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text(_replies[index], style: GoogleFonts.tajawal(color: Colors.white, fontSize: 15))),
                        IconButton(
                          icon: const Icon(Icons.copy, color: Color(0xFF9C27B0)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('تم النسخ'), backgroundColor: const Color(0xFF9C27B0)),
                            );
                          },
                        )
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
