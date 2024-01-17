import 'package:flutter/material.dart';
import 'package:kappuru/screens/GenderPreferencePage.dart';

class EnterNamePage extends StatefulWidget {
  @override
  _EnterNamePageState createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  TextEditingController nameController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center widget added here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Enter Name text
              Text(
                'Enter Your Name',
                style: TextStyle(
                  color: Color(0xFF040404),
                  fontSize: 32.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Name input box
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD62958), width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    onChanged: (value) {
                      // Enable the button if more than two alphabets are entered
                      setState(() {
                        isButtonEnabled = value.trim().length > 2 &&
                            RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
                      });
                    },
                  ),
                ),
              ),

              // Continue button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          // Validate name and show pop-up
                          if (RegExp(r'^[a-zA-Z\s]+$')
                              .hasMatch(nameController.text)) {
                            // Handle successful continuation
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GenderPreferencePage()),
                            );
                          } else {
                            // Show pop-up to inform the user to enter the name correctly
                            showAlertDialog(context);
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: isButtonEnabled ? Color(0xFFD62958) : Colors.grey,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color:
                            isButtonEnabled ? Color(0xFFD62958) : Colors.grey,
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

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Name'),
          content: Text('Please enter a valid name with alphabets and spaces.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EnterNamePage(),
  ));
}
