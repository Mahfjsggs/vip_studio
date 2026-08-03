import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  final List<Map<String, String>> _templates = const [
    {'name': 'هوك فيروسي', 'desc': '3 ثواني تخلي المشاهد يكمل', 'color': '0xFFD4AF37'},
    {'name': 'قبل وبعد', 'desc': 'مثالي للجيم والطبخ', 'color': '0xFF9C27B0'},
    {'name': 'قصة سريعة', 'desc': 'اسلوب سرد قصصي', 'color': '0xFF2196F3'},
    {'name': 'تحدي', 'desc': 'قوالب تحديات الترند', 'color': '0xFFE91E63'},
    {'name': 'نصائح', 'desc': '5 نصائح ب 15 ثانية', 'color': '0xFF4CAF50'},
    {'name': 'رياكشن', 'desc': 'رد فعل على ترند', 'color': '0xFFFF9800'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('🎬 قوالب متحركة', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemCount: _templates.length,
          itemBuilder: (context, index) {
            final template = _templates[index];
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF17171F),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(int.parse(template['color']!)), width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.movie, size: 40, color: Color(int.parse(template['color']!))),
                  const SizedBox(height: 10),
                  Text(template['name']!, style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(template['desc']!, textAlign: TextAlign.center, style: GoogleFonts.tajawal(fontSize: 12, color: Colors.white54)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('سيتم ربط التحميل لاحقا'), backgroundColor: const Color(0xFFD4AF37)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(int.parse(template['color']!)),
                      foregroundColor: Colors.black,
                    ),
                    child: Text('تحميل', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
