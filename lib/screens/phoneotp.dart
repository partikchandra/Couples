// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kappuru/screens/OtpPage.dart';
import 'package:kappuru/utilities/PrimaryButton.dart';
import 'package:kappuru/utilities/TextView.dart';

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            TextView(text: "Enter mobile number"),
            const SizedBox(height: 20.0),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD62958),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
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
                  Container(
                    padding: EdgeInsets.only(left: 100, top: 3, bottom: 3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border(
                        top: BorderSide(width: 2, color: Color(0xFFD62958)),
                        right: BorderSide(width: 2, color: Color(0xFFD62958)),
                        bottom: BorderSide(width: 2, color: Color(0xFFD62958)),
                        left: BorderSide(width: 2, color: Color(0xFFD62958)),
                      ),
                    ),
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLength: 10,
                      decoration: const InputDecoration(
                        hintText: 'Enter your mobile number',
                        border: InputBorder.none,
                        counterText: "",
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: PrimaryButton(
                    text: "Get OTP",
                    size: phoneNumberController.text.length,
                    onPressed: () => isButtonEnabled()
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpPage()),
                            );
                          }
                        : null,
                  )),
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
