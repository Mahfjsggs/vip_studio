import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vip_screen.dart';

class VoiceScreen extends StatefulWidget {
  final String text;
  final bool isVip;
  const VoiceScreen({super.key, required this.text, required this.isVip});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
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
            Text('هالميزة بعدها تحت التطوير 🎙️', style: GoogleFonts.tajawal(color: Colors.white70, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
