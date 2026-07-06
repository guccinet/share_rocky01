import 'package:flutter/material.dart';
import 'data/RegisterData.dart';

class ExampleuiResultListview extends StatelessWidget {
  // 🟢 มารับค่า List Of Object จากหน้าลงทะเบียนเข้ามาทำงาน
  final List<RegisterData> dataList;

  const ExampleuiResultListview({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Data List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: dataList.isEmpty
          ? const Center(child: Text('No data found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final student = dataList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: student.gender == 'Male' ? Colors.blue.shade100 : Colors.pink.shade100,
                      child: Icon(
                        student.gender == 'Male' ? Icons.male : Icons.female,
                        color: student.gender == 'Male' ? Colors.blue : Colors.pink,
                      ),
                    ),
                    title: Text(
                      student.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Department: ${student.department}"),
                          Text("Birthday: ${student.birthday}"),
                        ],
                      ),
                    ),
                    trailing: Text(
                      "# ${index + 1}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}