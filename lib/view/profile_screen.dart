import 'package:crypto/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/pp.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Deamon Targeriyan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Obx(() => Text(
                  'Current Balance: \$${controller.currentBalance.value}',
                  style: const TextStyle(fontSize: 16),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildInfoCard('Total Income', '\$20m', Colors.blue),
                buildInfoCard('Total Transactions', '527', Colors.green),
                buildInfoCard('Total Expense', '\$17.5m', Colors.red),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transitions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildTransactionItem('Salary', '\$1500.76', Colors.green),
                  buildTransactionItem('Gas Bill', '\$14.50', Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String amount, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget buildTransactionItem(String title, String amount, Color color) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.attach_money,
          color: color,
        ),
        title: Text(title),
        trailing: Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
