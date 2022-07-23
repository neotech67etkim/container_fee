//import 'package:chang_mini/services/bank_service.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

String feet = '';

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
            MaterialPageRoute(builder: (context) => CementPage()),
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
  TextEditingController _DataTimeEditingControllerDepart =
      TextEditingController();
  TextEditingController _DataTimeEditingControllerLanding =
      TextEditingController();
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
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                _selectedCalendar(context, 'Depar');
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
                      hintText: "선적 희망 예정일",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _DataTimeEditingControllerDepart,
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                _selectedCalendar(context, 'Landing');
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
                      hintText: "도착 희망 예정일",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _DataTimeEditingControllerLanding,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeetPage()),
                );
              },
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectedCalendar(BuildContext context, String DeparLanding) {
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
                    if (DeparLanding == 'Depar') {
                      _DataTimeEditingControllerDepart.text = args.toString();
                      convertDateTimeDisplay(
                          _DataTimeEditingControllerDepart.text, '방문');
                    } else if (DeparLanding == 'Landing') {
                      _DataTimeEditingControllerLanding.text = args.toString();
                      convertDateTimeDisplay(
                          _DataTimeEditingControllerLanding.text, '도착');
                    }
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
      return _DataTimeEditingControllerDepart.text =
          serverFormater.format(displayDate);
    } else if (text == '도착') {
      _EstimatedEditingController.clear();
      return _DataTimeEditingControllerLanding.text =
          serverFormater.format(displayDate);
    } else
      return _EstimatedEditingController.text =
          serverFormater.format(displayDate);
  }
}

class CementPage extends StatelessWidget {
  const CementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('1/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('운반하시는 품목을 선택해주세요.'),
            ElevatedButton(
              onPressed: () {
                feet = '20ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeetPage()),
                );
              },
              child: Text('일반 수출입 품목'),
            ),
            ElevatedButton(
              onPressed: () {
                feet = '40ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CementLocationPage()),
                );
              },
              child: Text('시멘트'),
            ),
          ],
        ),
      ),
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
                feet = '20ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('일반 내륙 지역'),
            ),
            ElevatedButton(
              onPressed: () {
                feet = '40ft';
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
                feet = '20ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('20ft 컨테이너(20톤)'),
            ),
            ElevatedButton(
              onPressed: () {
                feet = '40ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('40ft 컨테이너(23톤)'),
            ),
            ElevatedButton(
              onPressed: () {
                feet = '46ft';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('46ft 컨테이너(12.5% up)'),
            ),
            ElevatedButton(
              onPressed: () {
                feet = 'cement';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortPage()),
                );
              },
              child: Text('시멘트'),
            ),
          ],
        ),
      ),
    );
  }
}

class PortPage extends StatefulWidget {
  const PortPage({Key? key}) : super(key: key);

  @override
  State<PortPage> createState() => _PortPageState();
}

class _PortPageState extends State<PortPage> {
  List<String> port = ['인천', '부산', '김포'];
  String? selectedDepPort;
  String? selectedLandPort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3/20 단계')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '출발/도착 항구를 선택해 주세요.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('출발 항구 선택'),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  '출발 항구를 고르세요.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: port
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedDepPort,
                onChanged: (value) {
                  setState(() {
                    selectedDepPort = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 350,
                itemHeight: 40,
              ),
            ),
            Text('도착항구 선택'),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  '도착 항구를 고르세요.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: port
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedLandPort,
                onChanged: (value) {
                  setState(() {
                    selectedLandPort = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 350,
                itemHeight: 40,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DestinationPage()),
          );
        },
        child: Text('확인'),
      ),
    );
  }
}

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  List<String> city = ['인천', '부산', '김포'];
  List<String> gu = ['미포구', '성북구', '동구', '강남구'];
  List<String> dong = ['계양동', '미천동', '금호동', '강동', '달동', '방어동', '화봉동'];

  String? selectedCity;
  String? selectedGu;
  String? selectedDong;

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
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      '시 선택',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: city
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 150,
                    itemHeight: 40,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      '구 선택',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: gu
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedGu,
                    onChanged: (value) {
                      setState(() {
                        selectedGu = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 150,
                    itemHeight: 40,
                  ),
                ),
              ],
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  '동 선택',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: dong
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedDong,
                onChanged: (value) {
                  setState(() {
                    selectedDong = value as String;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 150,
                itemHeight: 40,
              ),
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
                  MaterialPageRoute(builder: (context) => BobtailPage()),
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

class BobtailPage extends StatelessWidget {
  const BobtailPage({Key? key}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => ConoptionPage()),
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

class ConoptionPage extends StatelessWidget {
  const ConoptionPage({Key? key}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => DangerPage()),
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

class DangerPage extends StatelessWidget {
  const DangerPage({Key? key}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => HeavyPage()),
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

class HeavyPage extends StatelessWidget {
  const HeavyPage({Key? key}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => TimePage()),
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

class TimePage extends StatelessWidget {
  const TimePage({Key? key}) : super(key: key);

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
