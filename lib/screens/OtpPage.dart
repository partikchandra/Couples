import 'package:flutter/material.dart';
import 'package:kappuru/screens/EnterNamePage.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool isButtonEnabled() {
    // Check if all OTP fields are filled
    return otpControllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            // Enter OTP text
            Text(
              'Enter OTP',
              style: TextStyle(
                color: Color(0xFF040404),
                fontSize: 32.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),

            // OTP has been sent to your phone text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'OTP has been sent to your phone',
                style: TextStyle(
                  color: Color(0xFFD62958),
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // OTP input boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => buildOtpInput(index),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Resend OTP text
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  // Handle resend OTP action
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: Color(0xFFD62958),
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Spacer(),
            // Continue button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: isButtonEnabled()
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterNamePage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Color(0xFFD62958),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpInput(int index) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFD62958), width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          // Move to the next input box when a digit is entered
          if (value.isNotEmpty && index < otpControllers.length - 1) {
            FocusScope.of(context).nextFocus();
          }
          setState(() {});
        },
      ),
    );
  }
}
