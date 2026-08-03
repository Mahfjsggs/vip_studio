import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_editor_screen.dart';  // شلت كلمة screens/
import 'hashtags_screen.dart';     // شلت كلمة screens/

void main() {
  runApp(const VIPStudioApp());
}

class VIPStudioApp extends StatelessWidget {
  const VIPStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIP Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('VIP Studio', style: GoogleFonts.tajawal(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFFD4AF37))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('المرحلة 1: الذكاء', style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 15),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TextEditorScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF17171F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Text('🧠 مولد الافكار', style: GoogleFonts.tajawal(fontSize: 18)),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HashtagsScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF17171F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Text('#️⃣ مولد الهاشتاكات', style: GoogleFonts.tajawal(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
