import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'vip_screen.dart';

class VoiceScreen extends StatefulWidget {
  final String text;
  final bool isVip;
  const VoiceScreen({super.key, required this.text, required this.isVip});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String _selectedVoice = 'ar-XA-Wavenet-A';

  final List<Map<String, String>> _voices = [
    {'name': 'رجالي قوي', 'code': 'ar-XA-Wavenet-A'},
    {'name': 'نسائي هادئ', 'code': 'ar-XA-Wavenet-B'},
    {'name': 'رجالي حماسي', 'code': 'ar-XA-Wavenet-C'},
    {'name': 'نسائي VIP فخم', 'code': 'ar-XA-Wavenet-D'},
  ];

  Future<void> _speak() async {
    await flutterTts.setLanguage('ar-XA');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVip) {
      return Scaffold(
        backgroundColor: const Color(0xFF0A0A0F),
        appBar: AppBar(title: Text('تغيير الاصوات', style: GoogleFonts.tajawal(color: Colors.white)), backgroundColor: Colors.transparent),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Color(0xFFD4AF37)),
              const SizedBox(height: 20),
              Text('هالميزة VIP فقط', style: GoogleFonts.tajawal(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VipScreen())),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black),
                child: Text('اشترك VIP', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(title: Text('🎙️ تغيير الاصوات VIP', style: GoogleFonts.tajawal(color: const Color(0xFFD4AF37))), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12)),
              child: Text(widget.text, style: GoogleFonts.tajawal(color: Colors.white)),
            ),
            const SizedBox(height: 30),
            Text('اختر الصوت', style: GoogleFonts.tajawal(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 15),
            ..._voices.map((v) => RadioListTile(
              title: Text(v['name']!, style: GoogleFonts.tajawal(color: Colors.white)),
              value: v['code']!,
              groupValue: _selectedVoice,
              activeColor: const Color(0xFFD4AF37),
              onChanged: (val) => setState(() => _selectedVoice = val!),
            )),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _speak,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text('استمع للسكريبت', style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
