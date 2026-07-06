import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 1. นำเข้า Firebase Core
import 'firebase_options.dart'; // 2. นำเข้าไฟล์คอนฟิกที่เพิ่งเจนมาจากเครื่องมือเมื่อกี้

// 🟢 1. รวมจุด Import ไฟล์ทั้งหมดของคุณไว้ที่นี่
//import 'Drawer.dart'; 
//import 'MultiChildrenExample.dart';
//import 'RowPageOverflow.dart';
//import 'SingleChildExample.dart';
//import 'WalletScreen.dart';
import 'ch4/ExampleuiSTD.dart';
import 'ch4/HomeScreen.dart';
import 'ch4/ExampleuiResultListview.dart';
import 'ch5/ProductListScreen.dart';
//import 'ch6/ui/ActivityListScreen.dart';
import 'ch6/ui/ActivityListScreen+รวม Slidable.dart';
void main() async {
  // บังคับให้ Flutter เตรียมระบบให้พร้อมก่อนเริ่มต้นเปิด Service ภายนอก
  WidgetsFlutterBinding.ensureInitialized(); 

  // 3. สั่งให้แอปเชื่อมต่อกับ Google Cloud Firebase ทันทีที่เปิดแอป
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false, // เอาแถบ DEBUG ออก
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // เปิดใช้ Material 3 ดีไซน์ใหม่ล่าสุด
      ),
      
      // 🟢 2. วิธีเปลี่ยนหน้า: อยากเปิดแอปไปที่บทไหน แค่เอาเครื่องหมาย // ออกหน้าบรรทัดนั้น 
      // และใส่ // หน้าบรรทัดอื่นเพื่อปิดไว้ (เปิดใช้งานได้ทีละหน้าเดียว)
      
      //home: const ExampleuiSTD(),
      
      //home: ProductListScreen(key: UniqueKey()), // ✨ บทที่ 5: หน้าดึงข้อมูล API 
      //home: ExampleuiSTD(key: UniqueKey()), // ✨ บทที่ 4: หน้ากรอกข้อมูลอินพุต
      // home: ListViewExampleApp(key: UniqueKey()), // บทที่ 4: หน้า ListView ผลลัพธ์
      // home: HomeScreen(key: UniqueKey()), // บทที่ 4: หน้ากรอกข้อมูลอินพุต
      // home: ActivityListScreen(key: UniqueKey()), // บทที่ 6: หน้ารายการกิจกรรม

      home: const ActivityListScreen (), // บทที่ 6: หน้ารายการกิจกรรม + Slidable

    );
  }
}