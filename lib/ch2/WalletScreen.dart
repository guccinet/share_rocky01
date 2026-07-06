import 'package:flutter/material.dart';

// 🔴 1. ตัวแม่เป็น StatefulWidget เพราะยอดเงินและการเปิด-ปิดตา ต้องขยับและเปลี่ยนค่าได้
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double myBalance = 5000.0;
  bool showBalance = true; // State สำหรับเปิด-ปิดตา

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        // ดักหน้าจอแตกแนวตั้ง
        child: Column(
          children: [
            // --- โซนการ์ดเงินสด (Stateful เพราะต้องยอมให้กดปิดตาเปลี่ยนสถานะ) ---
            Card(
              margin: const EdgeInsets.all(16),
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ยอดเงินคงเหลือ',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          showBalance ? '฿$myBalance' : '฿ * * * *',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        showBalance ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // 💡 ไฮไลท์สอนนศ.: สั่งวาดหน้าจอใหม่เมื่อกดปุ่ม
                        setState(() {
                          showBalance = !showBalance;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'โปรโมชันพิเศษ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // 💡 เรียกใช้ StatelessWidget ลูกที่สร้างแยกไว้ด้านล่าง
            const PromoCard(
              title: 'ลดทันที 50 บาท',
              desc: 'เมื่อจ่ายบิลค่าน้ำไฟครั้งแรกของเดือน',
              color: Colors.redAccent,
            ),
            const PromoCard(
              title: 'รับพอยท์ x2',
              desc: 'เติมเงินเกมโปรดผ่านแอปวันนี้ รับคะแนนสองเท่า',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ), //body

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _showExpenseDialog,
        child: const Icon(Icons.remove, color: Colors.white),
      ),
    );
  } //method build

  void _showExpenseDialog() {
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Expense'),
          content: TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter your expense:'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (priceController.text.isNotEmpty) {
                  setState(() {
                    myBalance = myBalance - double.parse(priceController.text);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

// 🟣 2. ตัวลูกเป็น StatelessWidget ทำหน้าที่รับข้อมูลมาวาดเป็นการ์ดสวย ๆ นิ่ง ๆ ไม่มีสมองจำค่า
class PromoCard extends StatelessWidget {
  final String title;
  final String desc;
  final Color color;

  const PromoCard({
    super.key,
    required this.title,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: color,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(desc, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}
