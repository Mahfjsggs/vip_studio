import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  final List<Map<String, String>> _plan = const [
    {'day': 'اليوم 1', 'topic': 'هوك فيروسي: اكبر غلطة بـ', 'type': 'تعليمي'},
    {'day': 'اليوم 2', 'topic': 'قبل وبعد: النتيجة مال', 'type': 'تحفيزي'},
    {'day': 'اليوم 3', 'topic': '3 نصائح سريعة عن', 'type': 'قيمة'},
    {'day': 'اليوم 4', 'topic': 'رد على تعليق متابع', 'type': 'تفاعل'},
    {'day': 'اليوم 5', 'topic': 'قصة شخصية: كيف بديت بـ', 'type': 'قصة'},
    {'day': 'اليوم 6', 'topic': 'تحدي 7 ايام لـ', 'type': 'تحدي'},
    {'day': 'اليوم 7', 'topic': 'اسئلة واجوبة لايف', 'type': 'لايف'},
  ];

  Color _getTypeColor(String type) {
    switch (type) {
      case 'تعليمي': return const Color(0xFF2196F3);
      case 'تحفيزي': return const Color(0xFF9C27B0);
      case 'قيمة': return const Color(0xFF4CAF50);
      case 'تفاعل': return const Color(0xFFE91E63);
      case 'قصة': return const Color(0xFFFF9800);
      case 'تحدي': return const Color(0xFFD4AF37);
      default: return const Color(0xFF9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('📅 مخط 30 يوم', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _plan.length,
        itemBuilder: (context, index) {
          final item = _plan[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF17171F),
              borderRadius: BorderRadius.circular(12),
              border: Border(left: BorderSide(color: _getTypeColor(item['type']!), width: 4)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getTypeColor(item['type']!),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(item['day']!, style: GoogleFonts.tajawal(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['topic']!, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(item['type']!, style: GoogleFonts.tajawal(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
