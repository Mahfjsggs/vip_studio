import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScriptScreen extends StatefulWidget {
  const ScriptScreen({super.key});

  @override
  State<ScriptScreen> createState() => _ScriptScreenState();
}

class _ScriptScreenState extends State<ScriptScreen> {
  final TextEditingController _controller = TextEditingController();
  String _script = '';

  void _generateScript() {
    if (_controller.text.isEmpty) {
      setState(() => _script = 'اكتب موضوع الفيديو اول');
      return;
    }

    // وهمي لحد ما نربط جيميني
    setState(() {
      _script = '''🎬 سكريبت فيديو: ${_controller.text}
المدة: 30 ثانية

[0-3 ثانية - الهوك]
"وقف! اذا تريد تعرف عن ${_controller.text} كمل الفيديو للاخير"

[4-15 ثانية - القيمة]
"اغلب الناس يغلطون بهاي النقطة مال ${_controller.text}. 
السر هو انك لازم... 1... 2... 3..."

[16-25 ثانية - الدليل]
"انا جربتها وخلال اسبوع شفت نتيجة. شوفوا الفرق"

[26-30 ثانية - CTA]
"احفظ الفيديو وتابعني علمود بعد، واكتبلي بالتعليقات رأيك"

#جاهز_للتصوير''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('📜 مولد السكريبت', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
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
                hintText: 'اكتب موضوع الفيديو: كيف اخسر وزن، طبخة سريعة',
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
                onPressed: _generateScript,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('ولدلي سكريبت 30 ثانية', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
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
                  child: Text(_script, style: GoogleFonts.tajawal(fontSize: 15, color: Colors.white, height: 1.8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
