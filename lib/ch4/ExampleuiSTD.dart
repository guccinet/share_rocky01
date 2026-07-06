import 'package:hello_app/ch4/ExampleuiResultListview.dart';
import 'package:flutter/material.dart';
import 'data/RegisterData.dart';

class ExampleuiSTD extends StatefulWidget {
  const ExampleuiSTD({super.key});

  @override
  State<ExampleuiSTD> createState() => _ExampleuiSTDState();
}

class _ExampleuiSTDState extends State<ExampleuiSTD> {
  final TextEditingController _nameController = TextEditingController();

  String _result = '';
  String _selectedOption = 'IT'; 
  String _gender = 'Male';
  bool _acceptTerm = false;
  DateTime? _selectedDate;

  final List<String> _options = ['IT', 'Digital', 'Network'];

  // 🟢 1. สร้างตระกร้าสำหรับเก็บสะสมข้อมูลที่กด Add เข้ามา
  final List<RegisterData> _registerList = [];

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // 🟢 2. เขียนโค้ดปุ่ม Add ข้อมูลลง List
  void _addData() {
    if (_nameController.text.trim().isEmpty) {
      setState(() {
        _result = "Please enter your name";
      });
      return;
    }
    if (_selectedDate == null) {
      setState(() {
        _result = "Please select your birthday";
      });
      return;
    }
    if (!_acceptTerm) {
      setState(() {
        _result = "Please accept the terms and conditions";
      });
      return;
    }

    // ผ่านทุกเงื่อนไข สร้าง Object แล้วยัดลง List
    setState(() {
      String formattedDate = "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
      
      _registerList.add(
        RegisterData(
          name: _nameController.text,
          department: _selectedOption,
          gender: _gender,
          birthday: formattedDate,
        ),
      );

      _result = "Successfully added! Total items: ${_registerList.length}";
      
      // ล้างข้อมูลในช่องกรอกหลังแอดเสร็จเพื่อให้พร้อมกรอกคนถัดไป
      _nameController.clear();
      _selectedDate = null;
    });
  }

  // 🟢 3. ส่ง List ข้อมูลทั้งหมดข้ามไปยังหน้าถัดไปเมื่อกด View ALL
  void _viewALL() {
    if (_registerList.isEmpty) {
      setState(() {
        _result = "Please add at least one data before viewing!";
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExampleuiResultListview(dataList: _registerList),
      ),
    );
  }

  void _cancel() {
    setState(() {
      _nameController.clear();
      _selectedOption = _options[0];
      _gender = 'Male';
      _acceptTerm = false;
      _selectedDate = null;
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... ส่วน Widget build โค้ด UI เหมือนเดิมของอาจารย์ทุกประการ ...
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name:", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            const SizedBox(height: 16),
            const Text("Department:", style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: _selectedOption,
              isExpanded: true,
              items: _options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text("Gender:", style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 24),
            const Text("Birthday:", style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text("Select Date"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CheckboxListTile(
              title: const Text("I accept the terms and conditions"),
              value: _acceptTerm,
              onChanged: (value) {
                setState(() {
                  _acceptTerm = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _cancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _addData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Add'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _viewALL,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('View ALL'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _result,
              style: TextStyle(
                color: _result.contains("Please") ? Colors.red : Colors.green,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}