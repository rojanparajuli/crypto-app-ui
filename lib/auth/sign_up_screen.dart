import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final obscurePassword = true.obs;
    final rememberMe = true.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.green.withOpacity(0.9),
                          BlendMode.srcATop,
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            'assets/istockphoto-1292425551-612x612.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                      ),
                      const Positioned(
                        top: 50.0,
                        left: 15.0,
                        child: Text(
                          "Create A CRYPTO Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Positioned(
                        top: 90.0,
                        left: 15.0,
                        child: Text(
                          'Fill in the form and create a new account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Username/E-mail',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.mail)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          obscurePassword.value = !obscurePassword.value;
                        },
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                const Text(
                  "Conform password",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          obscurePassword.value = !obscurePassword.value;
                        },
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Obx(() => Checkbox(
                          value: rememberMe.value,
                          onChanged: (value) {
                            rememberMe.value = value!;
                          },
                        )),
                    const Text('Accept All Terms And Conditions'),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF7ed956),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.transparent),
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
