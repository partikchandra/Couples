import 'package:flutter/material.dart';
import 'package:kappuru/screens/dashboard.dart';

class PartnerConnectPage extends StatefulWidget {
  @override
  _PartnerConnectPageState createState() => _PartnerConnectPageState();
}

class _PartnerConnectPageState extends State<PartnerConnectPage> {
  late String partnerCode;

  @override
  void initState() {
    super.initState();
    // Generate a random 5-digit alphanumeric code
    partnerCode = generateRandomCode(5);
  }

  String generateRandomCode(int length) {
    const alphanumericChars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String code = '';
    for (int i = 0; i < length; i++) {
      code += alphanumericChars[
          DateTime.now().microsecondsSinceEpoch % alphanumericChars.length];
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Connect with your partner!',
                style: TextStyle(
                  color: Color(0xFF040404),
                  fontSize: 24.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 16),

              // Circle with random code
              Container(
                width: 216.0,
                height: 216.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD62958),
                ),
                child: Center(
                  child: Text(
                    partnerCode,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Enter your Partner's code heading
              Text(
                'Enter your Partner\'s code',
                style: TextStyle(
                  color: Color(0xFF040404),
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 8),

              // Input box
              Container(
                width: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black45, width: 1.0),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Continue button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD62958),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(
                      color: Color(0xFFD62958),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PartnerConnectPage(),
  ));
}
