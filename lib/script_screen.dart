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

  void _generate() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _script = 'السلام عليكم شباب\nاليوم موضوعنا عن ${_controller.text}\nاول نقطة...';
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
              style: GoogleFonts.tajawal(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'اكتب موضوع الفيديو',
                hintStyle: GoogleFonts.tajawal(color: Colors.white38),
                filled: true, fillColor: const Color(0xFF17171F),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _generate,
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF9C27B0), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
                child: Text('ولد السكريبت', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            if (_script.isNotEmpty) ...[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(child: Text(_script, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 16))),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('ميزة الصوت قريباً 🎙️')),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: Text('🎙️ استمع بالصوت - VIP', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
