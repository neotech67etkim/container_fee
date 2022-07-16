//import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bank {
  String? name;
  String? bankImage;
  int? balance;

  Bank({
    this.name,
    this.bankImage,
    this.balance,
  });
}

class ContainerService extends ChangeNotifier {
  List<Bank> myBankList = [
    Bank(name: '카카오뱅크', bankImage: 'assets/kakao_bank.png', balance: 456000),
    Bank(name: '신한은행', bankImage: 'assets/sinhan_bank.png', balance: 100000),
  ];

  void createBank(String name, String bankImage, int balance) {
    myBankList.add(
      Bank(name: name, bankImage: 'assets/toss_bank.png', balance: balance),
    );
    notifyListeners();
  }

  void sendBank(int indexFrom, int indexTo, int changedBalanceFrom,
      int changedBalanceTo) {
    myBankList[indexFrom].balance = changedBalanceFrom;
    myBankList[indexTo].balance = changedBalanceTo;
    notifyListeners();
  }
}

Future<void> main() async {
  bool data = await fetchData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContainerService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Future<bool> fetchData() async {
  bool data = false;

  // Change to API call
  await Future.delayed(Duration(seconds: 3), () {
    data = true;
  });

  return data;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1/20단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('시작하기'),
            Text('운반하시는 물류를 선택하여 주세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeetPage()),
                );
              },
              child: Text('지금 바로 견적내기'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('나중에 보기'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeetPage extends StatelessWidget {
  const FeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('운반하시는 물류를 선택해주세요.'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('20ft 컨테이너(20톤)'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('40ft 컨테이너(23톤)'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('46ft 컨테이너(12.5% up)'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('시멘트'),
            ),
          ],
        ),
      ),
    );
  }
}

class PortPage extends StatelessWidget {
  const PortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('출발/도착 항구를 선택해 주세요.'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DestinationPage()),
                );
              },
              child: Text('항구 선택 드롭다운 메뉴'),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationPage extends StatelessWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('4/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('행선지를 선택해 주세요.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddpercentPage()),
                    );
                  },
                  child: Text('시도 선택 드롭다운 메뉴'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('구 선택 드롭다운 메뉴'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('동 선택 드롭다운 메뉴'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddpercentPage()),
                );
              },
              child: Text('선택 완료하기'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddpercentPage extends StatelessWidget {
  const AddpercentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('5/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('할증 옵션을 선택해주세요.'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('해당없음'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('통행제한 구역 30%'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('검색대 통과 (X-ray_ 96,000원'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('시멘트'),
            ),
          ],
        ),
      ),
    );
  }
}
