import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Column(
            children: [
              Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: Text(
                  'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF5D4E37),
                    height: 1.6,
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Form
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF8B4513).withValues(alpha : 0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send us a message',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B4513),
                            ),
                          ),
                          SizedBox(height: 30),
                          
                          // Form fields
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Your Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Color(0xFFD4AF37)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Color(0xFFD4AF37)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Subject',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Color(0xFFD4AF37)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          
                          TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Your Message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Color(0xFFD4AF37)),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD4AF37),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Send Message',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 60),
                  
                  // Contact Information
                  Expanded(
                    child: Column(
                      children: [
                        _buildContactCard(
                          icon: Icons.email_outlined,
                          title: 'Email',
                          content: 'hello@decodwell.com',
                        ),
                        SizedBox(height: 30),
                        _buildContactCard(
                          icon: Icons.phone_outlined,
                          title: 'Phone',
                          content: '+1 (555) 123-4567',
                        ),
                        SizedBox(height: 30),
                        _buildContactCard(
                          icon: Icons.location_on_outlined,
                          title: 'Address',
                          content: 'Coming Soon\nPhysical Store Location',
                        ),
                        SizedBox(height: 30),
                        _buildContactCard(
                          icon: Icons.access_time,
                          title: 'Business Hours',
                          content: 'Mon - Fri: 9:00 AM - 6:00 PM\nWeekends: By Appointment',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFFD4AF37).withValues(alpha : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Color(0xFFD4AF37),
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF5D4E37),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}