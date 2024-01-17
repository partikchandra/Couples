// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kappuru/screens/OtpPage.dart';

class phoneotp extends StatefulWidget {
  const phoneotp({super.key});

  @override
  _phoneotpState createState() => _phoneotpState();
}

class _phoneotpState extends State<phoneotp> {
  String selectedCode = '+91';
  TextEditingController phoneNumberController = TextEditingController();

  bool isButtonEnabled() {
    return phoneNumberController.text.length == 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Enter mobile number',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  // width: ,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD62958),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: DropdownButton(
                    dropdownColor: const Color(0xFFD62958),
                    underline: Container(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    value: selectedCode,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCode = newValue!;
                      });
                    },
                    items: <String>['+91', '+01', '+82'].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      border: Border(
                        top: BorderSide(width: 2, color: Color(0xFFD62958)),
                        right: BorderSide(width: 2, color: Color(0xFFD62958)),
                        bottom: BorderSide(width: 2, color: Color(0xFFD62958)),
                      ),
                    ),
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter your mobile number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: ElevatedButton(
                  onPressed: isButtonEnabled()
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OtpPage()),
                          );
                        }
                      : null,
                  child: const Text(
                    'Enter',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      isButtonEnabled()
                          ? const Color(0xFFD62958)
                          : Colors.white,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      isButtonEnabled()
                          ? Colors.white
                          : const Color(0xFFD62958),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: isButtonEnabled()
                              ? const Color(0xFFD62958)
                              : const Color(0xFFD62958),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
