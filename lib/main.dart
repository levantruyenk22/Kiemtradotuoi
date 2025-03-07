import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  const AgeCheckerScreen({super.key});

  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String result = "";

  void checkAgeCategory() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);

    if (name.isEmpty || age == null) {
      setState(() {
        result = "Vui lòng nhập thông tin hợp lệ";
      });
      return;
    }

    String category;
    if (age < 2) {
      category = "Em bé";
    } else if (age < 6) {
      category = "Trẻ em";
    } else if (age <= 65) {
      category = "Người lớn";
    } else {
      category = "Người già";
    }

    setState(() {
      result = "$name thuộc nhóm: $category";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thực hành 01')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Họ và tên'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Tuổi'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAgeCategory,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
