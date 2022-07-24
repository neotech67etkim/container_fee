import 'package:container_fee_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddOptionPage extends StatelessWidget {
  const AddOptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5/20 단계')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '추가 할증 옵션을\n선택해 주세요',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '해당하는 옵션을 전부 선택해 주세요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('시간'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('컨테이너'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('위험물'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('중량물'),
            ),
          ],
        ),
      ),
    );
  }
}
