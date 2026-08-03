import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextEditorScreen extends StatefulWidget {
  const TextEditorScreen({super.key});

  @override
  State<TextEditorScreen> createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _ideas = [];

  void _generateIdeas() {
    if (_controller.text.isEmpty) {
      setState(() => _ideas = ['اكتب المجال مالك اول... مثلا: طبخ، جيم، كوميديا']);
      return;
    }

    // هسه وهمي. بعدين نربطه بجيميني
    setState(() {
      _ideas = [
        '1. 3 أخطاء يدمرون ${_controller.text} ومحد يحجي عنها',
        '2. جربت ${_controller.text} لمدة 7 ايام وهذا اللي صار',
        '3. سر واحد بـ ${_controller.text} يغير حياتك',
        '4. ليش 90% يفشلون بـ ${_controller.text}',
        '5. تحدي: ${_controller.text} بس ب 10 دولار',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('🧠 مولد الافكار', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
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
                hintText: 'اكتب تخصصك: طبخ، رياضة، كوميديا...',
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
                onPressed: _generateIdeas,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('ولدلي 5 افكار فيروسية', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _ideas.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF17171F),
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(_ideas[index], style: GoogleFonts.tajawal(color: Colors.white, fontSize: 15)),
                      trailing: const Icon(Icons.copy, color: Color(0xFFD4AF37)),
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
