
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseItem {
  final String type;
  final double amount;
  final IconData icon;
  final Color color;

  ExpenseItem({
    required this.type,
    required this.amount,
    required this.icon,
    required this.color,
  });
}

class ExpensesController extends GetxController {
  var searchQuery = ''.obs;
  var expenses = <ExpenseItem>[
    ExpenseItem(type: 'Water Bill', amount: 90.00, icon: Icons.water_drop, color: Colors.blue),
    ExpenseItem(type: 'Customer Bill', amount: 200.00, icon: Icons.build, color: Colors.orange),
    ExpenseItem(type: 'Gas Bill', amount: 10.50, icon: Icons.local_gas_station, color: Colors.yellow),
    ExpenseItem(type: 'Electricity Bill', amount: 200.00, icon: Icons.electric_bolt, color: Colors.red),
    ExpenseItem(type: 'Internet Bill', amount: 50.00, icon: Icons.wifi, color: Colors.purple),
    ExpenseItem(type: 'Phone Bill', amount: 45.00, icon: Icons.phone, color: Colors.green),
  ].obs;

  List<ExpenseItem> get filteredExpenses => expenses.where((expense) {
    return expense.type.toLowerCase().contains(searchQuery.value.toLowerCase());
  }).toList();
}

class ExpensesScreen extends StatelessWidget {
  final ExpensesController expensesController = Get.put(ExpensesController());

   ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => expensesController.searchQuery.value = value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.add),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Search expenses',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: expensesController.filteredExpenses.length,
                  itemBuilder: (context, index) {
                    final expense = expensesController.filteredExpenses[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: expense.color,
                          child: Icon(expense.icon, color: Colors.white),
                        ),
                        title: Text(expense.type),
                        subtitle: const Text('Expense'),
                        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
