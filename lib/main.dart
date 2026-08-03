import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'vip_screen.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37))));
          }
          if (snapshot.hasData) {
            if (!snapshot.data!.emailVerified) {
              return const VerifyEmailScreen(); // امان اضافي
            }
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mark_email_unread, size: 80, color: Color(0xFFD4AF37)),
              const SizedBox(height: 20),
              Text('فعل ايميلك', style: GoogleFonts.tajawal(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              Text('رسلنا رابط التفعيل على ايميلك', style: GoogleFonts.tajawal(color: Colors.white70)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => FirebaseAuth.instance.currentUser?.sendEmailVerification(),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black),
                child: Text('اعادة ارسال الرابط', style: GoogleFonts.tajawal()),
              ),
              TextButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text('تسجيل خروج', style: GoogleFonts.tajawal(color: Colors.white70)),
              )
            ],
          ),
        ),
      ),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
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
            _buildButton(context, '👑 الاشتراك VIP', const VipScreen()),
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
