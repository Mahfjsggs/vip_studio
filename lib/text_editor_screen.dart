import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextEditorScreen extends StatefulWidget {
  const TextEditorScreen({super.key});

  @override
  State<TextEditorScreen> createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _improveText() {
    setState(() {
      _result = '✨ النص المحسن:\n\n${_controller.text}\n\n#هاشتاك #محتوى #VIP';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محرر النصوص', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              style: GoogleFonts.tajawal(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'اكتب فكرتك او النص هنا...',
                hintStyle: GoogleFonts.tajawal(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF17171F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _improveText,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('حسن النص بالذكاء الاصطناعي', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF17171F),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Text(_result, style: GoogleFonts.tajawal(fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
