import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController {
  var name = ''.obs;
  var type = 'Income'.obs;

  void setName(String value) {
    name.value = value;
  }

  void setType(String value) {
    type.value = value;
  }
}

class AddCategory extends StatelessWidget {
  final AddCategoryController controller = Get.put(AddCategoryController());

  AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Category'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => controller.setName(value),
              decoration: const InputDecoration(
                labelText: 'Add category name',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload, size: 50, color: Colors.grey),
                      SizedBox(height: 10),
                      Text('Drag your image here'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Income'),
                      leading: Radio<String>(
                        value: 'Income',
                        groupValue: controller.type.value,
                        onChanged: (value) {
                          if (value != null) {
                            controller.setType(value);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Expense'),
                      leading: Radio<String>(
                        value: 'Expense',
                        groupValue: controller.type.value,
                        onChanged: (value) {
                          if (value != null) {
                            controller.setType(value);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Category Name: ${controller.name.value}');
                  print('Type: ${controller.type.value}');
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
