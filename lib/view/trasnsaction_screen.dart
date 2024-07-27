import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trasncationcontroller extends GetxController {
  var balance = 2567.0.obs;
  var income = 12000.0.obs;
  var expense = 2000.0.obs;
  var transactions = [
    {"name": "Utility Bill", "amount": 500.12},
    {"name": "Utility Bill", "amount": 500.12},
  ].obs;
}

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Trasncationcontroller controller = Get.put(Trasncationcontroller());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mr Demon Targariyan", style: TextStyle(color: Colors.black)),
            Text("Business Owner", style: TextStyle(color: Colors.grey)),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage('assets/pp.jpg'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text("Current Balance"),
                        Text("\$${controller.balance.value}",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IncomeExpenseCard(
                        title: "Income", amount: controller.income.value),
                    IncomeExpenseCard(
                        title: "Expense", amount: controller.expense.value),
                  ],
                )),
            const SizedBox(height: 20),
            const Text("Transactions", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Obx(() => Column(
                  children: controller.transactions.map((transaction) {
                    String name = transaction["name"] as String;
                    double amount = transaction["amount"] as double;
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.receipt),
                        title: Text(name),
                        trailing: Text("\$${amount.toStringAsFixed(2)}"),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      ),
    );
  }
}

class IncomeExpenseCard extends StatelessWidget {
  final String title;
  final double amount;

  const IncomeExpenseCard({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: (MediaQuery.of(context).size.width - 48) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text("\$${amount.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
