import 'package:flutter/material.dart';

class NewsletterSignup extends StatefulWidget {
  const NewsletterSignup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsletterSignupState createState() => _NewsletterSignupState();
}

class _NewsletterSignupState extends State<NewsletterSignup> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Color(0xFFD4AF37).withValues(alpha : 0.1),
      child: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            children: [
              Icon(
                Icons.mail_outline,
                size: 60,
                color: Color(0xFFD4AF37),
              ),
              SizedBox(height: 30),
              Text(
                'Stay In The Loop',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Be the first to know about new products, exclusive offers, and design inspiration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5D4E37),
                  height: 1.6,
                ),
              ),
              SizedBox(height: 40),
              
              if (!_isSubscribed) ...[
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: _subscribe,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD4AF37),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Subscribe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'We respect your privacy. Unsubscribe at any time.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF5D4E37).withValues(alpha : 0.7),
                  ),
                ),
              ] else ...[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha : 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.withValues(alpha : 0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Thank you for subscribing!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _subscribe() {
    if (_emailController.text.isNotEmpty && 
        _emailController.text.contains('@')) {
      setState(() {
        _isSubscribed = true;
      });
      
      // Reset after 3 seconds for demo purposes
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isSubscribed = false;
            _emailController.clear();
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}