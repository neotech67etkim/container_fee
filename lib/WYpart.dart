import 'package:container_fee_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WoonimPage extends StatelessWidget {
  const WoonimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateService>(
      builder: (context, service, child) {
        return Scaffold(
          appBar: AppBar(title: Text('1/20 단계')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('운임 종류를 선택해 주세요.'),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "Wi";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  child: Text('안전위탁운임'),
                ),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "Woo";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  child: Text('안전운송운임'),
                ),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "User";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  child: Text('운수사업자간운임'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CementLocationPage extends StatelessWidget {
  const CementLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('운반하실 지역을 선택해주세요.'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('일반 내륙 지역'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('제주도'),
            ),
          ],
        ),
      ),
    );
  }
}
