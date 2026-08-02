import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_editor_screen.dart';
import 'templates_screen.dart';
import 'tips_screen.dart'; // ضفنا استيراد النصائح

void main() {
  runApp(const VipStudioApp());
}

class VipStudioApp extends StatelessWidget {
  const VipStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIP Studio',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B0F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFFBB86FC),
          surface: Color(0xFF17171F),
          onPrimary: Colors.black,
          onSurface: Colors.white,
        ),
        textTheme: GoogleFonts.tajawalTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0B0B0F),
              Color(0xFF17171F),
              Color(0xFF0B0B0F),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFF5D67B), Color(0xFFD4AF37)],
                  ).createShader(bounds),
                  child: Text(
                    'VIP STUDIO',
                    style: GoogleFonts.tajawal(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'أداتك الاحترافية لصناعة المحتوى',
                  style: GoogleFonts.tajawal(
                    fontSize: 15,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: 40),
                _FeatureCard(
                  icon: Icons.edit_note_rounded,
                  title: 'محرر النصوص',
                  subtitle: 'اكتب وطوّر أفكارك بسهولة',
                  color: const Color(0xFFD4AF37),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const TextEditorScreen()));
                  },
                ),
                const SizedBox(height: 16),
                _FeatureCard(
                  icon: Icons.image_rounded,
                  title: 'قوالب الأغلفة',
                  subtitle: 'اختر من مكتبة تصاميم جاهزة',
                  color: const Color(0xFFBB86FC),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const TemplatesScreen()));
                  },
                ),
                const SizedBox(height: 16),
                _FeatureCard(
                  icon: Icons.lightbulb_rounded,
                  title: 'نصائح ذكية',
                  subtitle: 'حسّن محتواك بتوصيات مخصصة',
                  color: const Color(0xFF4FC3F7),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const TipsScreen())); // ربطناه
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF17171F),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.tajawal(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.tajawal(
                      fontSize: 13,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white38, size: 16),
          ],
        ),
      ),
    );
  }
}
