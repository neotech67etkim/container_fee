//import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

class CalculateService extends ChangeNotifier {
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
        ChangeNotifierProvider(create: (context) => CalculateService()),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Text('시작하기'),
            SizedBox(
              height: 40,
            ),
            Text('안전 운임 계산기로 간편하게 \n예상금액을 조회해 보세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DurationPage()),
          );
        },
        child: Text('지금 바로 견적내기'),
      ),
    );
  }
}

class DurationPage extends StatefulWidget {
  const DurationPage({Key? key}) : super(key: key);

  @override
  State<DurationPage> createState() => _DurationPageState();
}

class _DurationPageState extends State<DurationPage> {
  TextEditingController _DataTimeEditingController = TextEditingController();
  TextEditingController _EstimatedEditingController = TextEditingController();

  DateTime? tempPickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('기간을 \n선택해주세요'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeetPage()),
                );
              },
              child: Text('확인'),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                _selectDataCalendar_Expecteddate_visit(context);
              },
              child: AbsorbPointer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      isDense: true,
                      hintText: "방문 희망 예정일",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _DataTimeEditingController,
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                _selectDataCalendar_Expecteddate_visit(context);
              },
              child: AbsorbPointer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      isDense: true,
                      hintText: "방문 희망 예정일",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _DataTimeEditingController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDataCalendar_Expecteddate_visit(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 550,
              child: SfDateRangePicker(
                monthViewSettings: DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                ),
                monthFormat: 'MMM',
                showNavigationArrow: true,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
                headerHeight: 80,
                view: DateRangePickerView.month,
                allowViewNavigation: false,
                backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                initialSelectedDate: DateTime.now(),
                minDate: DateTime.now(),
                // 아래코드는 tempPickedDate를 전역으로 받아 시작일을 선택한 날자로 시작할 수 있음
                //minDate: tempPickedDate,
                maxDate: DateTime.now().add(new Duration(days: 365)),
                // 아래 코드는 선택시작일로부터 2주까지밖에 날자 선택이 안됌
                //maxDate: tempPickedDate!.add(new Duration(days: 14)),
                selectionMode: DateRangePickerSelectionMode.single,
                confirmText: '완료',
                cancelText: '취소',
                onSubmit: (args) => {
                  setState(() {
                    _EstimatedEditingController.clear();
                    //tempPickedDate = args as DateTime?;
                    _DataTimeEditingController.text = args.toString();
                    convertDateTimeDisplay(
                        _DataTimeEditingController.text, '방문');
                    Navigator.of(context).pop();
                  }),
                },
                onCancel: () => Navigator.of(context).pop(),
                showActionButtons: true,
              ),
            ),
          ));
        });
  }

  String convertDateTimeDisplay(String date, String text) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    if (text == '방문') {
      _EstimatedEditingController.clear();
      return _DataTimeEditingController.text =
          serverFormater.format(displayDate);
    } else
      return _EstimatedEditingController.text =
          serverFormater.format(displayDate);
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
