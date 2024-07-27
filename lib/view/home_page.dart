import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeController extends GetxController {
  var totalIncome = 2567.78.obs;
  var incomeHistory = <IncomeHistoryItem>[
    IncomeHistoryItem(type: 'Salary', amount: 500.00, icon: Icons.monetization_on, color: Colors.blue),
    IncomeHistoryItem(type: 'Business', amount: 2500.50, icon: Icons.business, color: Colors.green),
    IncomeHistoryItem(type: 'Investment', amount: 1500.12, icon: Icons.savings, color: Colors.purple),
  ].obs;
}

class IncomeHistoryItem {
  final String type;
  final double amount;
  final IconData icon;
  final Color color;

  IncomeHistoryItem({
    required this.type,
    required this.amount,
    required this.icon,
    required this.color,
  });
}

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              '\$${homeController.totalIncome.value}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 100),
                        const FlSpot(1, 200),
                        const FlSpot(2, 300),
                        const FlSpot(3, 400),
                        const FlSpot(4, 300),
                        const FlSpot(5, 200),
                        const FlSpot(6, 100),
                      ],
                      isCurved: true,
                      color: Colors.blue, // Updated to a single color parameter
                      barWidth: 5,
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('M');
                            case 1:
                              return const Text('T');
                            case 2:
                              return const Text('W');
                            case 3:
                              return const Text('T');
                            case 4:
                              return const Text('F');
                            case 5:
                              return const Text('S');
                            case 6:
                              return const Text('S');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(value.toString());
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Income History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: homeController.incomeHistory.length,
                itemBuilder: (context, index) {
                  final item = homeController.incomeHistory[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item.color,
                        child: Icon(item.icon, color: Colors.white),
                      ),
                      title: Text(item.type),
                      subtitle: const Text('Income'),
                      trailing: Text('\$${item.amount.toStringAsFixed(2)}'),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
