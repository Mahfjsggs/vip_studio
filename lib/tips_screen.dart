import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  final List<Map<String, String>> tips = const [
    {
      'title': 'الهوك الذهبي',
      'desc': 'اول 3 ثواني هي كلشي. ابدأ بسؤال او رقم صادم',
      'icon': '🎣'
    },
    {
      'title': 'وقت النشر',
      'desc': 'افضل وقت للنشر بالعراق: 8-10 بالليل',
      'icon': '⏰'
    },
    {
      'title': 'الهاشتاكات',
      'desc': 'استخدم 3-5 هاشتاكات. 2 عام + 2 خاص + 1 ترند',
      'icon': '#️⃣'
    },
    {
      'title': 'التفاعل',
      'desc': 'اسأل سؤال بنهاية الفيديو حتى الناس تعلق',
      'icon': '💬'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نصائح ذكية', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF17171F),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF4FC3F7).withOpacity(0.3)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tip['icon']!, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tip['title']!,
                        style: GoogleFonts.tajawal(fontSize: 17, fontWeight: FontWeight.bold, color: const Color(0xFF4FC3F7)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        tip['desc']!,
                        style: GoogleFonts.tajawal(fontSize: 14, color: Colors.white70, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
