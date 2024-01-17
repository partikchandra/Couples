import 'package:flutter/material.dart';
import 'package:kappuru/screens/code.dart';

class GenderPreferencePage extends StatefulWidget {
  @override
  _GenderPreferencePageState createState() => _GenderPreferencePageState();
}

class _GenderPreferencePageState extends State<GenderPreferencePage> {
  late String selectedGender = ''; // Initialize with an empty string
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Would you prefer to tell your gender? text
              Text(
                'Would you prefer to tell your gender?',
                style: TextStyle(
                  color: Color(0xFF040404),
                  fontSize: 32.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Gender buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildGenderButton('Male'),
                  buildGenderButton('Female'),
                  buildGenderButton('Other'),
                ],
              ),

              // Continue button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PartnerConnectPage()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: isButtonEnabled ? Color(0xFFD62958) : Colors.white,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color:
                            isButtonEnabled ? Color(0xFFD62958) : Colors.white,
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
      ),
    );
  }

  Widget buildGenderButton(String gender) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle button selection
          setState(() {
            selectedGender = gender;
            isButtonEnabled = true;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor:
              selectedGender == gender ? Colors.white : Color(0xFFD62958),
          backgroundColor:
              selectedGender == gender ? Color(0xFFD62958) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
              color: selectedGender == gender ? Color(0xFFD62958) : Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(gender),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GenderPreferencePage(),
  ));
}
