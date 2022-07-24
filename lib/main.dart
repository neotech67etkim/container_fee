//import 'package:chang_mini/services/bank_service.dart';
import 'package:container_fee_calculator/SJpart.dart';
import 'package:container_fee_calculator/WYpart.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Noto_Sans_KR',
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              '시작하기',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(121, 121, 121, 1),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '국민 안전 지키는 \n안전 운임제',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '안전 운임 계산기로 적정 급여를 조회해 보세요.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
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
        style: ElevatedButton.styleFrom(
          fixedSize: Size(450, 55),
        ),
        child: Text(
          '지금 바로 조회하기',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
              '운반하시는 품목을\n선택해주세요.',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WoonimPage()),
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
                '수출입 컨테이너',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CementLocationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(374, 55),
                primary: Colors.white,
                side: BorderSide(width: 1.0, color: Color(0xffDADCE1)),
              ),
              child: Text(
                '시멘트',
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
  List<String> port = [
    '인천',
    '부산',
    '김포',
    'jqkkl',
    'agh',
    'arhrh',
    'rhrhwh',
    'hewqhhe',
    'ewherh',
    'wrehrh',
    'ehrheh',
    'qeherh',
    'ehhrreh',
    'qeherhrh'
  ];
  String? selectedDepPort;
  String? selectedLandPort;

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
          '3/20 단계',
          style: TextStyle(
            color: Colors.grey,
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
              '기점을 선택해 주세요.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '인천항, 인천신항 선택 시 20% 할증,\n평택항 선택 시 18% 할증이 자동으로 적용됩니다.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              '기점',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'ex.부산북항기점',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868A93),
                  ),
                ),
                items: port
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868A93),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedDepPort,
                onChanged: (value) {
                  setState(() {
                    selectedDepPort = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 40,
                iconEnabledColor: Color(0xff868A93),
                iconDisabledColor: Colors.black,
                //buttonHeight: 60,
                //buttonWidth: 350,
                //itemHeight: 40,
                buttonElevation: 2,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 300,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                //offset: const Offset(-20, 0),
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
          '3/20 단계',
          style: TextStyle(
            color: Colors.grey,
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
              '행선지를\n선택해 주세요.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              '시‧도',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  '시 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868A93),
                  ),
                ),
                items: city
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868A93),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedCity,
                onChanged: (value) {
                  setState(() {
                    selectedCity = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 40,
                iconEnabledColor: Color(0xff868A93),
                iconDisabledColor: Colors.black,
                //buttonHeight: 60,
                //buttonWidth: 350,
                //itemHeight: 40,
                buttonElevation: 2,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 300,
                dropdownPadding: null,
                dropdownElevation: 8,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '시·군·구',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  '시·군·구 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868A93),
                  ),
                ),
                items: gu
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868A93),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedGu,
                onChanged: (value) {
                  setState(() {
                    selectedGu = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 40,
                iconEnabledColor: Color(0xff868A93),
                iconDisabledColor: Colors.black,
                //buttonHeight: 60,
                //buttonWidth: 350,
                //itemHeight: 40,
                buttonElevation: 2,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 300,
                dropdownPadding: null,
                dropdownElevation: 8,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                //offset: const Offset(-20, 0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '읍·면·동',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff868A93),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  '읍·면·동 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff868A93),
                  ),
                ),
                items: dong
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff868A93),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedDong,
                onChanged: (value) {
                  setState(() {
                    selectedDong = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 40,
                iconEnabledColor: Color(0xff868A93),
                iconDisabledColor: Colors.black,
                //buttonHeight: 60,
                //buttonWidth: 350,
                //itemHeight: 40,
                buttonElevation: 2,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 300,
                dropdownPadding: null,
                dropdownElevation: 8,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                //offset: const Offset(-20, 0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddpercentPage()),
          );
        },
        child: Text('확인'),
      ),
    );
  }
}

class AddpercentPage extends StatefulWidget {
  AddpercentPage({Key? key}) : super(key: key);

  @override
  State<AddpercentPage> createState() => _AddpercentPageState();
}

class _AddpercentPageState extends State<AddpercentPage> {
  List<Map<String, dynamic>> tag = [
    {'option': '통행제한지역 30% ⓘ', 'isCheck': false},
    {'option': '검색대통과(X-ray) 96,000원', 'isCheck': false},
    {'option': '산간벽지,오지 20% ⓘ', 'isCheck': false},
    {'option': '밥테일 1회', 'isCheck': false},
    {'option': '밥테일 2회', 'isCheck': false},
  ];

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
              '할증 옵션을\n선택해주세요',
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
            Expanded(
              child: ListView.builder(
                itemCount: tag.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tag[index]['isCheck'] = !tag[index]['isCheck'];
                          });
                          print(tag[index]['isCheck']);
                          print(tag[index]['option']);
                        },
                        style: tag[index]['isCheck']
                            ? ElevatedButton.styleFrom(
                                fixedSize: Size(374, 60),
                                primary: Colors.blue,
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffDADCE1),
                                ),
                              )
                            : ElevatedButton.styleFrom(
                                fixedSize: Size(374, 60),
                                primary: Colors.white,
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffDADCE1),
                                ),
                              ),
                        child: Text(
                          tag[index]['option'],
                          style: tag[index]['isCheck']
                              ? TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)
                              : TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff868A93),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOptionPage()),
          );
        },
        child: Text('확인'),
      ),
    );
  }
}
