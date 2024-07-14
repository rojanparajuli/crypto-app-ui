import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text(
            'CRYPTO',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Image.asset(
            'assets/logo.png',
            height: 400,
            fit: BoxFit.fitHeight,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Welcome to Crypto',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Center(child: Text('Save money by using Crypto App')),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF7ed956),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.transparent),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: AbsorbPointer(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFF7ed956)),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF7ed956),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
