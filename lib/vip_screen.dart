import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('👑 VIP Studio Pro', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold, color: const Color(0xFFD4AF37))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFFFD700)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text('اشتراك VIP', style: GoogleFonts.tajawal(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('9.99\$ / شهريا', style: GoogleFonts.tajawal(color: Colors.black87, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _feature('✅ مولد غير محدود'),
            _feature('✅ تحليلات متقدمة'),
            _feature('✅ اصوات AI احترافية'),
            _feature('✅ ازالة الاعلانات'),
            _feature('✅ دعم 24 ساعة'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('سيتم ربط الدفع لاحقا'), backgroundColor: const Color(0xFFD4AF37)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text('اشترك الان', style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _feature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(text, style: GoogleFonts.tajawal(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
