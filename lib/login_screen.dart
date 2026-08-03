import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _loading = false;
  bool _isLogin = true;

  Future<void> _auth() async {
    setState(() => _loading = true);
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
      } else {
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
        await user.user?.sendEmailVerification();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ: $e'), backgroundColor: Colors.red));
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('VIP Studio', style: GoogleFonts.tajawal(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFFD4AF37))),
              const SizedBox(height: 40),
              TextField(controller: _email, style: GoogleFonts.tajawal(color: Colors.white), decoration: InputDecoration(hintText: 'الايميل', filled: true, fillColor: const Color(0xFF17171F), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
              const SizedBox(height: 15),
              TextField(controller: _pass, obscureText: true, style: GoogleFonts.tajawal(color: Colors.white), decoration: InputDecoration(hintText: 'كلمة السر', filled: true, fillColor: const Color(0xFF17171F), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
              const SizedBox(height: 30),
              _loading ? const CircularProgressIndicator(color: Color(0xFFD4AF37)) : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _auth,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: Text(_isLogin ? 'تسجيل دخول' : 'انشاء حساب', style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => _isLogin = !_isLogin),
                child: Text(_isLogin ? 'ماعندك حساب؟ سجل' : 'عندك حساب؟ سجل دخول', style: GoogleFonts.tajawal(color: Colors.white70)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
