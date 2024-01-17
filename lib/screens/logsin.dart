import 'package:flutter/material.dart';
import 'package:kappuru/screens/phoneotp.dart';

class Logsin extends StatelessWidget {
  const Logsin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const SizedBox(height: 200),
            Image.asset(
              'lib/assets/logo.png',
              height: 80,
              width: 80,
            ),
            const Spacer(),
            // Welcome text
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome to Cpiies!",
                style: TextStyle(
                  color: Color(0xFFD62958),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            // Tagline
            const Text(
              "Your tagline goes here",
              style: TextStyle(
                color: Color(0xFFD62958),
              ),
            ),

            // Continue with mobile number button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const phoneotp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD62958),
                ),
                child: const Text(
                  "Continue with mobile number",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Have an account? Login text
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account? ", style: TextStyle(color: Colors.grey)),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFFD62958),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
