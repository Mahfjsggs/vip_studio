import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompetitorScreen extends StatefulWidget {
  const CompetitorScreen({super.key});

  @override
  State<CompetitorScreen> createState() => _CompetitorScreenState();
}

class _CompetitorScreenState extends State<CompetitorScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _result;

  void _analyze() {
    if (_controller.text.isEmpty) {
      setState(() => _result = null);
      return;
    }
    setState(() {
      _result = {
        'name': _controller.text,
        'posts': '34 فيديو',
        'avg_views': '125K',
        'best_time': '9:00 م',
        'top_hashtags': '#ترند #فاير #اكسبلور',
        'advice': 'يركز على الهوك اول 2 ثانية. يستخدم ترندات الصوت. ينشر يوميا'
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('🔍 تحليل منافس', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.tajawal(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'الصق رابط تيك توك او اكتب اسم الحساب',
                hintStyle: GoogleFonts.tajawal(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF17171F),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFFD4AF37)),
                  onPressed: _analyze,
                )
              ),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Expanded(
                child: ListView(
                  children: [
                    _buildCard('📊 عدد المنشورات', _result!['posts']),
                    _buildCard('👀 متوسط المشاهدات', _result!['avg_views']),
                    _buildCard('⏰ افضل وقت ينشر', _result!['best_time']),
                    _buildCard('#️⃣ اكثر هاشتاكات', _result!['top_hashtags']),
                    _buildCard('💡 نصيحتنا الك', _result!['advice']),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF17171F), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.tajawal(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
