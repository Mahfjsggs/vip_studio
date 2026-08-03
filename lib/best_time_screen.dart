import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestTimeScreen extends StatefulWidget {
  const BestTimeScreen({super.key});

  @override
  State<BestTimeScreen> createState() => _BestTimeScreenState();
}

class _BestTimeScreenState extends State<BestTimeScreen> {
  String _selectedCategory = 'عام';
  List<String> _times = [];

  final List<String> _categories = ['عام', 'كوميديا', 'طبخ', 'جيم', 'تعليم', 'موضة'];

  void _generateTimes() {
    // وهمي لحد ما نربط جيميني. بعدين يصير ذكي حسب البلد
    Map<String, List<String>> fakeData = {
      'عام': ['7:00 م', '9:00 م', '11:00 م'],
      'كوميديا': ['8:00 م', '10:00 م', '12:00 ص'],
      'طبخ': ['12:00 ظ', '6:00 م', '8:00 م'],
      'جيم': ['6:00 ص', '5:00 م', '7:00 م'],
      'تعليم': ['4:00 م', '7:00 م', '9:00 م'],
      'موضة': ['2:00 م', '8:00 م', '10:00 م'],
    };

    setState(() {
      _times = fakeData[_selectedCategory]!;
    });
  }

  @override
  void initState() {
    super.initState();
    _generateTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('⏰ أفضل وقت نشر', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اختر تخصصك:', style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              dropdownColor: const Color(0xFF17171F),
              style: GoogleFonts.tajawal(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF17171F),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              items: _categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
                _generateTimes();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _generateTimes,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('جيبلي افضل 3 اوقات', style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Text('الاوقات الذهبية ل $_selectedCategory:', style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _times.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF17171F),
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.access_time, color: Color(0xFFD4AF37)),
                      title: Text(_times[index], style: GoogleFonts.tajawal(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text('بتوقيت بغداد', style: GoogleFonts.tajawal(color: Colors.white38)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
