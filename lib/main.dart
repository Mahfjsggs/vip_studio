import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_editor_screen.dart';
import 'hashtags_screen.dart';
import 'script_screen.dart';
import 'best_time_screen.dart';
import 'templates_screen.dart';
import 'calendar_screen.dart';
import 'competitor_screen.dart';
import 'thumbnail_screen.dart';
import 'replies_screen.dart';
import 'analytics_screen.dart';
import 'vip_screen.dart'; // الاخير

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
        child: ListView(
          children: [
            Text('المرحلة 1: الذكاء', style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 15),
            _buildButton(context, '🧠 مولد الافكار', const TextEditorScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '#️⃣ مولد الهاشتاكات', const HashtagsScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '📜 مولد السكريبت', const ScriptScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '⏰ أفضل وقت نشر', const BestTimeScreen()),

            const SizedBox(height: 30),
            Text('المرحلة 2: الفخامة', style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 15),
            _buildButton(context, '🎬 قوالب متحركة', const TemplatesScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '📅 مخط 30 يوم', const CalendarScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '🔍 تحليل منافس', const CompetitorScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '🖼️ مولد صور مصغرة', const ThumbnailScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '💬 ردود ذكية', const RepliesScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '📊 لوحة التحليلات', const AnalyticsScreen()),
            const SizedBox(height: 15),
            _buildButton(context, '👑 الاشتراك VIP', const VipScreen()), // الاخير
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF17171F),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(text, style: GoogleFonts.tajawal(fontSize: 18)),
    );
  }
}
