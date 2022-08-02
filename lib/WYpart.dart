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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            title: Text(
              '1/20 단계',
              style: TextStyle(
                color: Color(0xffB4B9C3),
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 1.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '운임 타입을\n선택해 주세요.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "Wi";
                    service.pointedwoonim = "안전위탁운임";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(374, 55),
                    primary: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: Color(0xffDADCE1),
                    ),
                  ),
                  child: Text(
                    '안전위탁운임',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff868A93),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "Woo";
                    service.pointedwoonim = "안전운송운임";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(374, 55),
                    primary: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: Color(0xffDADCE1),
                    ),
                  ),
                  child: Text(
                    '안전운송운임',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff868A93),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    service.woonimCondition = "User";
                    service.pointedwoonim = "운수사업자간운임";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeetPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(374, 55),
                    primary: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: Color(0xffDADCE1),
                    ),
                  ),
                  child: Text(
                    '운수사업자간운임',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff868A93),
                    ),
                  ),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '1/20 단계',
          style: TextStyle(
            color: Color(0xffB4B9C3),
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '운반하실 지역을 선택해주세요.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
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
