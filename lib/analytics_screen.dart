import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('📊 لوحة التحليلات', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(child: _statCard('👀 مشاهدات', '2.4M', '+12%', const Color(0xFF2196F3))),
                const SizedBox(width: 15),
                Expanded(child: _statCard('❤️ لايكات', '189K', '+8%', const Color(0xFFE91E63))),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _statCard('👥 متابعين', '45.2K', '+5%', const Color(0xFF4CAF50))),
                const SizedBox(width: 15),
                Expanded(child: _statCard('💬 تعليقات', '8.3K', '+20%', const Color(0xFF9C27B0))),
              ],
            ),
            const SizedBox(height: 30),
            Text('أفضل فيديو هذا الاسبوع', style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('5 اخطاء تدمر جسمك بالجيم', style: GoogleFonts.tajawal(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('890K مشاهدة • 45K لايك', style: GoogleFonts.tajawal(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text('نصيحة الذكاء الاصطناعي', style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFFD4AF37))),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFD4AF37))),
              child: Text('انشر الساعة 9 بالليل. الفيديوهات التعليمية جايبة اعلى وصول الك. كمل بنفس النمط', style: GoogleFonts.tajawal(color: Colors.white, fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, String change, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.tajawal(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(change, style: GoogleFonts.tajawal(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
