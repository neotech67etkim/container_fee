//import 'package:chang_mini/services/bank_service.dart';
//import 'dart:html';

import 'dart:convert';

import 'package:container_fee_calculator/SJpart.dart';
import 'package:container_fee_calculator/WYpart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('###,###,###,###');

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
  List woonim = ["Wi", "Woo", "User"];
  List container = ["ft20", "ft40", "ft46"];
  String woonimCondition = "";
  String containerCondition = "";
  String portCondition = "";
  List city = [];
  List dataList = [];
  String? pointedCity = '';
  String? pointedDong = '';
  String? pointedGu = '';
  String? pointedwoonim = '';
  String? pointedFeet = '';
  String? pointedPort = '';
  String? pointedKm = '';
  int? addingFee = 0;
  int midResult = 0;
  String midResultMenu = '';
  int pointedIndex = 0;
  List addingOptions = [];
  List addingFactors = [];
  int? finalResult = 0;
  bool addingXray = false;

  Map detailValues = {
    "busan2Way": [
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "용산2가동",
        "distanceKm": 404,
        "witak40ft": 989100,
        "user40ft": 1031100,
        "woonsong40ft": 1101900,
        "witak20ft": 868600,
        "user20ft": 904100,
        "woonsong20ft": 963500
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "하계1동",
        "distanceKm": 398,
        "witak40ft": 978600,
        "user40ft": 1020600,
        "woonsong40ft": 1091400,
        "witak20ft": 860400,
        "user20ft": 895800,
        "woonsong20ft": 955200
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "염창동",
        "distanceKm": 414,
        "witak40ft": 1006600,
        "user40ft": 1048700,
        "woonsong40ft": 1119500,
        "witak20ft": 882300,
        "user20ft": 917800,
        "woonsong20ft": 977300
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "공항동",
        "distanceKm": 422,
        "witak40ft": 1020400,
        "user40ft": 1062600,
        "woonsong40ft": 1133400,
        "witak20ft": 893300,
        "user20ft": 928900,
        "woonsong20ft": 988400
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "방화2동",
        "distanceKm": 422,
        "witak40ft": 1020400,
        "user40ft": 1062600,
        "woonsong40ft": 1133400,
        "witak20ft": 893300,
        "user20ft": 928900,
        "woonsong20ft": 988400
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로1동",
        "distanceKm": 410,
        "witak40ft": 999600,
        "user40ft": 1041700,
        "woonsong40ft": 1112500,
        "witak20ft": 876900,
        "user20ft": 912400,
        "woonsong20ft": 971900
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "고척1동",
        "distanceKm": 411,
        "witak40ft": 1001300,
        "user40ft": 1043400,
        "woonsong40ft": 1114200,
        "witak20ft": 878200,
        "user20ft": 913700,
        "woonsong20ft": 973100
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "수궁동",
        "distanceKm": 414,
        "witak40ft": 1006600,
        "user40ft": 1048700,
        "woonsong40ft": 1119500,
        "witak20ft": 882300,
        "user20ft": 917800,
        "woonsong20ft": 977300
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "개봉1동",
        "distanceKm": 412,
        "witak40ft": 1003100,
        "user40ft": 1045200,
        "woonsong40ft": 1116000,
        "witak20ft": 879600,
        "user20ft": 915100,
        "woonsong20ft": 974600
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "오류2동",
        "distanceKm": 413,
        "witak40ft": 1004800,
        "user40ft": 1046900,
        "woonsong40ft": 1117700,
        "witak20ft": 881000,
        "user20ft": 916500,
        "woonsong20ft": 975900
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "가산동",
        "distanceKm": 408,
        "witak40ft": 996100,
        "user40ft": 1038200,
        "woonsong40ft": 1108900,
        "witak20ft": 874200,
        "user20ft": 909700,
        "woonsong20ft": 969100
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "독산1동",
        "distanceKm": 406,
        "witak40ft": 992600,
        "user40ft": 1034600,
        "woonsong40ft": 1105400,
        "witak20ft": 871400,
        "user20ft": 906900,
        "woonsong20ft": 966300
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "삼성1동",
        "distanceKm": 397,
        "witak40ft": 976900,
        "user40ft": 1018900,
        "woonsong40ft": 1089700,
        "witak20ft": 858900,
        "user20ft": 894400,
        "woonsong20ft": 953900
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "개포1동",
        "distanceKm": 389,
        "witak40ft": 962900,
        "user40ft": 1004900,
        "woonsong40ft": 1075700,
        "witak20ft": 847900,
        "user20ft": 883300,
        "woonsong20ft": 942900
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "송파1동",
        "distanceKm": 389,
        "witak40ft": 962900,
        "user40ft": 1004900,
        "woonsong40ft": 1075700,
        "witak20ft": 847900,
        "user20ft": 883300,
        "woonsong20ft": 942900
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "가락본동",
        "distanceKm": 389,
        "witak40ft": 962900,
        "user40ft": 1004900,
        "woonsong40ft": 1075700,
        "witak20ft": 847900,
        "user20ft": 883300,
        "woonsong20ft": 942900
      },
      {
        "city": "부산광역시",
        "gu": "서구",
        "dong": "남부민1동",
        "distanceKm": 12,
        "witak40ft": 143500,
        "user40ft": 150700,
        "woonsong40ft": 162300,
        "witak20ft": 124900,
        "user20ft": 130900,
        "woonsong20ft": 140600
      },
      {
        "city": "부산광역시",
        "gu": "서구",
        "dong": "암남동",
        "distanceKm": 20,
        "witak40ft": 171600,
        "user40ft": 179600,
        "woonsong40ft": 192600,
        "witak20ft": 153100,
        "user20ft": 159800,
        "woonsong20ft": 170700
      },
      {
        "city": "부산광역시",
        "gu": "동구",
        "dong": "초량1동",
        "distanceKm": 11,
        "witak40ft": 139900,
        "user40ft": 146900,
        "woonsong40ft": 158300,
        "witak20ft": 121700,
        "user20ft": 127600,
        "woonsong20ft": 137200
      },
      {
        "city": "부산광역시",
        "gu": "동구",
        "dong": "좌천동",
        "distanceKm": 10,
        "witak40ft": 136200,
        "user40ft": 143100,
        "woonsong40ft": 154400,
        "witak20ft": 118600,
        "user20ft": 124500,
        "woonsong20ft": 134000
      },
      {
        "city": "부산광역시",
        "gu": "영도구",
        "dong": "남항동",
        "distanceKm": 10,
        "witak40ft": 136200,
        "user40ft": 143100,
        "woonsong40ft": 154400,
        "witak20ft": 118600,
        "user20ft": 124500,
        "woonsong20ft": 134000
      },
      {
        "city": "부산광역시",
        "gu": "영도구",
        "dong": "청학1동",
        "distanceKm": 8,
        "witak40ft": 129100,
        "user40ft": 135800,
        "woonsong40ft": 146700,
        "witak20ft": 112300,
        "user20ft": 118000,
        "woonsong20ft": 127100
      },
      {
        "city": "부산광역시",
        "gu": "동래구",
        "dong": "안락1동",
        "distanceKm": 15,
        "witak40ft": 154100,
        "user40ft": 161600,
        "woonsong40ft": 173700,
        "witak20ft": 134200,
        "user20ft": 140500,
        "woonsong20ft": 150700
      },
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "용당동",
        "distanceKm": 4,
        "witak40ft": 114600,
        "user40ft": 120900,
        "woonsong40ft": 131200,
        "witak20ft": 99700,
        "user20ft": 105000,
        "woonsong20ft": 113500
      },
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "감만1동",
        "distanceKm": 6,
        "witak40ft": 121800,
        "user40ft": 128300,
        "woonsong40ft": 138800,
        "witak20ft": 106100,
        "user20ft": 111600,
        "woonsong20ft": 120400
      },
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "우암동",
        "distanceKm": 7,
        "witak40ft": 125500,
        "user40ft": 132100,
        "woonsong40ft": 142800,
        "witak20ft": 109200,
        "user20ft": 114800,
        "woonsong20ft": 123700
      },
      {
        "city": "부산광역시",
        "gu": "해운대구",
        "dong": "재송1동",
        "distanceKm": 13,
        "witak40ft": 147000,
        "user40ft": 154200,
        "woonsong40ft": 165900,
        "witak20ft": 128000,
        "user20ft": 134200,
        "woonsong20ft": 144100
      },
      {
        "city": "부산광역시",
        "gu": "해운대구",
        "dong": "반여1동",
        "distanceKm": 16,
        "witak40ft": 157600,
        "user40ft": 165200,
        "woonsong40ft": 177500,
        "witak20ft": 137900,
        "user20ft": 144300,
        "woonsong20ft": 154700
      },
      {
        "city": "부산광역시",
        "gu": "해운대구",
        "dong": "반송1동",
        "distanceKm": 20,
        "witak40ft": 171600,
        "user40ft": 179600,
        "woonsong40ft": 192600,
        "witak20ft": 153100,
        "user20ft": 159800,
        "woonsong20ft": 170700
      },
      {
        "city": "부산광역시",
        "gu": "해운대구",
        "dong": "우1동",
        "distanceKm": 13,
        "witak40ft": 147000,
        "user40ft": 154200,
        "woonsong40ft": 165900,
        "witak20ft": 128000,
        "user20ft": 134200,
        "woonsong20ft": 144100
      },
      {
        "city": "부산광역시",
        "gu": "사하구",
        "dong": "신평1동",
        "distanceKm": 17,
        "witak40ft": 161100,
        "user40ft": 168700,
        "woonsong40ft": 181200,
        "witak20ft": 141700,
        "user20ft": 148200,
        "woonsong20ft": 158700
      },
      {
        "city": "부산광역시",
        "gu": "사하구",
        "dong": "장림1동",
        "distanceKm": 18,
        "witak40ft": 164700,
        "user40ft": 172500,
        "woonsong40ft": 185100,
        "witak20ft": 145500,
        "user20ft": 152000,
        "woonsong20ft": 162600
      },
      {
        "city": "부산광역시",
        "gu": "사하구",
        "dong": "다대1동",
        "distanceKm": 21,
        "witak40ft": 175200,
        "user40ft": 183300,
        "woonsong40ft": 196400,
        "witak20ft": 156900,
        "user20ft": 163700,
        "woonsong20ft": 174800
      },
      {
        "city": "부산광역시",
        "gu": "사하구",
        "dong": "구평동",
        "distanceKm": 16,
        "witak40ft": 157600,
        "user40ft": 165200,
        "woonsong40ft": 177500,
        "witak20ft": 137900,
        "user20ft": 144300,
        "woonsong20ft": 154700
      },
      {
        "city": "부산광역시",
        "gu": "사하구",
        "dong": "감천1동",
        "distanceKm": 14,
        "witak40ft": 150600,
        "user40ft": 157900,
        "woonsong40ft": 169900,
        "witak20ft": 131100,
        "user20ft": 137300,
        "woonsong20ft": 147300
      },
      {
        "city": "부산광역시",
        "gu": "금정구",
        "dong": "금사회동동",
        "distanceKm": 19,
        "witak40ft": 168200,
        "user40ft": 176000,
        "woonsong40ft": 188800,
        "witak20ft": 149400,
        "user20ft": 156000,
        "woonsong20ft": 166700
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "대저2동",
        "distanceKm": 24,
        "witak40ft": 186200,
        "user40ft": 194600,
        "woonsong40ft": 208400,
        "witak20ft": 168200,
        "user20ft": 175300,
        "woonsong20ft": 186800
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "강동동",
        "distanceKm": 27,
        "witak40ft": 195900,
        "user40ft": 204600,
        "woonsong40ft": 218900,
        "witak20ft": 176900,
        "user20ft": 184200,
        "woonsong20ft": 196100
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "가락동",
        "distanceKm": 31,
        "witak40ft": 209200,
        "user40ft": 218300,
        "woonsong40ft": 233300,
        "witak20ft": 186700,
        "user20ft": 194400,
        "woonsong20ft": 206800
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "녹산동",
        "distanceKm": 30,
        "witak40ft": 205800,
        "user40ft": 214800,
        "woonsong40ft": 229600,
        "witak20ft": 184300,
        "user20ft": 191900,
        "woonsong20ft": 204300
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "가덕도동",
        "distanceKm": 33,
        "witak40ft": 216000,
        "user40ft": 225300,
        "woonsong40ft": 240600,
        "witak20ft": 191600,
        "user20ft": 199500,
        "woonsong20ft": 212300
      },
      {
        "city": "부산광역시",
        "gu": "강서구",
        "dong": "명지1동",
        "distanceKm": 23,
        "witak40ft": 182000,
        "user40ft": 190300,
        "woonsong40ft": 203800,
        "witak20ft": 164300,
        "user20ft": 171300,
        "woonsong20ft": 182700
      },
      {
        "city": "부산광역시",
        "gu": "사상구",
        "dong": "주례1동",
        "distanceKm": 15,
        "witak40ft": 154100,
        "user40ft": 161600,
        "woonsong40ft": 173700,
        "witak20ft": 134200,
        "user20ft": 140500,
        "woonsong20ft": 150700
      },
      {
        "city": "부산광역시",
        "gu": "사상구",
        "dong": "학장동",
        "distanceKm": 18,
        "witak40ft": 164700,
        "user40ft": 172500,
        "woonsong40ft": 185100,
        "witak20ft": 145500,
        "user20ft": 152000,
        "woonsong20ft": 162600
      },
      {
        "city": "부산광역시",
        "gu": "사상구",
        "dong": "엄궁동",
        "distanceKm": 20,
        "witak40ft": 171600,
        "user40ft": 179600,
        "woonsong40ft": 192600,
        "witak20ft": 153100,
        "user20ft": 159800,
        "woonsong20ft": 170700
      },
      {
        "city": "부산광역시",
        "gu": "사상구",
        "dong": "감전동",
        "distanceKm": 17,
        "witak40ft": 161100,
        "user40ft": 168700,
        "woonsong40ft": 181200,
        "witak20ft": 141700,
        "user20ft": 148200,
        "woonsong20ft": 158700
      },
      {
        "city": "부산광역시",
        "gu": "기장군",
        "dong": "기장읍",
        "distanceKm": 25,
        "witak40ft": 190300,
        "user40ft": 198800,
        "woonsong40ft": 212700,
        "witak20ft": 171800,
        "user20ft": 179000,
        "woonsong20ft": 190700
      },
      {
        "city": "부산광역시",
        "gu": "기장군",
        "dong": "장안읍",
        "distanceKm": 34,
        "witak40ft": 219300,
        "user40ft": 228700,
        "woonsong40ft": 244200,
        "witak20ft": 194100,
        "user20ft": 202000,
        "woonsong20ft": 215000
      },
      {
        "city": "부산광역시",
        "gu": "기장군",
        "dong": "정관읍",
        "distanceKm": 32,
        "witak40ft": 212600,
        "user40ft": 221800,
        "woonsong40ft": 236900,
        "witak20ft": 189200,
        "user20ft": 197000,
        "woonsong20ft": 209600
      },
      {
        "city": "부산광역시",
        "gu": "기장군",
        "dong": "일광면",
        "distanceKm": 28,
        "witak40ft": 199200,
        "user40ft": 208000,
        "woonsong40ft": 222300,
        "witak20ft": 179400,
        "user20ft": 186800,
        "woonsong20ft": 198900
      },
      {
        "city": "부산광역시",
        "gu": "기장군",
        "dong": "철마면",
        "distanceKm": 25,
        "witak40ft": 190300,
        "user40ft": 198800,
        "woonsong40ft": 212700,
        "witak20ft": 171800,
        "user20ft": 179000,
        "woonsong20ft": 190700
      },
      {
        "city": "대구광역시",
        "gu": "중구",
        "dong": "성내1동",
        "distanceKm": 116,
        "witak40ft": 431600,
        "user40ft": 449600,
        "woonsong40ft": 479400,
        "witak20ft": 381200,
        "user20ft": 396300,
        "woonsong20ft": 421300
      },
      {
        "city": "대구광역시",
        "gu": "중구",
        "dong": "성내3동",
        "distanceKm": 117,
        "witak40ft": 434000,
        "user40ft": 452000,
        "woonsong40ft": 481900,
        "witak20ft": 383100,
        "user20ft": 398300,
        "woonsong20ft": 423400
      },
      {
        "city": "대구광역시",
        "gu": "서구",
        "dong": "비산1동",
        "distanceKm": 119,
        "witak40ft": 438400,
        "user40ft": 456700,
        "woonsong40ft": 487000,
        "witak20ft": 387000,
        "user20ft": 402400,
        "woonsong20ft": 427900
      },
      {
        "city": "대구광역시",
        "gu": "서구",
        "dong": "평리1동",
        "distanceKm": 120,
        "witak40ft": 440600,
        "user40ft": 459000,
        "woonsong40ft": 489500,
        "witak20ft": 388800,
        "user20ft": 404300,
        "woonsong20ft": 430000
      },
      {
        "city": "대구광역시",
        "gu": "서구",
        "dong": "상중이동",
        "distanceKm": 121,
        "witak40ft": 442900,
        "user40ft": 461300,
        "woonsong40ft": 492000,
        "witak20ft": 390700,
        "user20ft": 406300,
        "woonsong20ft": 432000
      },
      {
        "city": "대구광역시",
        "gu": "북구",
        "dong": "침산1동",
        "distanceKm": 119,
        "witak40ft": 438400,
        "user40ft": 456700,
        "woonsong40ft": 487000,
        "witak20ft": 387000,
        "user20ft": 402400,
        "woonsong20ft": 427900
      },
      {
        "city": "대구광역시",
        "gu": "북구",
        "dong": "검단동",
        "distanceKm": 118,
        "witak40ft": 436200,
        "user40ft": 454300,
        "woonsong40ft": 484500,
        "witak20ft": 385000,
        "user20ft": 400400,
        "woonsong20ft": 425800
      },
      {
        "city": "대구광역시",
        "gu": "북구",
        "dong": "노원동",
        "distanceKm": 121,
        "witak40ft": 442900,
        "user40ft": 461300,
        "woonsong40ft": 492000,
        "witak20ft": 390700,
        "user20ft": 406300,
        "woonsong20ft": 432000
      },
      {
        "city": "대구광역시",
        "gu": "수성구",
        "dong": "만촌1동",
        "distanceKm": 112,
        "witak40ft": 422600,
        "user40ft": 440100,
        "woonsong40ft": 469200,
        "witak20ft": 373400,
        "user20ft": 388200,
        "woonsong20ft": 412600
      },
      {
        "city": "대구광역시",
        "gu": "달서구",
        "dong": "장기동",
        "distanceKm": 122,
        "witak40ft": 445100,
        "user40ft": 463700,
        "woonsong40ft": 494500,
        "witak20ft": 392600,
        "user20ft": 408300,
        "woonsong20ft": 434200
      },
      {
        "city": "대구광역시",
        "gu": "달서구",
        "dong": "이곡1동",
        "distanceKm": 123,
        "witak40ft": 447300,
        "user40ft": 466000,
        "woonsong40ft": 497000,
        "witak20ft": 394600,
        "user20ft": 410300,
        "woonsong20ft": 436300
      },
      {
        "city": "대구광역시",
        "gu": "달서구",
        "dong": "신당동",
        "distanceKm": 126,
        "witak40ft": 454000,
        "user40ft": 473000,
        "woonsong40ft": 504500,
        "witak20ft": 400200,
        "user20ft": 416200,
        "woonsong20ft": 442700
      },
      {
        "city": "대구광역시",
        "gu": "달서구",
        "dong": "월성1동",
        "distanceKm": 123,
        "witak40ft": 447300,
        "user40ft": 466000,
        "woonsong40ft": 497000,
        "witak20ft": 394600,
        "user20ft": 410300,
        "woonsong20ft": 436300
      },
      {
        "city": "대구광역시",
        "gu": "달성군",
        "dong": "논공읍",
        "distanceKm": 132,
        "witak40ft": 467200,
        "user40ft": 486700,
        "woonsong40ft": 519300,
        "witak20ft": 411500,
        "user20ft": 428000,
        "woonsong20ft": 455400
      },
      {
        "city": "대구광역시",
        "gu": "달성군",
        "dong": "다사읍",
        "distanceKm": 133,
        "witak40ft": 469400,
        "user40ft": 489100,
        "woonsong40ft": 521800,
        "witak20ft": 413300,
        "user20ft": 429900,
        "woonsong20ft": 457400
      },
      {
        "city": "대구광역시",
        "gu": "달성군",
        "dong": "유가읍",
        "distanceKm": 123,
        "witak40ft": 447300,
        "user40ft": 466000,
        "woonsong40ft": 497000,
        "witak20ft": 394600,
        "user20ft": 410300,
        "woonsong20ft": 436300
      },
      {
        "city": "대구광역시",
        "gu": "달성군",
        "dong": "현풍읍",
        "distanceKm": 122,
        "witak40ft": 445100,
        "user40ft": 463700,
        "woonsong40ft": 494500,
        "witak20ft": 392600,
        "user20ft": 408300,
        "woonsong20ft": 434200
      },
      {
        "city": "대구광역시",
        "gu": "달성군",
        "dong": "구지면",
        "distanceKm": 122,
        "witak40ft": 445100,
        "user40ft": 463700,
        "woonsong40ft": 494500,
        "witak20ft": 392600,
        "user20ft": 408300,
        "woonsong20ft": 434200
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "신포동",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "신흥동",
        "distanceKm": 423,
        "witak40ft": 1022200,
        "user40ft": 1064400,
        "woonsong40ft": 1135300,
        "witak20ft": 894700,
        "user20ft": 930300,
        "woonsong20ft": 989700
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "동인천동",
        "distanceKm": 425,
        "witak40ft": 1025700,
        "user40ft": 1067900,
        "woonsong40ft": 1138700,
        "witak20ft": 897400,
        "user20ft": 933000,
        "woonsong20ft": 992400
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "북성동",
        "distanceKm": 426,
        "witak40ft": 1027400,
        "user40ft": 1069600,
        "woonsong40ft": 1140400,
        "witak20ft": 898700,
        "user20ft": 934300,
        "woonsong20ft": 993800
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "운서동",
        "distanceKm": 437,
        "witak40ft": 1046500,
        "user40ft": 1088700,
        "woonsong40ft": 1159500,
        "witak20ft": 913600,
        "user20ft": 949300,
        "woonsong20ft": 1008800
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "영종동",
        "distanceKm": 437,
        "witak40ft": 1046500,
        "user40ft": 1088700,
        "woonsong40ft": 1159500,
        "witak20ft": 913600,
        "user20ft": 949300,
        "woonsong20ft": 1008800
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수1동",
        "distanceKm": 413,
        "witak40ft": 1004800,
        "user40ft": 1046900,
        "woonsong40ft": 1117700,
        "witak20ft": 881000,
        "user20ft": 916500,
        "woonsong20ft": 975900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "남촌도림동",
        "distanceKm": 415,
        "witak40ft": 1008300,
        "user40ft": 1050500,
        "woonsong40ft": 1121300,
        "witak20ft": 883700,
        "user20ft": 919300,
        "woonsong20ft": 978800
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "논현1동",
        "distanceKm": 414,
        "witak40ft": 1006600,
        "user40ft": 1048700,
        "woonsong40ft": 1119500,
        "witak20ft": 882300,
        "user20ft": 917800,
        "woonsong20ft": 977300
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "논현고잔동",
        "distanceKm": 413,
        "witak40ft": 1004800,
        "user40ft": 1046900,
        "woonsong40ft": 1117700,
        "witak20ft": 881000,
        "user20ft": 916500,
        "woonsong20ft": 975900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "장수서창동",
        "distanceKm": 414,
        "witak40ft": 1006600,
        "user40ft": 1048700,
        "woonsong40ft": 1119500,
        "witak20ft": 882300,
        "user20ft": 917800,
        "woonsong20ft": 977300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평1동",
        "distanceKm": 419,
        "witak40ft": 1015200,
        "user40ft": 1057400,
        "woonsong40ft": 1128200,
        "witak20ft": 889200,
        "user20ft": 924800,
        "woonsong20ft": 984300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "산곡2동",
        "distanceKm": 421,
        "witak40ft": 1018700,
        "user40ft": 1060900,
        "woonsong40ft": 1131700,
        "witak20ft": 891900,
        "user20ft": 927500,
        "woonsong20ft": 986900
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "효성1동",
        "distanceKm": 425,
        "witak40ft": 1025700,
        "user40ft": 1067900,
        "woonsong40ft": 1138700,
        "witak20ft": 897400,
        "user20ft": 933000,
        "woonsong20ft": 992400
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "작전서운동",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양2동",
        "distanceKm": 423,
        "witak40ft": 1022200,
        "user40ft": 1064400,
        "woonsong40ft": 1135300,
        "witak20ft": 894700,
        "user20ft": 930300,
        "woonsong20ft": 989700
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양1동",
        "distanceKm": 427,
        "witak40ft": 1029100,
        "user40ft": 1071300,
        "woonsong40ft": 1142200,
        "witak20ft": 900000,
        "user20ft": 935600,
        "woonsong20ft": 995000
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양3동",
        "distanceKm": 425,
        "witak40ft": 1025700,
        "user40ft": 1067900,
        "woonsong40ft": 1138700,
        "witak20ft": 897400,
        "user20ft": 933000,
        "woonsong20ft": 992400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "검암경서동",
        "distanceKm": 429,
        "witak40ft": 1032700,
        "user40ft": 1074900,
        "woonsong40ft": 1145700,
        "witak20ft": 902800,
        "user20ft": 938400,
        "woonsong20ft": 997800
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "연희동",
        "distanceKm": 430,
        "witak40ft": 1034300,
        "user40ft": 1076500,
        "woonsong40ft": 1147400,
        "witak20ft": 904100,
        "user20ft": 939700,
        "woonsong20ft": 999100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "석남1동",
        "distanceKm": 428,
        "witak40ft": 1031000,
        "user40ft": 1073200,
        "woonsong40ft": 1144000,
        "witak20ft": 901500,
        "user20ft": 937100,
        "woonsong20ft": 996600
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가좌1동",
        "distanceKm": 430,
        "witak40ft": 1034300,
        "user40ft": 1076500,
        "woonsong40ft": 1147400,
        "witak20ft": 904100,
        "user20ft": 939700,
        "woonsong20ft": 999100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "신현원창동",
        "distanceKm": 428,
        "witak40ft": 1031000,
        "user40ft": 1073200,
        "woonsong40ft": 1144000,
        "witak20ft": 901500,
        "user20ft": 937100,
        "woonsong20ft": 996600
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "청라1동",
        "distanceKm": 430,
        "witak40ft": 1034300,
        "user40ft": 1076500,
        "woonsong40ft": 1147400,
        "witak20ft": 904100,
        "user20ft": 939700,
        "woonsong20ft": 999100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "불로대곡동",
        "distanceKm": 435,
        "witak40ft": 1043000,
        "user40ft": 1085300,
        "woonsong40ft": 1156100,
        "witak20ft": 910900,
        "user20ft": 946500,
        "woonsong20ft": 1006000
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "오류왕길동",
        "distanceKm": 440,
        "witak40ft": 1051700,
        "user40ft": 1094100,
        "woonsong40ft": 1164800,
        "witak20ft": 917700,
        "user20ft": 953400,
        "woonsong20ft": 1012800
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "학익1동",
        "distanceKm": 418,
        "witak40ft": 1013600,
        "user40ft": 1055700,
        "woonsong40ft": 1126500,
        "witak20ft": 887900,
        "user20ft": 923400,
        "woonsong20ft": 982900
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "도화1동",
        "distanceKm": 420,
        "witak40ft": 1017000,
        "user40ft": 1059100,
        "woonsong40ft": 1129900,
        "witak20ft": 890600,
        "user20ft": 926200,
        "woonsong20ft": 985600
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안1동",
        "distanceKm": 421,
        "witak40ft": 1018700,
        "user40ft": 1060900,
        "woonsong40ft": 1131700,
        "witak20ft": 891900,
        "user20ft": 927500,
        "woonsong20ft": 986900
      },
      {
        "city": "광주광역시",
        "gu": "서구",
        "dong": "치평동",
        "distanceKm": 273,
        "witak40ft": 752300,
        "user40ft": 786300,
        "woonsong40ft": 843700,
        "witak20ft": 677300,
        "user20ft": 706000,
        "woonsong20ft": 754200
      },
      {
        "city": "광주광역시",
        "gu": "북구",
        "dong": "일곡동",
        "distanceKm": 265,
        "witak40ft": 735300,
        "user40ft": 768400,
        "woonsong40ft": 824300,
        "witak20ft": 644600,
        "user20ft": 672500,
        "woonsong20ft": 719600
      },
      {
        "city": "광주광역시",
        "gu": "북구",
        "dong": "양산동",
        "distanceKm": 268,
        "witak40ft": 741000,
        "user40ft": 774500,
        "woonsong40ft": 830900,
        "witak20ft": 649300,
        "user20ft": 677500,
        "woonsong20ft": 724900
      },
      {
        "city": "광주광역시",
        "gu": "북구",
        "dong": "건국동",
        "distanceKm": 266,
        "witak40ft": 737200,
        "user40ft": 770400,
        "woonsong40ft": 826600,
        "witak20ft": 646200,
        "user20ft": 674200,
        "woonsong20ft": 721300
      },
      {
        "city": "광주광역시",
        "gu": "북구",
        "dong": "신용동",
        "distanceKm": 268,
        "witak40ft": 741000,
        "user40ft": 774500,
        "woonsong40ft": 830900,
        "witak20ft": 649300,
        "user20ft": 677500,
        "woonsong20ft": 724900
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "어룡동",
        "distanceKm": 278,
        "witak40ft": 760900,
        "user40ft": 795400,
        "woonsong40ft": 853500,
        "witak20ft": 684900,
        "user20ft": 714000,
        "woonsong20ft": 762900
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "비아동",
        "distanceKm": 272,
        "witak40ft": 750600,
        "user40ft": 784500,
        "woonsong40ft": 841700,
        "witak20ft": 675800,
        "user20ft": 704400,
        "woonsong20ft": 752400
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "하남동",
        "distanceKm": 275,
        "witak40ft": 755700,
        "user40ft": 789900,
        "woonsong40ft": 847500,
        "witak20ft": 680500,
        "user20ft": 709300,
        "woonsong20ft": 757800
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "임곡동",
        "distanceKm": 278,
        "witak40ft": 760900,
        "user40ft": 795400,
        "woonsong40ft": 853500,
        "witak20ft": 684900,
        "user20ft": 714000,
        "woonsong20ft": 762900
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "평동",
        "distanceKm": 283,
        "witak40ft": 769200,
        "user40ft": 804200,
        "woonsong40ft": 863200,
        "witak20ft": 692500,
        "user20ft": 722000,
        "woonsong20ft": 771700
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "삼도동",
        "distanceKm": 286,
        "witak40ft": 774600,
        "user40ft": 809900,
        "woonsong40ft": 869500,
        "witak20ft": 697000,
        "user20ft": 726700,
        "woonsong20ft": 776700
      },
      {
        "city": "광주광역시",
        "gu": "광산구",
        "dong": "수완동",
        "distanceKm": 272,
        "witak40ft": 750600,
        "user40ft": 784500,
        "woonsong40ft": 841700,
        "witak20ft": 675800,
        "user20ft": 704400,
        "woonsong20ft": 752400
      },
      {
        "city": "대전광역시",
        "gu": "유성구",
        "dong": "신성동",
        "distanceKm": 276,
        "witak40ft": 757400,
        "user40ft": 791700,
        "woonsong40ft": 849500,
        "witak20ft": 682000,
        "user20ft": 710900,
        "woonsong20ft": 759500
      },
      {
        "city": "대전광역시",
        "gu": "유성구",
        "dong": "구즉동",
        "distanceKm": 274,
        "witak40ft": 754000,
        "user40ft": 788100,
        "woonsong40ft": 845600,
        "witak20ft": 678800,
        "user20ft": 707600,
        "woonsong20ft": 755900
      },
      {
        "city": "대전광역시",
        "gu": "유성구",
        "dong": "관평동",
        "distanceKm": 272,
        "witak40ft": 750600,
        "user40ft": 784500,
        "woonsong40ft": 841700,
        "witak20ft": 675800,
        "user20ft": 704400,
        "woonsong20ft": 752400
      },
      {
        "city": "대전광역시",
        "gu": "대덕구",
        "dong": "대화동",
        "distanceKm": 267,
        "witak40ft": 739200,
        "user40ft": 772600,
        "woonsong40ft": 828900,
        "witak20ft": 647700,
        "user20ft": 675800,
        "woonsong20ft": 723100
      },
      {
        "city": "대전광역시",
        "gu": "대덕구",
        "dong": "회덕동",
        "distanceKm": 267,
        "witak40ft": 739200,
        "user40ft": 772600,
        "woonsong40ft": 828900,
        "witak20ft": 647700,
        "user20ft": 675800,
        "woonsong20ft": 723100
      },
      {
        "city": "대전광역시",
        "gu": "대덕구",
        "dong": "덕암동",
        "distanceKm": 271,
        "witak40ft": 748900,
        "user40ft": 782700,
        "woonsong40ft": 839700,
        "witak20ft": 674400,
        "user20ft": 702900,
        "woonsong20ft": 750800
      },
      {
        "city": "대전광역시",
        "gu": "대덕구",
        "dong": "목상동",
        "distanceKm": 273,
        "witak40ft": 752300,
        "user40ft": 786300,
        "woonsong40ft": 843700,
        "witak20ft": 677300,
        "user20ft": 706000,
        "woonsong20ft": 754200
      },
      {
        "city": "울산광역시",
        "gu": "중구",
        "dong": "중앙동",
        "distanceKm": 66,
        "witak40ft": 313200,
        "user40ft": 325900,
        "woonsong40ft": 346900,
        "witak20ft": 278700,
        "user20ft": 289400,
        "woonsong20ft": 307100
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "옥동",
        "distanceKm": 63,
        "witak40ft": 305700,
        "user40ft": 318100,
        "woonsong40ft": 338700,
        "witak20ft": 272100,
        "user20ft": 282500,
        "woonsong20ft": 299700
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "야음장생포동",
        "distanceKm": 62,
        "witak40ft": 303200,
        "user40ft": 315500,
        "woonsong40ft": 335900,
        "witak20ft": 269900,
        "user20ft": 280300,
        "woonsong20ft": 297400
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "선암동",
        "distanceKm": 61,
        "witak40ft": 300600,
        "user40ft": 312800,
        "woonsong40ft": 333000,
        "witak20ft": 267600,
        "user20ft": 277900,
        "woonsong20ft": 294900
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "농소1동",
        "distanceKm": 74,
        "witak40ft": 333000,
        "user40ft": 346500,
        "woonsong40ft": 369000,
        "witak20ft": 296000,
        "user20ft": 307400,
        "woonsong20ft": 326300
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "농소2동",
        "distanceKm": 76,
        "witak40ft": 337900,
        "user40ft": 351700,
        "woonsong40ft": 374500,
        "witak20ft": 300200,
        "user20ft": 311800,
        "woonsong20ft": 331100
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "효문동",
        "distanceKm": 69,
        "witak40ft": 320700,
        "user40ft": 333700,
        "woonsong40ft": 355300,
        "witak20ft": 285200,
        "user20ft": 296200,
        "woonsong20ft": 314400
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "온산읍",
        "distanceKm": 53,
        "witak40ft": 280100,
        "user40ft": 291500,
        "woonsong40ft": 310300,
        "witak20ft": 249600,
        "user20ft": 259300,
        "woonsong20ft": 275100
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "언양읍",
        "distanceKm": 62,
        "witak40ft": 303200,
        "user40ft": 315500,
        "woonsong40ft": 335900,
        "witak20ft": 269900,
        "user20ft": 280300,
        "woonsong20ft": 297400
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "온양읍",
        "distanceKm": 47,
        "witak40ft": 262000,
        "user40ft": 272800,
        "woonsong40ft": 290500,
        "witak20ft": 228400,
        "user20ft": 237500,
        "woonsong20ft": 252400
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "청량읍",
        "distanceKm": 57,
        "witak40ft": 290400,
        "user40ft": 302200,
        "woonsong40ft": 321700,
        "witak20ft": 258700,
        "user20ft": 268700,
        "woonsong20ft": 285100
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "웅촌면",
        "distanceKm": 50,
        "witak40ft": 271700,
        "user40ft": 282800,
        "woonsong40ft": 301100,
        "witak20ft": 236900,
        "user20ft": 246200,
        "woonsong20ft": 261500
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "두동면",
        "distanceKm": 76,
        "witak40ft": 337900,
        "user40ft": 351700,
        "woonsong40ft": 374500,
        "witak20ft": 300200,
        "user20ft": 311800,
        "woonsong20ft": 331100
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "두서면",
        "distanceKm": 71,
        "witak40ft": 325700,
        "user40ft": 338900,
        "woonsong40ft": 360900,
        "witak20ft": 289600,
        "user20ft": 300800,
        "woonsong20ft": 319300
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "상북면",
        "distanceKm": 68,
        "witak40ft": 318200,
        "user40ft": 331100,
        "woonsong40ft": 352500,
        "witak20ft": 283000,
        "user20ft": 293900,
        "woonsong20ft": 312000
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "삼남면",
        "distanceKm": 59,
        "witak40ft": 295500,
        "user40ft": 307500,
        "woonsong40ft": 327300,
        "witak20ft": 263200,
        "user20ft": 273300,
        "woonsong20ft": 290000
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "삼동면",
        "distanceKm": 62,
        "witak40ft": 303200,
        "user40ft": 315500,
        "woonsong40ft": 335900,
        "witak20ft": 269900,
        "user20ft": 280300,
        "woonsong20ft": 297400
      },
      {
        "city": "경기도",
        "gu": "수원시 장안구",
        "dong": "파장동",
        "distanceKm": 385,
        "witak40ft": 955800,
        "user40ft": 997700,
        "woonsong40ft": 1068500,
        "witak20ft": 842300,
        "user20ft": 877700,
        "woonsong20ft": 937200
      },
      {
        "city": "경기도",
        "gu": "수원시 권선구",
        "dong": "평동",
        "distanceKm": 378,
        "witak40ft": 943400,
        "user40ft": 985300,
        "woonsong40ft": 1056200,
        "witak20ft": 832600,
        "user20ft": 868000,
        "woonsong20ft": 927500
      },
      {
        "city": "경기도",
        "gu": "수원시 영통구",
        "dong": "매탄1동",
        "distanceKm": 380,
        "witak40ft": 946900,
        "user40ft": 988800,
        "woonsong40ft": 1059600,
        "witak20ft": 835300,
        "user20ft": 870700,
        "woonsong20ft": 930300
      },
      {
        "city": "경기도",
        "gu": "성남시 분당구",
        "dong": "야탑1동",
        "distanceKm": 376,
        "witak40ft": 939900,
        "user40ft": 981800,
        "woonsong40ft": 1052600,
        "witak20ft": 829600,
        "user20ft": 865000,
        "woonsong20ft": 924500
      },
      {
        "city": "경기도",
        "gu": "안양시 만안구",
        "dong": "박달1동",
        "distanceKm": 394,
        "witak40ft": 971600,
        "user40ft": 1013600,
        "woonsong40ft": 1084400,
        "witak20ft": 854800,
        "user20ft": 890200,
        "woonsong20ft": 949700
      },
      {
        "city": "경기도",
        "gu": "안양시 동안구",
        "dong": "관양1동",
        "distanceKm": 392,
        "witak40ft": 968200,
        "user40ft": 1010200,
        "woonsong40ft": 1080900,
        "witak20ft": 852000,
        "user20ft": 887500,
        "woonsong20ft": 947000
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "오정동",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "팽성읍",
        "distanceKm": 350,
        "witak40ft": 893600,
        "user40ft": 935400,
        "woonsong40ft": 1006200,
        "witak20ft": 792900,
        "user20ft": 828100,
        "woonsong20ft": 887700
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "포승읍",
        "distanceKm": 379,
        "witak40ft": 945100,
        "user40ft": 987000,
        "woonsong40ft": 1057900,
        "witak20ft": 833900,
        "user20ft": 869200,
        "woonsong20ft": 928700
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "청북읍",
        "distanceKm": 368,
        "witak40ft": 925700,
        "user40ft": 967500,
        "woonsong40ft": 1038300,
        "witak20ft": 818600,
        "user20ft": 853900,
        "woonsong20ft": 913400
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "진위면",
        "distanceKm": 356,
        "witak40ft": 904400,
        "user40ft": 946200,
        "woonsong40ft": 1017000,
        "witak20ft": 801500,
        "user20ft": 836800,
        "woonsong20ft": 896300
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "서탄면",
        "distanceKm": 366,
        "witak40ft": 922200,
        "user40ft": 964000,
        "woonsong40ft": 1034800,
        "witak20ft": 815600,
        "user20ft": 850900,
        "woonsong20ft": 910400
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "고덕면",
        "distanceKm": 362,
        "witak40ft": 915000,
        "user40ft": 956800,
        "woonsong40ft": 1027600,
        "witak20ft": 810100,
        "user20ft": 845300,
        "woonsong20ft": 904800
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "오성면",
        "distanceKm": 366,
        "witak40ft": 922200,
        "user40ft": 964000,
        "woonsong40ft": 1034800,
        "witak20ft": 815600,
        "user20ft": 850900,
        "woonsong20ft": 910400
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "중앙동",
        "distanceKm": 354,
        "witak40ft": 900800,
        "user40ft": 942600,
        "woonsong40ft": 1013400,
        "witak20ft": 798600,
        "user20ft": 833900,
        "woonsong20ft": 893400
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "송탄동",
        "distanceKm": 350,
        "witak40ft": 893600,
        "user40ft": 935400,
        "woonsong40ft": 1006200,
        "witak20ft": 792900,
        "user20ft": 828100,
        "woonsong20ft": 887700
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "지산동",
        "distanceKm": 356,
        "witak40ft": 904400,
        "user40ft": 946200,
        "woonsong40ft": 1017000,
        "witak20ft": 801500,
        "user20ft": 836800,
        "woonsong20ft": 896300
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "신평동",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "비전1동",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "세교동",
        "distanceKm": 348,
        "witak40ft": 890100,
        "user40ft": 931600,
        "woonsong40ft": 1002100,
        "witak20ft": 790100,
        "user20ft": 825200,
        "woonsong20ft": 884400
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "불현동",
        "distanceKm": 431,
        "witak40ft": 1036000,
        "user40ft": 1078300,
        "woonsong40ft": 1149100,
        "witak20ft": 905500,
        "user20ft": 941100,
        "woonsong20ft": 1000600
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "소요동",
        "distanceKm": 434,
        "witak40ft": 1041300,
        "user40ft": 1083600,
        "woonsong40ft": 1154400,
        "witak20ft": 909600,
        "user20ft": 945200,
        "woonsong20ft": 1004600
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "상패동",
        "distanceKm": 435,
        "witak40ft": 1043000,
        "user40ft": 1085300,
        "woonsong40ft": 1156100,
        "witak20ft": 910900,
        "user20ft": 946500,
        "woonsong20ft": 1006000
      },
      {
        "city": "경기도",
        "gu": "안산시 상록구",
        "dong": "본오1동",
        "distanceKm": 397,
        "witak40ft": 976900,
        "user40ft": 1018900,
        "woonsong40ft": 1089700,
        "witak20ft": 858900,
        "user20ft": 894400,
        "woonsong20ft": 953900
      },
      {
        "city": "경기도",
        "gu": "안산시 단원구",
        "dong": "초지동",
        "distanceKm": 402,
        "witak40ft": 985600,
        "user40ft": 1027600,
        "woonsong40ft": 1098400,
        "witak20ft": 865800,
        "user20ft": 901300,
        "woonsong20ft": 960800
      },
      {
        "city": "경기도",
        "gu": "안산시 단원구",
        "dong": "신길동",
        "distanceKm": 402,
        "witak40ft": 985600,
        "user40ft": 1027600,
        "woonsong40ft": 1098400,
        "witak20ft": 865800,
        "user20ft": 901300,
        "woonsong20ft": 960800
      },
      {
        "city": "경기도",
        "gu": "고양시 덕양구",
        "dong": "화정1동",
        "distanceKm": 429,
        "witak40ft": 1032700,
        "user40ft": 1074900,
        "woonsong40ft": 1145700,
        "witak20ft": 902800,
        "user20ft": 938400,
        "woonsong20ft": 997800
      },
      {
        "city": "경기도",
        "gu": "고양시 일산동구",
        "dong": "장항1동",
        "distanceKm": 430,
        "witak40ft": 1034300,
        "user40ft": 1076500,
        "woonsong40ft": 1147400,
        "witak20ft": 904100,
        "user20ft": 939700,
        "woonsong20ft": 999100
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "와부읍",
        "distanceKm": 391,
        "witak40ft": 966300,
        "user40ft": 1008300,
        "woonsong40ft": 1079100,
        "witak20ft": 850600,
        "user20ft": 886000,
        "woonsong20ft": 945500
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "진접읍",
        "distanceKm": 406,
        "witak40ft": 992600,
        "user40ft": 1034600,
        "woonsong40ft": 1105400,
        "witak20ft": 871400,
        "user20ft": 906900,
        "woonsong20ft": 966300
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "화도읍",
        "distanceKm": 404,
        "witak40ft": 989100,
        "user40ft": 1031100,
        "woonsong40ft": 1101900,
        "witak20ft": 868600,
        "user20ft": 904100,
        "woonsong20ft": 963500
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "진건읍",
        "distanceKm": 398,
        "witak40ft": 978600,
        "user40ft": 1020600,
        "woonsong40ft": 1091400,
        "witak20ft": 860400,
        "user20ft": 895800,
        "woonsong20ft": 955200
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "오남읍",
        "distanceKm": 407,
        "witak40ft": 994300,
        "user40ft": 1036400,
        "woonsong40ft": 1107100,
        "witak20ft": 872800,
        "user20ft": 908300,
        "woonsong20ft": 967800
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "별내면",
        "distanceKm": 401,
        "witak40ft": 983800,
        "user40ft": 1025800,
        "woonsong40ft": 1096600,
        "witak20ft": 864500,
        "user20ft": 900000,
        "woonsong20ft": 959400
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "수동면",
        "distanceKm": 408,
        "witak40ft": 996100,
        "user40ft": 1038200,
        "woonsong40ft": 1108900,
        "witak20ft": 874200,
        "user20ft": 909700,
        "woonsong20ft": 969100
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "금곡동",
        "distanceKm": 396,
        "witak40ft": 975200,
        "user40ft": 1017200,
        "woonsong40ft": 1087900,
        "witak20ft": 857500,
        "user20ft": 892900,
        "woonsong20ft": 952400
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "양정동",
        "distanceKm": 394,
        "witak40ft": 971600,
        "user40ft": 1013600,
        "woonsong40ft": 1084400,
        "witak20ft": 854800,
        "user20ft": 890200,
        "woonsong20ft": 949700
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "다산1동",
        "distanceKm": 391,
        "witak40ft": 966300,
        "user40ft": 1008300,
        "woonsong40ft": 1079100,
        "witak20ft": 850600,
        "user20ft": 886000,
        "woonsong20ft": 945500
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "중앙동",
        "distanceKm": 360,
        "witak40ft": 911500,
        "user40ft": 953300,
        "woonsong40ft": 1024100,
        "witak20ft": 807100,
        "user20ft": 842300,
        "woonsong20ft": 901800
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "남촌동",
        "distanceKm": 361,
        "witak40ft": 913200,
        "user40ft": 955000,
        "woonsong40ft": 1025800,
        "witak20ft": 808600,
        "user20ft": 843900,
        "woonsong20ft": 903500
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "세마동",
        "distanceKm": 368,
        "witak40ft": 925700,
        "user40ft": 967500,
        "woonsong40ft": 1038300,
        "witak20ft": 818600,
        "user20ft": 853900,
        "woonsong20ft": 913400
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "초평동",
        "distanceKm": 364,
        "witak40ft": 918700,
        "user40ft": 960500,
        "woonsong40ft": 1031300,
        "witak20ft": 812800,
        "user20ft": 848100,
        "woonsong20ft": 907600
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "대야동",
        "distanceKm": 410,
        "witak40ft": 999600,
        "user40ft": 1041700,
        "woonsong40ft": 1112500,
        "witak20ft": 876900,
        "user20ft": 912400,
        "woonsong20ft": 971900
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "신천동",
        "distanceKm": 411,
        "witak40ft": 1001300,
        "user40ft": 1043400,
        "woonsong40ft": 1114200,
        "witak20ft": 878200,
        "user20ft": 913700,
        "woonsong20ft": 973100
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "신현동",
        "distanceKm": 409,
        "witak40ft": 997800,
        "user40ft": 1039900,
        "woonsong40ft": 1110700,
        "witak20ft": 875500,
        "user20ft": 911000,
        "woonsong20ft": 970400
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "매화동",
        "distanceKm": 407,
        "witak40ft": 994300,
        "user40ft": 1036400,
        "woonsong40ft": 1107100,
        "witak20ft": 872800,
        "user20ft": 908300,
        "woonsong20ft": 967800
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "목감동",
        "distanceKm": 401,
        "witak40ft": 983800,
        "user40ft": 1025800,
        "woonsong40ft": 1096600,
        "witak20ft": 864500,
        "user20ft": 900000,
        "woonsong20ft": 959400
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "과림동",
        "distanceKm": 409,
        "witak40ft": 997800,
        "user40ft": 1039900,
        "woonsong40ft": 1110700,
        "witak20ft": 875500,
        "user20ft": 911000,
        "woonsong20ft": 970400
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕본동",
        "distanceKm": 406,
        "witak40ft": 992600,
        "user40ft": 1034600,
        "woonsong40ft": 1105400,
        "witak20ft": 871400,
        "user20ft": 906900,
        "woonsong20ft": 966300
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "군자동",
        "distanceKm": 401,
        "witak40ft": 983800,
        "user40ft": 1025800,
        "woonsong40ft": 1096600,
        "witak20ft": 864500,
        "user20ft": 900000,
        "woonsong20ft": 959400
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "연성동",
        "distanceKm": 404,
        "witak40ft": 989100,
        "user40ft": 1031100,
        "woonsong40ft": 1101900,
        "witak20ft": 868600,
        "user20ft": 904100,
        "woonsong20ft": 963500
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "군포1동",
        "distanceKm": 387,
        "witak40ft": 959300,
        "user40ft": 1001300,
        "woonsong40ft": 1072100,
        "witak20ft": 845200,
        "user20ft": 880600,
        "woonsong20ft": 940000
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "군포2동",
        "distanceKm": 388,
        "witak40ft": 961100,
        "user40ft": 1003000,
        "woonsong40ft": 1073800,
        "witak20ft": 846500,
        "user20ft": 881900,
        "woonsong20ft": 941300
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "금정동",
        "distanceKm": 389,
        "witak40ft": 962900,
        "user40ft": 1004900,
        "woonsong40ft": 1075700,
        "witak20ft": 847900,
        "user20ft": 883300,
        "woonsong20ft": 942900
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "부곡동",
        "distanceKm": 385,
        "witak40ft": 955800,
        "user40ft": 997700,
        "woonsong40ft": 1068500,
        "witak20ft": 842300,
        "user20ft": 877700,
        "woonsong20ft": 937200
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "오전동",
        "distanceKm": 384,
        "witak40ft": 954100,
        "user40ft": 996000,
        "woonsong40ft": 1066800,
        "witak20ft": 840900,
        "user20ft": 876300,
        "woonsong20ft": 935800
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "청계동",
        "distanceKm": 390,
        "witak40ft": 964600,
        "user40ft": 1006600,
        "woonsong40ft": 1077400,
        "witak20ft": 849200,
        "user20ft": 884600,
        "woonsong20ft": 944100
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "천현동",
        "distanceKm": 379,
        "witak40ft": 945100,
        "user40ft": 987000,
        "woonsong40ft": 1057900,
        "witak20ft": 833900,
        "user20ft": 869200,
        "woonsong20ft": 928700
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "덕풍1동",
        "distanceKm": 384,
        "witak40ft": 954100,
        "user40ft": 996000,
        "woonsong40ft": 1066800,
        "witak20ft": 840900,
        "user20ft": 876300,
        "woonsong20ft": 935800
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "춘궁동",
        "distanceKm": 381,
        "witak40ft": 948700,
        "user40ft": 990600,
        "woonsong40ft": 1061400,
        "witak20ft": 836700,
        "user20ft": 872100,
        "woonsong20ft": 931700
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "초이동",
        "distanceKm": 384,
        "witak40ft": 954100,
        "user40ft": 996000,
        "woonsong40ft": 1066800,
        "witak20ft": 840900,
        "user20ft": 876300,
        "woonsong20ft": 935800
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "풍산동",
        "distanceKm": 382,
        "witak40ft": 950400,
        "user40ft": 992400,
        "woonsong40ft": 1063200,
        "witak20ft": 838200,
        "user20ft": 873600,
        "woonsong20ft": 933000
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "감북동",
        "distanceKm": 385,
        "witak40ft": 955800,
        "user40ft": 997700,
        "woonsong40ft": 1068500,
        "witak20ft": 842300,
        "user20ft": 877700,
        "woonsong20ft": 937200
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "모현읍",
        "distanceKm": 369,
        "witak40ft": 927500,
        "user40ft": 969300,
        "woonsong40ft": 1040100,
        "witak20ft": 819900,
        "user20ft": 855200,
        "woonsong20ft": 914600
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "이동읍",
        "distanceKm": 364,
        "witak40ft": 918700,
        "user40ft": 960500,
        "woonsong40ft": 1031300,
        "witak20ft": 812800,
        "user20ft": 848100,
        "woonsong20ft": 907600
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "남사면",
        "distanceKm": 368,
        "witak40ft": 925700,
        "user40ft": 967500,
        "woonsong40ft": 1038300,
        "witak20ft": 818600,
        "user20ft": 853900,
        "woonsong20ft": 913400
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "원삼면",
        "distanceKm": 363,
        "witak40ft": 916700,
        "user40ft": 958500,
        "woonsong40ft": 1029300,
        "witak20ft": 811400,
        "user20ft": 846600,
        "woonsong20ft": 906100
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "백암면",
        "distanceKm": 354,
        "witak40ft": 900800,
        "user40ft": 942600,
        "woonsong40ft": 1013400,
        "witak20ft": 798600,
        "user20ft": 833900,
        "woonsong20ft": 893400
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "양지면",
        "distanceKm": 353,
        "witak40ft": 898900,
        "user40ft": 940700,
        "woonsong40ft": 1011500,
        "witak20ft": 797200,
        "user20ft": 832400,
        "woonsong20ft": 891900
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "중앙동",
        "distanceKm": 362,
        "witak40ft": 915000,
        "user40ft": 956800,
        "woonsong40ft": 1027600,
        "witak20ft": 810100,
        "user20ft": 845300,
        "woonsong20ft": 904800
      },
      {
        "city": "경기도",
        "gu": "용인시 처인구",
        "dong": "유림동",
        "distanceKm": 360,
        "witak40ft": 911500,
        "user40ft": 953300,
        "woonsong40ft": 1024100,
        "witak20ft": 807100,
        "user20ft": 842300,
        "woonsong20ft": 901800
      },
      {
        "city": "경기도",
        "gu": "용인시 기흥구",
        "dong": "기흥동",
        "distanceKm": 372,
        "witak40ft": 932800,
        "user40ft": 974700,
        "woonsong40ft": 1045500,
        "witak20ft": 824200,
        "user20ft": 859500,
        "woonsong20ft": 919000
      },
      {
        "city": "경기도",
        "gu": "용인시 기흥구",
        "dong": "서농동",
        "distanceKm": 372,
        "witak40ft": 932800,
        "user40ft": 974700,
        "woonsong40ft": 1045500,
        "witak20ft": 824200,
        "user20ft": 859500,
        "woonsong20ft": 919000
      },
      {
        "city": "경기도",
        "gu": "용인시 기흥구",
        "dong": "상하동",
        "distanceKm": 377,
        "witak40ft": 941600,
        "user40ft": 983500,
        "woonsong40ft": 1054300,
        "witak20ft": 831200,
        "user20ft": 866600,
        "woonsong20ft": 926100
      },
      {
        "city": "경기도",
        "gu": "용인시 수지구",
        "dong": "동천동",
        "distanceKm": 381,
        "witak40ft": 948700,
        "user40ft": 990600,
        "woonsong40ft": 1061400,
        "witak20ft": 836700,
        "user20ft": 872100,
        "woonsong20ft": 931700
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "문산읍",
        "distanceKm": 448,
        "witak40ft": 1065500,
        "user40ft": 1107900,
        "woonsong40ft": 1178600,
        "witak20ft": 928700,
        "user20ft": 964500,
        "woonsong20ft": 1023900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "파주읍",
        "distanceKm": 448,
        "witak40ft": 1065500,
        "user40ft": 1107900,
        "woonsong40ft": 1178600,
        "witak20ft": 928700,
        "user20ft": 964500,
        "woonsong20ft": 1023900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "법원읍",
        "distanceKm": 448,
        "witak40ft": 1065500,
        "user40ft": 1107900,
        "woonsong40ft": 1178600,
        "witak20ft": 928700,
        "user20ft": 964500,
        "woonsong20ft": 1023900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "조리읍",
        "distanceKm": 438,
        "witak40ft": 1048200,
        "user40ft": 1090600,
        "woonsong40ft": 1161400,
        "witak20ft": 914900,
        "user20ft": 950700,
        "woonsong20ft": 1010100
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "월롱면",
        "distanceKm": 443,
        "witak40ft": 1056800,
        "user40ft": 1099200,
        "woonsong40ft": 1170000,
        "witak20ft": 921700,
        "user20ft": 957500,
        "woonsong20ft": 1017000
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "탄현면",
        "distanceKm": 452,
        "witak40ft": 1072400,
        "user40ft": 1114800,
        "woonsong40ft": 1185500,
        "witak20ft": 934700,
        "user20ft": 970500,
        "woonsong20ft": 1029900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "광탄면",
        "distanceKm": 428,
        "witak40ft": 1031000,
        "user40ft": 1073200,
        "woonsong40ft": 1144000,
        "witak20ft": 901500,
        "user20ft": 937100,
        "woonsong20ft": 996600
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "파평면",
        "distanceKm": 459,
        "witak40ft": 1084300,
        "user40ft": 1126700,
        "woonsong40ft": 1197400,
        "witak20ft": 945300,
        "user20ft": 981100,
        "woonsong20ft": 1040400
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "적성면",
        "distanceKm": 448,
        "witak40ft": 1065500,
        "user40ft": 1107900,
        "woonsong40ft": 1178600,
        "witak20ft": 928700,
        "user20ft": 964500,
        "woonsong20ft": 1023900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "금촌1동",
        "distanceKm": 437,
        "witak40ft": 1046500,
        "user40ft": 1088700,
        "woonsong40ft": 1159500,
        "witak20ft": 913600,
        "user20ft": 949300,
        "woonsong20ft": 1008800
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "금촌3동",
        "distanceKm": 438,
        "witak40ft": 1048200,
        "user40ft": 1090600,
        "woonsong40ft": 1161400,
        "witak20ft": 914900,
        "user20ft": 950700,
        "woonsong20ft": 1010100
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "교하동",
        "distanceKm": 442,
        "witak40ft": 1055200,
        "user40ft": 1097600,
        "woonsong40ft": 1168400,
        "witak20ft": 920400,
        "user20ft": 956200,
        "woonsong20ft": 1015600
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "운정1동",
        "distanceKm": 438,
        "witak40ft": 1048200,
        "user40ft": 1090600,
        "woonsong40ft": 1161400,
        "witak20ft": 914900,
        "user20ft": 950700,
        "woonsong20ft": 1010100
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "장호원읍",
        "distanceKm": 315,
        "witak40ft": 830300,
        "user40ft": 868500,
        "woonsong40ft": 933200,
        "witak20ft": 742300,
        "user20ft": 774500,
        "woonsong20ft": 828800
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "부발읍",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "신둔면",
        "distanceKm": 348,
        "witak40ft": 890100,
        "user40ft": 931600,
        "woonsong40ft": 1002100,
        "witak20ft": 790100,
        "user20ft": 825200,
        "woonsong20ft": 884400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "백사면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "호법면",
        "distanceKm": 342,
        "witak40ft": 879200,
        "user40ft": 920100,
        "woonsong40ft": 989600,
        "witak20ft": 781500,
        "user20ft": 816000,
        "woonsong20ft": 874400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "마장면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "대월면",
        "distanceKm": 337,
        "witak40ft": 870200,
        "user40ft": 910600,
        "woonsong40ft": 979200,
        "witak20ft": 774300,
        "user20ft": 808400,
        "woonsong20ft": 866100
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "모가면",
        "distanceKm": 351,
        "witak40ft": 895300,
        "user40ft": 937100,
        "woonsong40ft": 1007900,
        "witak20ft": 794300,
        "user20ft": 829500,
        "woonsong20ft": 889000
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "설성면",
        "distanceKm": 326,
        "witak40ft": 850300,
        "user40ft": 889600,
        "woonsong40ft": 956200,
        "witak20ft": 758300,
        "user20ft": 791500,
        "woonsong20ft": 847400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "율면",
        "distanceKm": 322,
        "witak40ft": 843100,
        "user40ft": 882000,
        "woonsong40ft": 947900,
        "witak20ft": 752500,
        "user20ft": 785300,
        "woonsong20ft": 840700
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "중리동",
        "distanceKm": 338,
        "witak40ft": 872000,
        "user40ft": 912500,
        "woonsong40ft": 981300,
        "witak20ft": 775800,
        "user20ft": 810000,
        "woonsong20ft": 867800
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "관고동",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "증포동",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "공도읍",
        "distanceKm": 343,
        "witak40ft": 881000,
        "user40ft": 922100,
        "woonsong40ft": 991700,
        "witak20ft": 783000,
        "user20ft": 817600,
        "woonsong20ft": 876100
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "보개면",
        "distanceKm": 354,
        "witak40ft": 900800,
        "user40ft": 942600,
        "woonsong40ft": 1013400,
        "witak20ft": 798600,
        "user20ft": 833900,
        "woonsong20ft": 893400
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "서운면",
        "distanceKm": 340,
        "witak40ft": 875700,
        "user40ft": 916400,
        "woonsong40ft": 985500,
        "witak20ft": 778600,
        "user20ft": 813000,
        "woonsong20ft": 871100
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "미양면",
        "distanceKm": 352,
        "witak40ft": 897200,
        "user40ft": 939000,
        "woonsong40ft": 1009800,
        "witak20ft": 795900,
        "user20ft": 831100,
        "woonsong20ft": 890600
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "대덕면",
        "distanceKm": 349,
        "witak40ft": 891800,
        "user40ft": 933500,
        "woonsong40ft": 1004200,
        "witak20ft": 791500,
        "user20ft": 826600,
        "woonsong20ft": 886000
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "양성면",
        "distanceKm": 356,
        "witak40ft": 904400,
        "user40ft": 946200,
        "woonsong40ft": 1017000,
        "witak20ft": 801500,
        "user20ft": 836800,
        "woonsong20ft": 896300
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "원곡면",
        "distanceKm": 351,
        "witak40ft": 895300,
        "user40ft": 937100,
        "woonsong40ft": 1007900,
        "witak20ft": 794300,
        "user20ft": 829500,
        "woonsong20ft": 889000
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "일죽면",
        "distanceKm": 338,
        "witak40ft": 872000,
        "user40ft": 912500,
        "woonsong40ft": 981300,
        "witak20ft": 775800,
        "user20ft": 810000,
        "woonsong20ft": 867800
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "죽산면",
        "distanceKm": 344,
        "witak40ft": 882800,
        "user40ft": 923900,
        "woonsong40ft": 993700,
        "witak20ft": 784400,
        "user20ft": 819100,
        "woonsong20ft": 877800
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "삼죽면",
        "distanceKm": 350,
        "witak40ft": 893600,
        "user40ft": 935400,
        "woonsong40ft": 1006200,
        "witak20ft": 792900,
        "user20ft": 828100,
        "woonsong20ft": 887700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성1동",
        "distanceKm": 351,
        "witak40ft": 895300,
        "user40ft": 937100,
        "woonsong40ft": 1007900,
        "witak20ft": 794300,
        "user20ft": 829500,
        "woonsong20ft": 889000
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성2동",
        "distanceKm": 350,
        "witak40ft": 893600,
        "user40ft": 935400,
        "woonsong40ft": 1006200,
        "witak20ft": 792900,
        "user20ft": 828100,
        "woonsong20ft": 887700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성3동",
        "distanceKm": 352,
        "witak40ft": 897200,
        "user40ft": 939000,
        "woonsong40ft": 1009800,
        "witak20ft": 795900,
        "user20ft": 831100,
        "woonsong20ft": 890600
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "통진읍",
        "distanceKm": 443,
        "witak40ft": 1056800,
        "user40ft": 1099200,
        "woonsong40ft": 1170000,
        "witak20ft": 921700,
        "user20ft": 957500,
        "woonsong20ft": 1017000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "고촌읍",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "양촌읍",
        "distanceKm": 440,
        "witak40ft": 1051700,
        "user40ft": 1094100,
        "woonsong40ft": 1164800,
        "witak20ft": 917700,
        "user20ft": 953400,
        "woonsong20ft": 1012800
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "대곶면",
        "distanceKm": 446,
        "witak40ft": 1062000,
        "user40ft": 1104400,
        "woonsong40ft": 1175200,
        "witak20ft": 925800,
        "user20ft": 961600,
        "woonsong20ft": 1020900
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "월곶면",
        "distanceKm": 447,
        "witak40ft": 1063700,
        "user40ft": 1106100,
        "woonsong40ft": 1176900,
        "witak20ft": 927200,
        "user20ft": 963000,
        "woonsong20ft": 1022400
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "하성면",
        "distanceKm": 444,
        "witak40ft": 1058600,
        "user40ft": 1101000,
        "woonsong40ft": 1171700,
        "witak20ft": 923100,
        "user20ft": 958900,
        "woonsong20ft": 1018200
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "사우동",
        "distanceKm": 431,
        "witak40ft": 1036000,
        "user40ft": 1078300,
        "woonsong40ft": 1149100,
        "witak20ft": 905500,
        "user20ft": 941100,
        "woonsong20ft": 1000600
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "풍무동",
        "distanceKm": 430,
        "witak40ft": 1034300,
        "user40ft": 1076500,
        "woonsong40ft": 1147400,
        "witak20ft": 904100,
        "user20ft": 939700,
        "woonsong20ft": 999100
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "운양동",
        "distanceKm": 434,
        "witak40ft": 1041300,
        "user40ft": 1083600,
        "woonsong40ft": 1154400,
        "witak20ft": 909600,
        "user20ft": 945200,
        "woonsong20ft": 1004600
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "김포본동",
        "distanceKm": 433,
        "witak40ft": 1039500,
        "user40ft": 1081700,
        "woonsong40ft": 1152500,
        "witak20ft": 908100,
        "user20ft": 943800,
        "woonsong20ft": 1003300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "봉담읍",
        "distanceKm": 381,
        "witak40ft": 948700,
        "user40ft": 990600,
        "woonsong40ft": 1061400,
        "witak20ft": 836700,
        "user20ft": 872100,
        "woonsong20ft": 931700
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "우정읍",
        "distanceKm": 385,
        "witak40ft": 955800,
        "user40ft": 997700,
        "woonsong40ft": 1068500,
        "witak20ft": 842300,
        "user20ft": 877700,
        "woonsong20ft": 937200
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "향남읍",
        "distanceKm": 382,
        "witak40ft": 950400,
        "user40ft": 992400,
        "woonsong40ft": 1063200,
        "witak20ft": 838200,
        "user20ft": 873600,
        "woonsong20ft": 933000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "남양읍",
        "distanceKm": 397,
        "witak40ft": 976900,
        "user40ft": 1018900,
        "woonsong40ft": 1089700,
        "witak20ft": 858900,
        "user20ft": 894400,
        "woonsong20ft": 953900
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "비봉면",
        "distanceKm": 392,
        "witak40ft": 968200,
        "user40ft": 1010200,
        "woonsong40ft": 1080900,
        "witak20ft": 852000,
        "user20ft": 887500,
        "woonsong20ft": 947000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "마도면",
        "distanceKm": 394,
        "witak40ft": 971600,
        "user40ft": 1013600,
        "woonsong40ft": 1084400,
        "witak20ft": 854800,
        "user20ft": 890200,
        "woonsong20ft": 949700
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "송산면",
        "distanceKm": 394,
        "witak40ft": 971600,
        "user40ft": 1013600,
        "woonsong40ft": 1084400,
        "witak20ft": 854800,
        "user20ft": 890200,
        "woonsong20ft": 949700
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "서신면",
        "distanceKm": 399,
        "witak40ft": 980400,
        "user40ft": 1022400,
        "woonsong40ft": 1093200,
        "witak20ft": 861800,
        "user20ft": 897200,
        "woonsong20ft": 956700
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "팔탄면",
        "distanceKm": 383,
        "witak40ft": 952200,
        "user40ft": 994200,
        "woonsong40ft": 1065000,
        "witak20ft": 839600,
        "user20ft": 875000,
        "woonsong20ft": 934500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "장안면",
        "distanceKm": 387,
        "witak40ft": 959300,
        "user40ft": 1001300,
        "woonsong40ft": 1072100,
        "witak20ft": 845200,
        "user20ft": 880600,
        "woonsong20ft": 940000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "양감면",
        "distanceKm": 371,
        "witak40ft": 931000,
        "user40ft": 972900,
        "woonsong40ft": 1043700,
        "witak20ft": 822600,
        "user20ft": 857900,
        "woonsong20ft": 917500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "정남면",
        "distanceKm": 378,
        "witak40ft": 943400,
        "user40ft": 985300,
        "woonsong40ft": 1056200,
        "witak20ft": 832600,
        "user20ft": 868000,
        "woonsong20ft": 927500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "진안동",
        "distanceKm": 371,
        "witak40ft": 931000,
        "user40ft": 972900,
        "woonsong40ft": 1043700,
        "witak20ft": 822600,
        "user20ft": 857900,
        "woonsong20ft": 917500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "병점1동",
        "distanceKm": 370,
        "witak40ft": 929200,
        "user40ft": 971000,
        "woonsong40ft": 1041800,
        "witak20ft": 821300,
        "user20ft": 856600,
        "woonsong20ft": 916000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "반월동",
        "distanceKm": 372,
        "witak40ft": 932800,
        "user40ft": 974700,
        "woonsong40ft": 1045500,
        "witak20ft": 824200,
        "user20ft": 859500,
        "woonsong20ft": 919000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "화산동",
        "distanceKm": 372,
        "witak40ft": 932800,
        "user40ft": 974700,
        "woonsong40ft": 1045500,
        "witak20ft": 824200,
        "user20ft": 859500,
        "woonsong20ft": 919000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄1동",
        "distanceKm": 370,
        "witak40ft": 929200,
        "user40ft": 971000,
        "woonsong40ft": 1041800,
        "witak20ft": 821300,
        "user20ft": 856600,
        "woonsong20ft": 916000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄5동",
        "distanceKm": 371,
        "witak40ft": 931000,
        "user40ft": 972900,
        "woonsong40ft": 1043700,
        "witak20ft": 822600,
        "user20ft": 857900,
        "woonsong20ft": 917500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄7동",
        "distanceKm": 364,
        "witak40ft": 918700,
        "user40ft": 960500,
        "woonsong40ft": 1031300,
        "witak20ft": 812800,
        "user20ft": 848100,
        "woonsong20ft": 907600
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄6동",
        "distanceKm": 363,
        "witak40ft": 916700,
        "user40ft": 958500,
        "woonsong40ft": 1029300,
        "witak20ft": 811400,
        "user20ft": 846600,
        "woonsong20ft": 906100
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄8동",
        "distanceKm": 363,
        "witak40ft": 916700,
        "user40ft": 958500,
        "woonsong40ft": 1029300,
        "witak20ft": 811400,
        "user20ft": 846600,
        "woonsong20ft": 906100
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "오포읍",
        "distanceKm": 368,
        "witak40ft": 925700,
        "user40ft": 967500,
        "woonsong40ft": 1038300,
        "witak20ft": 818600,
        "user20ft": 853900,
        "woonsong20ft": 913400
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "초월읍",
        "distanceKm": 360,
        "witak40ft": 911500,
        "user40ft": 953300,
        "woonsong40ft": 1024100,
        "witak20ft": 807100,
        "user20ft": 842300,
        "woonsong20ft": 901800
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "곤지암읍",
        "distanceKm": 357,
        "witak40ft": 906100,
        "user40ft": 947900,
        "woonsong40ft": 1018700,
        "witak20ft": 802900,
        "user20ft": 838200,
        "woonsong20ft": 897700
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "도척면",
        "distanceKm": 361,
        "witak40ft": 913200,
        "user40ft": 955000,
        "woonsong40ft": 1025800,
        "witak20ft": 808600,
        "user20ft": 843900,
        "woonsong20ft": 903500
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "퇴촌면",
        "distanceKm": 373,
        "witak40ft": 934600,
        "user40ft": 976500,
        "woonsong40ft": 1047300,
        "witak20ft": 825600,
        "user20ft": 860900,
        "woonsong20ft": 920400
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "남종면",
        "distanceKm": 377,
        "witak40ft": 941600,
        "user40ft": 983500,
        "woonsong40ft": 1054300,
        "witak20ft": 831200,
        "user20ft": 866600,
        "woonsong20ft": 926100
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "송정동",
        "distanceKm": 371,
        "witak40ft": 931000,
        "user40ft": 972900,
        "woonsong40ft": 1043700,
        "witak20ft": 822600,
        "user20ft": 857900,
        "woonsong20ft": 917500
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "광남동",
        "distanceKm": 366,
        "witak40ft": 922200,
        "user40ft": 964000,
        "woonsong40ft": 1034800,
        "witak20ft": 815600,
        "user20ft": 850900,
        "woonsong20ft": 910400
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "백석읍",
        "distanceKm": 419,
        "witak40ft": 1015200,
        "user40ft": 1057400,
        "woonsong40ft": 1128200,
        "witak20ft": 889200,
        "user20ft": 924800,
        "woonsong20ft": 984300
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "은현면",
        "distanceKm": 432,
        "witak40ft": 1037800,
        "user40ft": 1080000,
        "woonsong40ft": 1150800,
        "witak20ft": 906800,
        "user20ft": 942400,
        "woonsong20ft": 1001900
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "남면",
        "distanceKm": 438,
        "witak40ft": 1048200,
        "user40ft": 1090600,
        "woonsong40ft": 1161400,
        "witak20ft": 914900,
        "user20ft": 950700,
        "woonsong20ft": 1010100
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "광적면",
        "distanceKm": 422,
        "witak40ft": 1020400,
        "user40ft": 1062600,
        "woonsong40ft": 1133400,
        "witak20ft": 893300,
        "user20ft": 928900,
        "woonsong20ft": 988400
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "양주1동",
        "distanceKm": 412,
        "witak40ft": 1003100,
        "user40ft": 1045200,
        "woonsong40ft": 1116000,
        "witak20ft": 879600,
        "user20ft": 915100,
        "woonsong20ft": 974600
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "양주2동",
        "distanceKm": 420,
        "witak40ft": 1017000,
        "user40ft": 1059100,
        "woonsong40ft": 1129900,
        "witak20ft": 890600,
        "user20ft": 926200,
        "woonsong20ft": 985600
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천1동",
        "distanceKm": 427,
        "witak40ft": 1029100,
        "user40ft": 1071300,
        "woonsong40ft": 1142200,
        "witak20ft": 900000,
        "user20ft": 935600,
        "woonsong20ft": 995000
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천2동",
        "distanceKm": 423,
        "witak40ft": 1022200,
        "user40ft": 1064400,
        "woonsong40ft": 1135300,
        "witak20ft": 894700,
        "user20ft": 930300,
        "woonsong20ft": 989700
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천4동",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "소흘읍",
        "distanceKm": 422,
        "witak40ft": 1020400,
        "user40ft": 1062600,
        "woonsong40ft": 1133400,
        "witak20ft": 893300,
        "user20ft": 928900,
        "woonsong20ft": 988400
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "군내면",
        "distanceKm": 431,
        "witak40ft": 1036000,
        "user40ft": 1078300,
        "woonsong40ft": 1149100,
        "witak20ft": 905500,
        "user20ft": 941100,
        "woonsong20ft": 1000600
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "내촌면",
        "distanceKm": 414,
        "witak40ft": 1006600,
        "user40ft": 1048700,
        "woonsong40ft": 1119500,
        "witak20ft": 882300,
        "user20ft": 917800,
        "woonsong20ft": 977300
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "가산면",
        "distanceKm": 428,
        "witak40ft": 1031000,
        "user40ft": 1073200,
        "woonsong40ft": 1144000,
        "witak20ft": 901500,
        "user20ft": 937100,
        "woonsong20ft": 996600
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "신북면",
        "distanceKm": 435,
        "witak40ft": 1043000,
        "user40ft": 1085300,
        "woonsong40ft": 1156100,
        "witak20ft": 910900,
        "user20ft": 946500,
        "woonsong20ft": 1006000
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "영중면",
        "distanceKm": 444,
        "witak40ft": 1058600,
        "user40ft": 1101000,
        "woonsong40ft": 1171700,
        "witak20ft": 923100,
        "user20ft": 958900,
        "woonsong20ft": 1018200
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "일동면",
        "distanceKm": 447,
        "witak40ft": 1063700,
        "user40ft": 1106100,
        "woonsong40ft": 1176900,
        "witak20ft": 927200,
        "user20ft": 963000,
        "woonsong20ft": 1022400
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "이동면",
        "distanceKm": 456,
        "witak40ft": 1079200,
        "user40ft": 1121700,
        "woonsong40ft": 1192400,
        "witak20ft": 940700,
        "user20ft": 976500,
        "woonsong20ft": 1035900
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "영북면",
        "distanceKm": 454,
        "witak40ft": 1075800,
        "user40ft": 1118300,
        "woonsong40ft": 1189000,
        "witak20ft": 937800,
        "user20ft": 973600,
        "woonsong20ft": 1032900
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "관인면",
        "distanceKm": 464,
        "witak40ft": 1093000,
        "user40ft": 1135500,
        "woonsong40ft": 1206200,
        "witak20ft": 952600,
        "user20ft": 988500,
        "woonsong20ft": 1047900
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "화현면",
        "distanceKm": 431,
        "witak40ft": 1036000,
        "user40ft": 1078300,
        "woonsong40ft": 1149100,
        "witak20ft": 905500,
        "user20ft": 941100,
        "woonsong20ft": 1000600
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "포천동",
        "distanceKm": 431,
        "witak40ft": 1036000,
        "user40ft": 1078300,
        "woonsong40ft": 1149100,
        "witak20ft": 905500,
        "user20ft": 941100,
        "woonsong20ft": 1000600
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "선단동",
        "distanceKm": 424,
        "witak40ft": 1024000,
        "user40ft": 1066200,
        "woonsong40ft": 1137000,
        "witak20ft": 896000,
        "user20ft": 931600,
        "woonsong20ft": 991100
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "가남읍",
        "distanceKm": 326,
        "witak40ft": 850300,
        "user40ft": 889600,
        "woonsong40ft": 956200,
        "witak20ft": 758300,
        "user20ft": 791500,
        "woonsong20ft": 847400
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "점동면",
        "distanceKm": 335,
        "witak40ft": 866600,
        "user40ft": 906900,
        "woonsong40ft": 975100,
        "witak20ft": 771400,
        "user20ft": 805400,
        "woonsong20ft": 862700
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "능서면",
        "distanceKm": 333,
        "witak40ft": 863000,
        "user40ft": 903000,
        "woonsong40ft": 970900,
        "witak20ft": 768600,
        "user20ft": 802400,
        "woonsong20ft": 859400
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "흥천면",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "대신면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "강천면",
        "distanceKm": 340,
        "witak40ft": 875700,
        "user40ft": 916400,
        "woonsong40ft": 985500,
        "witak20ft": 778600,
        "user20ft": 813000,
        "woonsong20ft": 871100
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "여흥동",
        "distanceKm": 337,
        "witak40ft": 870200,
        "user40ft": 910600,
        "woonsong40ft": 979200,
        "witak20ft": 774300,
        "user20ft": 808400,
        "woonsong20ft": 866100
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "중앙동",
        "distanceKm": 336,
        "witak40ft": 868500,
        "user40ft": 908900,
        "woonsong40ft": 977300,
        "witak20ft": 772800,
        "user20ft": 806900,
        "woonsong20ft": 864400
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "전곡읍",
        "distanceKm": 448,
        "witak40ft": 1065500,
        "user40ft": 1107900,
        "woonsong40ft": 1178600,
        "witak20ft": 928700,
        "user20ft": 964500,
        "woonsong20ft": 1023900
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "청산면",
        "distanceKm": 442,
        "witak40ft": 1055200,
        "user40ft": 1097600,
        "woonsong40ft": 1168400,
        "witak20ft": 920400,
        "user20ft": 956200,
        "woonsong20ft": 1015600
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "백학면",
        "distanceKm": 456,
        "witak40ft": 1079200,
        "user40ft": 1121700,
        "woonsong40ft": 1192400,
        "witak20ft": 940700,
        "user20ft": 976500,
        "woonsong20ft": 1035900
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "장남면",
        "distanceKm": 453,
        "witak40ft": 1074100,
        "user40ft": 1116600,
        "woonsong40ft": 1187300,
        "witak20ft": 936200,
        "user20ft": 972000,
        "woonsong20ft": 1031400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "동면",
        "distanceKm": 415,
        "witak40ft": 1008300,
        "user40ft": 1050500,
        "woonsong40ft": 1121300,
        "witak20ft": 883700,
        "user20ft": 919300,
        "woonsong20ft": 978800
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "동산면",
        "distanceKm": 396,
        "witak40ft": 975200,
        "user40ft": 1017200,
        "woonsong40ft": 1087900,
        "witak20ft": 857500,
        "user20ft": 892900,
        "woonsong20ft": 952400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "남면",
        "distanceKm": 412,
        "witak40ft": 1003100,
        "user40ft": 1045200,
        "woonsong40ft": 1116000,
        "witak20ft": 879600,
        "user20ft": 915100,
        "woonsong20ft": 974600
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "남산면",
        "distanceKm": 416,
        "witak40ft": 1010100,
        "user40ft": 1052200,
        "woonsong40ft": 1123000,
        "witak20ft": 885000,
        "user20ft": 920500,
        "woonsong20ft": 980000
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "후평1동",
        "distanceKm": 412,
        "witak40ft": 1003100,
        "user40ft": 1045200,
        "woonsong40ft": 1116000,
        "witak20ft": 879600,
        "user20ft": 915100,
        "woonsong20ft": 974600
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "문막읍",
        "distanceKm": 348,
        "witak40ft": 890100,
        "user40ft": 931600,
        "woonsong40ft": 1002100,
        "witak20ft": 790100,
        "user20ft": 825200,
        "woonsong20ft": 884400
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "소초면",
        "distanceKm": 352,
        "witak40ft": 897200,
        "user40ft": 939000,
        "woonsong40ft": 1009800,
        "witak20ft": 795900,
        "user20ft": 831100,
        "woonsong20ft": 890600
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "지정면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "부론면",
        "distanceKm": 316,
        "witak40ft": 832000,
        "user40ft": 870300,
        "woonsong40ft": 935200,
        "witak20ft": 743700,
        "user20ft": 776100,
        "woonsong20ft": 830600
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "우산동",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "강원도",
        "gu": "원주시",
        "dong": "태장1동",
        "distanceKm": 339,
        "witak40ft": 873800,
        "user40ft": 914500,
        "woonsong40ft": 983400,
        "witak20ft": 777200,
        "user20ft": 811500,
        "woonsong20ft": 869400
      },
      {
        "city": "강원도",
        "gu": "강릉시",
        "dong": "옥계면",
        "distanceKm": 336,
        "witak40ft": 868500,
        "user40ft": 908900,
        "woonsong40ft": 977300,
        "witak20ft": 772800,
        "user20ft": 806900,
        "woonsong20ft": 864400
      },
      {
        "city": "강원도",
        "gu": "강릉시",
        "dong": "성덕동",
        "distanceKm": 362,
        "witak40ft": 915000,
        "user40ft": 956800,
        "woonsong40ft": 1027600,
        "witak20ft": 810100,
        "user20ft": 845300,
        "woonsong20ft": 904800
      },
      {
        "city": "강원도",
        "gu": "강릉시",
        "dong": "경포동",
        "distanceKm": 369,
        "witak40ft": 927500,
        "user40ft": 969300,
        "woonsong40ft": 1040100,
        "witak20ft": 819900,
        "user20ft": 855200,
        "woonsong20ft": 914600
      },
      {
        "city": "강원도",
        "gu": "동해시",
        "dong": "송정동",
        "distanceKm": 318,
        "witak40ft": 835800,
        "user40ft": 874300,
        "woonsong40ft": 939500,
        "witak20ft": 746700,
        "user20ft": 779200,
        "woonsong20ft": 834000
      },
      {
        "city": "강원도",
        "gu": "동해시",
        "dong": "북삼동",
        "distanceKm": 317,
        "witak40ft": 834000,
        "user40ft": 872400,
        "woonsong40ft": 937500,
        "witak20ft": 745300,
        "user20ft": 777700,
        "woonsong20ft": 832300
      },
      {
        "city": "강원도",
        "gu": "동해시",
        "dong": "북평동",
        "distanceKm": 315,
        "witak40ft": 830300,
        "user40ft": 868500,
        "woonsong40ft": 933200,
        "witak20ft": 742300,
        "user20ft": 774500,
        "woonsong20ft": 828800
      },
      {
        "city": "강원도",
        "gu": "고성군",
        "dong": "간성읍",
        "distanceKm": 531,
        "witak40ft": 1206500,
        "user40ft": 1249300,
        "woonsong40ft": 1319900,
        "witak20ft": 1051500,
        "user20ft": 1087700,
        "woonsong20ft": 1147000
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "주덕읍",
        "distanceKm": 288,
        "witak40ft": 778400,
        "user40ft": 813900,
        "woonsong40ft": 873800,
        "witak20ft": 700000,
        "user20ft": 729900,
        "woonsong20ft": 780300
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "앙성면",
        "distanceKm": 304,
        "witak40ft": 810100,
        "user40ft": 847300,
        "woonsong40ft": 910100,
        "witak20ft": 726100,
        "user20ft": 757400,
        "woonsong20ft": 810200
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "산척면",
        "distanceKm": 307,
        "witak40ft": 815700,
        "user40ft": 853100,
        "woonsong40ft": 916500,
        "witak20ft": 730600,
        "user20ft": 762100,
        "woonsong20ft": 815200
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "대소원면",
        "distanceKm": 286,
        "witak40ft": 774600,
        "user40ft": 809900,
        "woonsong40ft": 869500,
        "witak20ft": 697000,
        "user20ft": 726700,
        "woonsong20ft": 776700
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "중앙탑면",
        "distanceKm": 298,
        "witak40ft": 797000,
        "user40ft": 833500,
        "woonsong40ft": 895100,
        "witak20ft": 715000,
        "user20ft": 745800,
        "woonsong20ft": 797700
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "달천동",
        "distanceKm": 292,
        "witak40ft": 785900,
        "user40ft": 821800,
        "woonsong40ft": 882400,
        "witak20ft": 706000,
        "user20ft": 736300,
        "woonsong20ft": 787300
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "칠금금릉동",
        "distanceKm": 293,
        "witak40ft": 787700,
        "user40ft": 823700,
        "woonsong40ft": 884500,
        "witak20ft": 707500,
        "user20ft": 737900,
        "woonsong20ft": 789000
      },
      {
        "city": "충청북도",
        "gu": "충주시",
        "dong": "목행용탄동",
        "distanceKm": 296,
        "witak40ft": 793200,
        "user40ft": 829500,
        "woonsong40ft": 890800,
        "witak20ft": 712000,
        "user20ft": 742600,
        "woonsong20ft": 794200
      },
      {
        "city": "충청북도",
        "gu": "청주시 상당구",
        "dong": "가덕면",
        "distanceKm": 273,
        "witak40ft": 752300,
        "user40ft": 786300,
        "woonsong40ft": 843700,
        "witak20ft": 677300,
        "user20ft": 706000,
        "woonsong20ft": 754200
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "오송읍",
        "distanceKm": 291,
        "witak40ft": 784000,
        "user40ft": 819800,
        "woonsong40ft": 880200,
        "witak20ft": 704600,
        "user20ft": 734800,
        "woonsong20ft": 785700
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "강내면",
        "distanceKm": 288,
        "witak40ft": 778400,
        "user40ft": 813900,
        "woonsong40ft": 873800,
        "witak20ft": 700000,
        "user20ft": 729900,
        "woonsong20ft": 780300
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "옥산면",
        "distanceKm": 290,
        "witak40ft": 782100,
        "user40ft": 817800,
        "woonsong40ft": 878200,
        "witak20ft": 703100,
        "user20ft": 733300,
        "woonsong20ft": 784000
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "복대1동",
        "distanceKm": 290,
        "witak40ft": 782100,
        "user40ft": 817800,
        "woonsong40ft": 878200,
        "witak20ft": 703100,
        "user20ft": 733300,
        "woonsong20ft": 784000
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "봉명1동",
        "distanceKm": 292,
        "witak40ft": 785900,
        "user40ft": 821800,
        "woonsong40ft": 882400,
        "witak20ft": 706000,
        "user20ft": 736300,
        "woonsong20ft": 787300
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "봉명2송정동",
        "distanceKm": 291,
        "witak40ft": 784000,
        "user40ft": 819800,
        "woonsong40ft": 880200,
        "witak20ft": 704600,
        "user20ft": 734800,
        "woonsong20ft": 785700
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "강서1동",
        "distanceKm": 291,
        "witak40ft": 784000,
        "user40ft": 819800,
        "woonsong40ft": 880200,
        "witak20ft": 704600,
        "user20ft": 734800,
        "woonsong20ft": 785700
      },
      {
        "city": "충청북도",
        "gu": "청주시 흥덕구",
        "dong": "강서2동",
        "distanceKm": 292,
        "witak40ft": 785900,
        "user40ft": 821800,
        "woonsong40ft": 882400,
        "witak20ft": 706000,
        "user20ft": 736300,
        "woonsong20ft": 787300
      },
      {
        "city": "충청북도",
        "gu": "청주시 청원구",
        "dong": "내수읍",
        "distanceKm": 307,
        "witak40ft": 815700,
        "user40ft": 853100,
        "woonsong40ft": 916500,
        "witak20ft": 730600,
        "user20ft": 762100,
        "woonsong20ft": 815200
      },
      {
        "city": "충청북도",
        "gu": "청주시 청원구",
        "dong": "오창읍",
        "distanceKm": 303,
        "witak40ft": 808300,
        "user40ft": 845300,
        "woonsong40ft": 908000,
        "witak20ft": 724600,
        "user20ft": 755800,
        "woonsong20ft": 808400
      },
      {
        "city": "충청북도",
        "gu": "청주시 청원구",
        "dong": "북이면",
        "distanceKm": 308,
        "witak40ft": 817400,
        "user40ft": 855000,
        "woonsong40ft": 918500,
        "witak20ft": 732000,
        "user20ft": 763700,
        "woonsong20ft": 817000
      },
      {
        "city": "충청북도",
        "gu": "보은군",
        "dong": "보은읍",
        "distanceKm": 254,
        "witak40ft": 714500,
        "user40ft": 746500,
        "woonsong40ft": 800600,
        "witak20ft": 627700,
        "user20ft": 654700,
        "woonsong20ft": 700100
      },
      {
        "city": "충청북도",
        "gu": "보은군",
        "dong": "장안면",
        "distanceKm": 243,
        "witak40ft": 693400,
        "user40ft": 724200,
        "woonsong40ft": 776300,
        "witak20ft": 604600,
        "user20ft": 630600,
        "woonsong20ft": 674300
      },
      {
        "city": "충청북도",
        "gu": "보은군",
        "dong": "마로면",
        "distanceKm": 246,
        "witak40ft": 699200,
        "user40ft": 730300,
        "woonsong40ft": 782900,
        "witak20ft": 609600,
        "user20ft": 635800,
        "woonsong20ft": 680000
      },
      {
        "city": "충청북도",
        "gu": "보은군",
        "dong": "삼승면",
        "distanceKm": 245,
        "witak40ft": 697200,
        "user40ft": 728200,
        "woonsong40ft": 780600,
        "witak20ft": 607900,
        "user20ft": 634100,
        "woonsong20ft": 678100
      },
      {
        "city": "충청북도",
        "gu": "보은군",
        "dong": "내북면",
        "distanceKm": 263,
        "witak40ft": 731400,
        "user40ft": 764300,
        "woonsong40ft": 820000,
        "witak20ft": 641600,
        "user20ft": 669300,
        "woonsong20ft": 716000
      },
      {
        "city": "충청북도",
        "gu": "옥천군",
        "dong": "옥천읍",
        "distanceKm": 251,
        "witak40ft": 708700,
        "user40ft": 740400,
        "woonsong40ft": 793900,
        "witak20ft": 623000,
        "user20ft": 649700,
        "woonsong20ft": 694700
      },
      {
        "city": "충청북도",
        "gu": "옥천군",
        "dong": "청산면",
        "distanceKm": 232,
        "witak40ft": 672100,
        "user40ft": 701900,
        "woonsong40ft": 752100,
        "witak20ft": 586000,
        "user20ft": 611100,
        "woonsong20ft": 653300
      },
      {
        "city": "충청북도",
        "gu": "영동군",
        "dong": "영동읍",
        "distanceKm": 227,
        "witak40ft": 662400,
        "user40ft": 691600,
        "woonsong40ft": 740900,
        "witak20ft": 577600,
        "user20ft": 602200,
        "woonsong20ft": 643500
      },
      {
        "city": "충청북도",
        "gu": "영동군",
        "dong": "용산면",
        "distanceKm": 223,
        "witak40ft": 654600,
        "user40ft": 683400,
        "woonsong40ft": 732100,
        "witak20ft": 570800,
        "user20ft": 595100,
        "woonsong20ft": 635900
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "진천읍",
        "distanceKm": 319,
        "witak40ft": 837600,
        "user40ft": 876200,
        "woonsong40ft": 941600,
        "witak20ft": 748200,
        "user20ft": 780800,
        "woonsong20ft": 835700
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "덕산읍",
        "distanceKm": 324,
        "witak40ft": 846600,
        "user40ft": 885700,
        "woonsong40ft": 952000,
        "witak20ft": 755400,
        "user20ft": 788400,
        "woonsong20ft": 844100
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "초평면",
        "distanceKm": 316,
        "witak40ft": 832000,
        "user40ft": 870300,
        "woonsong40ft": 935200,
        "witak20ft": 743700,
        "user20ft": 776100,
        "woonsong20ft": 830600
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "문백면",
        "distanceKm": 308,
        "witak40ft": 817400,
        "user40ft": 855000,
        "woonsong40ft": 918500,
        "witak20ft": 732000,
        "user20ft": 763700,
        "woonsong20ft": 817000
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "이월면",
        "distanceKm": 331,
        "witak40ft": 859400,
        "user40ft": 899200,
        "woonsong40ft": 966700,
        "witak20ft": 765600,
        "user20ft": 799200,
        "woonsong20ft": 855900
      },
      {
        "city": "충청북도",
        "gu": "진천군",
        "dong": "광혜원면",
        "distanceKm": 331,
        "witak40ft": 859400,
        "user40ft": 899200,
        "woonsong40ft": 966700,
        "witak20ft": 765600,
        "user20ft": 799200,
        "woonsong20ft": 855900
      },
      {
        "city": "충청북도",
        "gu": "괴산군",
        "dong": "괴산읍",
        "distanceKm": 274,
        "witak40ft": 754000,
        "user40ft": 788100,
        "woonsong40ft": 845600,
        "witak20ft": 678800,
        "user20ft": 707600,
        "woonsong20ft": 755900
      },
      {
        "city": "충청북도",
        "gu": "괴산군",
        "dong": "칠성면",
        "distanceKm": 266,
        "witak40ft": 737200,
        "user40ft": 770400,
        "woonsong40ft": 826600,
        "witak20ft": 646200,
        "user20ft": 674200,
        "woonsong20ft": 721300
      },
      {
        "city": "충청북도",
        "gu": "괴산군",
        "dong": "청안면",
        "distanceKm": 293,
        "witak40ft": 787700,
        "user40ft": 823700,
        "woonsong40ft": 884500,
        "witak20ft": 707500,
        "user20ft": 737900,
        "woonsong20ft": 789000
      },
      {
        "city": "충청북도",
        "gu": "괴산군",
        "dong": "사리면",
        "distanceKm": 289,
        "witak40ft": 780200,
        "user40ft": 815800,
        "woonsong40ft": 875900,
        "witak20ft": 701500,
        "user20ft": 731600,
        "woonsong20ft": 782200
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "음성읍",
        "distanceKm": 301,
        "witak40ft": 804700,
        "user40ft": 841500,
        "woonsong40ft": 903800,
        "witak20ft": 721600,
        "user20ft": 752700,
        "woonsong20ft": 805000
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "금왕읍",
        "distanceKm": 314,
        "witak40ft": 828500,
        "user40ft": 866600,
        "woonsong40ft": 931200,
        "witak20ft": 740800,
        "user20ft": 772900,
        "woonsong20ft": 827100
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "소이면",
        "distanceKm": 296,
        "witak40ft": 793200,
        "user40ft": 829500,
        "woonsong40ft": 890800,
        "witak20ft": 712000,
        "user20ft": 742600,
        "woonsong20ft": 794200
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "원남면",
        "distanceKm": 303,
        "witak40ft": 808300,
        "user40ft": 845300,
        "woonsong40ft": 908000,
        "witak20ft": 724600,
        "user20ft": 755800,
        "woonsong20ft": 808400
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "맹동면",
        "distanceKm": 320,
        "witak40ft": 839300,
        "user40ft": 878000,
        "woonsong40ft": 943600,
        "witak20ft": 749700,
        "user20ft": 782400,
        "woonsong20ft": 837500
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "대소면",
        "distanceKm": 330,
        "witak40ft": 857600,
        "user40ft": 897300,
        "woonsong40ft": 964700,
        "witak20ft": 764100,
        "user20ft": 797600,
        "woonsong20ft": 854200
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "삼성면",
        "distanceKm": 333,
        "witak40ft": 863000,
        "user40ft": 903000,
        "woonsong40ft": 970900,
        "witak20ft": 768600,
        "user20ft": 802400,
        "woonsong20ft": 859400
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "생극면",
        "distanceKm": 316,
        "witak40ft": 832000,
        "user40ft": 870300,
        "woonsong40ft": 935200,
        "witak20ft": 743700,
        "user20ft": 776100,
        "woonsong20ft": 830600
      },
      {
        "city": "충청북도",
        "gu": "음성군",
        "dong": "감곡면",
        "distanceKm": 312,
        "witak40ft": 824700,
        "user40ft": 862600,
        "woonsong40ft": 926800,
        "witak20ft": 737900,
        "user20ft": 769900,
        "woonsong20ft": 823800
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "풍세면",
        "distanceKm": 325,
        "witak40ft": 848600,
        "user40ft": 887800,
        "woonsong40ft": 954200,
        "witak20ft": 756900,
        "user20ft": 790000,
        "woonsong20ft": 845800
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "광덕면",
        "distanceKm": 328,
        "witak40ft": 853900,
        "user40ft": 893400,
        "woonsong40ft": 960400,
        "witak20ft": 761300,
        "user20ft": 794600,
        "woonsong20ft": 850900
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "성남면",
        "distanceKm": 317,
        "witak40ft": 834000,
        "user40ft": 872400,
        "woonsong40ft": 937500,
        "witak20ft": 745300,
        "user20ft": 777700,
        "woonsong20ft": 832300
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "병천면",
        "distanceKm": 318,
        "witak40ft": 835800,
        "user40ft": 874300,
        "woonsong40ft": 939500,
        "witak20ft": 746700,
        "user20ft": 779200,
        "woonsong20ft": 834000
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "동면",
        "distanceKm": 324,
        "witak40ft": 846600,
        "user40ft": 885700,
        "woonsong40ft": 952000,
        "witak20ft": 755400,
        "user20ft": 788400,
        "woonsong20ft": 844100
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "봉명동",
        "distanceKm": 325,
        "witak40ft": 848600,
        "user40ft": 887800,
        "woonsong40ft": 954200,
        "witak20ft": 756900,
        "user20ft": 790000,
        "woonsong20ft": 845800
      },
      {
        "city": "충청남도",
        "gu": "천안시 동남구",
        "dong": "청룡동",
        "distanceKm": 321,
        "witak40ft": 841300,
        "user40ft": 880100,
        "woonsong40ft": 945800,
        "witak20ft": 751000,
        "user20ft": 783800,
        "woonsong20ft": 839000
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "성거읍",
        "distanceKm": 328,
        "witak40ft": 853900,
        "user40ft": 893400,
        "woonsong40ft": 960400,
        "witak20ft": 761300,
        "user20ft": 794600,
        "woonsong20ft": 850900
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "직산읍",
        "distanceKm": 328,
        "witak40ft": 853900,
        "user40ft": 893400,
        "woonsong40ft": 960400,
        "witak20ft": 761300,
        "user20ft": 794600,
        "woonsong20ft": 850900
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "입장면",
        "distanceKm": 335,
        "witak40ft": 866600,
        "user40ft": 906900,
        "woonsong40ft": 975100,
        "witak20ft": 771400,
        "user20ft": 805400,
        "woonsong20ft": 862700
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "백석동",
        "distanceKm": 326,
        "witak40ft": 850300,
        "user40ft": 889600,
        "woonsong40ft": 956200,
        "witak20ft": 758300,
        "user20ft": 791500,
        "woonsong20ft": 847400
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "부성1동",
        "distanceKm": 324,
        "witak40ft": 846600,
        "user40ft": 885700,
        "woonsong40ft": 952000,
        "witak20ft": 755400,
        "user20ft": 788400,
        "woonsong20ft": 844100
      },
      {
        "city": "충청남도",
        "gu": "천안시 서북구",
        "dong": "부성2동",
        "distanceKm": 325,
        "witak40ft": 848600,
        "user40ft": 887800,
        "woonsong40ft": 954200,
        "witak20ft": 756900,
        "user20ft": 790000,
        "woonsong20ft": 845800
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "유구읍",
        "distanceKm": 322,
        "witak40ft": 843100,
        "user40ft": 882000,
        "woonsong40ft": 947900,
        "witak20ft": 752500,
        "user20ft": 785300,
        "woonsong20ft": 840700
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "탄천면",
        "distanceKm": 313,
        "witak40ft": 826700,
        "user40ft": 864700,
        "woonsong40ft": 929000,
        "witak20ft": 739400,
        "user20ft": 771500,
        "woonsong20ft": 825500
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "계룡면",
        "distanceKm": 311,
        "witak40ft": 823000,
        "user40ft": 860800,
        "woonsong40ft": 924900,
        "witak20ft": 736400,
        "user20ft": 768300,
        "woonsong20ft": 822100
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "의당면",
        "distanceKm": 300,
        "witak40ft": 802800,
        "user40ft": 839600,
        "woonsong40ft": 901700,
        "witak20ft": 720100,
        "user20ft": 751100,
        "woonsong20ft": 803200
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "정안면",
        "distanceKm": 319,
        "witak40ft": 837600,
        "user40ft": 876200,
        "woonsong40ft": 941600,
        "witak20ft": 748200,
        "user20ft": 780800,
        "woonsong20ft": 835700
      },
      {
        "city": "충청남도",
        "gu": "공주시",
        "dong": "금학동",
        "distanceKm": 304,
        "witak40ft": 810100,
        "user40ft": 847300,
        "woonsong40ft": 910100,
        "witak20ft": 726100,
        "user20ft": 757400,
        "woonsong20ft": 810200
      },
      {
        "city": "충청남도",
        "gu": "보령시",
        "dong": "웅천읍",
        "distanceKm": 343,
        "witak40ft": 881000,
        "user40ft": 922100,
        "woonsong40ft": 991700,
        "witak20ft": 783000,
        "user20ft": 817600,
        "woonsong20ft": 876100
      },
      {
        "city": "충청남도",
        "gu": "보령시",
        "dong": "주교면",
        "distanceKm": 362,
        "witak40ft": 915000,
        "user40ft": 956800,
        "woonsong40ft": 1027600,
        "witak20ft": 810100,
        "user20ft": 845300,
        "woonsong20ft": 904800
      },
      {
        "city": "충청남도",
        "gu": "보령시",
        "dong": "오천면",
        "distanceKm": 374,
        "witak40ft": 936300,
        "user40ft": 978200,
        "woonsong40ft": 1049000,
        "witak20ft": 826900,
        "user20ft": 862300,
        "woonsong20ft": 921800
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "염치읍",
        "distanceKm": 342,
        "witak40ft": 879200,
        "user40ft": 920100,
        "woonsong40ft": 989600,
        "witak20ft": 781500,
        "user20ft": 816000,
        "woonsong20ft": 874400
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "송악면",
        "distanceKm": 340,
        "witak40ft": 875700,
        "user40ft": 916400,
        "woonsong40ft": 985500,
        "witak20ft": 778600,
        "user20ft": 813000,
        "woonsong20ft": 871100
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "탕정면",
        "distanceKm": 335,
        "witak40ft": 866600,
        "user40ft": 906900,
        "woonsong40ft": 975100,
        "witak20ft": 771400,
        "user20ft": 805400,
        "woonsong20ft": 862700
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "음봉면",
        "distanceKm": 344,
        "witak40ft": 882800,
        "user40ft": 923900,
        "woonsong40ft": 993700,
        "witak20ft": 784400,
        "user20ft": 819100,
        "woonsong20ft": 877800
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "둔포면",
        "distanceKm": 350,
        "witak40ft": 893600,
        "user40ft": 935400,
        "woonsong40ft": 1006200,
        "witak20ft": 792900,
        "user20ft": 828100,
        "woonsong20ft": 887700
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "영인면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "인주면",
        "distanceKm": 362,
        "witak40ft": 915000,
        "user40ft": 956800,
        "woonsong40ft": 1027600,
        "witak20ft": 810100,
        "user20ft": 845300,
        "woonsong20ft": 904800
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "선장면",
        "distanceKm": 352,
        "witak40ft": 897200,
        "user40ft": 939000,
        "woonsong40ft": 1009800,
        "witak20ft": 795900,
        "user20ft": 831100,
        "woonsong20ft": 890600
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "도고면",
        "distanceKm": 354,
        "witak40ft": 900800,
        "user40ft": 942600,
        "woonsong40ft": 1013400,
        "witak20ft": 798600,
        "user20ft": 833900,
        "woonsong20ft": 893400
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "신창면",
        "distanceKm": 344,
        "witak40ft": 882800,
        "user40ft": 923900,
        "woonsong40ft": 993700,
        "witak20ft": 784400,
        "user20ft": 819100,
        "woonsong20ft": 877800
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "온양3동",
        "distanceKm": 337,
        "witak40ft": 870200,
        "user40ft": 910600,
        "woonsong40ft": 979200,
        "witak20ft": 774300,
        "user20ft": 808400,
        "woonsong20ft": 866100
      },
      {
        "city": "충청남도",
        "gu": "아산시",
        "dong": "온양4동",
        "distanceKm": 341,
        "witak40ft": 877500,
        "user40ft": 918300,
        "woonsong40ft": 987600,
        "witak20ft": 780000,
        "user20ft": 814500,
        "woonsong20ft": 872700
      },
      {
        "city": "충청남도",
        "gu": "서산시",
        "dong": "대산읍",
        "distanceKm": 398,
        "witak40ft": 978600,
        "user40ft": 1020600,
        "woonsong40ft": 1091400,
        "witak20ft": 860400,
        "user20ft": 895800,
        "woonsong20ft": 955200
      },
      {
        "city": "충청남도",
        "gu": "서산시",
        "dong": "지곡면",
        "distanceKm": 394,
        "witak40ft": 971600,
        "user40ft": 1013600,
        "woonsong40ft": 1084400,
        "witak20ft": 854800,
        "user20ft": 890200,
        "woonsong20ft": 949700
      },
      {
        "city": "충청남도",
        "gu": "서산시",
        "dong": "성연면",
        "distanceKm": 387,
        "witak40ft": 959300,
        "user40ft": 1001300,
        "woonsong40ft": 1072100,
        "witak20ft": 845200,
        "user20ft": 880600,
        "woonsong20ft": 940000
      },
      {
        "city": "충청남도",
        "gu": "서산시",
        "dong": "석남동",
        "distanceKm": 388,
        "witak40ft": 961100,
        "user40ft": 1003000,
        "woonsong40ft": 1073800,
        "witak20ft": 846500,
        "user20ft": 881900,
        "woonsong20ft": 941300
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "연무읍",
        "distanceKm": 291,
        "witak40ft": 784000,
        "user40ft": 819800,
        "woonsong40ft": 880200,
        "witak20ft": 704600,
        "user20ft": 734800,
        "woonsong20ft": 785700
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "성동면",
        "distanceKm": 303,
        "witak40ft": 808300,
        "user40ft": 845300,
        "woonsong40ft": 908000,
        "witak20ft": 724600,
        "user20ft": 755800,
        "woonsong20ft": 808400
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "광석면",
        "distanceKm": 303,
        "witak40ft": 808300,
        "user40ft": 845300,
        "woonsong40ft": 908000,
        "witak20ft": 724600,
        "user20ft": 755800,
        "woonsong20ft": 808400
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "부적면",
        "distanceKm": 302,
        "witak40ft": 806500,
        "user40ft": 843400,
        "woonsong40ft": 905900,
        "witak20ft": 723100,
        "user20ft": 754300,
        "woonsong20ft": 806800
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "가야곡면",
        "distanceKm": 290,
        "witak40ft": 782100,
        "user40ft": 817800,
        "woonsong40ft": 878200,
        "witak20ft": 703100,
        "user20ft": 733300,
        "woonsong20ft": 784000
      },
      {
        "city": "충청남도",
        "gu": "논산시",
        "dong": "취암동",
        "distanceKm": 299,
        "witak40ft": 798800,
        "user40ft": 835400,
        "woonsong40ft": 897300,
        "witak20ft": 716600,
        "user20ft": 747500,
        "woonsong20ft": 799500
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "합덕읍",
        "distanceKm": 364,
        "witak40ft": 918700,
        "user40ft": 960500,
        "woonsong40ft": 1031300,
        "witak20ft": 812800,
        "user20ft": 848100,
        "woonsong20ft": 907600
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "송악읍",
        "distanceKm": 379,
        "witak40ft": 945100,
        "user40ft": 987000,
        "woonsong40ft": 1057900,
        "witak20ft": 833900,
        "user20ft": 869200,
        "woonsong20ft": 928700
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "고대면",
        "distanceKm": 389,
        "witak40ft": 962900,
        "user40ft": 1004900,
        "woonsong40ft": 1075700,
        "witak20ft": 847900,
        "user20ft": 883300,
        "woonsong20ft": 942900
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "석문면",
        "distanceKm": 396,
        "witak40ft": 975200,
        "user40ft": 1017200,
        "woonsong40ft": 1087900,
        "witak20ft": 857500,
        "user20ft": 892900,
        "woonsong20ft": 952400
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "순성면",
        "distanceKm": 371,
        "witak40ft": 931000,
        "user40ft": 972900,
        "woonsong40ft": 1043700,
        "witak20ft": 822600,
        "user20ft": 857900,
        "woonsong20ft": 917500
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "신평면",
        "distanceKm": 382,
        "witak40ft": 950400,
        "user40ft": 992400,
        "woonsong40ft": 1063200,
        "witak20ft": 838200,
        "user20ft": 873600,
        "woonsong20ft": 933000
      },
      {
        "city": "충청남도",
        "gu": "당진시",
        "dong": "송산면",
        "distanceKm": 382,
        "witak40ft": 950400,
        "user40ft": 992400,
        "woonsong40ft": 1063200,
        "witak20ft": 838200,
        "user20ft": 873600,
        "woonsong20ft": 933000
      },
      {
        "city": "충청남도",
        "gu": "금산군",
        "dong": "제원면",
        "distanceKm": 256,
        "witak40ft": 718300,
        "user40ft": 750500,
        "woonsong40ft": 804900,
        "witak20ft": 630600,
        "user20ft": 657700,
        "woonsong20ft": 703400
      },
      {
        "city": "충청남도",
        "gu": "금산군",
        "dong": "추부면",
        "distanceKm": 266,
        "witak40ft": 737200,
        "user40ft": 770400,
        "woonsong40ft": 826600,
        "witak20ft": 646200,
        "user20ft": 674200,
        "woonsong20ft": 721300
      },
      {
        "city": "충청남도",
        "gu": "부여군",
        "dong": "규암면",
        "distanceKm": 319,
        "witak40ft": 837600,
        "user40ft": 876200,
        "woonsong40ft": 941600,
        "witak20ft": 748200,
        "user20ft": 780800,
        "woonsong20ft": 835700
      },
      {
        "city": "충청남도",
        "gu": "부여군",
        "dong": "남면",
        "distanceKm": 330,
        "witak40ft": 857600,
        "user40ft": 897300,
        "woonsong40ft": 964700,
        "witak20ft": 764100,
        "user20ft": 797600,
        "woonsong20ft": 854200
      },
      {
        "city": "충청남도",
        "gu": "부여군",
        "dong": "초촌면",
        "distanceKm": 308,
        "witak40ft": 817400,
        "user40ft": 855000,
        "woonsong40ft": 918500,
        "witak20ft": 732000,
        "user20ft": 763700,
        "woonsong20ft": 817000
      },
      {
        "city": "충청남도",
        "gu": "서천군",
        "dong": "장항읍",
        "distanceKm": 314,
        "witak40ft": 828500,
        "user40ft": 866600,
        "woonsong40ft": 931200,
        "witak20ft": 740800,
        "user20ft": 772900,
        "woonsong20ft": 827100
      },
      {
        "city": "충청남도",
        "gu": "서천군",
        "dong": "마서면",
        "distanceKm": 316,
        "witak40ft": 832000,
        "user40ft": 870300,
        "woonsong40ft": 935200,
        "witak20ft": 743700,
        "user20ft": 776100,
        "woonsong20ft": 830600
      },
      {
        "city": "충청남도",
        "gu": "청양군",
        "dong": "정산면",
        "distanceKm": 329,
        "witak40ft": 855700,
        "user40ft": 895300,
        "woonsong40ft": 962400,
        "witak20ft": 762700,
        "user20ft": 796100,
        "woonsong20ft": 852500
      },
      {
        "city": "충청남도",
        "gu": "홍성군",
        "dong": "홍성읍",
        "distanceKm": 357,
        "witak40ft": 906100,
        "user40ft": 947900,
        "woonsong40ft": 1018700,
        "witak20ft": 802900,
        "user20ft": 838200,
        "woonsong20ft": 897700
      },
      {
        "city": "충청남도",
        "gu": "홍성군",
        "dong": "금마면",
        "distanceKm": 351,
        "witak40ft": 895300,
        "user40ft": 937100,
        "woonsong40ft": 1007900,
        "witak20ft": 794300,
        "user20ft": 829500,
        "woonsong20ft": 889000
      },
      {
        "city": "충청남도",
        "gu": "홍성군",
        "dong": "갈산면",
        "distanceKm": 380,
        "witak40ft": 946900,
        "user40ft": 988800,
        "woonsong40ft": 1059600,
        "witak20ft": 835300,
        "user20ft": 870700,
        "woonsong20ft": 930300
      },
      {
        "city": "충청남도",
        "gu": "홍성군",
        "dong": "구항면",
        "distanceKm": 365,
        "witak40ft": 920400,
        "user40ft": 962200,
        "woonsong40ft": 1033000,
        "witak20ft": 814300,
        "user20ft": 849600,
        "woonsong20ft": 909100
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "예산읍",
        "distanceKm": 349,
        "witak40ft": 891800,
        "user40ft": 933500,
        "woonsong40ft": 1004200,
        "witak20ft": 791500,
        "user20ft": 826600,
        "woonsong20ft": 886000
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "삽교읍",
        "distanceKm": 349,
        "witak40ft": 891800,
        "user40ft": 933500,
        "woonsong40ft": 1004200,
        "witak20ft": 791500,
        "user20ft": 826600,
        "woonsong20ft": 886000
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "광시면",
        "distanceKm": 345,
        "witak40ft": 884600,
        "user40ft": 925800,
        "woonsong40ft": 995800,
        "witak20ft": 785700,
        "user20ft": 820500,
        "woonsong20ft": 879300
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "고덕면",
        "distanceKm": 356,
        "witak40ft": 904400,
        "user40ft": 946200,
        "woonsong40ft": 1017000,
        "witak20ft": 801500,
        "user20ft": 836800,
        "woonsong20ft": 896300
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "신암면",
        "distanceKm": 353,
        "witak40ft": 898900,
        "user40ft": 940700,
        "woonsong40ft": 1011500,
        "witak20ft": 797200,
        "user20ft": 832400,
        "woonsong20ft": 891900
      },
      {
        "city": "충청남도",
        "gu": "예산군",
        "dong": "오가면",
        "distanceKm": 346,
        "witak40ft": 886400,
        "user40ft": 927800,
        "woonsong40ft": 998000,
        "witak20ft": 787200,
        "user20ft": 822100,
        "woonsong20ft": 881100
      },
      {
        "city": "충청남도",
        "gu": "태안군",
        "dong": "원북면",
        "distanceKm": 418,
        "witak40ft": 1013600,
        "user40ft": 1055700,
        "woonsong40ft": 1126500,
        "witak20ft": 887900,
        "user20ft": 923400,
        "woonsong20ft": 982900
      },
      {
        "city": "전라북도",
        "gu": "전주시 덕진구",
        "dong": "팔복동",
        "distanceKm": 264,
        "witak40ft": 733500,
        "user40ft": 766500,
        "woonsong40ft": 822300,
        "witak20ft": 643100,
        "user20ft": 670900,
        "woonsong20ft": 717700
      },
      {
        "city": "전라북도",
        "gu": "전주시 덕진구",
        "dong": "여의동",
        "distanceKm": 272,
        "witak40ft": 750600,
        "user40ft": 784500,
        "woonsong40ft": 841700,
        "witak20ft": 675800,
        "user20ft": 704400,
        "woonsong20ft": 752400
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "임피면",
        "distanceKm": 302,
        "witak40ft": 806500,
        "user40ft": 843400,
        "woonsong40ft": 905900,
        "witak20ft": 723100,
        "user20ft": 754300,
        "woonsong20ft": 806800
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "서수면",
        "distanceKm": 299,
        "witak40ft": 798800,
        "user40ft": 835400,
        "woonsong40ft": 897300,
        "witak20ft": 716600,
        "user20ft": 747500,
        "woonsong20ft": 799500
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "성산면",
        "distanceKm": 306,
        "witak40ft": 813900,
        "user40ft": 851200,
        "woonsong40ft": 914400,
        "witak20ft": 729000,
        "user20ft": 760500,
        "woonsong20ft": 813500
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "월명동",
        "distanceKm": 309,
        "witak40ft": 819400,
        "user40ft": 857000,
        "woonsong40ft": 920700,
        "witak20ft": 733500,
        "user20ft": 765300,
        "woonsong20ft": 818800
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "조촌동",
        "distanceKm": 306,
        "witak40ft": 813900,
        "user40ft": 851200,
        "woonsong40ft": 914400,
        "witak20ft": 729000,
        "user20ft": 760500,
        "woonsong20ft": 813500
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "소룡동",
        "distanceKm": 310,
        "witak40ft": 821200,
        "user40ft": 858900,
        "woonsong40ft": 922800,
        "witak20ft": 734900,
        "user20ft": 766700,
        "woonsong20ft": 820400
      },
      {
        "city": "전라북도",
        "gu": "군산시",
        "dong": "미성동",
        "distanceKm": 312,
        "witak40ft": 824700,
        "user40ft": 862600,
        "woonsong40ft": 926800,
        "witak20ft": 737900,
        "user20ft": 769900,
        "woonsong20ft": 823800
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "함열읍",
        "distanceKm": 291,
        "witak40ft": 784000,
        "user40ft": 819800,
        "woonsong40ft": 880200,
        "witak20ft": 704600,
        "user20ft": 734800,
        "woonsong20ft": 785700
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "왕궁면",
        "distanceKm": 276,
        "witak40ft": 757400,
        "user40ft": 791700,
        "woonsong40ft": 849500,
        "witak20ft": 682000,
        "user20ft": 710900,
        "woonsong20ft": 759500
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "춘포면",
        "distanceKm": 277,
        "witak40ft": 759000,
        "user40ft": 793400,
        "woonsong40ft": 851500,
        "witak20ft": 683400,
        "user20ft": 712400,
        "woonsong20ft": 761100
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "삼기면",
        "distanceKm": 286,
        "witak40ft": 774600,
        "user40ft": 809900,
        "woonsong40ft": 869500,
        "witak20ft": 697000,
        "user20ft": 726700,
        "woonsong20ft": 776700
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "영등1동",
        "distanceKm": 286,
        "witak40ft": 774600,
        "user40ft": 809900,
        "woonsong40ft": 869500,
        "witak20ft": 697000,
        "user20ft": 726700,
        "woonsong20ft": 776700
      },
      {
        "city": "전라북도",
        "gu": "익산시",
        "dong": "팔봉동",
        "distanceKm": 282,
        "witak40ft": 767400,
        "user40ft": 802300,
        "woonsong40ft": 861300,
        "witak20ft": 691000,
        "user20ft": 720400,
        "woonsong20ft": 769800
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "신태인읍",
        "distanceKm": 308,
        "witak40ft": 817400,
        "user40ft": 855000,
        "woonsong40ft": 918500,
        "witak20ft": 732000,
        "user20ft": 763700,
        "woonsong20ft": 817000
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "북면",
        "distanceKm": 309,
        "witak40ft": 819400,
        "user40ft": 857000,
        "woonsong40ft": 920700,
        "witak20ft": 733500,
        "user20ft": 765300,
        "woonsong20ft": 818800
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "입암면",
        "distanceKm": 295,
        "witak40ft": 791500,
        "user40ft": 827700,
        "woonsong40ft": 888800,
        "witak20ft": 710500,
        "user20ft": 741100,
        "woonsong20ft": 792500
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "감곡면",
        "distanceKm": 301,
        "witak40ft": 804700,
        "user40ft": 841500,
        "woonsong40ft": 903800,
        "witak20ft": 721600,
        "user20ft": 752700,
        "woonsong20ft": 805000
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "수성동",
        "distanceKm": 304,
        "witak40ft": 810100,
        "user40ft": 847300,
        "woonsong40ft": 910100,
        "witak20ft": 726100,
        "user20ft": 757400,
        "woonsong20ft": 810200
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "농소동",
        "distanceKm": 305,
        "witak40ft": 812000,
        "user40ft": 849200,
        "woonsong40ft": 912200,
        "witak20ft": 727500,
        "user20ft": 758900,
        "woonsong20ft": 811800
      },
      {
        "city": "전라북도",
        "gu": "정읍시",
        "dong": "상교동",
        "distanceKm": 300,
        "witak40ft": 802800,
        "user40ft": 839600,
        "woonsong40ft": 901700,
        "witak20ft": 720100,
        "user20ft": 751100,
        "woonsong20ft": 803200
      },
      {
        "city": "전라북도",
        "gu": "남원시",
        "dong": "사매면",
        "distanceKm": 227,
        "witak40ft": 662400,
        "user40ft": 691600,
        "woonsong40ft": 740900,
        "witak20ft": 577600,
        "user20ft": 602200,
        "woonsong20ft": 643500
      },
      {
        "city": "전라북도",
        "gu": "남원시",
        "dong": "인월면",
        "distanceKm": 197,
        "witak40ft": 603100,
        "user40ft": 629300,
        "woonsong40ft": 673300,
        "witak20ft": 525900,
        "user20ft": 548000,
        "woonsong20ft": 585100
      },
      {
        "city": "전라북도",
        "gu": "남원시",
        "dong": "산내면",
        "distanceKm": 204,
        "witak40ft": 617100,
        "user40ft": 644000,
        "woonsong40ft": 689300,
        "witak20ft": 538100,
        "user20ft": 560800,
        "woonsong20ft": 598800
      },
      {
        "city": "전라북도",
        "gu": "김제시",
        "dong": "백산면",
        "distanceKm": 294,
        "witak40ft": 789500,
        "user40ft": 825600,
        "woonsong40ft": 886600,
        "witak20ft": 709100,
        "user20ft": 739500,
        "woonsong20ft": 790800
      },
      {
        "city": "전라북도",
        "gu": "김제시",
        "dong": "백구면",
        "distanceKm": 280,
        "witak40ft": 764200,
        "user40ft": 798900,
        "woonsong40ft": 857400,
        "witak20ft": 688100,
        "user20ft": 717300,
        "woonsong20ft": 766500
      },
      {
        "city": "전라북도",
        "gu": "김제시",
        "dong": "검산동",
        "distanceKm": 295,
        "witak40ft": 791500,
        "user40ft": 827700,
        "woonsong40ft": 888800,
        "witak20ft": 710500,
        "user20ft": 741100,
        "woonsong20ft": 792500
      },
      {
        "city": "전라북도",
        "gu": "완주군",
        "dong": "봉동읍",
        "distanceKm": 266,
        "witak40ft": 737200,
        "user40ft": 770400,
        "woonsong40ft": 826600,
        "witak20ft": 646200,
        "user20ft": 674200,
        "woonsong20ft": 721300
      },
      {
        "city": "전라북도",
        "gu": "완주군",
        "dong": "경천면",
        "distanceKm": 278,
        "witak40ft": 760900,
        "user40ft": 795400,
        "woonsong40ft": 853500,
        "witak20ft": 684900,
        "user20ft": 714000,
        "woonsong20ft": 762900
      },
      {
        "city": "전라북도",
        "gu": "부안군",
        "dong": "백산면",
        "distanceKm": 320,
        "witak40ft": 839300,
        "user40ft": 878000,
        "woonsong40ft": 943600,
        "witak20ft": 749700,
        "user20ft": 782400,
        "woonsong20ft": 837500
      },
      {
        "city": "전라북도",
        "gu": "부안군",
        "dong": "하서면",
        "distanceKm": 320,
        "witak40ft": 839300,
        "user40ft": 878000,
        "woonsong40ft": 943600,
        "witak20ft": 749700,
        "user20ft": 782400,
        "woonsong20ft": 837500
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "소라면",
        "distanceKm": 192,
        "witak40ft": 593100,
        "user40ft": 618800,
        "woonsong40ft": 661900,
        "witak20ft": 517100,
        "user20ft": 538800,
        "woonsong20ft": 575000
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "율촌면",
        "distanceKm": 188,
        "witak40ft": 585000,
        "user40ft": 610200,
        "woonsong40ft": 652600,
        "witak20ft": 510100,
        "user20ft": 531400,
        "woonsong20ft": 567000
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "월호동",
        "distanceKm": 198,
        "witak40ft": 605100,
        "user40ft": 631400,
        "woonsong40ft": 675700,
        "witak20ft": 527700,
        "user20ft": 549800,
        "woonsong20ft": 586900
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "만덕동",
        "distanceKm": 197,
        "witak40ft": 603100,
        "user40ft": 629300,
        "woonsong40ft": 673300,
        "witak20ft": 525900,
        "user20ft": 548000,
        "woonsong20ft": 585100
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "삼일동",
        "distanceKm": 185,
        "witak40ft": 578900,
        "user40ft": 603900,
        "woonsong40ft": 645800,
        "witak20ft": 505100,
        "user20ft": 526100,
        "woonsong20ft": 561200
      },
      {
        "city": "전라남도",
        "gu": "여수시",
        "dong": "묘도동",
        "distanceKm": 176,
        "witak40ft": 560500,
        "user40ft": 584500,
        "woonsong40ft": 624800,
        "witak20ft": 489900,
        "user20ft": 510200,
        "woonsong20ft": 544000
      },
      {
        "city": "전라남도",
        "gu": "순천시",
        "dong": "해룡면",
        "distanceKm": 184,
        "witak40ft": 576900,
        "user40ft": 601800,
        "woonsong40ft": 643500,
        "witak20ft": 503400,
        "user20ft": 524400,
        "woonsong20ft": 559400
      },
      {
        "city": "전라남도",
        "gu": "순천시",
        "dong": "서면",
        "distanceKm": 187,
        "witak40ft": 583000,
        "user40ft": 608200,
        "woonsong40ft": 650400,
        "witak20ft": 508500,
        "user20ft": 529700,
        "woonsong20ft": 565100
      },
      {
        "city": "전라남도",
        "gu": "순천시",
        "dong": "삼산동",
        "distanceKm": 190,
        "witak40ft": 589000,
        "user40ft": 614500,
        "woonsong40ft": 657300,
        "witak20ft": 513600,
        "user20ft": 535000,
        "woonsong20ft": 570900
      },
      {
        "city": "전라남도",
        "gu": "광양시",
        "dong": "광양읍",
        "distanceKm": 176,
        "witak40ft": 560500,
        "user40ft": 584500,
        "woonsong40ft": 624800,
        "witak20ft": 489900,
        "user20ft": 510200,
        "woonsong20ft": 544000
      },
      {
        "city": "전라남도",
        "gu": "광양시",
        "dong": "옥곡면",
        "distanceKm": 164,
        "witak40ft": 535500,
        "user40ft": 558300,
        "woonsong40ft": 596600,
        "witak20ft": 469100,
        "user20ft": 488400,
        "woonsong20ft": 520500
      },
      {
        "city": "전라남도",
        "gu": "광양시",
        "dong": "골약동",
        "distanceKm": 174,
        "witak40ft": 556300,
        "user40ft": 580100,
        "woonsong40ft": 620100,
        "witak20ft": 486400,
        "user20ft": 506500,
        "woonsong20ft": 540100
      },
      {
        "city": "전라남도",
        "gu": "광양시",
        "dong": "태인동",
        "distanceKm": 160,
        "witak40ft": 527100,
        "user40ft": 549500,
        "woonsong40ft": 587100,
        "witak20ft": 462100,
        "user20ft": 481000,
        "woonsong20ft": 512600
      },
      {
        "city": "전라남도",
        "gu": "광양시",
        "dong": "금호동",
        "distanceKm": 164,
        "witak40ft": 535500,
        "user40ft": 558300,
        "woonsong40ft": 596600,
        "witak20ft": 469100,
        "user20ft": 488400,
        "woonsong20ft": 520500
      },
      {
        "city": "전라남도",
        "gu": "담양군",
        "dong": "담양읍",
        "distanceKm": 260,
        "witak40ft": 725900,
        "user40ft": 758500,
        "woonsong40ft": 813600,
        "witak20ft": 636900,
        "user20ft": 664300,
        "woonsong20ft": 710600
      },
      {
        "city": "전라남도",
        "gu": "보성군",
        "dong": "겸백면",
        "distanceKm": 238,
        "witak40ft": 683800,
        "user40ft": 714100,
        "woonsong40ft": 765300,
        "witak20ft": 596200,
        "user20ft": 621800,
        "woonsong20ft": 664800
      },
      {
        "city": "전라남도",
        "gu": "영암군",
        "dong": "삼호읍",
        "distanceKm": 296,
        "witak40ft": 793200,
        "user40ft": 829500,
        "woonsong40ft": 890800,
        "witak20ft": 712000,
        "user20ft": 742600,
        "woonsong20ft": 794200
      },
      {
        "city": "전라남도",
        "gu": "영암군",
        "dong": "신북면",
        "distanceKm": 298,
        "witak40ft": 797000,
        "user40ft": 833500,
        "woonsong40ft": 895100,
        "witak20ft": 715000,
        "user20ft": 745800,
        "woonsong20ft": 797700
      },
      {
        "city": "전라남도",
        "gu": "함평군",
        "dong": "대동면",
        "distanceKm": 305,
        "witak40ft": 812000,
        "user40ft": 849200,
        "woonsong40ft": 912200,
        "witak20ft": 727500,
        "user20ft": 758900,
        "woonsong20ft": 811800
      },
      {
        "city": "전라남도",
        "gu": "함평군",
        "dong": "월야면",
        "distanceKm": 292,
        "witak40ft": 785900,
        "user40ft": 821800,
        "woonsong40ft": 882400,
        "witak20ft": 706000,
        "user20ft": 736300,
        "woonsong20ft": 787300
      },
      {
        "city": "전라남도",
        "gu": "장성군",
        "dong": "남면",
        "distanceKm": 270,
        "witak40ft": 744700,
        "user40ft": 778400,
        "woonsong40ft": 835300,
        "witak20ft": 652300,
        "user20ft": 680700,
        "woonsong20ft": 728500
      },
      {
        "city": "전라남도",
        "gu": "장성군",
        "dong": "삼계면",
        "distanceKm": 293,
        "witak40ft": 787700,
        "user40ft": 823700,
        "woonsong40ft": 884500,
        "witak20ft": 707500,
        "user20ft": 737900,
        "woonsong20ft": 789000
      },
      {
        "city": "전라남도",
        "gu": "장성군",
        "dong": "황룡면",
        "distanceKm": 281,
        "witak40ft": 765800,
        "user40ft": 800600,
        "woonsong40ft": 859400,
        "witak20ft": 689500,
        "user20ft": 718800,
        "woonsong20ft": 768100
      },
      {
        "city": "전라남도",
        "gu": "신안군",
        "dong": "압해읍",
        "distanceKm": 319,
        "witak40ft": 837600,
        "user40ft": 876200,
        "woonsong40ft": 941600,
        "witak20ft": 748200,
        "user20ft": 780800,
        "woonsong20ft": 835700
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "구룡포읍",
        "distanceKm": 134,
        "witak40ft": 471500,
        "user40ft": 491300,
        "woonsong40ft": 524200,
        "witak20ft": 415200,
        "user20ft": 431900,
        "woonsong20ft": 459600
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "연일읍",
        "distanceKm": 125,
        "witak40ft": 451700,
        "user40ft": 470500,
        "woonsong40ft": 501900,
        "witak20ft": 398300,
        "user20ft": 414200,
        "woonsong20ft": 440600
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "오천읍",
        "distanceKm": 120,
        "witak40ft": 440600,
        "user40ft": 459000,
        "woonsong40ft": 489500,
        "witak20ft": 388800,
        "user20ft": 404300,
        "woonsong20ft": 430000
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "대송면",
        "distanceKm": 119,
        "witak40ft": 438400,
        "user40ft": 456700,
        "woonsong40ft": 487000,
        "witak20ft": 387000,
        "user20ft": 402400,
        "woonsong20ft": 427900
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "동해면",
        "distanceKm": 130,
        "witak40ft": 462700,
        "user40ft": 482100,
        "woonsong40ft": 514300,
        "witak20ft": 407700,
        "user20ft": 424000,
        "woonsong20ft": 451100
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "장기면",
        "distanceKm": 132,
        "witak40ft": 467200,
        "user40ft": 486700,
        "woonsong40ft": 519300,
        "witak20ft": 411500,
        "user20ft": 428000,
        "woonsong20ft": 455400
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "제철동",
        "distanceKm": 122,
        "witak40ft": 445100,
        "user40ft": 463700,
        "woonsong40ft": 494500,
        "witak20ft": 392600,
        "user20ft": 408300,
        "woonsong20ft": 434200
      },
      {
        "city": "경상북도",
        "gu": "포항시 북구",
        "dong": "흥해읍",
        "distanceKm": 141,
        "witak40ft": 486700,
        "user40ft": 507200,
        "woonsong40ft": 541400,
        "witak20ft": 428100,
        "user20ft": 445400,
        "woonsong20ft": 474100
      },
      {
        "city": "경상북도",
        "gu": "포항시 북구",
        "dong": "청하면",
        "distanceKm": 152,
        "witak40ft": 510300,
        "user40ft": 531900,
        "woonsong40ft": 568100,
        "witak20ft": 448000,
        "user20ft": 466200,
        "woonsong20ft": 496500
      },
      {
        "city": "경상북도",
        "gu": "포항시 북구",
        "dong": "송라면",
        "distanceKm": 156,
        "witak40ft": 518700,
        "user40ft": 540700,
        "woonsong40ft": 577600,
        "witak20ft": 455000,
        "user20ft": 473600,
        "woonsong20ft": 504500
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "감포읍",
        "distanceKm": 105,
        "witak40ft": 406600,
        "user40ft": 423300,
        "woonsong40ft": 451300,
        "witak20ft": 359600,
        "user20ft": 373700,
        "woonsong20ft": 397200
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "안강읍",
        "distanceKm": 115,
        "witak40ft": 429400,
        "user40ft": 447300,
        "woonsong40ft": 476900,
        "witak20ft": 379300,
        "user20ft": 394300,
        "woonsong20ft": 419100
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "건천읍",
        "distanceKm": 101,
        "witak40ft": 397400,
        "user40ft": 413700,
        "woonsong40ft": 440900,
        "witak20ft": 351700,
        "user20ft": 365500,
        "woonsong20ft": 388400
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "외동읍",
        "distanceKm": 88,
        "witak40ft": 366800,
        "user40ft": 381800,
        "woonsong40ft": 406700,
        "witak20ft": 325300,
        "user20ft": 337900,
        "woonsong20ft": 358900
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "양남면",
        "distanceKm": 86,
        "witak40ft": 362100,
        "user40ft": 376900,
        "woonsong40ft": 401500,
        "witak20ft": 321300,
        "user20ft": 333700,
        "woonsong20ft": 354300
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "내남면",
        "distanceKm": 84,
        "witak40ft": 357300,
        "user40ft": 371900,
        "woonsong40ft": 396100,
        "witak20ft": 317000,
        "user20ft": 329300,
        "woonsong20ft": 349600
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "강동면",
        "distanceKm": 116,
        "witak40ft": 431600,
        "user40ft": 449600,
        "woonsong40ft": 479400,
        "witak20ft": 381200,
        "user20ft": 396300,
        "woonsong20ft": 421300
      },
      {
        "city": "경상북도",
        "gu": "경주시",
        "dong": "천북면",
        "distanceKm": 105,
        "witak40ft": 406600,
        "user40ft": 423300,
        "woonsong40ft": 451300,
        "witak20ft": 359600,
        "user20ft": 373700,
        "woonsong20ft": 397200
      },
      {
        "city": "경상북도",
        "gu": "김천시",
        "dong": "아포읍",
        "distanceKm": 173,
        "witak40ft": 554300,
        "user40ft": 578000,
        "woonsong40ft": 617700,
        "witak20ft": 484700,
        "user20ft": 504700,
        "woonsong20ft": 538100
      },
      {
        "city": "경상북도",
        "gu": "김천시",
        "dong": "감문면",
        "distanceKm": 191,
        "witak40ft": 591100,
        "user40ft": 616700,
        "woonsong40ft": 659600,
        "witak20ft": 515300,
        "user20ft": 536900,
        "woonsong20ft": 573000
      },
      {
        "city": "경상북도",
        "gu": "김천시",
        "dong": "어모면",
        "distanceKm": 192,
        "witak40ft": 593100,
        "user40ft": 618800,
        "woonsong40ft": 661900,
        "witak20ft": 517100,
        "user20ft": 538800,
        "woonsong20ft": 575000
      },
      {
        "city": "경상북도",
        "gu": "김천시",
        "dong": "대신동",
        "distanceKm": 187,
        "witak40ft": 583000,
        "user40ft": 608200,
        "woonsong40ft": 650400,
        "witak20ft": 508500,
        "user20ft": 529700,
        "woonsong20ft": 565100
      },
      {
        "city": "경상북도",
        "gu": "안동시",
        "dong": "풍산읍",
        "distanceKm": 219,
        "witak40ft": 646800,
        "user40ft": 675200,
        "woonsong40ft": 723100,
        "witak20ft": 563900,
        "user20ft": 587900,
        "woonsong20ft": 628100
      },
      {
        "city": "경상북도",
        "gu": "안동시",
        "dong": "남후면",
        "distanceKm": 209,
        "witak40ft": 627000,
        "user40ft": 654400,
        "woonsong40ft": 700500,
        "witak20ft": 546700,
        "user20ft": 569800,
        "woonsong20ft": 608600
      },
      {
        "city": "경상북도",
        "gu": "안동시",
        "dong": "남선면",
        "distanceKm": 220,
        "witak40ft": 648700,
        "user40ft": 677200,
        "woonsong40ft": 725300,
        "witak20ft": 565700,
        "user20ft": 589700,
        "woonsong20ft": 630000
      },
      {
        "city": "경상북도",
        "gu": "안동시",
        "dong": "녹전면",
        "distanceKm": 255,
        "witak40ft": 716300,
        "user40ft": 748400,
        "woonsong40ft": 802600,
        "witak20ft": 629100,
        "user20ft": 656100,
        "woonsong20ft": 701700
      },
      {
        "city": "경상북도",
        "gu": "안동시",
        "dong": "서구동",
        "distanceKm": 223,
        "witak40ft": 654600,
        "user40ft": 683400,
        "woonsong40ft": 732100,
        "witak20ft": 570800,
        "user20ft": 595100,
        "woonsong20ft": 635900
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "선산읍",
        "distanceKm": 184,
        "witak40ft": 576900,
        "user40ft": 601800,
        "woonsong40ft": 643500,
        "witak20ft": 503400,
        "user20ft": 524400,
        "woonsong20ft": 559400
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "고아읍",
        "distanceKm": 174,
        "witak40ft": 556300,
        "user40ft": 580100,
        "woonsong40ft": 620100,
        "witak20ft": 486400,
        "user20ft": 506500,
        "woonsong20ft": 540100
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "해평면",
        "distanceKm": 174,
        "witak40ft": 556300,
        "user40ft": 580100,
        "woonsong40ft": 620100,
        "witak20ft": 486400,
        "user20ft": 506500,
        "woonsong20ft": 540100
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "산동면",
        "distanceKm": 167,
        "witak40ft": 541800,
        "user40ft": 564900,
        "woonsong40ft": 603700,
        "witak20ft": 474400,
        "user20ft": 493900,
        "woonsong20ft": 526500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "신평2동",
        "distanceKm": 163,
        "witak40ft": 533400,
        "user40ft": 556100,
        "woonsong40ft": 594200,
        "witak20ft": 467400,
        "user20ft": 486600,
        "woonsong20ft": 518500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "진미동",
        "distanceKm": 164,
        "witak40ft": 535500,
        "user40ft": 558300,
        "woonsong40ft": 596600,
        "witak20ft": 469100,
        "user20ft": 488400,
        "woonsong20ft": 520500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "양포동",
        "distanceKm": 166,
        "witak40ft": 539800,
        "user40ft": 562800,
        "woonsong40ft": 601400,
        "witak20ft": 472600,
        "user20ft": 492000,
        "woonsong20ft": 524400
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "장수면",
        "distanceKm": 240,
        "witak40ft": 687700,
        "user40ft": 718200,
        "woonsong40ft": 769700,
        "witak20ft": 599500,
        "user20ft": 625200,
        "woonsong20ft": 668500
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "안정면",
        "distanceKm": 252,
        "witak40ft": 710600,
        "user40ft": 742300,
        "woonsong40ft": 796000,
        "witak20ft": 624600,
        "user20ft": 651400,
        "woonsong20ft": 696400
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "봉현면",
        "distanceKm": 253,
        "witak40ft": 712600,
        "user40ft": 744500,
        "woonsong40ft": 798400,
        "witak20ft": 626100,
        "user20ft": 652900,
        "woonsong20ft": 698100
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "휴천3동",
        "distanceKm": 247,
        "witak40ft": 701100,
        "user40ft": 732400,
        "woonsong40ft": 785200,
        "witak20ft": 611300,
        "user20ft": 637600,
        "woonsong20ft": 682000
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "가흥1동",
        "distanceKm": 246,
        "witak40ft": 699200,
        "user40ft": 730300,
        "woonsong40ft": 782900,
        "witak20ft": 609600,
        "user20ft": 635800,
        "woonsong20ft": 680000
      },
      {
        "city": "경상북도",
        "gu": "영주시",
        "dong": "가흥2동",
        "distanceKm": 247,
        "witak40ft": 701100,
        "user40ft": 732400,
        "woonsong40ft": 785200,
        "witak20ft": 611300,
        "user20ft": 637600,
        "woonsong20ft": 682000
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "금호읍",
        "distanceKm": 127,
        "witak40ft": 456200,
        "user40ft": 475300,
        "woonsong40ft": 507100,
        "witak20ft": 402200,
        "user20ft": 418300,
        "woonsong20ft": 444900
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "화남면",
        "distanceKm": 139,
        "witak40ft": 482500,
        "user40ft": 502800,
        "woonsong40ft": 536600,
        "witak20ft": 424300,
        "user20ft": 441400,
        "woonsong20ft": 469900
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "고경면",
        "distanceKm": 134,
        "witak40ft": 471500,
        "user40ft": 491300,
        "woonsong40ft": 524200,
        "witak20ft": 415200,
        "user20ft": 431900,
        "woonsong20ft": 459600
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "북안면",
        "distanceKm": 112,
        "witak40ft": 422600,
        "user40ft": 440100,
        "woonsong40ft": 469200,
        "witak20ft": 373400,
        "user20ft": 388200,
        "woonsong20ft": 412600
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "대창면",
        "distanceKm": 129,
        "witak40ft": 460600,
        "user40ft": 479800,
        "woonsong40ft": 511800,
        "witak20ft": 405900,
        "user20ft": 422200,
        "woonsong20ft": 449100
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "중앙동",
        "distanceKm": 124,
        "witak40ft": 449500,
        "user40ft": 468300,
        "woonsong40ft": 499600,
        "witak20ft": 396500,
        "user20ft": 412300,
        "woonsong20ft": 438500
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "완산동",
        "distanceKm": 125,
        "witak40ft": 451700,
        "user40ft": 470500,
        "woonsong40ft": 501900,
        "witak20ft": 398300,
        "user20ft": 414200,
        "woonsong20ft": 440600
      },
      {
        "city": "경상북도",
        "gu": "영천시",
        "dong": "남부동",
        "distanceKm": 120,
        "witak40ft": 440600,
        "user40ft": 459000,
        "woonsong40ft": 489500,
        "witak20ft": 388800,
        "user20ft": 404300,
        "woonsong20ft": 430000
      },
      {
        "city": "경상북도",
        "gu": "상주시",
        "dong": "함창읍",
        "distanceKm": 222,
        "witak40ft": 652700,
        "user40ft": 681400,
        "woonsong40ft": 729800,
        "witak20ft": 569000,
        "user20ft": 593200,
        "woonsong20ft": 633900
      },
      {
        "city": "경상북도",
        "gu": "상주시",
        "dong": "청리면",
        "distanceKm": 210,
        "witak40ft": 629100,
        "user40ft": 656600,
        "woonsong40ft": 702800,
        "witak20ft": 548500,
        "user20ft": 571700,
        "woonsong20ft": 610700
      },
      {
        "city": "경상북도",
        "gu": "상주시",
        "dong": "은척면",
        "distanceKm": 234,
        "witak40ft": 676000,
        "user40ft": 705900,
        "woonsong40ft": 756400,
        "witak20ft": 589500,
        "user20ft": 614700,
        "woonsong20ft": 657200
      },
      {
        "city": "경상북도",
        "gu": "상주시",
        "dong": "신흥동",
        "distanceKm": 210,
        "witak40ft": 629100,
        "user40ft": 656600,
        "woonsong40ft": 702800,
        "witak20ft": 548500,
        "user20ft": 571700,
        "woonsong20ft": 610700
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "하양읍",
        "distanceKm": 123,
        "witak40ft": 447300,
        "user40ft": 466000,
        "woonsong40ft": 497000,
        "witak20ft": 394600,
        "user20ft": 410300,
        "woonsong20ft": 436300
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "진량읍",
        "distanceKm": 121,
        "witak40ft": 442900,
        "user40ft": 461300,
        "woonsong40ft": 492000,
        "witak20ft": 390700,
        "user20ft": 406300,
        "woonsong20ft": 432000
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "압량읍",
        "distanceKm": 114,
        "witak40ft": 427200,
        "user40ft": 444900,
        "woonsong40ft": 474300,
        "witak20ft": 377300,
        "user20ft": 392200,
        "woonsong20ft": 416900
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "와촌면",
        "distanceKm": 129,
        "witak40ft": 460600,
        "user40ft": 479800,
        "woonsong40ft": 511800,
        "witak20ft": 405900,
        "user20ft": 422200,
        "woonsong20ft": 449100
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "자인면",
        "distanceKm": 115,
        "witak40ft": 429400,
        "user40ft": 447300,
        "woonsong40ft": 476900,
        "witak20ft": 379300,
        "user20ft": 394300,
        "woonsong20ft": 419100
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "남산면",
        "distanceKm": 108,
        "witak40ft": 413400,
        "user40ft": 430400,
        "woonsong40ft": 458800,
        "witak20ft": 365600,
        "user20ft": 380000,
        "woonsong20ft": 403900
      },
      {
        "city": "경상북도",
        "gu": "경산시",
        "dong": "북부동",
        "distanceKm": 112,
        "witak40ft": 422600,
        "user40ft": 440100,
        "woonsong40ft": 469200,
        "witak20ft": 373400,
        "user20ft": 388200,
        "woonsong20ft": 412600
      },
      {
        "city": "경상북도",
        "gu": "군위군",
        "dong": "군위읍",
        "distanceKm": 171,
        "witak40ft": 550100,
        "user40ft": 573600,
        "woonsong40ft": 613100,
        "witak20ft": 481200,
        "user20ft": 501100,
        "woonsong20ft": 534200
      },
      {
        "city": "경상북도",
        "gu": "의성군",
        "dong": "단촌면",
        "distanceKm": 201,
        "witak40ft": 611100,
        "user40ft": 637700,
        "woonsong40ft": 682500,
        "witak20ft": 532900,
        "user20ft": 555300,
        "woonsong20ft": 592900
      },
      {
        "city": "경상북도",
        "gu": "의성군",
        "dong": "가음면",
        "distanceKm": 170,
        "witak40ft": 548100,
        "user40ft": 571500,
        "woonsong40ft": 610700,
        "witak20ft": 479400,
        "user20ft": 499200,
        "woonsong20ft": 532200
      },
      {
        "city": "경상북도",
        "gu": "청도군",
        "dong": "청도읍",
        "distanceKm": 87,
        "witak40ft": 364500,
        "user40ft": 379400,
        "woonsong40ft": 404200,
        "witak20ft": 323300,
        "user20ft": 335800,
        "woonsong20ft": 356600
      },
      {
        "city": "경상북도",
        "gu": "청도군",
        "dong": "풍각면",
        "distanceKm": 93,
        "witak40ft": 378700,
        "user40ft": 394200,
        "woonsong40ft": 420000,
        "witak20ft": 335500,
        "user20ft": 348600,
        "woonsong20ft": 370200
      },
      {
        "city": "경상북도",
        "gu": "고령군",
        "dong": "대가야읍",
        "distanceKm": 143,
        "witak40ft": 491100,
        "user40ft": 511700,
        "woonsong40ft": 546200,
        "witak20ft": 431700,
        "user20ft": 449100,
        "woonsong20ft": 478100
      },
      {
        "city": "경상북도",
        "gu": "고령군",
        "dong": "성산면",
        "distanceKm": 133,
        "witak40ft": 469400,
        "user40ft": 489100,
        "woonsong40ft": 521800,
        "witak20ft": 413300,
        "user20ft": 429900,
        "woonsong20ft": 457400
      },
      {
        "city": "경상북도",
        "gu": "고령군",
        "dong": "다산면",
        "distanceKm": 129,
        "witak40ft": 460600,
        "user40ft": 479800,
        "woonsong40ft": 511800,
        "witak20ft": 405900,
        "user20ft": 422200,
        "woonsong20ft": 449100
      },
      {
        "city": "경상북도",
        "gu": "고령군",
        "dong": "개진면",
        "distanceKm": 133,
        "witak40ft": 469400,
        "user40ft": 489100,
        "woonsong40ft": 521800,
        "witak20ft": 413300,
        "user20ft": 429900,
        "woonsong20ft": 457400
      },
      {
        "city": "경상북도",
        "gu": "성주군",
        "dong": "성주읍",
        "distanceKm": 158,
        "witak40ft": 523000,
        "user40ft": 545200,
        "woonsong40ft": 582300,
        "witak20ft": 458600,
        "user20ft": 477400,
        "woonsong20ft": 508600
      },
      {
        "city": "경상북도",
        "gu": "성주군",
        "dong": "선남면",
        "distanceKm": 145,
        "witak40ft": 495400,
        "user40ft": 516300,
        "woonsong40ft": 551200,
        "witak20ft": 435400,
        "user20ft": 453000,
        "woonsong20ft": 482200
      },
      {
        "city": "경상북도",
        "gu": "성주군",
        "dong": "대가면",
        "distanceKm": 155,
        "witak40ft": 516600,
        "user40ft": 538500,
        "woonsong40ft": 575100,
        "witak20ft": 453300,
        "user20ft": 471800,
        "woonsong20ft": 502600
      },
      {
        "city": "경상북도",
        "gu": "성주군",
        "dong": "초전면",
        "distanceKm": 162,
        "witak40ft": 531400,
        "user40ft": 554000,
        "woonsong40ft": 591900,
        "witak20ft": 465700,
        "user20ft": 484800,
        "woonsong20ft": 516500
      },
      {
        "city": "경상북도",
        "gu": "성주군",
        "dong": "월항면",
        "distanceKm": 155,
        "witak40ft": 516600,
        "user40ft": 538500,
        "woonsong40ft": 575100,
        "witak20ft": 453300,
        "user20ft": 471800,
        "woonsong20ft": 502600
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "왜관읍",
        "distanceKm": 145,
        "witak40ft": 495400,
        "user40ft": 516300,
        "woonsong40ft": 551200,
        "witak20ft": 435400,
        "user20ft": 453000,
        "woonsong20ft": 482200
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "북삼읍",
        "distanceKm": 162,
        "witak40ft": 531400,
        "user40ft": 554000,
        "woonsong40ft": 591900,
        "witak20ft": 465700,
        "user20ft": 484800,
        "woonsong20ft": 516500
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "석적읍",
        "distanceKm": 155,
        "witak40ft": 516600,
        "user40ft": 538500,
        "woonsong40ft": 575100,
        "witak20ft": 453300,
        "user20ft": 471800,
        "woonsong20ft": 502600
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "지천면",
        "distanceKm": 140,
        "witak40ft": 484500,
        "user40ft": 504900,
        "woonsong40ft": 538800,
        "witak20ft": 426300,
        "user20ft": 443500,
        "woonsong20ft": 472000
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "가산면",
        "distanceKm": 154,
        "witak40ft": 514600,
        "user40ft": 536400,
        "woonsong40ft": 572800,
        "witak20ft": 451600,
        "user20ft": 470000,
        "woonsong20ft": 500600
      },
      {
        "city": "경상북도",
        "gu": "칠곡군",
        "dong": "약목면",
        "distanceKm": 152,
        "witak40ft": 510300,
        "user40ft": 531900,
        "woonsong40ft": 568100,
        "witak20ft": 448000,
        "user20ft": 466200,
        "woonsong20ft": 496500
      },
      {
        "city": "경상북도",
        "gu": "봉화군",
        "dong": "봉성면",
        "distanceKm": 272,
        "witak40ft": 750600,
        "user40ft": 784500,
        "woonsong40ft": 841700,
        "witak20ft": 675800,
        "user20ft": 704400,
        "woonsong20ft": 752400
      },
      {
        "city": "경상북도",
        "gu": "봉화군",
        "dong": "석포면",
        "distanceKm": 314,
        "witak40ft": 828500,
        "user40ft": 866600,
        "woonsong40ft": 931200,
        "witak20ft": 740800,
        "user20ft": 772900,
        "woonsong20ft": 827100
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "정촌면",
        "distanceKm": 118,
        "witak40ft": 436200,
        "user40ft": 454300,
        "woonsong40ft": 484500,
        "witak20ft": 385000,
        "user20ft": 400400,
        "woonsong20ft": 425800
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "이반성면",
        "distanceKm": 94,
        "witak40ft": 381100,
        "user40ft": 396700,
        "woonsong40ft": 422600,
        "witak20ft": 337700,
        "user20ft": 350800,
        "woonsong20ft": 372500
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "사봉면",
        "distanceKm": 99,
        "witak40ft": 392700,
        "user40ft": 408800,
        "woonsong40ft": 435600,
        "witak20ft": 347700,
        "user20ft": 361300,
        "woonsong20ft": 383800
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "지수면",
        "distanceKm": 99,
        "witak40ft": 392700,
        "user40ft": 408800,
        "woonsong40ft": 435600,
        "witak20ft": 347700,
        "user20ft": 361300,
        "woonsong20ft": 383800
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "상평동",
        "distanceKm": 115,
        "witak40ft": 429400,
        "user40ft": 447300,
        "woonsong40ft": 476900,
        "witak20ft": 379300,
        "user20ft": 394300,
        "woonsong20ft": 419100
      },
      {
        "city": "경상남도",
        "gu": "진주시",
        "dong": "상대동",
        "distanceKm": 115,
        "witak40ft": 429400,
        "user40ft": 447300,
        "woonsong40ft": 476900,
        "witak20ft": 379300,
        "user20ft": 394300,
        "woonsong20ft": 419100
      },
      {
        "city": "경상남도",
        "gu": "통영시",
        "dong": "도산면",
        "distanceKm": 109,
        "witak40ft": 415700,
        "user40ft": 432800,
        "woonsong40ft": 461500,
        "witak20ft": 367500,
        "user20ft": 382000,
        "woonsong20ft": 406000
      },
      {
        "city": "경상남도",
        "gu": "통영시",
        "dong": "광도면",
        "distanceKm": 106,
        "witak40ft": 408800,
        "user40ft": 425600,
        "woonsong40ft": 453800,
        "witak20ft": 361600,
        "user20ft": 375800,
        "woonsong20ft": 399400
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "사천읍",
        "distanceKm": 124,
        "witak40ft": 449500,
        "user40ft": 468300,
        "woonsong40ft": 499600,
        "witak20ft": 396500,
        "user20ft": 412300,
        "woonsong20ft": 438500
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "사남면",
        "distanceKm": 128,
        "witak40ft": 458400,
        "user40ft": 477500,
        "woonsong40ft": 509400,
        "witak20ft": 404000,
        "user20ft": 420200,
        "woonsong20ft": 446900
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "용현면",
        "distanceKm": 132,
        "witak40ft": 467200,
        "user40ft": 486700,
        "woonsong40ft": 519300,
        "witak20ft": 411500,
        "user20ft": 428000,
        "woonsong20ft": 455400
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "축동면",
        "distanceKm": 121,
        "witak40ft": 442900,
        "user40ft": 461300,
        "woonsong40ft": 492000,
        "witak20ft": 390700,
        "user20ft": 406300,
        "woonsong20ft": 432000
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "곤양면",
        "distanceKm": 135,
        "witak40ft": 473700,
        "user40ft": 493600,
        "woonsong40ft": 526700,
        "witak20ft": 417000,
        "user20ft": 433800,
        "woonsong20ft": 461600
      },
      {
        "city": "경상남도",
        "gu": "사천시",
        "dong": "서포면",
        "distanceKm": 141,
        "witak40ft": 486700,
        "user40ft": 507200,
        "woonsong40ft": 541400,
        "witak20ft": 428100,
        "user20ft": 445400,
        "woonsong20ft": 474100
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "진영읍",
        "distanceKm": 50,
        "witak40ft": 271700,
        "user40ft": 282800,
        "woonsong40ft": 301100,
        "witak20ft": 236900,
        "user20ft": 246200,
        "woonsong20ft": 261500
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "주촌면",
        "distanceKm": 37,
        "witak40ft": 229300,
        "user40ft": 239100,
        "woonsong40ft": 255100,
        "witak20ft": 201200,
        "user20ft": 209500,
        "woonsong20ft": 223000
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "진례면",
        "distanceKm": 46,
        "witak40ft": 258900,
        "user40ft": 269600,
        "woonsong40ft": 287100,
        "witak20ft": 225500,
        "user20ft": 234500,
        "woonsong20ft": 249200
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "한림면",
        "distanceKm": 48,
        "witak40ft": 265200,
        "user40ft": 276100,
        "woonsong40ft": 294100,
        "witak20ft": 231100,
        "user20ft": 240300,
        "woonsong20ft": 255300
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "생림면",
        "distanceKm": 44,
        "witak40ft": 252300,
        "user40ft": 262700,
        "woonsong40ft": 279900,
        "witak20ft": 219900,
        "user20ft": 228700,
        "woonsong20ft": 243200
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "상동면",
        "distanceKm": 37,
        "witak40ft": 229300,
        "user40ft": 239100,
        "woonsong40ft": 255100,
        "witak20ft": 201200,
        "user20ft": 209500,
        "woonsong20ft": 223000
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "대동면",
        "distanceKm": 26,
        "witak40ft": 193100,
        "user40ft": 201700,
        "woonsong40ft": 215800,
        "witak20ft": 174400,
        "user20ft": 181600,
        "woonsong20ft": 193400
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "칠산서부동",
        "distanceKm": 32,
        "witak40ft": 212600,
        "user40ft": 221800,
        "woonsong40ft": 236900,
        "witak20ft": 189200,
        "user20ft": 197000,
        "woonsong20ft": 209600
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "삼안동",
        "distanceKm": 30,
        "witak40ft": 205800,
        "user40ft": 214800,
        "woonsong40ft": 229600,
        "witak20ft": 184300,
        "user20ft": 191900,
        "woonsong20ft": 204300
      },
      {
        "city": "경상남도",
        "gu": "김해시",
        "dong": "장유3동",
        "distanceKm": 38,
        "witak40ft": 232700,
        "user40ft": 242500,
        "woonsong40ft": 258700,
        "witak20ft": 203700,
        "user20ft": 212000,
        "woonsong20ft": 225500
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "삼랑진읍",
        "distanceKm": 52,
        "witak40ft": 277500,
        "user40ft": 288800,
        "woonsong40ft": 307300,
        "witak20ft": 247400,
        "user20ft": 256900,
        "woonsong20ft": 272600
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "하남읍",
        "distanceKm": 61,
        "witak40ft": 300600,
        "user40ft": 312800,
        "woonsong40ft": 333000,
        "witak20ft": 267600,
        "user20ft": 277900,
        "woonsong20ft": 294900
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "부북면",
        "distanceKm": 69,
        "witak40ft": 320700,
        "user40ft": 333700,
        "woonsong40ft": 355300,
        "witak20ft": 285200,
        "user20ft": 296200,
        "woonsong20ft": 314400
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "산내면",
        "distanceKm": 82,
        "witak40ft": 352500,
        "user40ft": 366800,
        "woonsong40ft": 390700,
        "witak20ft": 312900,
        "user20ft": 325000,
        "woonsong20ft": 345000
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "상남면",
        "distanceKm": 63,
        "witak40ft": 305700,
        "user40ft": 318100,
        "woonsong40ft": 338700,
        "witak20ft": 272100,
        "user20ft": 282500,
        "woonsong20ft": 299700
      },
      {
        "city": "경상남도",
        "gu": "밀양시",
        "dong": "가곡동",
        "distanceKm": 64,
        "witak40ft": 308100,
        "user40ft": 320600,
        "woonsong40ft": 341300,
        "witak20ft": 274300,
        "user20ft": 284800,
        "woonsong20ft": 302200
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "일운면",
        "distanceKm": 75,
        "witak40ft": 335500,
        "user40ft": 349100,
        "woonsong40ft": 371800,
        "witak20ft": 298100,
        "user20ft": 309600,
        "woonsong20ft": 328700
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "거제면",
        "distanceKm": 81,
        "witak40ft": 350100,
        "user40ft": 364400,
        "woonsong40ft": 388100,
        "witak20ft": 310800,
        "user20ft": 322900,
        "woonsong20ft": 342800
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "사등면",
        "distanceKm": 80,
        "witak40ft": 347700,
        "user40ft": 361800,
        "woonsong40ft": 385300,
        "witak20ft": 308700,
        "user20ft": 320600,
        "woonsong20ft": 340400
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "연초면",
        "distanceKm": 65,
        "witak40ft": 310800,
        "user40ft": 323400,
        "woonsong40ft": 344200,
        "witak20ft": 276400,
        "user20ft": 287100,
        "woonsong20ft": 304600
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "하청면",
        "distanceKm": 58,
        "witak40ft": 293000,
        "user40ft": 304900,
        "woonsong40ft": 324500,
        "witak20ft": 261000,
        "user20ft": 271000,
        "woonsong20ft": 287400
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "아주동",
        "distanceKm": 69,
        "witak40ft": 320700,
        "user40ft": 333700,
        "woonsong40ft": 355300,
        "witak20ft": 285200,
        "user20ft": 296200,
        "woonsong20ft": 314400
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "옥포1동",
        "distanceKm": 67,
        "witak40ft": 315700,
        "user40ft": 328500,
        "woonsong40ft": 349800,
        "witak20ft": 280900,
        "user20ft": 291700,
        "woonsong20ft": 309600
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "고현동",
        "distanceKm": 71,
        "witak40ft": 325700,
        "user40ft": 338900,
        "woonsong40ft": 360900,
        "witak20ft": 289600,
        "user20ft": 300800,
        "woonsong20ft": 319300
      },
      {
        "city": "경상남도",
        "gu": "거제시",
        "dong": "장승포동",
        "distanceKm": 74,
        "witak40ft": 333000,
        "user40ft": 346500,
        "woonsong40ft": 369000,
        "witak20ft": 296000,
        "user20ft": 307400,
        "woonsong20ft": 326300
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "물금읍",
        "distanceKm": 34,
        "witak40ft": 219300,
        "user40ft": 228700,
        "woonsong40ft": 244200,
        "witak20ft": 194100,
        "user20ft": 202000,
        "woonsong20ft": 215000
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "원동면",
        "distanceKm": 48,
        "witak40ft": 265200,
        "user40ft": 276100,
        "woonsong40ft": 294100,
        "witak20ft": 231100,
        "user20ft": 240300,
        "woonsong20ft": 255300
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "상북면",
        "distanceKm": 45,
        "witak40ft": 255500,
        "user40ft": 266000,
        "woonsong40ft": 283300,
        "witak20ft": 222700,
        "user20ft": 231600,
        "woonsong20ft": 246200
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "하북면",
        "distanceKm": 53,
        "witak40ft": 280100,
        "user40ft": 291500,
        "woonsong40ft": 310300,
        "witak20ft": 249600,
        "user20ft": 259300,
        "woonsong20ft": 275100
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "삼성동",
        "distanceKm": 38,
        "witak40ft": 232700,
        "user40ft": 242500,
        "woonsong40ft": 258700,
        "witak20ft": 203700,
        "user20ft": 212000,
        "woonsong20ft": 225500
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "강서동",
        "distanceKm": 38,
        "witak40ft": 232700,
        "user40ft": 242500,
        "woonsong40ft": 258700,
        "witak20ft": 203700,
        "user20ft": 212000,
        "woonsong20ft": 225500
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "서창동",
        "distanceKm": 44,
        "witak40ft": 252300,
        "user40ft": 262700,
        "woonsong40ft": 279900,
        "witak20ft": 219900,
        "user20ft": 228700,
        "woonsong20ft": 243200
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "소주동",
        "distanceKm": 43,
        "witak40ft": 249100,
        "user40ft": 259400,
        "woonsong40ft": 276400,
        "witak20ft": 217000,
        "user20ft": 225800,
        "woonsong20ft": 240100
      },
      {
        "city": "경상남도",
        "gu": "양산시",
        "dong": "덕계동",
        "distanceKm": 38,
        "witak40ft": 232700,
        "user40ft": 242500,
        "woonsong40ft": 258700,
        "witak20ft": 203700,
        "user20ft": 212000,
        "woonsong20ft": 225500
      },
      {
        "city": "경상남도",
        "gu": "창원시 의창구",
        "dong": "북면",
        "distanceKm": 68,
        "witak40ft": 318200,
        "user40ft": 331100,
        "woonsong40ft": 352500,
        "witak20ft": 283000,
        "user20ft": 293900,
        "woonsong20ft": 312000
      },
      {
        "city": "경상남도",
        "gu": "창원시의창구",
        "dong": "대산면",
        "distanceKm": 55,
        "witak40ft": 285300,
        "user40ft": 296900,
        "woonsong40ft": 316100,
        "witak20ft": 254200,
        "user20ft": 264000,
        "woonsong20ft": 280100
      },
      {
        "city": "경상남도",
        "gu": "창원시의창구",
        "dong": "팔룡동",
        "distanceKm": 58,
        "witak40ft": 293000,
        "user40ft": 304900,
        "woonsong40ft": 324500,
        "witak20ft": 261000,
        "user20ft": 271000,
        "woonsong20ft": 287400
      },
      {
        "city": "경상남도",
        "gu": "창원시성산구",
        "dong": "중앙동",
        "distanceKm": 51,
        "witak40ft": 274900,
        "user40ft": 286100,
        "woonsong40ft": 304500,
        "witak20ft": 245200,
        "user20ft": 254600,
        "woonsong20ft": 270000
      },
      {
        "city": "경상남도",
        "gu": "창원시성산구",
        "dong": "사파동",
        "distanceKm": 49,
        "witak40ft": 268500,
        "user40ft": 279500,
        "woonsong40ft": 297500,
        "witak20ft": 233900,
        "user20ft": 243200,
        "woonsong20ft": 258400
      },
      {
        "city": "경상남도",
        "gu": "창원시 성산구",
        "dong": "가음정동",
        "distanceKm": 50,
        "witak40ft": 271700,
        "user40ft": 282800,
        "woonsong40ft": 301100,
        "witak20ft": 236900,
        "user20ft": 246200,
        "woonsong20ft": 261500
      },
      {
        "city": "경상남도",
        "gu": "창원시성산구",
        "dong": "성주동",
        "distanceKm": 49,
        "witak40ft": 268500,
        "user40ft": 279500,
        "woonsong40ft": 297500,
        "witak20ft": 233900,
        "user20ft": 243200,
        "woonsong20ft": 258400
      },
      {
        "city": "경상남도",
        "gu": "창원시 성산구",
        "dong": "웅남동",
        "distanceKm": 56,
        "witak40ft": 287800,
        "user40ft": 299500,
        "woonsong40ft": 318900,
        "witak20ft": 256500,
        "user20ft": 266400,
        "woonsong20ft": 282600
      },
      {
        "city": "경상남도",
        "gu": "창원시 마산합포구",
        "dong": "진북면",
        "distanceKm": 76,
        "witak40ft": 337900,
        "user40ft": 351700,
        "woonsong40ft": 374500,
        "witak20ft": 300200,
        "user20ft": 311800,
        "woonsong20ft": 331100
      },
      {
        "city": "경상남도",
        "gu": "창원시 마산합포구",
        "dong": "진전면",
        "distanceKm": 81,
        "witak40ft": 350100,
        "user40ft": 364400,
        "woonsong40ft": 388100,
        "witak20ft": 310800,
        "user20ft": 322900,
        "woonsong20ft": 342800
      },
      {
        "city": "경상남도",
        "gu": "창원시 마산회원구",
        "dong": "내서읍",
        "distanceKm": 71,
        "witak40ft": 325700,
        "user40ft": 338900,
        "woonsong40ft": 360900,
        "witak20ft": 289600,
        "user20ft": 300800,
        "woonsong20ft": 319300
      },
      {
        "city": "경상남도",
        "gu": "창원시진해구",
        "dong": "풍호동",
        "distanceKm": 46,
        "witak40ft": 258900,
        "user40ft": 269600,
        "woonsong40ft": 287100,
        "witak20ft": 225500,
        "user20ft": 234500,
        "woonsong20ft": 249200
      },
      {
        "city": "경상남도",
        "gu": "창원시진해구",
        "dong": "웅천동",
        "distanceKm": 40,
        "witak40ft": 239100,
        "user40ft": 249200,
        "woonsong40ft": 265700,
        "witak20ft": 208500,
        "user20ft": 217000,
        "woonsong20ft": 230900
      },
      {
        "city": "경상남도",
        "gu": "창원시진해구",
        "dong": "웅동2동",
        "distanceKm": 32,
        "witak40ft": 212600,
        "user40ft": 221800,
        "woonsong40ft": 236900,
        "witak20ft": 189200,
        "user20ft": 197000,
        "woonsong20ft": 209600
      },
      {
        "city": "경상남도",
        "gu": "의령군",
        "dong": "의령읍",
        "distanceKm": 97,
        "witak40ft": 388100,
        "user40ft": 404000,
        "woonsong40ft": 430400,
        "witak20ft": 343600,
        "user20ft": 357000,
        "woonsong20ft": 379300
      },
      {
        "city": "경상남도",
        "gu": "의령군",
        "dong": "가례면",
        "distanceKm": 99,
        "witak40ft": 392700,
        "user40ft": 408800,
        "woonsong40ft": 435600,
        "witak20ft": 347700,
        "user20ft": 361300,
        "woonsong20ft": 383800
      },
      {
        "city": "경상남도",
        "gu": "의령군",
        "dong": "대의면",
        "distanceKm": 112,
        "witak40ft": 422600,
        "user40ft": 440100,
        "woonsong40ft": 469200,
        "witak20ft": 373400,
        "user20ft": 388200,
        "woonsong20ft": 412600
      },
      {
        "city": "경상남도",
        "gu": "의령군",
        "dong": "정곡면",
        "distanceKm": 96,
        "witak40ft": 385800,
        "user40ft": 401600,
        "woonsong40ft": 427900,
        "witak20ft": 341700,
        "user20ft": 355000,
        "woonsong20ft": 377100
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "가야읍",
        "distanceKm": 84,
        "witak40ft": 357300,
        "user40ft": 371900,
        "woonsong40ft": 396100,
        "witak20ft": 317000,
        "user20ft": 329300,
        "woonsong20ft": 349600
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "칠원읍",
        "distanceKm": 78,
        "witak40ft": 342800,
        "user40ft": 356800,
        "woonsong40ft": 380100,
        "witak20ft": 304500,
        "user20ft": 316300,
        "woonsong20ft": 335700
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "군북면",
        "distanceKm": 91,
        "witak40ft": 374000,
        "user40ft": 389300,
        "woonsong40ft": 414700,
        "witak20ft": 331500,
        "user20ft": 344400,
        "woonsong20ft": 365800
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "법수면",
        "distanceKm": 90,
        "witak40ft": 371700,
        "user40ft": 386900,
        "woonsong40ft": 412100,
        "witak20ft": 329500,
        "user20ft": 342300,
        "woonsong20ft": 363400
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "대산면",
        "distanceKm": 86,
        "witak40ft": 362100,
        "user40ft": 376900,
        "woonsong40ft": 401500,
        "witak20ft": 321300,
        "user20ft": 333700,
        "woonsong20ft": 354300
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "칠서면",
        "distanceKm": 78,
        "witak40ft": 342800,
        "user40ft": 356800,
        "woonsong40ft": 380100,
        "witak20ft": 304500,
        "user20ft": 316300,
        "woonsong20ft": 335700
      },
      {
        "city": "경상남도",
        "gu": "함안군",
        "dong": "칠북면",
        "distanceKm": 76,
        "witak40ft": 337900,
        "user40ft": 351700,
        "woonsong40ft": 374500,
        "witak20ft": 300200,
        "user20ft": 311800,
        "woonsong20ft": 331100
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "창녕읍",
        "distanceKm": 99,
        "witak40ft": 392700,
        "user40ft": 408800,
        "woonsong40ft": 435600,
        "witak20ft": 347700,
        "user20ft": 361300,
        "woonsong20ft": 383800
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "고암면",
        "distanceKm": 101,
        "witak40ft": 397400,
        "user40ft": 413700,
        "woonsong40ft": 440900,
        "witak20ft": 351700,
        "user20ft": 365500,
        "woonsong20ft": 388400
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "대합면",
        "distanceKm": 108,
        "witak40ft": 413400,
        "user40ft": 430400,
        "woonsong40ft": 458800,
        "witak20ft": 365600,
        "user20ft": 380000,
        "woonsong20ft": 403900
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "유어면",
        "distanceKm": 105,
        "witak40ft": 406600,
        "user40ft": 423300,
        "woonsong40ft": 451300,
        "witak20ft": 359600,
        "user20ft": 373700,
        "woonsong20ft": 397200
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "계성면",
        "distanceKm": 92,
        "witak40ft": 376300,
        "user40ft": 391700,
        "woonsong40ft": 417400,
        "witak20ft": 333500,
        "user20ft": 346500,
        "woonsong20ft": 368000
      },
      {
        "city": "경상남도",
        "gu": "창녕군",
        "dong": "영산면",
        "distanceKm": 86,
        "witak40ft": 362100,
        "user40ft": 376900,
        "woonsong40ft": 401500,
        "witak20ft": 321300,
        "user20ft": 333700,
        "woonsong20ft": 354300
      },
      {
        "city": "경상남도",
        "gu": "고성군",
        "dong": "고성읍",
        "distanceKm": 100,
        "witak40ft": 395100,
        "user40ft": 411300,
        "woonsong40ft": 438200,
        "witak20ft": 349700,
        "user20ft": 363300,
        "woonsong20ft": 386000
      },
      {
        "city": "경상남도",
        "gu": "고성군",
        "dong": "개천면",
        "distanceKm": 102,
        "witak40ft": 399700,
        "user40ft": 416100,
        "woonsong40ft": 443500,
        "witak20ft": 353700,
        "user20ft": 367500,
        "woonsong20ft": 390500
      },
      {
        "city": "경상남도",
        "gu": "고성군",
        "dong": "동해면",
        "distanceKm": 92,
        "witak40ft": 376300,
        "user40ft": 391700,
        "woonsong40ft": 417400,
        "witak20ft": 333500,
        "user20ft": 346500,
        "woonsong20ft": 368000
      },
      {
        "city": "경상남도",
        "gu": "산청군",
        "dong": "금서면",
        "distanceKm": 160,
        "witak40ft": 527100,
        "user40ft": 549500,
        "woonsong40ft": 587100,
        "witak20ft": 462100,
        "user20ft": 481000,
        "woonsong20ft": 512600
      },
      {
        "city": "경상남도",
        "gu": "거창군",
        "dong": "거창읍",
        "distanceKm": 179,
        "witak40ft": 566600,
        "user40ft": 590900,
        "woonsong40ft": 631800,
        "witak20ft": 494900,
        "user20ft": 515400,
        "woonsong20ft": 549700
      },
      {
        "city": "경상남도",
        "gu": "거창군",
        "dong": "웅양면",
        "distanceKm": 194,
        "witak40ft": 597100,
        "user40ft": 623000,
        "woonsong40ft": 666500,
        "witak20ft": 520700,
        "user20ft": 542500,
        "woonsong20ft": 579100
      },
      {
        "city": "경상남도",
        "gu": "거창군",
        "dong": "남상면",
        "distanceKm": 181,
        "witak40ft": 570700,
        "user40ft": 595300,
        "woonsong40ft": 636500,
        "witak20ft": 498300,
        "user20ft": 519000,
        "woonsong20ft": 553500
      },
      {
        "city": "경상남도",
        "gu": "합천군",
        "dong": "가야면",
        "distanceKm": 159,
        "witak40ft": 525100,
        "user40ft": 547400,
        "woonsong40ft": 584800,
        "witak20ft": 460400,
        "user20ft": 479200,
        "woonsong20ft": 510500
      },
      {
        "city": "경상남도",
        "gu": "합천군",
        "dong": "율곡면",
        "distanceKm": 130,
        "witak40ft": 462700,
        "user40ft": 482100,
        "woonsong40ft": 514300,
        "witak20ft": 407700,
        "user20ft": 424000,
        "woonsong20ft": 451100
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "조치원읍",
        "distanceKm": 294,
        "witak40ft": 789500,
        "user40ft": 825600,
        "woonsong40ft": 886600,
        "witak20ft": 709100,
        "user20ft": 739500,
        "woonsong20ft": 790800
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "연기면",
        "distanceKm": 297,
        "witak40ft": 795000,
        "user40ft": 831400,
        "woonsong40ft": 893000,
        "witak20ft": 713400,
        "user20ft": 744100,
        "woonsong20ft": 795800
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "연동면",
        "distanceKm": 292,
        "witak40ft": 785900,
        "user40ft": 821800,
        "woonsong40ft": 882400,
        "witak20ft": 706000,
        "user20ft": 736300,
        "woonsong20ft": 787300
      },
      {
        "city": "세종특별자 치시",
        "gu": "세종시",
        "dong": "부강면",
        "distanceKm": 287,
        "witak40ft": 776600,
        "user40ft": 812000,
        "woonsong40ft": 871800,
        "witak20ft": 698600,
        "user20ft": 728400,
        "woonsong20ft": 778600
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "장군면",
        "distanceKm": 297,
        "witak40ft": 795000,
        "user40ft": 831400,
        "woonsong40ft": 893000,
        "witak20ft": 713400,
        "user20ft": 744100,
        "woonsong20ft": 795800
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "전의면",
        "distanceKm": 317,
        "witak40ft": 834000,
        "user40ft": 872400,
        "woonsong40ft": 937500,
        "witak20ft": 745300,
        "user20ft": 777700,
        "woonsong20ft": 832300
      },
      {
        "city": "세종특별자치시",
        "gu": "세종시",
        "dong": "소정면",
        "distanceKm": 320,
        "witak40ft": 839300,
        "user40ft": 878000,
        "woonsong40ft": 943600,
        "witak20ft": 749700,
        "user20ft": 782400,
        "woonsong20ft": 837500
      }
    ],
    "busan1Way": [
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "사직동",
        "distanceKm": 441,
        "witak40ft": 635100,
        "user40ft": 680800,
        "woonsong40ft": 760800,
        "witak20ft": 558000,
        "user20ft": 599600,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "삼청동",
        "distanceKm": 443,
        "witak40ft": 636900,
        "user40ft": 682600,
        "woonsong40ft": 762600,
        "witak20ft": 559100,
        "user20ft": 600800,
        "woonsong20ft": 674000
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "부암동",
        "distanceKm": 447,
        "witak40ft": 641200,
        "user40ft": 687000,
        "woonsong40ft": 767200,
        "witak20ft": 562500,
        "user20ft": 604200,
        "woonsong20ft": 677400
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "평창동",
        "distanceKm": 447,
        "witak40ft": 642600,
        "user40ft": 688500,
        "woonsong40ft": 768900,
        "witak20ft": 563500,
        "user20ft": 605300,
        "woonsong20ft": 678600
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "무악동",
        "distanceKm": 443,
        "witak40ft": 636100,
        "user40ft": 681800,
        "woonsong40ft": 761700,
        "witak20ft": 558600,
        "user20ft": 600300,
        "woonsong20ft": 673400
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "교남동",
        "distanceKm": 441,
        "witak40ft": 633500,
        "user40ft": 679100,
        "woonsong40ft": 759000,
        "witak20ft": 556700,
        "user20ft": 598300,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "가회동",
        "distanceKm": 440,
        "witak40ft": 633300,
        "user40ft": 679000,
        "woonsong40ft": 759000,
        "witak20ft": 556500,
        "user20ft": 598100,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "종로1234가 동",
        "distanceKm": 440,
        "witak40ft": 634200,
        "user40ft": 679900,
        "woonsong40ft": 759800,
        "witak20ft": 557200,
        "user20ft": 598800,
        "woonsong20ft": 671800
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "종로56가동",
        "distanceKm": 442,
        "witak40ft": 635100,
        "user40ft": 680800,
        "woonsong40ft": 760800,
        "witak20ft": 558000,
        "user20ft": 599600,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "이화동",
        "distanceKm": 440,
        "witak40ft": 633300,
        "user40ft": 679000,
        "woonsong40ft": 759000,
        "witak20ft": 556500,
        "user20ft": 598100,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "창신1동",
        "distanceKm": 439,
        "witak40ft": 631700,
        "user40ft": 677300,
        "woonsong40ft": 757200,
        "witak20ft": 555300,
        "user20ft": 596900,
        "woonsong20ft": 669800
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "창신2동",
        "distanceKm": 440,
        "witak40ft": 633300,
        "user40ft": 679000,
        "woonsong40ft": 759000,
        "witak20ft": 556500,
        "user20ft": 598100,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "창신3동",
        "distanceKm": 442,
        "witak40ft": 635800,
        "user40ft": 681500,
        "woonsong40ft": 761600,
        "witak20ft": 558400,
        "user20ft": 600100,
        "woonsong20ft": 673200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "숭인1동",
        "distanceKm": 440,
        "witak40ft": 633300,
        "user40ft": 679000,
        "woonsong40ft": 759000,
        "witak20ft": 556500,
        "user20ft": 598100,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "숭인2동",
        "distanceKm": 443,
        "witak40ft": 635100,
        "user40ft": 680800,
        "woonsong40ft": 760800,
        "witak20ft": 558000,
        "user20ft": 599600,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "청운효자동",
        "distanceKm": 442,
        "witak40ft": 635100,
        "user40ft": 680800,
        "woonsong40ft": 760800,
        "witak20ft": 558000,
        "user20ft": 599600,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "종로구",
        "dong": "혜화동",
        "distanceKm": 442,
        "witak40ft": 637600,
        "user40ft": 683300,
        "woonsong40ft": 763400,
        "witak20ft": 559600,
        "user20ft": 601400,
        "woonsong20ft": 674600
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "소공동",
        "distanceKm": 438,
        "witak40ft": 630900,
        "user40ft": 676500,
        "woonsong40ft": 756300,
        "witak20ft": 554800,
        "user20ft": 596300,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "회현동",
        "distanceKm": 437,
        "witak40ft": 628400,
        "user40ft": 673900,
        "woonsong40ft": 753500,
        "witak20ft": 552900,
        "user20ft": 594400,
        "woonsong20ft": 667200
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "명동",
        "distanceKm": 438,
        "witak40ft": 630000,
        "user40ft": 675600,
        "woonsong40ft": 755300,
        "witak20ft": 554100,
        "user20ft": 595700,
        "woonsong20ft": 668600
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "필동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "장충동",
        "distanceKm": 438,
        "witak40ft": 630700,
        "user40ft": 676300,
        "woonsong40ft": 756200,
        "witak20ft": 554600,
        "user20ft": 596200,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "광희동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "을지로동",
        "distanceKm": 438,
        "witak40ft": 630700,
        "user40ft": 676300,
        "woonsong40ft": 756200,
        "witak20ft": 554600,
        "user20ft": 596200,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "신당5동",
        "distanceKm": 438,
        "witak40ft": 631700,
        "user40ft": 677300,
        "woonsong40ft": 757200,
        "witak20ft": 555300,
        "user20ft": 596900,
        "woonsong20ft": 669800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "황학동",
        "distanceKm": 439,
        "witak40ft": 631700,
        "user40ft": 677300,
        "woonsong40ft": 757200,
        "witak20ft": 555300,
        "user20ft": 596900,
        "woonsong20ft": 669800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "중림동",
        "distanceKm": 444,
        "witak40ft": 633800,
        "user40ft": 679400,
        "woonsong40ft": 759100,
        "witak20ft": 557200,
        "user20ft": 598700,
        "woonsong20ft": 671500
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "신당동",
        "distanceKm": 439,
        "witak40ft": 631700,
        "user40ft": 677300,
        "woonsong40ft": 757200,
        "witak20ft": 555300,
        "user20ft": 596900,
        "woonsong20ft": 669800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "다산동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "약수동",
        "distanceKm": 435,
        "witak40ft": 625600,
        "user40ft": 671100,
        "woonsong40ft": 750800,
        "witak20ft": 550600,
        "user20ft": 592100,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "청구동",
        "distanceKm": 436,
        "witak40ft": 628100,
        "user40ft": 673700,
        "woonsong40ft": 753500,
        "witak20ft": 552700,
        "user20ft": 594300,
        "woonsong20ft": 667200
      },
      {
        "city": "서울특별시",
        "gu": "중구",
        "dong": "동화동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "후암동",
        "distanceKm": 439,
        "witak40ft": 630200,
        "user40ft": 675700,
        "woonsong40ft": 755300,
        "witak20ft": 554300,
        "user20ft": 595800,
        "woonsong20ft": 668600
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "용산2가동",
        "distanceKm": 435,
        "witak40ft": 625000,
        "user40ft": 670400,
        "woonsong40ft": 750000,
        "witak20ft": 550400,
        "user20ft": 591800,
        "woonsong20ft": 664500
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "남영동",
        "distanceKm": 437,
        "witak40ft": 627500,
        "user40ft": 673000,
        "woonsong40ft": 752600,
        "witak20ft": 552400,
        "user20ft": 593900,
        "woonsong20ft": 666600
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "원효로2동",
        "distanceKm": 438,
        "witak40ft": 627800,
        "user40ft": 673200,
        "woonsong40ft": 752700,
        "witak20ft": 552700,
        "user20ft": 594100,
        "woonsong20ft": 666700
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "효창동",
        "distanceKm": 438,
        "witak40ft": 627500,
        "user40ft": 673000,
        "woonsong40ft": 752600,
        "witak20ft": 552400,
        "user20ft": 593900,
        "woonsong20ft": 666600
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "용문동",
        "distanceKm": 440,
        "witak40ft": 629600,
        "user40ft": 675000,
        "woonsong40ft": 754500,
        "witak20ft": 554100,
        "user20ft": 595500,
        "woonsong20ft": 668100
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "이촌1동",
        "distanceKm": 435,
        "witak40ft": 625000,
        "user40ft": 670400,
        "woonsong40ft": 750000,
        "witak20ft": 550400,
        "user20ft": 591800,
        "woonsong20ft": 664500
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "이촌2동",
        "distanceKm": 438,
        "witak40ft": 627800,
        "user40ft": 673200,
        "woonsong40ft": 752700,
        "witak20ft": 552700,
        "user20ft": 594100,
        "woonsong20ft": 666700
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "이태원1동",
        "distanceKm": 432,
        "witak40ft": 621400,
        "user40ft": 666800,
        "woonsong40ft": 746200,
        "witak20ft": 547700,
        "user20ft": 589100,
        "woonsong20ft": 661700
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "이태원2동",
        "distanceKm": 434,
        "witak40ft": 624000,
        "user40ft": 669400,
        "woonsong40ft": 749000,
        "witak20ft": 549700,
        "user20ft": 591100,
        "woonsong20ft": 663800
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "서빙고동",
        "distanceKm": 428,
        "witak40ft": 617900,
        "user40ft": 663200,
        "woonsong40ft": 742600,
        "witak20ft": 545200,
        "user20ft": 586500,
        "woonsong20ft": 659000
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "보광동",
        "distanceKm": 433,
        "witak40ft": 622400,
        "user40ft": 667700,
        "woonsong40ft": 747100,
        "witak20ft": 548500,
        "user20ft": 589800,
        "woonsong20ft": 662400
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "청파동",
        "distanceKm": 438,
        "witak40ft": 629200,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553700,
        "user20ft": 595200,
        "woonsong20ft": 668000
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "원효로1동",
        "distanceKm": 440,
        "witak40ft": 629600,
        "user40ft": 675000,
        "woonsong40ft": 754500,
        "witak20ft": 554100,
        "user20ft": 595500,
        "woonsong20ft": 668100
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "한강로동",
        "distanceKm": 435,
        "witak40ft": 625000,
        "user40ft": 670400,
        "woonsong40ft": 750000,
        "witak20ft": 550400,
        "user20ft": 591800,
        "woonsong20ft": 664500
      },
      {
        "city": "서울특별시",
        "gu": "용산구",
        "dong": "한남동",
        "distanceKm": 430,
        "witak40ft": 620300,
        "user40ft": 665700,
        "woonsong40ft": 745300,
        "witak20ft": 546800,
        "user20ft": 588200,
        "woonsong20ft": 660900
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "왕십리2동",
        "distanceKm": 437,
        "witak40ft": 628100,
        "user40ft": 673700,
        "woonsong40ft": 753500,
        "witak20ft": 552700,
        "user20ft": 594300,
        "woonsong20ft": 667200
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "마장동",
        "distanceKm": 442,
        "witak40ft": 635800,
        "user40ft": 681500,
        "woonsong40ft": 761600,
        "witak20ft": 558400,
        "user20ft": 600100,
        "woonsong20ft": 673200
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "사근동",
        "distanceKm": 438,
        "witak40ft": 631500,
        "user40ft": 677200,
        "woonsong40ft": 757100,
        "witak20ft": 555000,
        "user20ft": 596600,
        "woonsong20ft": 669700
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "행당1동",
        "distanceKm": 437,
        "witak40ft": 629800,
        "user40ft": 675400,
        "woonsong40ft": 755200,
        "witak20ft": 553900,
        "user20ft": 595500,
        "woonsong20ft": 668400
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "행당2동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "응봉동",
        "distanceKm": 436,
        "witak40ft": 626400,
        "user40ft": 672000,
        "woonsong40ft": 751700,
        "witak20ft": 551400,
        "user20ft": 592900,
        "woonsong20ft": 665800
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "금호1가동",
        "distanceKm": 437,
        "witak40ft": 629100,
        "user40ft": 674700,
        "woonsong40ft": 754400,
        "witak20ft": 553400,
        "user20ft": 594900,
        "woonsong20ft": 667800
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "금호4가동",
        "distanceKm": 434,
        "witak40ft": 625600,
        "user40ft": 671100,
        "woonsong40ft": 750800,
        "witak20ft": 550600,
        "user20ft": 592100,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "성수1가1동",
        "distanceKm": 434,
        "witak40ft": 626300,
        "user40ft": 671900,
        "woonsong40ft": 751700,
        "witak20ft": 551100,
        "user20ft": 592600,
        "woonsong20ft": 665500
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "성수1가2동",
        "distanceKm": 434,
        "witak40ft": 626300,
        "user40ft": 671900,
        "woonsong40ft": 751700,
        "witak20ft": 551100,
        "user20ft": 592600,
        "woonsong20ft": 665500
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "성수2가1동",
        "distanceKm": 433,
        "witak40ft": 625300,
        "user40ft": 670900,
        "woonsong40ft": 750700,
        "witak20ft": 550500,
        "user20ft": 592000,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "성수2가3동",
        "distanceKm": 435,
        "witak40ft": 627900,
        "user40ft": 673600,
        "woonsong40ft": 753500,
        "witak20ft": 552400,
        "user20ft": 594000,
        "woonsong20ft": 667000
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "송정동",
        "distanceKm": 436,
        "witak40ft": 627900,
        "user40ft": 673600,
        "woonsong40ft": 753500,
        "witak20ft": 552400,
        "user20ft": 594000,
        "woonsong20ft": 667000
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "용답동",
        "distanceKm": 435,
        "witak40ft": 630300,
        "user40ft": 676000,
        "woonsong40ft": 756100,
        "witak20ft": 553900,
        "user20ft": 595600,
        "woonsong20ft": 668700
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "왕십리도선 동",
        "distanceKm": 440,
        "witak40ft": 632400,
        "user40ft": 678100,
        "woonsong40ft": 758100,
        "witak20ft": 555800,
        "user20ft": 597400,
        "woonsong20ft": 670400
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "금호23가동",
        "distanceKm": 436,
        "witak40ft": 627300,
        "user40ft": 672900,
        "woonsong40ft": 752600,
        "witak20ft": 552200,
        "user20ft": 593700,
        "woonsong20ft": 666500
      },
      {
        "city": "서울특별시",
        "gu": "성동구",
        "dong": "옥수동",
        "distanceKm": 434,
        "witak40ft": 624700,
        "user40ft": 670200,
        "woonsong40ft": 749900,
        "witak20ft": 550100,
        "user20ft": 591600,
        "woonsong20ft": 664300
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "화양동",
        "distanceKm": 431,
        "witak40ft": 624300,
        "user40ft": 669900,
        "woonsong40ft": 749700,
        "witak20ft": 549500,
        "user20ft": 591100,
        "woonsong20ft": 664000
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "군자동",
        "distanceKm": 431,
        "witak40ft": 625000,
        "user40ft": 670700,
        "woonsong40ft": 750600,
        "witak20ft": 550000,
        "user20ft": 591600,
        "woonsong20ft": 664600
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "중곡1동",
        "distanceKm": 432,
        "witak40ft": 626600,
        "user40ft": 672300,
        "woonsong40ft": 752400,
        "witak20ft": 551200,
        "user20ft": 592800,
        "woonsong20ft": 665900
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "중곡2동",
        "distanceKm": 431,
        "witak40ft": 626600,
        "user40ft": 672300,
        "woonsong40ft": 752400,
        "witak20ft": 551200,
        "user20ft": 592800,
        "woonsong20ft": 665900
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "중곡3동",
        "distanceKm": 433,
        "witak40ft": 627600,
        "user40ft": 673300,
        "woonsong40ft": 753400,
        "witak20ft": 551900,
        "user20ft": 593600,
        "woonsong20ft": 666700
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "중곡4동",
        "distanceKm": 432,
        "witak40ft": 627400,
        "user40ft": 673200,
        "woonsong40ft": 753400,
        "witak20ft": 551600,
        "user20ft": 593300,
        "woonsong20ft": 666400
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "능동",
        "distanceKm": 432,
        "witak40ft": 626600,
        "user40ft": 672300,
        "woonsong40ft": 752400,
        "witak20ft": 551200,
        "user20ft": 592800,
        "woonsong20ft": 665900
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "구의1동",
        "distanceKm": 433,
        "witak40ft": 628500,
        "user40ft": 674200,
        "woonsong40ft": 754300,
        "witak20ft": 552600,
        "user20ft": 594300,
        "woonsong20ft": 667500
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "구의2동",
        "distanceKm": 431,
        "witak40ft": 624900,
        "user40ft": 670600,
        "woonsong40ft": 750700,
        "witak20ft": 549700,
        "user20ft": 591300,
        "woonsong20ft": 664400
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "구의3동",
        "distanceKm": 432,
        "witak40ft": 625800,
        "user40ft": 671500,
        "woonsong40ft": 751600,
        "witak20ft": 550400,
        "user20ft": 592100,
        "woonsong20ft": 665200
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "광장동",
        "distanceKm": 431,
        "witak40ft": 627200,
        "user40ft": 673000,
        "woonsong40ft": 753300,
        "witak20ft": 551400,
        "user20ft": 593100,
        "woonsong20ft": 666400
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "자양1동",
        "distanceKm": 431,
        "witak40ft": 624300,
        "user40ft": 669900,
        "woonsong40ft": 749700,
        "witak20ft": 549500,
        "user20ft": 591100,
        "woonsong20ft": 664000
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "자양2동",
        "distanceKm": 431,
        "witak40ft": 624300,
        "user40ft": 669900,
        "woonsong40ft": 749700,
        "witak20ft": 549500,
        "user20ft": 591100,
        "woonsong20ft": 664000
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "자양3동",
        "distanceKm": 433,
        "witak40ft": 625300,
        "user40ft": 670900,
        "woonsong40ft": 750700,
        "witak20ft": 550500,
        "user20ft": 592000,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "광진구",
        "dong": "자양4동",
        "distanceKm": 433,
        "witak40ft": 625300,
        "user40ft": 670900,
        "woonsong40ft": 750700,
        "witak20ft": 550500,
        "user20ft": 592000,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "회기동",
        "distanceKm": 436,
        "witak40ft": 631800,
        "user40ft": 677600,
        "woonsong40ft": 757900,
        "witak20ft": 555100,
        "user20ft": 596800,
        "woonsong20ft": 670100
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "휘경1동",
        "distanceKm": 437,
        "witak40ft": 635800,
        "user40ft": 681800,
        "woonsong40ft": 762300,
        "witak20ft": 558300,
        "user20ft": 600200,
        "woonsong20ft": 673600
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "휘경2동",
        "distanceKm": 435,
        "witak40ft": 631700,
        "user40ft": 677600,
        "woonsong40ft": 757900,
        "witak20ft": 554800,
        "user20ft": 596600,
        "woonsong20ft": 669900
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "청량리동",
        "distanceKm": 442,
        "witak40ft": 635700,
        "user40ft": 681500,
        "woonsong40ft": 761600,
        "witak20ft": 558200,
        "user20ft": 599900,
        "woonsong20ft": 673100
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "용신동",
        "distanceKm": 436,
        "witak40ft": 630400,
        "user40ft": 676100,
        "woonsong40ft": 756100,
        "witak20ft": 554100,
        "user20ft": 595800,
        "woonsong20ft": 668900
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "제기동",
        "distanceKm": 440,
        "witak40ft": 634000,
        "user40ft": 679800,
        "woonsong40ft": 759900,
        "witak20ft": 556900,
        "user20ft": 598600,
        "woonsong20ft": 671700
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "전농1동",
        "distanceKm": 437,
        "witak40ft": 632000,
        "user40ft": 677800,
        "woonsong40ft": 758000,
        "witak20ft": 555400,
        "user20ft": 597100,
        "woonsong20ft": 670200
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "전농2동",
        "distanceKm": 433,
        "witak40ft": 630000,
        "user40ft": 675800,
        "woonsong40ft": 756000,
        "witak20ft": 553600,
        "user20ft": 595300,
        "woonsong20ft": 668600
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "답십리2동",
        "distanceKm": 435,
        "witak40ft": 630300,
        "user40ft": 676000,
        "woonsong40ft": 756100,
        "witak20ft": 553900,
        "user20ft": 595600,
        "woonsong20ft": 668700
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "장안1동",
        "distanceKm": 434,
        "witak40ft": 628500,
        "user40ft": 674200,
        "woonsong40ft": 754300,
        "witak20ft": 552600,
        "user20ft": 594300,
        "woonsong20ft": 667500
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "장안2동",
        "distanceKm": 433,
        "witak40ft": 629000,
        "user40ft": 674800,
        "woonsong40ft": 755100,
        "witak20ft": 552800,
        "user20ft": 594600,
        "woonsong20ft": 667900
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "이문1동",
        "distanceKm": 438,
        "witak40ft": 635800,
        "user40ft": 681800,
        "woonsong40ft": 762300,
        "witak20ft": 558300,
        "user20ft": 600200,
        "woonsong20ft": 673600
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "이문2동",
        "distanceKm": 441,
        "witak40ft": 638600,
        "user40ft": 684600,
        "woonsong40ft": 765100,
        "witak20ft": 560500,
        "user20ft": 602400,
        "woonsong20ft": 675900
      },
      {
        "city": "서울특별시",
        "gu": "동대문구",
        "dong": "답십리1동",
        "distanceKm": 435,
        "witak40ft": 629500,
        "user40ft": 675200,
        "woonsong40ft": 755200,
        "witak20ft": 553500,
        "user20ft": 595100,
        "woonsong20ft": 668200
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목2동",
        "distanceKm": 434,
        "witak40ft": 630700,
        "user40ft": 676500,
        "woonsong40ft": 756800,
        "witak20ft": 554100,
        "user20ft": 595900,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목4동",
        "distanceKm": 432,
        "witak40ft": 627400,
        "user40ft": 673200,
        "woonsong40ft": 753400,
        "witak20ft": 551600,
        "user20ft": 593300,
        "woonsong20ft": 666400
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목5동",
        "distanceKm": 432,
        "witak40ft": 628200,
        "user40ft": 674000,
        "woonsong40ft": 754200,
        "witak20ft": 552100,
        "user20ft": 593800,
        "woonsong20ft": 667000
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목7동",
        "distanceKm": 433,
        "witak40ft": 627400,
        "user40ft": 673200,
        "woonsong40ft": 753400,
        "witak20ft": 551600,
        "user20ft": 593300,
        "woonsong20ft": 666400
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "상봉1동",
        "distanceKm": 440,
        "witak40ft": 639100,
        "user40ft": 685200,
        "woonsong40ft": 765800,
        "witak20ft": 561200,
        "user20ft": 603200,
        "woonsong20ft": 676800
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "상봉2동",
        "distanceKm": 434,
        "witak40ft": 630700,
        "user40ft": 676500,
        "woonsong40ft": 756800,
        "witak20ft": 554100,
        "user20ft": 595900,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "중화1동",
        "distanceKm": 436,
        "witak40ft": 633300,
        "user40ft": 679200,
        "woonsong40ft": 759700,
        "witak20ft": 556200,
        "user20ft": 598000,
        "woonsong20ft": 671400
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "중화2동",
        "distanceKm": 435,
        "witak40ft": 631700,
        "user40ft": 677600,
        "woonsong40ft": 757900,
        "witak20ft": 554800,
        "user20ft": 596600,
        "woonsong20ft": 669900
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "묵1동",
        "distanceKm": 441,
        "witak40ft": 641700,
        "user40ft": 687800,
        "woonsong40ft": 768600,
        "witak20ft": 563300,
        "user20ft": 605300,
        "woonsong20ft": 679000
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "묵2동",
        "distanceKm": 441,
        "witak40ft": 640000,
        "user40ft": 686100,
        "woonsong40ft": 766800,
        "witak20ft": 562000,
        "user20ft": 603900,
        "woonsong20ft": 677500
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "망우3동",
        "distanceKm": 438,
        "witak40ft": 635100,
        "user40ft": 681000,
        "woonsong40ft": 761400,
        "witak20ft": 557600,
        "user20ft": 599400,
        "woonsong20ft": 672800
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "신내1동",
        "distanceKm": 440,
        "witak40ft": 639800,
        "user40ft": 685900,
        "woonsong40ft": 766700,
        "witak20ft": 561800,
        "user20ft": 603800,
        "woonsong20ft": 677600
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "신내2동",
        "distanceKm": 440,
        "witak40ft": 639100,
        "user40ft": 685200,
        "woonsong40ft": 765800,
        "witak20ft": 561200,
        "user20ft": 603200,
        "woonsong20ft": 676800
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목본동",
        "distanceKm": 432,
        "witak40ft": 629700,
        "user40ft": 675600,
        "woonsong40ft": 755900,
        "witak20ft": 553300,
        "user20ft": 595100,
        "woonsong20ft": 668500
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "면목38동",
        "distanceKm": 433,
        "witak40ft": 630600,
        "user40ft": 676500,
        "woonsong40ft": 756800,
        "witak20ft": 553900,
        "user20ft": 595700,
        "woonsong20ft": 669200
      },
      {
        "city": "서울특별시",
        "gu": "중랑구",
        "dong": "망우본동",
        "distanceKm": 437,
        "witak40ft": 636300,
        "user40ft": 682400,
        "woonsong40ft": 763000,
        "witak20ft": 559000,
        "user20ft": 601000,
        "woonsong20ft": 674600
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "돈암1동",
        "distanceKm": 443,
        "witak40ft": 639700,
        "user40ft": 685600,
        "woonsong40ft": 766000,
        "witak20ft": 561300,
        "user20ft": 603100,
        "woonsong20ft": 676500
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "돈암2동",
        "distanceKm": 443,
        "witak40ft": 639900,
        "user40ft": 685800,
        "woonsong40ft": 766100,
        "witak20ft": 561300,
        "user20ft": 603100,
        "woonsong20ft": 676400
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "안암동",
        "distanceKm": 442,
        "witak40ft": 635700,
        "user40ft": 681500,
        "woonsong40ft": 761600,
        "witak20ft": 558200,
        "user20ft": 599900,
        "woonsong20ft": 673100
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "보문동",
        "distanceKm": 440,
        "witak40ft": 633300,
        "user40ft": 679000,
        "woonsong40ft": 759000,
        "witak20ft": 556500,
        "user20ft": 598100,
        "woonsong20ft": 671200
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "정릉1동",
        "distanceKm": 443,
        "witak40ft": 639700,
        "user40ft": 685600,
        "woonsong40ft": 766000,
        "witak20ft": 561300,
        "user20ft": 603100,
        "woonsong20ft": 676500
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "정릉2동",
        "distanceKm": 445,
        "witak40ft": 642300,
        "user40ft": 688300,
        "woonsong40ft": 768800,
        "witak20ft": 563400,
        "user20ft": 605300,
        "woonsong20ft": 678700
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "정릉3동",
        "distanceKm": 446,
        "witak40ft": 644800,
        "user40ft": 690800,
        "woonsong40ft": 771400,
        "witak20ft": 565600,
        "user20ft": 607500,
        "woonsong20ft": 681000
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "정릉4동",
        "distanceKm": 446,
        "witak40ft": 643100,
        "user40ft": 689100,
        "woonsong40ft": 769600,
        "witak20ft": 564200,
        "user20ft": 606100,
        "woonsong20ft": 679500
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "길음1동",
        "distanceKm": 444,
        "witak40ft": 641300,
        "user40ft": 687300,
        "woonsong40ft": 767800,
        "witak20ft": 562800,
        "user20ft": 604700,
        "woonsong20ft": 678100
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "길음2동",
        "distanceKm": 444,
        "witak40ft": 640400,
        "user40ft": 686400,
        "woonsong40ft": 766900,
        "witak20ft": 562000,
        "user20ft": 603900,
        "woonsong20ft": 677300
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "월곡1동",
        "distanceKm": 443,
        "witak40ft": 640400,
        "user40ft": 686400,
        "woonsong40ft": 766900,
        "witak20ft": 562000,
        "user20ft": 603900,
        "woonsong20ft": 677300
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "월곡2동",
        "distanceKm": 459,
        "witak40ft": 660000,
        "user40ft": 706400,
        "woonsong40ft": 787600,
        "witak20ft": 578400,
        "user20ft": 620600,
        "woonsong20ft": 694600
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "장위1동",
        "distanceKm": 445,
        "witak40ft": 643000,
        "user40ft": 689000,
        "woonsong40ft": 769600,
        "witak20ft": 564100,
        "user20ft": 606000,
        "woonsong20ft": 679600
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "장위2동",
        "distanceKm": 442,
        "witak40ft": 639300,
        "user40ft": 685300,
        "woonsong40ft": 765900,
        "witak20ft": 561200,
        "user20ft": 603200,
        "woonsong20ft": 676800
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "장위3동",
        "distanceKm": 443,
        "witak40ft": 641900,
        "user40ft": 688000,
        "woonsong40ft": 768700,
        "witak20ft": 563400,
        "user20ft": 605300,
        "woonsong20ft": 678900
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "성북동",
        "distanceKm": 444,
        "witak40ft": 639200,
        "user40ft": 685100,
        "woonsong40ft": 765300,
        "witak20ft": 560800,
        "user20ft": 602600,
        "woonsong20ft": 675800
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "삼선동",
        "distanceKm": 441,
        "witak40ft": 636600,
        "user40ft": 682400,
        "woonsong40ft": 762500,
        "witak20ft": 558800,
        "user20ft": 600600,
        "woonsong20ft": 673800
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "동선동",
        "distanceKm": 442,
        "witak40ft": 636600,
        "user40ft": 682400,
        "woonsong40ft": 762500,
        "witak20ft": 558800,
        "user20ft": 600600,
        "woonsong20ft": 673800
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "종암동",
        "distanceKm": 441,
        "witak40ft": 636400,
        "user40ft": 682200,
        "woonsong40ft": 762500,
        "witak20ft": 558700,
        "user20ft": 600500,
        "woonsong20ft": 673700
      },
      {
        "city": "서울특별시",
        "gu": "성북구",
        "dong": "석관동",
        "distanceKm": 445,
        "witak40ft": 642000,
        "user40ft": 688100,
        "woonsong40ft": 768700,
        "witak20ft": 563400,
        "user20ft": 605300,
        "woonsong20ft": 678800
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "번1동",
        "distanceKm": 450,
        "witak40ft": 649000,
        "user40ft": 695200,
        "woonsong40ft": 775900,
        "witak20ft": 569200,
        "user20ft": 611200,
        "woonsong20ft": 684800
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "번2동",
        "distanceKm": 446,
        "witak40ft": 645300,
        "user40ft": 691500,
        "woonsong40ft": 772300,
        "witak20ft": 566300,
        "user20ft": 608300,
        "woonsong20ft": 682000
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "번3동",
        "distanceKm": 445,
        "witak40ft": 642800,
        "user40ft": 688900,
        "woonsong40ft": 769500,
        "witak20ft": 564100,
        "user20ft": 606100,
        "woonsong20ft": 679700
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "수유1동",
        "distanceKm": 450,
        "witak40ft": 649900,
        "user40ft": 696100,
        "woonsong40ft": 776800,
        "witak20ft": 569900,
        "user20ft": 611900,
        "woonsong20ft": 685600
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "수유2동",
        "distanceKm": 452,
        "witak40ft": 651600,
        "user40ft": 697800,
        "woonsong40ft": 778600,
        "witak20ft": 571300,
        "user20ft": 613400,
        "woonsong20ft": 687100
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "수유3동",
        "distanceKm": 450,
        "witak40ft": 649000,
        "user40ft": 695200,
        "woonsong40ft": 775900,
        "witak20ft": 569200,
        "user20ft": 611200,
        "woonsong20ft": 684800
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "삼양동",
        "distanceKm": 448,
        "witak40ft": 646500,
        "user40ft": 692600,
        "woonsong40ft": 773300,
        "witak20ft": 566900,
        "user20ft": 608900,
        "woonsong20ft": 682600
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "미아동",
        "distanceKm": 447,
        "witak40ft": 645600,
        "user40ft": 691700,
        "woonsong40ft": 772300,
        "witak20ft": 566300,
        "user20ft": 608300,
        "woonsong20ft": 681900
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "송중동",
        "distanceKm": 444,
        "witak40ft": 642000,
        "user40ft": 688100,
        "woonsong40ft": 768700,
        "witak20ft": 563400,
        "user20ft": 605300,
        "woonsong20ft": 678800
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "송천동",
        "distanceKm": 446,
        "witak40ft": 643900,
        "user40ft": 689900,
        "woonsong40ft": 770500,
        "witak20ft": 564800,
        "user20ft": 606700,
        "woonsong20ft": 680200
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "삼각산동",
        "distanceKm": 445,
        "witak40ft": 643000,
        "user40ft": 689000,
        "woonsong40ft": 769600,
        "witak20ft": 564100,
        "user20ft": 606000,
        "woonsong20ft": 679600
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "우이동",
        "distanceKm": 454,
        "witak40ft": 653200,
        "user40ft": 699500,
        "woonsong40ft": 780400,
        "witak20ft": 572700,
        "user20ft": 614800,
        "woonsong20ft": 688600
      },
      {
        "city": "서울특별시",
        "gu": "강북구",
        "dong": "인수동",
        "distanceKm": 455,
        "witak40ft": 655700,
        "user40ft": 702000,
        "woonsong40ft": 783000,
        "witak20ft": 574800,
        "user20ft": 617000,
        "woonsong20ft": 690900
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "쌍문1동",
        "distanceKm": 457,
        "witak40ft": 657700,
        "user40ft": 704000,
        "woonsong40ft": 784900,
        "witak20ft": 576200,
        "user20ft": 618400,
        "woonsong20ft": 692300
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "쌍문2동",
        "distanceKm": 458,
        "witak40ft": 659100,
        "user40ft": 705500,
        "woonsong40ft": 786600,
        "witak20ft": 577700,
        "user20ft": 619900,
        "woonsong20ft": 693800
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "쌍문3동",
        "distanceKm": 457,
        "witak40ft": 656800,
        "user40ft": 703100,
        "woonsong40ft": 784000,
        "witak20ft": 575500,
        "user20ft": 617600,
        "woonsong20ft": 691500
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "쌍문4동",
        "distanceKm": 460,
        "witak40ft": 661700,
        "user40ft": 708100,
        "woonsong40ft": 789200,
        "witak20ft": 579800,
        "user20ft": 622100,
        "woonsong20ft": 696200
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "방학1동",
        "distanceKm": 459,
        "witak40ft": 661500,
        "user40ft": 708000,
        "woonsong40ft": 789200,
        "witak20ft": 582500,
        "user20ft": 624800,
        "woonsong20ft": 699000
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "방학2동",
        "distanceKm": 461,
        "witak40ft": 663700,
        "user40ft": 710200,
        "woonsong40ft": 791500,
        "witak20ft": 584300,
        "user20ft": 626700,
        "woonsong20ft": 700900
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "방학3동",
        "distanceKm": 460,
        "witak40ft": 662400,
        "user40ft": 708900,
        "woonsong40ft": 790100,
        "witak20ft": 583200,
        "user20ft": 625500,
        "woonsong20ft": 699600
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "창1동",
        "distanceKm": 456,
        "witak40ft": 656800,
        "user40ft": 703100,
        "woonsong40ft": 784000,
        "witak20ft": 575500,
        "user20ft": 617600,
        "woonsong20ft": 691500
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "창2동",
        "distanceKm": 457,
        "witak40ft": 656100,
        "user40ft": 702300,
        "woonsong40ft": 783200,
        "witak20ft": 574900,
        "user20ft": 617000,
        "woonsong20ft": 690800
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "창3동",
        "distanceKm": 458,
        "witak40ft": 657700,
        "user40ft": 704000,
        "woonsong40ft": 784900,
        "witak20ft": 576200,
        "user20ft": 618400,
        "woonsong20ft": 692300
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "창4동",
        "distanceKm": 457,
        "witak40ft": 659100,
        "user40ft": 705500,
        "woonsong40ft": 786600,
        "witak20ft": 577700,
        "user20ft": 619900,
        "woonsong20ft": 693800
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "창5동",
        "distanceKm": 460,
        "witak40ft": 662400,
        "user40ft": 708900,
        "woonsong40ft": 790100,
        "witak20ft": 583200,
        "user20ft": 625500,
        "woonsong20ft": 699600
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "도봉1동",
        "distanceKm": 458,
        "witak40ft": 660900,
        "user40ft": 707400,
        "woonsong40ft": 788800,
        "witak20ft": 582200,
        "user20ft": 624600,
        "woonsong20ft": 698800
      },
      {
        "city": "서울특별시",
        "gu": "도봉구",
        "dong": "도봉2동",
        "distanceKm": 459,
        "witak40ft": 661500,
        "user40ft": 708000,
        "woonsong40ft": 789200,
        "witak20ft": 582500,
        "user20ft": 624800,
        "woonsong20ft": 699000
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "월계1동",
        "distanceKm": 445,
        "witak40ft": 643500,
        "user40ft": 689600,
        "woonsong40ft": 770300,
        "witak20ft": 564800,
        "user20ft": 606800,
        "woonsong20ft": 680500
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "월계2동",
        "distanceKm": 446,
        "witak40ft": 646000,
        "user40ft": 692200,
        "woonsong40ft": 773100,
        "witak20ft": 566900,
        "user20ft": 609000,
        "woonsong20ft": 682800
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "월계3동",
        "distanceKm": 442,
        "witak40ft": 641700,
        "user40ft": 687800,
        "woonsong40ft": 768600,
        "witak20ft": 563300,
        "user20ft": 605300,
        "woonsong20ft": 679000
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "공릉2동",
        "distanceKm": 441,
        "witak40ft": 640700,
        "user40ft": 686800,
        "woonsong40ft": 767600,
        "witak20ft": 562700,
        "user20ft": 604700,
        "woonsong20ft": 678300
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "하계1동",
        "distanceKm": 445,
        "witak40ft": 647400,
        "user40ft": 693700,
        "woonsong40ft": 774700,
        "witak20ft": 568200,
        "user20ft": 610400,
        "woonsong20ft": 684300
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "하계2동",
        "distanceKm": 445,
        "witak40ft": 645800,
        "user40ft": 692000,
        "woonsong40ft": 773000,
        "witak20ft": 566800,
        "user20ft": 608900,
        "woonsong20ft": 682800
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "중계본동",
        "distanceKm": 447,
        "witak40ft": 650000,
        "user40ft": 696300,
        "woonsong40ft": 777400,
        "witak20ft": 570500,
        "user20ft": 612700,
        "woonsong20ft": 686600
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "중계1동",
        "distanceKm": 449,
        "witak40ft": 651500,
        "user40ft": 697900,
        "woonsong40ft": 779100,
        "witak20ft": 571800,
        "user20ft": 614000,
        "woonsong20ft": 688100
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "중계4동",
        "distanceKm": 449,
        "witak40ft": 652500,
        "user40ft": 698900,
        "woonsong40ft": 780100,
        "witak20ft": 572600,
        "user20ft": 614800,
        "woonsong20ft": 688800
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계1동",
        "distanceKm": 458,
        "witak40ft": 661200,
        "user40ft": 707800,
        "woonsong40ft": 789300,
        "witak20ft": 582600,
        "user20ft": 625000,
        "woonsong20ft": 699300
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계2동",
        "distanceKm": 451,
        "witak40ft": 654100,
        "user40ft": 700500,
        "woonsong40ft": 781800,
        "witak20ft": 576700,
        "user20ft": 619000,
        "woonsong20ft": 693100
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계5동",
        "distanceKm": 452,
        "witak40ft": 655100,
        "user40ft": 701500,
        "woonsong40ft": 782800,
        "witak20ft": 577500,
        "user20ft": 619800,
        "woonsong20ft": 693900
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계8동",
        "distanceKm": 458,
        "witak40ft": 658800,
        "user40ft": 705300,
        "woonsong40ft": 786500,
        "witak20ft": 577700,
        "user20ft": 619900,
        "woonsong20ft": 693900
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계9동",
        "distanceKm": 458,
        "witak40ft": 660500,
        "user40ft": 707000,
        "woonsong40ft": 788300,
        "witak20ft": 581800,
        "user20ft": 624100,
        "woonsong20ft": 698200
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계10동",
        "distanceKm": 458,
        "witak40ft": 661500,
        "user40ft": 708000,
        "woonsong40ft": 789200,
        "witak20ft": 582500,
        "user20ft": 624800,
        "woonsong20ft": 699000
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계34동",
        "distanceKm": 453,
        "witak40ft": 656700,
        "user40ft": 703200,
        "woonsong40ft": 784700,
        "witak20ft": 579000,
        "user20ft": 621300,
        "woonsong20ft": 695600
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "상계67동",
        "distanceKm": 450,
        "witak40ft": 652500,
        "user40ft": 698900,
        "woonsong40ft": 780100,
        "witak20ft": 572600,
        "user20ft": 614800,
        "woonsong20ft": 688800
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "중계23동",
        "distanceKm": 446,
        "witak40ft": 648400,
        "user40ft": 694700,
        "woonsong40ft": 775700,
        "witak20ft": 569000,
        "user20ft": 611200,
        "woonsong20ft": 685100
      },
      {
        "city": "서울특별시",
        "gu": "노원구",
        "dong": "공릉1동",
        "distanceKm": 442,
        "witak40ft": 641700,
        "user40ft": 687800,
        "woonsong40ft": 768600,
        "witak20ft": 563300,
        "user20ft": 605300,
        "woonsong20ft": 679000
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "녹번동",
        "distanceKm": 452,
        "witak40ft": 646400,
        "user40ft": 692300,
        "woonsong40ft": 772600,
        "witak20ft": 566300,
        "user20ft": 608100,
        "woonsong20ft": 681500
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "불광1동",
        "distanceKm": 453,
        "witak40ft": 648900,
        "user40ft": 694800,
        "woonsong40ft": 775200,
        "witak20ft": 568500,
        "user20ft": 610300,
        "woonsong20ft": 683700
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "갈현1동",
        "distanceKm": 466,
        "witak40ft": 662300,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694800
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "갈현2동",
        "distanceKm": 455,
        "witak40ft": 650600,
        "user40ft": 696600,
        "woonsong40ft": 777000,
        "witak20ft": 569900,
        "user20ft": 611800,
        "woonsong20ft": 685100
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "구산동",
        "distanceKm": 454,
        "witak40ft": 649100,
        "user40ft": 695000,
        "woonsong40ft": 775300,
        "witak20ft": 568500,
        "user20ft": 610400,
        "woonsong20ft": 683700
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "대조동",
        "distanceKm": 454,
        "witak40ft": 649800,
        "user40ft": 695800,
        "woonsong40ft": 776200,
        "witak20ft": 569300,
        "user20ft": 611200,
        "woonsong20ft": 684500
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "응암1동",
        "distanceKm": 452,
        "witak40ft": 647200,
        "user40ft": 693100,
        "woonsong40ft": 773500,
        "witak20ft": 567000,
        "user20ft": 608900,
        "woonsong20ft": 682300
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "응암2동",
        "distanceKm": 452,
        "witak40ft": 646500,
        "user40ft": 692400,
        "woonsong40ft": 772600,
        "witak20ft": 566600,
        "user20ft": 608400,
        "woonsong20ft": 681700
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "신사1동",
        "distanceKm": 452,
        "witak40ft": 646500,
        "user40ft": 692400,
        "woonsong40ft": 772600,
        "witak20ft": 566600,
        "user20ft": 608400,
        "woonsong20ft": 681700
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "신사2동",
        "distanceKm": 455,
        "witak40ft": 648500,
        "user40ft": 694300,
        "woonsong40ft": 774500,
        "witak20ft": 568300,
        "user20ft": 610000,
        "woonsong20ft": 683200
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "증산동",
        "distanceKm": 453,
        "witak40ft": 645900,
        "user40ft": 691700,
        "woonsong40ft": 771800,
        "witak20ft": 566300,
        "user20ft": 608000,
        "woonsong20ft": 681200
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "수색동",
        "distanceKm": 454,
        "witak40ft": 647600,
        "user40ft": 693400,
        "woonsong40ft": 773500,
        "witak20ft": 567600,
        "user20ft": 609300,
        "woonsong20ft": 682500
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "진관동",
        "distanceKm": 469,
        "witak40ft": 667300,
        "user40ft": 713500,
        "woonsong40ft": 794200,
        "witak20ft": 583500,
        "user20ft": 625600,
        "woonsong20ft": 699200
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "불광2동",
        "distanceKm": 466,
        "witak40ft": 662300,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694800
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "응암3동",
        "distanceKm": 452,
        "witak40ft": 644900,
        "user40ft": 690700,
        "woonsong40ft": 770800,
        "witak20ft": 565400,
        "user20ft": 607200,
        "woonsong20ft": 680400
      },
      {
        "city": "서울특별시",
        "gu": "은평구",
        "dong": "역촌동",
        "distanceKm": 453,
        "witak40ft": 649100,
        "user40ft": 695000,
        "woonsong40ft": 775300,
        "witak20ft": 568500,
        "user20ft": 610400,
        "woonsong20ft": 683700
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "천연동",
        "distanceKm": 442,
        "witak40ft": 635100,
        "user40ft": 680800,
        "woonsong40ft": 760800,
        "witak20ft": 558000,
        "user20ft": 599600,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "홍제1동",
        "distanceKm": 449,
        "witak40ft": 643700,
        "user40ft": 689600,
        "woonsong40ft": 769800,
        "witak20ft": 564400,
        "user20ft": 606200,
        "woonsong20ft": 679400
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "홍제3동",
        "distanceKm": 449,
        "witak40ft": 643700,
        "user40ft": 689600,
        "woonsong40ft": 769800,
        "witak20ft": 564400,
        "user20ft": 606200,
        "woonsong20ft": 679400
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "홍제2동",
        "distanceKm": 448,
        "witak40ft": 641300,
        "user40ft": 687100,
        "woonsong40ft": 767200,
        "witak20ft": 562800,
        "user20ft": 604500,
        "woonsong20ft": 677500
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "홍은1동",
        "distanceKm": 451,
        "witak40ft": 646400,
        "user40ft": 692300,
        "woonsong40ft": 772600,
        "witak20ft": 566300,
        "user20ft": 608100,
        "woonsong20ft": 681500
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "홍은2동",
        "distanceKm": 453,
        "witak40ft": 645100,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565600,
        "user20ft": 607300,
        "woonsong20ft": 680400
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "남가좌1동",
        "distanceKm": 452,
        "witak40ft": 645100,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565600,
        "user20ft": 607300,
        "woonsong20ft": 680400
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "남가좌2동",
        "distanceKm": 453,
        "witak40ft": 646700,
        "user40ft": 692500,
        "woonsong40ft": 772700,
        "witak20ft": 566800,
        "user20ft": 608600,
        "woonsong20ft": 681800
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "북가좌1동",
        "distanceKm": 452,
        "witak40ft": 645100,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565600,
        "user20ft": 607300,
        "woonsong20ft": 680400
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "북가좌2동",
        "distanceKm": 453,
        "witak40ft": 645900,
        "user40ft": 691700,
        "woonsong40ft": 771800,
        "witak20ft": 566300,
        "user20ft": 608000,
        "woonsong20ft": 681200
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "충현동",
        "distanceKm": 441,
        "witak40ft": 632700,
        "user40ft": 678300,
        "woonsong40ft": 758100,
        "witak20ft": 556200,
        "user20ft": 597700,
        "woonsong20ft": 670600
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "북아현동",
        "distanceKm": 444,
        "witak40ft": 634600,
        "user40ft": 680200,
        "woonsong40ft": 759900,
        "witak20ft": 557900,
        "user20ft": 599400,
        "woonsong20ft": 672300
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "신촌동",
        "distanceKm": 444,
        "witak40ft": 634600,
        "user40ft": 680200,
        "woonsong40ft": 759900,
        "witak20ft": 557900,
        "user20ft": 599400,
        "woonsong20ft": 672300
      },
      {
        "city": "서울특별시",
        "gu": "서대문구",
        "dong": "연희동",
        "distanceKm": 450,
        "witak40ft": 644000,
        "user40ft": 689800,
        "woonsong40ft": 769900,
        "witak20ft": 564700,
        "user20ft": 606400,
        "woonsong20ft": 679500
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "용강동",
        "distanceKm": 440,
        "witak40ft": 629600,
        "user40ft": 675000,
        "woonsong40ft": 754500,
        "witak20ft": 554100,
        "user20ft": 595500,
        "woonsong20ft": 668100
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "대흥동",
        "distanceKm": 444,
        "witak40ft": 634600,
        "user40ft": 680200,
        "woonsong40ft": 759900,
        "witak20ft": 557900,
        "user20ft": 599400,
        "woonsong20ft": 672300
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "염리동",
        "distanceKm": 441,
        "witak40ft": 631200,
        "user40ft": 676700,
        "woonsong40ft": 756300,
        "witak20ft": 555300,
        "user20ft": 596800,
        "woonsong20ft": 669500
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "신수동",
        "distanceKm": 441,
        "witak40ft": 630500,
        "user40ft": 676000,
        "woonsong40ft": 755500,
        "witak20ft": 554800,
        "user20ft": 596200,
        "woonsong20ft": 668900
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "서교동",
        "distanceKm": 448,
        "witak40ft": 639900,
        "user40ft": 685600,
        "woonsong40ft": 765500,
        "witak20ft": 561800,
        "user20ft": 603400,
        "woonsong20ft": 676300
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "합정동",
        "distanceKm": 446,
        "witak40ft": 636600,
        "user40ft": 682100,
        "woonsong40ft": 761800,
        "witak20ft": 559400,
        "user20ft": 600900,
        "woonsong20ft": 673700
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "망원1동",
        "distanceKm": 448,
        "witak40ft": 640600,
        "user40ft": 686300,
        "woonsong40ft": 766300,
        "witak20ft": 562300,
        "user20ft": 603900,
        "woonsong20ft": 676900
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "망원2동",
        "distanceKm": 447,
        "witak40ft": 638300,
        "user40ft": 683900,
        "woonsong40ft": 763700,
        "witak20ft": 560600,
        "user20ft": 602200,
        "woonsong20ft": 675000
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "연남동",
        "distanceKm": 448,
        "witak40ft": 640800,
        "user40ft": 686500,
        "woonsong40ft": 766300,
        "witak20ft": 562500,
        "user20ft": 604100,
        "woonsong20ft": 677100
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "성산1동",
        "distanceKm": 448,
        "witak40ft": 639100,
        "user40ft": 684700,
        "woonsong40ft": 764500,
        "witak20ft": 561300,
        "user20ft": 602900,
        "woonsong20ft": 675700
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "성산2동",
        "distanceKm": 449,
        "witak40ft": 639100,
        "user40ft": 684700,
        "woonsong40ft": 764500,
        "witak20ft": 561300,
        "user20ft": 602900,
        "woonsong20ft": 675700
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "상암동",
        "distanceKm": 452,
        "witak40ft": 644300,
        "user40ft": 690000,
        "woonsong40ft": 770000,
        "witak20ft": 565200,
        "user20ft": 606900,
        "woonsong20ft": 679900
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "도화동",
        "distanceKm": 440,
        "witak40ft": 628600,
        "user40ft": 674000,
        "woonsong40ft": 753500,
        "witak20ft": 553300,
        "user20ft": 594700,
        "woonsong20ft": 667400
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "서강동",
        "distanceKm": 441,
        "witak40ft": 630500,
        "user40ft": 676000,
        "woonsong40ft": 755500,
        "witak20ft": 554800,
        "user20ft": 596200,
        "woonsong20ft": 668900
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "공덕동",
        "distanceKm": 443,
        "witak40ft": 633800,
        "user40ft": 679400,
        "woonsong40ft": 759100,
        "witak20ft": 557200,
        "user20ft": 598700,
        "woonsong20ft": 671500
      },
      {
        "city": "서울특별시",
        "gu": "마포구",
        "dong": "아현동",
        "distanceKm": 442,
        "witak40ft": 631200,
        "user40ft": 676700,
        "woonsong40ft": 756300,
        "witak20ft": 555300,
        "user20ft": 596800,
        "woonsong20ft": 669500
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "목1동",
        "distanceKm": 443,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "목2동",
        "distanceKm": 445,
        "witak40ft": 634000,
        "user40ft": 679500,
        "woonsong40ft": 759000,
        "witak20ft": 557600,
        "user20ft": 599100,
        "woonsong20ft": 671800
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "목3동",
        "distanceKm": 446,
        "witak40ft": 635100,
        "user40ft": 680500,
        "woonsong40ft": 760000,
        "witak20ft": 558400,
        "user20ft": 599800,
        "woonsong20ft": 672500
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "목4동",
        "distanceKm": 443,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월1동",
        "distanceKm": 448,
        "witak40ft": 636800,
        "user40ft": 682300,
        "woonsong40ft": 761900,
        "witak20ft": 559900,
        "user20ft": 601300,
        "woonsong20ft": 674000
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월2동",
        "distanceKm": 447,
        "witak40ft": 635200,
        "user40ft": 680600,
        "woonsong40ft": 760000,
        "witak20ft": 558600,
        "user20ft": 600000,
        "woonsong20ft": 672600
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월3동",
        "distanceKm": 450,
        "witak40ft": 638600,
        "user40ft": 684100,
        "woonsong40ft": 763600,
        "witak20ft": 561300,
        "user20ft": 602800,
        "woonsong20ft": 675400
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월4동",
        "distanceKm": 448,
        "witak40ft": 636100,
        "user40ft": 681500,
        "woonsong40ft": 760900,
        "witak20ft": 559400,
        "user20ft": 600800,
        "woonsong20ft": 673300
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월5동",
        "distanceKm": 450,
        "witak40ft": 638600,
        "user40ft": 684100,
        "woonsong40ft": 763600,
        "witak20ft": 561300,
        "user20ft": 602800,
        "woonsong20ft": 675400
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월6동",
        "distanceKm": 443,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신월7동",
        "distanceKm": 447,
        "witak40ft": 634500,
        "user40ft": 679800,
        "woonsong40ft": 759100,
        "witak20ft": 558100,
        "user20ft": 599500,
        "woonsong20ft": 672000
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정1동",
        "distanceKm": 443,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정2동",
        "distanceKm": 440,
        "witak40ft": 626600,
        "user40ft": 671800,
        "woonsong40ft": 750900,
        "witak20ft": 552000,
        "user20ft": 593300,
        "woonsong20ft": 665700
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정3동",
        "distanceKm": 441,
        "witak40ft": 628100,
        "user40ft": 673400,
        "woonsong40ft": 752600,
        "witak20ft": 553200,
        "user20ft": 594500,
        "woonsong20ft": 666900
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정6동",
        "distanceKm": 443,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정7동",
        "distanceKm": 440,
        "witak40ft": 627200,
        "user40ft": 672500,
        "woonsong40ft": 751700,
        "witak20ft": 552500,
        "user20ft": 593800,
        "woonsong20ft": 666300
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "목5동",
        "distanceKm": 445,
        "witak40ft": 633300,
        "user40ft": 678700,
        "woonsong40ft": 758200,
        "witak20ft": 557100,
        "user20ft": 598500,
        "woonsong20ft": 671100
      },
      {
        "city": "서울특별시",
        "gu": "양천구",
        "dong": "신정4동",
        "distanceKm": 442,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "염창동",
        "distanceKm": 447,
        "witak40ft": 637500,
        "user40ft": 683000,
        "woonsong40ft": 762700,
        "witak20ft": 560100,
        "user20ft": 601600,
        "woonsong20ft": 674400
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "등촌1동",
        "distanceKm": 451,
        "witak40ft": 642500,
        "user40ft": 688200,
        "woonsong40ft": 768100,
        "witak20ft": 563900,
        "user20ft": 605500,
        "woonsong20ft": 678500
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "등촌2동",
        "distanceKm": 445,
        "witak40ft": 633300,
        "user40ft": 678700,
        "woonsong40ft": 758200,
        "witak20ft": 557100,
        "user20ft": 598500,
        "woonsong20ft": 671100
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "등촌3동",
        "distanceKm": 453,
        "witak40ft": 645200,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565800,
        "user20ft": 607500,
        "woonsong20ft": 680600
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡본동",
        "distanceKm": 449,
        "witak40ft": 638500,
        "user40ft": 684000,
        "woonsong40ft": 763700,
        "witak20ft": 561000,
        "user20ft": 602500,
        "woonsong20ft": 675200
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡2동",
        "distanceKm": 444,
        "witak40ft": 632400,
        "user40ft": 677800,
        "woonsong40ft": 757300,
        "witak20ft": 556400,
        "user20ft": 597800,
        "woonsong20ft": 670300
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡3동",
        "distanceKm": 451,
        "witak40ft": 639400,
        "user40ft": 684900,
        "woonsong40ft": 764600,
        "witak20ft": 561800,
        "user20ft": 603300,
        "woonsong20ft": 676000
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡4동",
        "distanceKm": 444,
        "witak40ft": 632400,
        "user40ft": 677800,
        "woonsong40ft": 757300,
        "witak20ft": 556400,
        "user20ft": 597800,
        "woonsong20ft": 670300
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡6동",
        "distanceKm": 450,
        "witak40ft": 640200,
        "user40ft": 685700,
        "woonsong40ft": 765400,
        "witak20ft": 562300,
        "user20ft": 603800,
        "woonsong20ft": 676600
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡8동",
        "distanceKm": 447,
        "witak40ft": 635900,
        "user40ft": 681300,
        "woonsong40ft": 760800,
        "witak20ft": 559100,
        "user20ft": 600500,
        "woonsong20ft": 673200
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "가양1동",
        "distanceKm": 455,
        "witak40ft": 648500,
        "user40ft": 694300,
        "woonsong40ft": 774500,
        "witak20ft": 568300,
        "user20ft": 610000,
        "woonsong20ft": 683200
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "가양2동",
        "distanceKm": 452,
        "witak40ft": 644300,
        "user40ft": 690000,
        "woonsong40ft": 770000,
        "witak20ft": 565200,
        "user20ft": 606900,
        "woonsong20ft": 679900
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "가양3동",
        "distanceKm": 452,
        "witak40ft": 644300,
        "user40ft": 690000,
        "woonsong40ft": 770000,
        "witak20ft": 565200,
        "user20ft": 606900,
        "woonsong20ft": 679900
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "발산1동",
        "distanceKm": 453,
        "witak40ft": 641900,
        "user40ft": 687500,
        "woonsong40ft": 767200,
        "witak20ft": 563700,
        "user20ft": 605200,
        "woonsong20ft": 678000
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "공항동",
        "distanceKm": 457,
        "witak40ft": 648000,
        "user40ft": 693700,
        "woonsong40ft": 773600,
        "witak20ft": 568200,
        "user20ft": 609800,
        "woonsong20ft": 682800
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "방화1동",
        "distanceKm": 459,
        "witak40ft": 652200,
        "user40ft": 698000,
        "woonsong40ft": 778100,
        "witak20ft": 571100,
        "user20ft": 612900,
        "woonsong20ft": 686000
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "방화2동",
        "distanceKm": 458,
        "witak40ft": 649700,
        "user40ft": 695400,
        "woonsong40ft": 775400,
        "witak20ft": 569500,
        "user20ft": 611100,
        "woonsong20ft": 684100
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "방화3동",
        "distanceKm": 461,
        "witak40ft": 655500,
        "user40ft": 701400,
        "woonsong40ft": 781700,
        "witak20ft": 573500,
        "user20ft": 615400,
        "woonsong20ft": 688700
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "화곡1동",
        "distanceKm": 448,
        "witak40ft": 636800,
        "user40ft": 682300,
        "woonsong40ft": 761900,
        "witak20ft": 559900,
        "user20ft": 601300,
        "woonsong20ft": 674000
      },
      {
        "city": "서울특별시",
        "gu": "강서구",
        "dong": "우장산동",
        "distanceKm": 451,
        "witak40ft": 641100,
        "user40ft": 686700,
        "woonsong40ft": 766400,
        "witak20ft": 562900,
        "user20ft": 604400,
        "woonsong20ft": 677200
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "신도림동",
        "distanceKm": 438,
        "witak40ft": 624700,
        "user40ft": 670000,
        "woonsong40ft": 749200,
        "witak20ft": 550600,
        "user20ft": 591900,
        "woonsong20ft": 664300
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로1동",
        "distanceKm": 435,
        "witak40ft": 620900,
        "user40ft": 666000,
        "woonsong40ft": 745000,
        "witak20ft": 547400,
        "user20ft": 588600,
        "woonsong20ft": 660800
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로3동",
        "distanceKm": 434,
        "witak40ft": 620100,
        "user40ft": 665200,
        "woonsong40ft": 744200,
        "witak20ft": 546600,
        "user20ft": 587800,
        "woonsong20ft": 660000
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로4동",
        "distanceKm": 434,
        "witak40ft": 618900,
        "user40ft": 664000,
        "woonsong40ft": 742900,
        "witak20ft": 545500,
        "user20ft": 586600,
        "woonsong20ft": 658800
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로5동",
        "distanceKm": 437,
        "witak40ft": 623200,
        "user40ft": 668400,
        "woonsong40ft": 747600,
        "witak20ft": 549300,
        "user20ft": 590500,
        "woonsong20ft": 662800
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "고척1동",
        "distanceKm": 437,
        "witak40ft": 623200,
        "user40ft": 668400,
        "woonsong40ft": 747600,
        "witak20ft": 549300,
        "user20ft": 590500,
        "woonsong20ft": 662800
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "고척2동",
        "distanceKm": 439,
        "witak40ft": 626300,
        "user40ft": 671600,
        "woonsong40ft": 750800,
        "witak20ft": 551800,
        "user20ft": 593100,
        "woonsong20ft": 665500
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "개봉2동",
        "distanceKm": 439,
        "witak40ft": 625100,
        "user40ft": 670300,
        "woonsong40ft": 749400,
        "witak20ft": 550800,
        "user20ft": 592000,
        "woonsong20ft": 664300
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "개봉3동",
        "distanceKm": 438,
        "witak40ft": 624200,
        "user40ft": 669400,
        "woonsong40ft": 748500,
        "witak20ft": 550000,
        "user20ft": 591200,
        "woonsong20ft": 663400
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "오류1동",
        "distanceKm": 441,
        "witak40ft": 627200,
        "user40ft": 672500,
        "woonsong40ft": 751700,
        "witak20ft": 552500,
        "user20ft": 593800,
        "woonsong20ft": 666300
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "수궁동",
        "distanceKm": 442,
        "witak40ft": 629100,
        "user40ft": 674400,
        "woonsong40ft": 753600,
        "witak20ft": 553900,
        "user20ft": 595200,
        "woonsong20ft": 667700
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "가리봉동",
        "distanceKm": 431,
        "witak40ft": 615900,
        "user40ft": 660900,
        "woonsong40ft": 739800,
        "witak20ft": 542900,
        "user20ft": 583900,
        "woonsong20ft": 655900
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "구로2동",
        "distanceKm": 435,
        "witak40ft": 618900,
        "user40ft": 664000,
        "woonsong40ft": 742900,
        "witak20ft": 545500,
        "user20ft": 586600,
        "woonsong20ft": 658800
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "개봉1동",
        "distanceKm": 439,
        "witak40ft": 625500,
        "user40ft": 670800,
        "woonsong40ft": 750000,
        "witak20ft": 551300,
        "user20ft": 592600,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "오류2동",
        "distanceKm": 440,
        "witak40ft": 625100,
        "user40ft": 670300,
        "woonsong40ft": 749400,
        "witak20ft": 550800,
        "user20ft": 592000,
        "woonsong20ft": 664300
      },
      {
        "city": "서울특별시",
        "gu": "구로구",
        "dong": "항동",
        "distanceKm": 438,
        "witak40ft": 623200,
        "user40ft": 668400,
        "woonsong40ft": 747600,
        "witak20ft": 549300,
        "user20ft": 590500,
        "woonsong20ft": 662800
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "가산동",
        "distanceKm": 430,
        "witak40ft": 613300,
        "user40ft": 658200,
        "woonsong40ft": 736900,
        "witak20ft": 540200,
        "user20ft": 581300,
        "woonsong20ft": 653300
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "독산1동",
        "distanceKm": 426,
        "witak40ft": 607900,
        "user40ft": 652800,
        "woonsong40ft": 731300,
        "witak20ft": 535100,
        "user20ft": 576000,
        "woonsong20ft": 647800
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "독산2동",
        "distanceKm": 426,
        "witak40ft": 607900,
        "user40ft": 652800,
        "woonsong40ft": 731300,
        "witak20ft": 535100,
        "user20ft": 576000,
        "woonsong20ft": 647800
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "독산3동",
        "distanceKm": 429,
        "witak40ft": 610600,
        "user40ft": 655500,
        "woonsong40ft": 734200,
        "witak20ft": 537700,
        "user20ft": 578700,
        "woonsong20ft": 650600
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "독산4동",
        "distanceKm": 425,
        "witak40ft": 606200,
        "user40ft": 651000,
        "woonsong40ft": 729400,
        "witak20ft": 533100,
        "user20ft": 574000,
        "woonsong20ft": 645800
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "시흥1동",
        "distanceKm": 422,
        "witak40ft": 602700,
        "user40ft": 647400,
        "woonsong40ft": 725800,
        "witak20ft": 529800,
        "user20ft": 570700,
        "woonsong20ft": 642400
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "시흥2동",
        "distanceKm": 422,
        "witak40ft": 604400,
        "user40ft": 649200,
        "woonsong40ft": 727700,
        "witak20ft": 531700,
        "user20ft": 572600,
        "woonsong20ft": 644400
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "시흥3동",
        "distanceKm": 419,
        "witak40ft": 597300,
        "user40ft": 641900,
        "woonsong40ft": 720100,
        "witak20ft": 524600,
        "user20ft": 565300,
        "woonsong20ft": 636900
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "시흥4동",
        "distanceKm": 423,
        "witak40ft": 602700,
        "user40ft": 647400,
        "woonsong40ft": 725800,
        "witak20ft": 529800,
        "user20ft": 570700,
        "woonsong20ft": 642400
      },
      {
        "city": "서울특별시",
        "gu": "금천구",
        "dong": "시흥5동",
        "distanceKm": 422,
        "witak40ft": 602700,
        "user40ft": 647400,
        "woonsong40ft": 725800,
        "witak20ft": 529800,
        "user20ft": 570700,
        "woonsong20ft": 642400
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "여의동",
        "distanceKm": 434,
        "witak40ft": 621800,
        "user40ft": 667100,
        "woonsong40ft": 746300,
        "witak20ft": 548100,
        "user20ft": 589400,
        "woonsong20ft": 661900
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "당산1동",
        "distanceKm": 443,
        "witak40ft": 629900,
        "user40ft": 675200,
        "woonsong40ft": 754500,
        "witak20ft": 554700,
        "user20ft": 596000,
        "woonsong20ft": 668400
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "당산2동",
        "distanceKm": 442,
        "witak40ft": 630600,
        "user40ft": 676000,
        "woonsong40ft": 755500,
        "witak20ft": 555000,
        "user20ft": 596400,
        "woonsong20ft": 668900
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "양평1동",
        "distanceKm": 442,
        "witak40ft": 630700,
        "user40ft": 676100,
        "woonsong40ft": 755500,
        "witak20ft": 555200,
        "user20ft": 596600,
        "woonsong20ft": 669100
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "양평2동",
        "distanceKm": 442,
        "witak40ft": 631300,
        "user40ft": 676800,
        "woonsong40ft": 756300,
        "witak20ft": 555500,
        "user20ft": 596900,
        "woonsong20ft": 669500
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길1동",
        "distanceKm": 435,
        "witak40ft": 622000,
        "user40ft": 667200,
        "woonsong40ft": 746300,
        "witak20ft": 548400,
        "user20ft": 589600,
        "woonsong20ft": 662000
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길3동",
        "distanceKm": 436,
        "witak40ft": 622400,
        "user40ft": 667600,
        "woonsong40ft": 746600,
        "witak20ft": 548500,
        "user20ft": 589700,
        "woonsong20ft": 662000
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길4동",
        "distanceKm": 433,
        "witak40ft": 618900,
        "user40ft": 664000,
        "woonsong40ft": 742900,
        "witak20ft": 545500,
        "user20ft": 586600,
        "woonsong20ft": 658800
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길5동",
        "distanceKm": 433,
        "witak40ft": 618900,
        "user40ft": 664000,
        "woonsong40ft": 742900,
        "witak20ft": 545500,
        "user20ft": 586600,
        "woonsong20ft": 658800
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길6동",
        "distanceKm": 432,
        "witak40ft": 615900,
        "user40ft": 660900,
        "woonsong40ft": 739800,
        "witak20ft": 542900,
        "user20ft": 583900,
        "woonsong20ft": 655900
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "신길7동",
        "distanceKm": 433,
        "witak40ft": 619200,
        "user40ft": 664300,
        "woonsong40ft": 743300,
        "witak20ft": 545900,
        "user20ft": 587000,
        "woonsong20ft": 659200
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "대림1동",
        "distanceKm": 432,
        "witak40ft": 615900,
        "user40ft": 660900,
        "woonsong40ft": 739800,
        "witak20ft": 542900,
        "user20ft": 583900,
        "woonsong20ft": 655900
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "대림2동",
        "distanceKm": 431,
        "witak40ft": 614200,
        "user40ft": 659200,
        "woonsong40ft": 737900,
        "witak20ft": 541000,
        "user20ft": 582000,
        "woonsong20ft": 654000
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "대림3동",
        "distanceKm": 434,
        "witak40ft": 618000,
        "user40ft": 663100,
        "woonsong40ft": 742000,
        "witak20ft": 544700,
        "user20ft": 585800,
        "woonsong20ft": 658000
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "영등포본동",
        "distanceKm": 436,
        "witak40ft": 621900,
        "user40ft": 667000,
        "woonsong40ft": 746000,
        "witak20ft": 548000,
        "user20ft": 589200,
        "woonsong20ft": 661400
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "영등포동",
        "distanceKm": 438,
        "witak40ft": 624700,
        "user40ft": 670000,
        "woonsong40ft": 749200,
        "witak20ft": 550600,
        "user20ft": 591900,
        "woonsong20ft": 664300
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "도림동",
        "distanceKm": 439,
        "witak40ft": 624200,
        "user40ft": 669400,
        "woonsong40ft": 748500,
        "witak20ft": 550000,
        "user20ft": 591200,
        "woonsong20ft": 663400
      },
      {
        "city": "서울특별시",
        "gu": "영등포구",
        "dong": "문래동",
        "distanceKm": 442,
        "witak40ft": 628400,
        "user40ft": 673600,
        "woonsong40ft": 752700,
        "witak20ft": 553400,
        "user20ft": 594700,
        "woonsong20ft": 667100
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "노량진2동",
        "distanceKm": 434,
        "witak40ft": 621800,
        "user40ft": 667100,
        "woonsong40ft": 746300,
        "witak20ft": 548100,
        "user20ft": 589400,
        "woonsong20ft": 661900
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "상도1동",
        "distanceKm": 428,
        "witak40ft": 614200,
        "user40ft": 659300,
        "woonsong40ft": 738400,
        "witak20ft": 542000,
        "user20ft": 583200,
        "woonsong20ft": 655500
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "상도2동",
        "distanceKm": 431,
        "witak40ft": 619000,
        "user40ft": 664300,
        "woonsong40ft": 743500,
        "witak20ft": 546100,
        "user20ft": 587400,
        "woonsong20ft": 659800
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "상도3동",
        "distanceKm": 431,
        "witak40ft": 617700,
        "user40ft": 662900,
        "woonsong40ft": 742000,
        "witak20ft": 545000,
        "user20ft": 586200,
        "woonsong20ft": 658500
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "상도4동",
        "distanceKm": 429,
        "witak40ft": 616500,
        "user40ft": 661700,
        "woonsong40ft": 740800,
        "witak20ft": 544100,
        "user20ft": 585300,
        "woonsong20ft": 657700
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "사당1동",
        "distanceKm": 420,
        "witak40ft": 605800,
        "user40ft": 650800,
        "woonsong40ft": 729600,
        "witak20ft": 534900,
        "user20ft": 575900,
        "woonsong20ft": 648000
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "사당3동",
        "distanceKm": 422,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "사당4동",
        "distanceKm": 422,
        "witak40ft": 606800,
        "user40ft": 651800,
        "woonsong40ft": 730600,
        "witak20ft": 535700,
        "user20ft": 576700,
        "woonsong20ft": 648800
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "사당5동",
        "distanceKm": 423,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "대방동",
        "distanceKm": 435,
        "witak40ft": 622800,
        "user40ft": 668000,
        "woonsong40ft": 747200,
        "witak20ft": 549000,
        "user20ft": 590200,
        "woonsong20ft": 662600
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "신대방1동",
        "distanceKm": 430,
        "witak40ft": 613300,
        "user40ft": 658200,
        "woonsong40ft": 736900,
        "witak20ft": 540200,
        "user20ft": 581300,
        "woonsong20ft": 653300
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "신대방2동",
        "distanceKm": 428,
        "witak40ft": 612300,
        "user40ft": 657300,
        "woonsong40ft": 736100,
        "witak20ft": 540000,
        "user20ft": 581100,
        "woonsong20ft": 653100
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "흑석동",
        "distanceKm": 429,
        "witak40ft": 618000,
        "user40ft": 663300,
        "woonsong40ft": 742600,
        "witak20ft": 545300,
        "user20ft": 586600,
        "woonsong20ft": 659000
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "노량진1동",
        "distanceKm": 434,
        "witak40ft": 620800,
        "user40ft": 666100,
        "woonsong40ft": 745300,
        "witak20ft": 547500,
        "user20ft": 588800,
        "woonsong20ft": 661200
      },
      {
        "city": "서울특별시",
        "gu": "동작구",
        "dong": "사당2동",
        "distanceKm": 423,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "보라매동",
        "distanceKm": 425,
        "witak40ft": 610600,
        "user40ft": 655700,
        "woonsong40ft": 734600,
        "witak20ft": 539000,
        "user20ft": 580100,
        "woonsong20ft": 652300
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "청림동",
        "distanceKm": 426,
        "witak40ft": 614200,
        "user40ft": 659300,
        "woonsong40ft": 738400,
        "witak20ft": 542000,
        "user20ft": 583200,
        "woonsong20ft": 655500
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "행운동",
        "distanceKm": 423,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "낙성대동",
        "distanceKm": 423,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "중앙동",
        "distanceKm": 427,
        "witak40ft": 613200,
        "user40ft": 658300,
        "woonsong40ft": 737400,
        "witak20ft": 541300,
        "user20ft": 582500,
        "woonsong20ft": 654800
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "인헌동",
        "distanceKm": 423,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "남현동",
        "distanceKm": 419,
        "witak40ft": 603100,
        "user40ft": 648100,
        "woonsong40ft": 726900,
        "witak20ft": 532200,
        "user20ft": 573200,
        "woonsong20ft": 645300
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "서원동",
        "distanceKm": 425,
        "witak40ft": 609500,
        "user40ft": 654500,
        "woonsong40ft": 733400,
        "witak20ft": 537800,
        "user20ft": 578800,
        "woonsong20ft": 650900
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "신원동",
        "distanceKm": 426,
        "witak40ft": 610300,
        "user40ft": 655300,
        "woonsong40ft": 734200,
        "witak20ft": 538500,
        "user20ft": 579600,
        "woonsong20ft": 651700
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "서림동",
        "distanceKm": 423,
        "witak40ft": 606800,
        "user40ft": 651800,
        "woonsong40ft": 730500,
        "witak20ft": 535300,
        "user20ft": 576300,
        "woonsong20ft": 648200
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "신사동",
        "distanceKm": 427,
        "witak40ft": 613400,
        "user40ft": 658400,
        "woonsong40ft": 737300,
        "witak20ft": 541100,
        "user20ft": 582200,
        "woonsong20ft": 654300
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "신림동",
        "distanceKm": 427,
        "witak40ft": 612500,
        "user40ft": 657600,
        "woonsong40ft": 736500,
        "witak20ft": 540400,
        "user20ft": 581500,
        "woonsong20ft": 653700
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "난향동",
        "distanceKm": 425,
        "witak40ft": 607000,
        "user40ft": 651900,
        "woonsong40ft": 730400,
        "witak20ft": 534300,
        "user20ft": 575200,
        "woonsong20ft": 647000
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "조원동",
        "distanceKm": 429,
        "witak40ft": 611600,
        "user40ft": 656500,
        "woonsong40ft": 735100,
        "witak20ft": 538400,
        "user20ft": 579400,
        "woonsong20ft": 651300
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "대학동",
        "distanceKm": 422,
        "witak40ft": 606800,
        "user40ft": 651800,
        "woonsong40ft": 730500,
        "witak20ft": 535300,
        "user20ft": 576300,
        "woonsong20ft": 648200
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "은천동",
        "distanceKm": 427,
        "witak40ft": 614200,
        "user40ft": 659300,
        "woonsong40ft": 738400,
        "witak20ft": 542000,
        "user20ft": 583200,
        "woonsong20ft": 655500
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "성현동",
        "distanceKm": 426,
        "witak40ft": 614200,
        "user40ft": 659300,
        "woonsong40ft": 738400,
        "witak20ft": 542000,
        "user20ft": 583200,
        "woonsong20ft": 655500
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "청룡동",
        "distanceKm": 425,
        "witak40ft": 609500,
        "user40ft": 654500,
        "woonsong40ft": 733400,
        "witak20ft": 537800,
        "user20ft": 578800,
        "woonsong20ft": 650900
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "난곡동",
        "distanceKm": 425,
        "witak40ft": 607800,
        "user40ft": 652700,
        "woonsong40ft": 731400,
        "witak20ft": 535600,
        "user20ft": 576500,
        "woonsong20ft": 648400
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "삼성동",
        "distanceKm": 422,
        "witak40ft": 606800,
        "user40ft": 651800,
        "woonsong40ft": 730500,
        "witak20ft": 535300,
        "user20ft": 576300,
        "woonsong20ft": 648200
      },
      {
        "city": "서울특별시",
        "gu": "관악구",
        "dong": "미성동",
        "distanceKm": 425,
        "witak40ft": 608700,
        "user40ft": 653600,
        "woonsong40ft": 732300,
        "witak20ft": 536700,
        "user20ft": 577700,
        "woonsong20ft": 649700
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "서초1동",
        "distanceKm": 419,
        "witak40ft": 605100,
        "user40ft": 650200,
        "woonsong40ft": 729100,
        "witak20ft": 534600,
        "user20ft": 575700,
        "woonsong20ft": 647800
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "서초2동",
        "distanceKm": 418,
        "witak40ft": 604100,
        "user40ft": 649200,
        "woonsong40ft": 728100,
        "witak20ft": 533800,
        "user20ft": 574900,
        "woonsong20ft": 647100
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "서초3동",
        "distanceKm": 417,
        "witak40ft": 601300,
        "user40ft": 646200,
        "woonsong40ft": 724900,
        "witak20ft": 530800,
        "user20ft": 571800,
        "woonsong20ft": 643900
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "서초4동",
        "distanceKm": 422,
        "witak40ft": 610000,
        "user40ft": 655200,
        "woonsong40ft": 734300,
        "witak20ft": 539000,
        "user20ft": 580200,
        "woonsong20ft": 652600
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "잠원동",
        "distanceKm": 427,
        "witak40ft": 615300,
        "user40ft": 660600,
        "woonsong40ft": 739800,
        "witak20ft": 543000,
        "user20ft": 584300,
        "woonsong20ft": 656800
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "반포본동",
        "distanceKm": 422,
        "witak40ft": 607900,
        "user40ft": 652900,
        "woonsong40ft": 731800,
        "witak20ft": 536800,
        "user20ft": 577900,
        "woonsong20ft": 650100
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "반포1동",
        "distanceKm": 423,
        "witak40ft": 610900,
        "user40ft": 656100,
        "woonsong40ft": 735400,
        "witak20ft": 539700,
        "user20ft": 580900,
        "woonsong20ft": 653300
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "반포2동",
        "distanceKm": 424,
        "witak40ft": 611400,
        "user40ft": 656600,
        "woonsong40ft": 735700,
        "witak20ft": 539900,
        "user20ft": 581100,
        "woonsong20ft": 653400
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "반포3동",
        "distanceKm": 426,
        "witak40ft": 613400,
        "user40ft": 658600,
        "woonsong40ft": 737900,
        "witak20ft": 541600,
        "user20ft": 582900,
        "woonsong20ft": 655400
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "반포4동",
        "distanceKm": 422,
        "witak40ft": 609900,
        "user40ft": 655000,
        "woonsong40ft": 734100,
        "witak20ft": 538700,
        "user20ft": 579900,
        "woonsong20ft": 652100
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "방배본동",
        "distanceKm": 422,
        "witak40ft": 608800,
        "user40ft": 653800,
        "woonsong40ft": 732700,
        "witak20ft": 537500,
        "user20ft": 578600,
        "woonsong20ft": 650800
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "방배1동",
        "distanceKm": 420,
        "witak40ft": 604900,
        "user40ft": 649900,
        "woonsong40ft": 728700,
        "witak20ft": 534100,
        "user20ft": 575200,
        "woonsong20ft": 647300
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "방배2동",
        "distanceKm": 419,
        "witak40ft": 603100,
        "user40ft": 648100,
        "woonsong40ft": 726900,
        "witak20ft": 532200,
        "user20ft": 573200,
        "woonsong20ft": 645300
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "방배3동",
        "distanceKm": 419,
        "witak40ft": 604000,
        "user40ft": 649000,
        "woonsong40ft": 727800,
        "witak20ft": 533500,
        "user20ft": 574500,
        "woonsong20ft": 646600
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "방배4동",
        "distanceKm": 421,
        "witak40ft": 604900,
        "user40ft": 649900,
        "woonsong40ft": 728700,
        "witak20ft": 534100,
        "user20ft": 575200,
        "woonsong20ft": 647300
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "양재1동",
        "distanceKm": 415,
        "witak40ft": 599500,
        "user40ft": 644400,
        "woonsong40ft": 723100,
        "witak20ft": 529400,
        "user20ft": 570400,
        "woonsong20ft": 642300
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "양재2동",
        "distanceKm": 414,
        "witak40ft": 599400,
        "user40ft": 644400,
        "woonsong40ft": 723200,
        "witak20ft": 529900,
        "user20ft": 570900,
        "woonsong20ft": 642900
      },
      {
        "city": "서울특별시",
        "gu": "서초구",
        "dong": "내곡동",
        "distanceKm": 413,
        "witak40ft": 599600,
        "user40ft": 644600,
        "woonsong40ft": 723500,
        "witak20ft": 530200,
        "user20ft": 571300,
        "woonsong20ft": 643500
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "신사동",
        "distanceKm": 428,
        "witak40ft": 616000,
        "user40ft": 661300,
        "woonsong40ft": 740600,
        "witak20ft": 543600,
        "user20ft": 584900,
        "woonsong20ft": 657400
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "논현1동",
        "distanceKm": 425,
        "witak40ft": 613400,
        "user40ft": 658600,
        "woonsong40ft": 737900,
        "witak20ft": 541600,
        "user20ft": 582900,
        "woonsong20ft": 655400
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "논현2동",
        "distanceKm": 427,
        "witak40ft": 617700,
        "user40ft": 663100,
        "woonsong40ft": 742500,
        "witak20ft": 544900,
        "user20ft": 586300,
        "woonsong20ft": 658900
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "삼성1동",
        "distanceKm": 428,
        "witak40ft": 618500,
        "user40ft": 663900,
        "woonsong40ft": 743500,
        "witak20ft": 545400,
        "user20ft": 586800,
        "woonsong20ft": 659500
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "삼성2동",
        "distanceKm": 427,
        "witak40ft": 615200,
        "user40ft": 660500,
        "woonsong40ft": 739800,
        "witak20ft": 542900,
        "user20ft": 584200,
        "woonsong20ft": 656700
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "대치1동",
        "distanceKm": 418,
        "witak40ft": 606300,
        "user40ft": 651500,
        "woonsong40ft": 730700,
        "witak20ft": 536000,
        "user20ft": 577200,
        "woonsong20ft": 649600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "대치4동",
        "distanceKm": 420,
        "witak40ft": 608800,
        "user40ft": 654000,
        "woonsong40ft": 733300,
        "witak20ft": 538100,
        "user20ft": 579400,
        "woonsong20ft": 651800
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "역삼1동",
        "distanceKm": 419,
        "witak40ft": 607300,
        "user40ft": 652500,
        "woonsong40ft": 731600,
        "witak20ft": 536800,
        "user20ft": 578000,
        "woonsong20ft": 650300
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "역삼2동",
        "distanceKm": 418,
        "witak40ft": 606300,
        "user40ft": 651500,
        "woonsong40ft": 730700,
        "witak20ft": 536000,
        "user20ft": 577200,
        "woonsong20ft": 649600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "도곡1동",
        "distanceKm": 417,
        "witak40ft": 605000,
        "user40ft": 650100,
        "woonsong40ft": 729200,
        "witak20ft": 534800,
        "user20ft": 576000,
        "woonsong20ft": 648300
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "도곡2동",
        "distanceKm": 416,
        "witak40ft": 603500,
        "user40ft": 648600,
        "woonsong40ft": 727700,
        "witak20ft": 533500,
        "user20ft": 574600,
        "woonsong20ft": 646900
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "개포1동",
        "distanceKm": 414,
        "witak40ft": 601600,
        "user40ft": 646700,
        "woonsong40ft": 725700,
        "witak20ft": 532100,
        "user20ft": 573200,
        "woonsong20ft": 645500
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "개포4동",
        "distanceKm": 414,
        "witak40ft": 601600,
        "user40ft": 646700,
        "woonsong40ft": 725700,
        "witak20ft": 532100,
        "user20ft": 573200,
        "woonsong20ft": 645500
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "일원본동",
        "distanceKm": 418,
        "witak40ft": 605400,
        "user40ft": 650600,
        "woonsong40ft": 729700,
        "witak20ft": 535300,
        "user20ft": 576500,
        "woonsong20ft": 648900
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "일원1동",
        "distanceKm": 416,
        "witak40ft": 604500,
        "user40ft": 649700,
        "woonsong40ft": 728900,
        "witak20ft": 534600,
        "user20ft": 575800,
        "woonsong20ft": 648200
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "일원2동",
        "distanceKm": 418,
        "witak40ft": 606300,
        "user40ft": 651500,
        "woonsong40ft": 730700,
        "witak20ft": 536000,
        "user20ft": 577200,
        "woonsong20ft": 649600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "수서동",
        "distanceKm": 418,
        "witak40ft": 607800,
        "user40ft": 653100,
        "woonsong40ft": 732400,
        "witak20ft": 537100,
        "user20ft": 578400,
        "woonsong20ft": 650900
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "세곡동",
        "distanceKm": 416,
        "witak40ft": 604900,
        "user40ft": 650200,
        "woonsong40ft": 729600,
        "witak20ft": 534900,
        "user20ft": 576200,
        "woonsong20ft": 648700
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "압구정동",
        "distanceKm": 431,
        "witak40ft": 621300,
        "user40ft": 666700,
        "woonsong40ft": 746200,
        "witak20ft": 547600,
        "user20ft": 589000,
        "woonsong20ft": 661600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "청담동",
        "distanceKm": 431,
        "witak40ft": 621300,
        "user40ft": 666700,
        "woonsong40ft": 746200,
        "witak20ft": 547600,
        "user20ft": 589000,
        "woonsong20ft": 661600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "대치2동",
        "distanceKm": 424,
        "witak40ft": 612500,
        "user40ft": 657800,
        "woonsong40ft": 737100,
        "witak20ft": 540900,
        "user20ft": 582200,
        "woonsong20ft": 654600
      },
      {
        "city": "서울특별시",
        "gu": "강남구",
        "dong": "개포2동",
        "distanceKm": 418,
        "witak40ft": 606300,
        "user40ft": 651500,
        "woonsong40ft": 730700,
        "witak20ft": 536000,
        "user20ft": 577200,
        "woonsong20ft": 649600
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "풍납1동",
        "distanceKm": 428,
        "witak40ft": 622300,
        "user40ft": 667900,
        "woonsong40ft": 747800,
        "witak20ft": 547800,
        "user20ft": 589400,
        "woonsong20ft": 662400
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "풍납2동",
        "distanceKm": 424,
        "witak40ft": 618600,
        "user40ft": 664300,
        "woonsong40ft": 744300,
        "witak20ft": 544900,
        "user20ft": 586500,
        "woonsong20ft": 659500
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "거여1동",
        "distanceKm": 421,
        "witak40ft": 614300,
        "user40ft": 659800,
        "woonsong40ft": 739600,
        "witak20ft": 541700,
        "user20ft": 583200,
        "woonsong20ft": 656100
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "거여2동",
        "distanceKm": 422,
        "witak40ft": 615300,
        "user40ft": 660800,
        "woonsong40ft": 740600,
        "witak20ft": 542500,
        "user20ft": 584000,
        "woonsong20ft": 656800
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "마천1동",
        "distanceKm": 422,
        "witak40ft": 615300,
        "user40ft": 660800,
        "woonsong40ft": 740600,
        "witak20ft": 542500,
        "user20ft": 584000,
        "woonsong20ft": 656800
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "마천2동",
        "distanceKm": 422,
        "witak40ft": 614300,
        "user40ft": 659800,
        "woonsong40ft": 739600,
        "witak20ft": 541700,
        "user20ft": 583200,
        "woonsong20ft": 656100
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "방이1동",
        "distanceKm": 419,
        "witak40ft": 610200,
        "user40ft": 655600,
        "woonsong40ft": 735100,
        "witak20ft": 538800,
        "user20ft": 580200,
        "woonsong20ft": 652800
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "방이2동",
        "distanceKm": 420,
        "witak40ft": 611900,
        "user40ft": 657300,
        "woonsong40ft": 737000,
        "witak20ft": 540100,
        "user20ft": 581500,
        "woonsong20ft": 654200
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "오륜동",
        "distanceKm": 420,
        "witak40ft": 611700,
        "user40ft": 657200,
        "woonsong40ft": 736900,
        "witak20ft": 539800,
        "user20ft": 581300,
        "woonsong20ft": 654100
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "오금동",
        "distanceKm": 418,
        "witak40ft": 609300,
        "user40ft": 654700,
        "woonsong40ft": 734200,
        "witak20ft": 538100,
        "user20ft": 579500,
        "woonsong20ft": 652200
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "송파1동",
        "distanceKm": 419,
        "witak40ft": 609400,
        "user40ft": 654700,
        "woonsong40ft": 734200,
        "witak20ft": 538300,
        "user20ft": 579600,
        "woonsong20ft": 652200
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "송파2동",
        "distanceKm": 419,
        "witak40ft": 611100,
        "user40ft": 656500,
        "woonsong40ft": 736100,
        "witak20ft": 539600,
        "user20ft": 581000,
        "woonsong20ft": 653600
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "석촌동",
        "distanceKm": 420,
        "witak40ft": 611100,
        "user40ft": 656500,
        "woonsong40ft": 736100,
        "witak20ft": 539600,
        "user20ft": 581000,
        "woonsong20ft": 653600
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "삼전동",
        "distanceKm": 421,
        "witak40ft": 611300,
        "user40ft": 656600,
        "woonsong40ft": 736100,
        "witak20ft": 539800,
        "user20ft": 581200,
        "woonsong20ft": 653800
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "가락본동",
        "distanceKm": 419,
        "witak40ft": 609400,
        "user40ft": 654700,
        "woonsong40ft": 734200,
        "witak20ft": 538300,
        "user20ft": 579600,
        "woonsong20ft": 652200
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "가락1동",
        "distanceKm": 419,
        "witak40ft": 607800,
        "user40ft": 653100,
        "woonsong40ft": 732400,
        "witak20ft": 537100,
        "user20ft": 578400,
        "woonsong20ft": 650900
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "가락2동",
        "distanceKm": 419,
        "witak40ft": 610200,
        "user40ft": 655600,
        "woonsong40ft": 735100,
        "witak20ft": 538800,
        "user20ft": 580200,
        "woonsong20ft": 652800
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "문정1동",
        "distanceKm": 419,
        "witak40ft": 611000,
        "user40ft": 656400,
        "woonsong40ft": 736100,
        "witak20ft": 539300,
        "user20ft": 580700,
        "woonsong20ft": 653500
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "문정2동",
        "distanceKm": 417,
        "witak40ft": 606800,
        "user40ft": 652100,
        "woonsong40ft": 731400,
        "witak20ft": 536300,
        "user20ft": 577600,
        "woonsong20ft": 650100
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실본동",
        "distanceKm": 422,
        "witak40ft": 613000,
        "user40ft": 658400,
        "woonsong40ft": 737900,
        "witak20ft": 541000,
        "user20ft": 582400,
        "woonsong20ft": 655000
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실4동",
        "distanceKm": 423,
        "witak40ft": 617000,
        "user40ft": 662600,
        "woonsong40ft": 742400,
        "witak20ft": 543700,
        "user20ft": 585200,
        "woonsong20ft": 658200
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실6동",
        "distanceKm": 422,
        "witak40ft": 612700,
        "user40ft": 658200,
        "woonsong40ft": 737800,
        "witak20ft": 540800,
        "user20ft": 582200,
        "woonsong20ft": 655000
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실7동",
        "distanceKm": 429,
        "witak40ft": 618600,
        "user40ft": 664000,
        "woonsong40ft": 743500,
        "witak20ft": 545700,
        "user20ft": 587000,
        "woonsong20ft": 659600
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실2동",
        "distanceKm": 428,
        "witak40ft": 619200,
        "user40ft": 664700,
        "woonsong40ft": 744300,
        "witak20ft": 545900,
        "user20ft": 587300,
        "woonsong20ft": 660100
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "잠실3동",
        "distanceKm": 427,
        "witak40ft": 617600,
        "user40ft": 663000,
        "woonsong40ft": 742500,
        "witak20ft": 544700,
        "user20ft": 586100,
        "woonsong20ft": 658700
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "장지동",
        "distanceKm": 419,
        "witak40ft": 611000,
        "user40ft": 656400,
        "woonsong40ft": 736100,
        "witak20ft": 539300,
        "user20ft": 580700,
        "woonsong20ft": 653500
      },
      {
        "city": "서울특별시",
        "gu": "송파구",
        "dong": "위례동",
        "distanceKm": 420,
        "witak40ft": 612600,
        "user40ft": 658100,
        "woonsong40ft": 737900,
        "witak20ft": 540500,
        "user20ft": 582000,
        "woonsong20ft": 654800
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "강일동",
        "distanceKm": 427,
        "witak40ft": 625700,
        "user40ft": 671600,
        "woonsong40ft": 752100,
        "witak20ft": 550300,
        "user20ft": 592100,
        "woonsong20ft": 665600
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "상일동",
        "distanceKm": 424,
        "witak40ft": 622100,
        "user40ft": 668000,
        "woonsong40ft": 748500,
        "witak20ft": 547500,
        "user20ft": 589300,
        "woonsong20ft": 662700
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "명일1동",
        "distanceKm": 424,
        "witak40ft": 618400,
        "user40ft": 664100,
        "woonsong40ft": 744200,
        "witak20ft": 544600,
        "user20ft": 586200,
        "woonsong20ft": 659300
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "명일2동",
        "distanceKm": 423,
        "witak40ft": 618400,
        "user40ft": 664100,
        "woonsong40ft": 744200,
        "witak20ft": 544600,
        "user20ft": 586200,
        "woonsong20ft": 659300
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "고덕1동",
        "distanceKm": 426,
        "witak40ft": 624100,
        "user40ft": 670000,
        "woonsong40ft": 750400,
        "witak20ft": 548900,
        "user20ft": 590700,
        "woonsong20ft": 664100
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "고덕2동",
        "distanceKm": 426,
        "witak40ft": 624800,
        "user40ft": 670700,
        "woonsong40ft": 751200,
        "witak20ft": 549600,
        "user20ft": 591400,
        "woonsong20ft": 664900
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "암사2동",
        "distanceKm": 431,
        "witak40ft": 626500,
        "user40ft": 672300,
        "woonsong40ft": 752400,
        "witak20ft": 550900,
        "user20ft": 592600,
        "woonsong20ft": 665800
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "암사3동",
        "distanceKm": 427,
        "witak40ft": 623800,
        "user40ft": 669500,
        "woonsong40ft": 749600,
        "witak20ft": 548800,
        "user20ft": 590500,
        "woonsong20ft": 663600
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "천호1동",
        "distanceKm": 423,
        "witak40ft": 618400,
        "user40ft": 664100,
        "woonsong40ft": 744200,
        "witak20ft": 544600,
        "user20ft": 586200,
        "woonsong20ft": 659300
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "천호3동",
        "distanceKm": 422,
        "witak40ft": 616700,
        "user40ft": 662300,
        "woonsong40ft": 742300,
        "witak20ft": 543400,
        "user20ft": 585000,
        "woonsong20ft": 658100
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "성내1동",
        "distanceKm": 426,
        "witak40ft": 622500,
        "user40ft": 668300,
        "woonsong40ft": 748600,
        "witak20ft": 547800,
        "user20ft": 589500,
        "woonsong20ft": 662800
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "성내2동",
        "distanceKm": 422,
        "witak40ft": 616000,
        "user40ft": 661600,
        "woonsong40ft": 741400,
        "witak20ft": 542900,
        "user20ft": 584500,
        "woonsong20ft": 657500
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "성내3동",
        "distanceKm": 421,
        "witak40ft": 613300,
        "user40ft": 658900,
        "woonsong40ft": 738700,
        "witak20ft": 541000,
        "user20ft": 582500,
        "woonsong20ft": 655400
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "둔촌1동",
        "distanceKm": 421,
        "witak40ft": 615800,
        "user40ft": 661400,
        "woonsong40ft": 741300,
        "witak20ft": 542700,
        "user20ft": 584300,
        "woonsong20ft": 657300
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "둔촌2동",
        "distanceKm": 421,
        "witak40ft": 615100,
        "user40ft": 660700,
        "woonsong40ft": 740500,
        "witak20ft": 542200,
        "user20ft": 583700,
        "woonsong20ft": 656700
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "암사1동",
        "distanceKm": 429,
        "witak40ft": 624600,
        "user40ft": 670400,
        "woonsong40ft": 750500,
        "witak20ft": 549500,
        "user20ft": 591200,
        "woonsong20ft": 664400
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "천호2동",
        "distanceKm": 424,
        "witak40ft": 619300,
        "user40ft": 665000,
        "woonsong40ft": 745100,
        "witak20ft": 545300,
        "user20ft": 587000,
        "woonsong20ft": 660200
      },
      {
        "city": "서울특별시",
        "gu": "강동구",
        "dong": "길동",
        "distanceKm": 422,
        "witak40ft": 615800,
        "user40ft": 661400,
        "woonsong40ft": 741300,
        "witak20ft": 542700,
        "user20ft": 584300,
        "woonsong20ft": 657300
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "연안동",
        "distanceKm": 467,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "신포동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "신흥동",
        "distanceKm": 467,
        "witak40ft": 662300,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694800
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "도원동",
        "distanceKm": 468,
        "witak40ft": 663100,
        "user40ft": 709200,
        "woonsong40ft": 789700,
        "witak20ft": 579900,
        "user20ft": 621900,
        "woonsong20ft": 695400
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "율목동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "동인천동",
        "distanceKm": 469,
        "witak40ft": 665600,
        "user40ft": 711800,
        "woonsong40ft": 792500,
        "witak20ft": 582000,
        "user20ft": 624100,
        "woonsong20ft": 697700
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "북성동",
        "distanceKm": 471,
        "witak40ft": 668200,
        "user40ft": 714400,
        "woonsong40ft": 795200,
        "witak20ft": 584200,
        "user20ft": 626300,
        "woonsong20ft": 699900
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "송월동",
        "distanceKm": 470,
        "witak40ft": 667300,
        "user40ft": 713500,
        "woonsong40ft": 794200,
        "witak20ft": 583500,
        "user20ft": 625600,
        "woonsong20ft": 699200
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "용유동",
        "distanceKm": 512,
        "witak40ft": 715300,
        "user40ft": 762700,
        "woonsong40ft": 845200,
        "witak20ft": 626400,
        "user20ft": 669500,
        "woonsong20ft": 744700
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "운서동",
        "distanceKm": 494,
        "witak40ft": 695600,
        "user40ft": 742400,
        "woonsong40ft": 824200,
        "witak20ft": 610100,
        "user20ft": 652700,
        "woonsong20ft": 727300
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "영종동",
        "distanceKm": 495,
        "witak40ft": 696900,
        "user40ft": 743800,
        "woonsong40ft": 825700,
        "witak20ft": 611200,
        "user20ft": 653900,
        "woonsong20ft": 728500
      },
      {
        "city": "인천광역시",
        "gu": "중구",
        "dong": "영종1동",
        "distanceKm": 498,
        "witak40ft": 700000,
        "user40ft": 747000,
        "woonsong40ft": 829000,
        "witak20ft": 613600,
        "user20ft": 656400,
        "woonsong20ft": 731200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "만석동",
        "distanceKm": 472,
        "witak40ft": 669800,
        "user40ft": 716000,
        "woonsong40ft": 796800,
        "witak20ft": 585600,
        "user20ft": 627700,
        "woonsong20ft": 701400
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "화수1화평 동",
        "distanceKm": 470,
        "witak40ft": 667300,
        "user40ft": 713500,
        "woonsong40ft": 794200,
        "witak20ft": 583500,
        "user20ft": 625600,
        "woonsong20ft": 699200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "화수2동",
        "distanceKm": 474,
        "witak40ft": 671700,
        "user40ft": 718000,
        "woonsong40ft": 798800,
        "witak20ft": 587000,
        "user20ft": 629100,
        "woonsong20ft": 702900
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송현12동",
        "distanceKm": 469,
        "witak40ft": 667300,
        "user40ft": 713500,
        "woonsong40ft": 794200,
        "witak20ft": 583500,
        "user20ft": 625600,
        "woonsong20ft": 699200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송현3동",
        "distanceKm": 470,
        "witak40ft": 666600,
        "user40ft": 712800,
        "woonsong40ft": 793400,
        "witak20ft": 582800,
        "user20ft": 624800,
        "woonsong20ft": 698400
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송림1동",
        "distanceKm": 469,
        "witak40ft": 665600,
        "user40ft": 711800,
        "woonsong40ft": 792500,
        "witak20ft": 582000,
        "user20ft": 624100,
        "woonsong20ft": 697700
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송림2동",
        "distanceKm": 469,
        "witak40ft": 665600,
        "user40ft": 711800,
        "woonsong40ft": 792500,
        "witak20ft": 582000,
        "user20ft": 624100,
        "woonsong20ft": 697700
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송림35동",
        "distanceKm": 468,
        "witak40ft": 664000,
        "user40ft": 710100,
        "woonsong40ft": 790700,
        "witak20ft": 580600,
        "user20ft": 622600,
        "woonsong20ft": 696200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송림4동",
        "distanceKm": 468,
        "witak40ft": 664000,
        "user40ft": 710100,
        "woonsong40ft": 790700,
        "witak20ft": 580600,
        "user20ft": 622600,
        "woonsong20ft": 696200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "송림6동",
        "distanceKm": 468,
        "witak40ft": 664000,
        "user40ft": 710100,
        "woonsong40ft": 790700,
        "witak20ft": 580600,
        "user20ft": 622600,
        "woonsong20ft": 696200
      },
      {
        "city": "인천광역시",
        "gu": "동구",
        "dong": "금창동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "옥련1동",
        "distanceKm": 458,
        "witak40ft": 652000,
        "user40ft": 697900,
        "woonsong40ft": 778100,
        "witak20ft": 570900,
        "user20ft": 612700,
        "woonsong20ft": 685900
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "선학동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "연수1동",
        "distanceKm": 457,
        "witak40ft": 649600,
        "user40ft": 695400,
        "woonsong40ft": 775400,
        "witak20ft": 569200,
        "user20ft": 610900,
        "woonsong20ft": 684000
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "연수2동",
        "distanceKm": 452,
        "witak40ft": 642500,
        "user40ft": 688200,
        "woonsong40ft": 768100,
        "witak20ft": 563900,
        "user20ft": 605500,
        "woonsong20ft": 678500
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "연수3동",
        "distanceKm": 453,
        "witak40ft": 645200,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565800,
        "user20ft": 607500,
        "woonsong20ft": 680600
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "청학동",
        "distanceKm": 456,
        "witak40ft": 650300,
        "user40ft": 696100,
        "woonsong40ft": 776300,
        "witak20ft": 569700,
        "user20ft": 611400,
        "woonsong20ft": 684600
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "동춘1동",
        "distanceKm": 456,
        "witak40ft": 647200,
        "user40ft": 692900,
        "woonsong40ft": 772800,
        "witak20ft": 567600,
        "user20ft": 609200,
        "woonsong20ft": 682100
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "동춘2동",
        "distanceKm": 450,
        "witak40ft": 641700,
        "user40ft": 687400,
        "woonsong40ft": 767200,
        "witak20ft": 563300,
        "user20ft": 604900,
        "woonsong20ft": 677800
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "동춘3동",
        "distanceKm": 450,
        "witak40ft": 641700,
        "user40ft": 687400,
        "woonsong40ft": 767200,
        "witak20ft": 563300,
        "user20ft": 604900,
        "woonsong20ft": 677800
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "옥련2동",
        "distanceKm": 460,
        "witak40ft": 653000,
        "user40ft": 698900,
        "woonsong40ft": 779100,
        "witak20ft": 571600,
        "user20ft": 613400,
        "woonsong20ft": 686600
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "송도1동",
        "distanceKm": 451,
        "witak40ft": 643400,
        "user40ft": 689100,
        "woonsong40ft": 769000,
        "witak20ft": 564400,
        "user20ft": 606100,
        "woonsong20ft": 679100
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "송도3동",
        "distanceKm": 451,
        "witak40ft": 643400,
        "user40ft": 689100,
        "woonsong40ft": 769000,
        "witak20ft": 564400,
        "user20ft": 606100,
        "woonsong20ft": 679100
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "송도2동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "연수구",
        "dong": "송도4동",
        "distanceKm": 455,
        "witak40ft": 648500,
        "user40ft": 694300,
        "woonsong40ft": 774500,
        "witak20ft": 568300,
        "user20ft": 610000,
        "woonsong20ft": 683200
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "구월1동",
        "distanceKm": 451,
        "witak40ft": 643400,
        "user40ft": 689100,
        "woonsong40ft": 769000,
        "witak20ft": 564400,
        "user20ft": 606100,
        "woonsong20ft": 679100
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "구월2동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "구월3동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "구월4동",
        "distanceKm": 449,
        "witak40ft": 640800,
        "user40ft": 686500,
        "woonsong40ft": 766300,
        "witak20ft": 562500,
        "user20ft": 604100,
        "woonsong20ft": 677100
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "간석1동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "간석2동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "간석3동",
        "distanceKm": 454,
        "witak40ft": 646900,
        "user40ft": 692700,
        "woonsong40ft": 772700,
        "witak20ft": 567200,
        "user20ft": 608900,
        "woonsong20ft": 681900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "간석4동",
        "distanceKm": 455,
        "witak40ft": 648500,
        "user40ft": 694300,
        "woonsong40ft": 774500,
        "witak20ft": 568300,
        "user20ft": 610000,
        "woonsong20ft": 683200
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수1동",
        "distanceKm": 447,
        "witak40ft": 638300,
        "user40ft": 683900,
        "woonsong40ft": 763700,
        "witak20ft": 560600,
        "user20ft": 602200,
        "woonsong20ft": 675000
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수2동",
        "distanceKm": 448,
        "witak40ft": 638400,
        "user40ft": 684000,
        "woonsong40ft": 763700,
        "witak20ft": 560900,
        "user20ft": 602400,
        "woonsong20ft": 675200
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수3동",
        "distanceKm": 449,
        "witak40ft": 640000,
        "user40ft": 685700,
        "woonsong40ft": 765500,
        "witak20ft": 562000,
        "user20ft": 603600,
        "woonsong20ft": 676500
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수4동",
        "distanceKm": 448,
        "witak40ft": 638400,
        "user40ft": 684000,
        "woonsong40ft": 763700,
        "witak20ft": 560900,
        "user20ft": 602400,
        "woonsong20ft": 675200
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수5동",
        "distanceKm": 447,
        "witak40ft": 637500,
        "user40ft": 683000,
        "woonsong40ft": 762700,
        "witak20ft": 560100,
        "user20ft": 601600,
        "woonsong20ft": 674400
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "만수6동",
        "distanceKm": 447,
        "witak40ft": 638300,
        "user40ft": 683900,
        "woonsong40ft": 763700,
        "witak20ft": 560600,
        "user20ft": 602200,
        "woonsong20ft": 675000
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "남촌도림동",
        "distanceKm": 451,
        "witak40ft": 643400,
        "user40ft": 689100,
        "woonsong40ft": 769000,
        "witak20ft": 564400,
        "user20ft": 606100,
        "woonsong20ft": 679100
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "논현1동",
        "distanceKm": 445,
        "witak40ft": 635800,
        "user40ft": 681300,
        "woonsong40ft": 760800,
        "witak20ft": 558900,
        "user20ft": 600400,
        "woonsong20ft": 673100
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "논현2동",
        "distanceKm": 446,
        "witak40ft": 636600,
        "user40ft": 682100,
        "woonsong40ft": 761800,
        "witak20ft": 559400,
        "user20ft": 600900,
        "woonsong20ft": 673700
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "논현고잔동",
        "distanceKm": 445,
        "witak40ft": 633200,
        "user40ft": 678700,
        "woonsong40ft": 758200,
        "witak20ft": 556900,
        "user20ft": 598300,
        "woonsong20ft": 670900
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "장수서창동",
        "distanceKm": 448,
        "witak40ft": 639100,
        "user40ft": 684700,
        "woonsong40ft": 764500,
        "witak20ft": 561300,
        "user20ft": 602900,
        "woonsong20ft": 675700
      },
      {
        "city": "인천광역시",
        "gu": "남동구",
        "dong": "서창2동",
        "distanceKm": 447,
        "witak40ft": 636700,
        "user40ft": 682200,
        "woonsong40ft": 761800,
        "witak20ft": 559600,
        "user20ft": 601100,
        "woonsong20ft": 673800
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평1동",
        "distanceKm": 456,
        "witak40ft": 648600,
        "user40ft": 694400,
        "woonsong40ft": 774500,
        "witak20ft": 568600,
        "user20ft": 610300,
        "woonsong20ft": 683300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평2동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평3동",
        "distanceKm": 460,
        "witak40ft": 654500,
        "user40ft": 700500,
        "woonsong40ft": 780800,
        "witak20ft": 572800,
        "user20ft": 614700,
        "woonsong20ft": 688000
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평4동",
        "distanceKm": 456,
        "witak40ft": 649400,
        "user40ft": 695200,
        "woonsong40ft": 775300,
        "witak20ft": 569100,
        "user20ft": 610800,
        "woonsong20ft": 684000
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평5동",
        "distanceKm": 454,
        "witak40ft": 646200,
        "user40ft": 691900,
        "woonsong40ft": 771800,
        "witak20ft": 566600,
        "user20ft": 608300,
        "woonsong20ft": 681300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부평6동",
        "distanceKm": 454,
        "witak40ft": 646200,
        "user40ft": 691900,
        "woonsong40ft": 771800,
        "witak20ft": 566600,
        "user20ft": 608300,
        "woonsong20ft": 681300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "산곡1동",
        "distanceKm": 461,
        "witak40ft": 655500,
        "user40ft": 701400,
        "woonsong40ft": 781700,
        "witak20ft": 573500,
        "user20ft": 615400,
        "woonsong20ft": 688700
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "산곡2동",
        "distanceKm": 460,
        "witak40ft": 653800,
        "user40ft": 699700,
        "woonsong40ft": 779900,
        "witak20ft": 572400,
        "user20ft": 614200,
        "woonsong20ft": 687500
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "산곡3동",
        "distanceKm": 458,
        "witak40ft": 652000,
        "user40ft": 697900,
        "woonsong40ft": 778100,
        "witak20ft": 570900,
        "user20ft": 612700,
        "woonsong20ft": 685900
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "산곡4동",
        "distanceKm": 460,
        "witak40ft": 653800,
        "user40ft": 699700,
        "woonsong40ft": 779900,
        "witak20ft": 572400,
        "user20ft": 614200,
        "woonsong20ft": 687500
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "청천1동",
        "distanceKm": 466,
        "witak40ft": 660700,
        "user40ft": 706700,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693000
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "청천2동",
        "distanceKm": 461,
        "witak40ft": 655500,
        "user40ft": 701400,
        "woonsong40ft": 781700,
        "witak20ft": 573500,
        "user20ft": 615400,
        "woonsong20ft": 688700
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "갈산1동",
        "distanceKm": 458,
        "witak40ft": 653000,
        "user40ft": 698900,
        "woonsong40ft": 779100,
        "witak20ft": 571600,
        "user20ft": 613400,
        "woonsong20ft": 686600
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "갈산2동",
        "distanceKm": 457,
        "witak40ft": 650300,
        "user40ft": 696100,
        "woonsong40ft": 776300,
        "witak20ft": 569700,
        "user20ft": 611400,
        "woonsong20ft": 684600
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "삼산1동",
        "distanceKm": 456,
        "witak40ft": 648600,
        "user40ft": 694400,
        "woonsong40ft": 774500,
        "witak20ft": 568600,
        "user20ft": 610300,
        "woonsong20ft": 683300
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부개1동",
        "distanceKm": 451,
        "witak40ft": 642500,
        "user40ft": 688200,
        "woonsong40ft": 768100,
        "witak20ft": 563900,
        "user20ft": 605500,
        "woonsong20ft": 678500
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부개2동",
        "distanceKm": 453,
        "witak40ft": 645200,
        "user40ft": 690900,
        "woonsong40ft": 770900,
        "witak20ft": 565800,
        "user20ft": 607500,
        "woonsong20ft": 680600
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "부개3동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "일신동",
        "distanceKm": 449,
        "witak40ft": 640000,
        "user40ft": 685700,
        "woonsong40ft": 765500,
        "witak20ft": 562000,
        "user20ft": 603600,
        "woonsong20ft": 676500
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "십정1동",
        "distanceKm": 458,
        "witak40ft": 652000,
        "user40ft": 697900,
        "woonsong40ft": 778100,
        "witak20ft": 570900,
        "user20ft": 612700,
        "woonsong20ft": 685900
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "십정2동",
        "distanceKm": 458,
        "witak40ft": 651300,
        "user40ft": 697100,
        "woonsong40ft": 777300,
        "witak20ft": 570500,
        "user20ft": 612300,
        "woonsong20ft": 685400
      },
      {
        "city": "인천광역시",
        "gu": "부평구",
        "dong": "삼산2동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "효성1동",
        "distanceKm": 468,
        "witak40ft": 664000,
        "user40ft": 710100,
        "woonsong40ft": 790700,
        "witak20ft": 580600,
        "user20ft": 622600,
        "woonsong20ft": 696200
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "효성2동",
        "distanceKm": 467,
        "witak40ft": 662400,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694700
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계산1동",
        "distanceKm": 467,
        "witak40ft": 663100,
        "user40ft": 709200,
        "woonsong40ft": 789700,
        "witak20ft": 579900,
        "user20ft": 621900,
        "woonsong20ft": 695400
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계산2동",
        "distanceKm": 465,
        "witak40ft": 660600,
        "user40ft": 706600,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693200
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계산3동",
        "distanceKm": 466,
        "witak40ft": 662300,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694800
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "작전1동",
        "distanceKm": 466,
        "witak40ft": 659900,
        "user40ft": 705900,
        "woonsong40ft": 786300,
        "witak20ft": 577100,
        "user20ft": 619000,
        "woonsong20ft": 692400
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "작전2동",
        "distanceKm": 466,
        "witak40ft": 663100,
        "user40ft": 709200,
        "woonsong40ft": 789700,
        "witak20ft": 579900,
        "user20ft": 621900,
        "woonsong20ft": 695400
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "작전서운동",
        "distanceKm": 464,
        "witak40ft": 656500,
        "user40ft": 702400,
        "woonsong40ft": 782600,
        "witak20ft": 574400,
        "user20ft": 616200,
        "woonsong20ft": 689500
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양2동",
        "distanceKm": 465,
        "witak40ft": 660600,
        "user40ft": 706600,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693200
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계산4동",
        "distanceKm": 465,
        "witak40ft": 660600,
        "user40ft": 706600,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693200
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양1동",
        "distanceKm": 473,
        "witak40ft": 670700,
        "user40ft": 717000,
        "woonsong40ft": 797800,
        "witak20ft": 586400,
        "user20ft": 628500,
        "woonsong20ft": 702300
      },
      {
        "city": "인천광역시",
        "gu": "계양구",
        "dong": "계양3동",
        "distanceKm": 469,
        "witak40ft": 665600,
        "user40ft": 711800,
        "woonsong40ft": 792500,
        "witak20ft": 582000,
        "user20ft": 624100,
        "woonsong20ft": 697700
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "검암경서동",
        "distanceKm": 478,
        "witak40ft": 675800,
        "user40ft": 722200,
        "woonsong40ft": 803100,
        "witak20ft": 590500,
        "user20ft": 632700,
        "woonsong20ft": 706700
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "연희동",
        "distanceKm": 476,
        "witak40ft": 675100,
        "user40ft": 721400,
        "woonsong40ft": 802300,
        "witak20ft": 589900,
        "user20ft": 632100,
        "woonsong20ft": 705900
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가정1동",
        "distanceKm": 474,
        "witak40ft": 671700,
        "user40ft": 718000,
        "woonsong40ft": 798800,
        "witak20ft": 587000,
        "user20ft": 629100,
        "woonsong20ft": 702900
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가정2동",
        "distanceKm": 472,
        "witak40ft": 669100,
        "user40ft": 715300,
        "woonsong40ft": 796000,
        "witak20ft": 585000,
        "user20ft": 627100,
        "woonsong20ft": 700700
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가정3동",
        "distanceKm": 472,
        "witak40ft": 668400,
        "user40ft": 714600,
        "woonsong40ft": 795200,
        "witak20ft": 584300,
        "user20ft": 626300,
        "woonsong20ft": 699800
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "석남1동",
        "distanceKm": 473,
        "witak40ft": 668400,
        "user40ft": 714600,
        "woonsong40ft": 795200,
        "witak20ft": 584300,
        "user20ft": 626300,
        "woonsong20ft": 699800
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "석남2동",
        "distanceKm": 473,
        "witak40ft": 669300,
        "user40ft": 715500,
        "woonsong40ft": 796100,
        "witak20ft": 584900,
        "user20ft": 626900,
        "woonsong20ft": 700500
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "석남3동",
        "distanceKm": 474,
        "witak40ft": 669400,
        "user40ft": 715500,
        "woonsong40ft": 796100,
        "witak20ft": 584900,
        "user20ft": 626900,
        "woonsong20ft": 700400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가좌1동",
        "distanceKm": 472,
        "witak40ft": 667000,
        "user40ft": 713100,
        "woonsong40ft": 793500,
        "witak20ft": 582800,
        "user20ft": 624700,
        "woonsong20ft": 698100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가좌2동",
        "distanceKm": 462,
        "witak40ft": 657100,
        "user40ft": 703100,
        "woonsong40ft": 783500,
        "witak20ft": 574900,
        "user20ft": 616800,
        "woonsong20ft": 690200
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가좌3동",
        "distanceKm": 472,
        "witak40ft": 667900,
        "user40ft": 714000,
        "woonsong40ft": 794400,
        "witak20ft": 583500,
        "user20ft": 625500,
        "woonsong20ft": 698900
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "가좌4동",
        "distanceKm": 461,
        "witak40ft": 657100,
        "user40ft": 703100,
        "woonsong40ft": 783500,
        "witak20ft": 574900,
        "user20ft": 616800,
        "woonsong20ft": 690200
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "신현원창동",
        "distanceKm": 473,
        "witak40ft": 670000,
        "user40ft": 716200,
        "woonsong40ft": 796900,
        "witak20ft": 585600,
        "user20ft": 627700,
        "woonsong20ft": 701300
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "청라1동",
        "distanceKm": 478,
        "witak40ft": 676700,
        "user40ft": 723100,
        "woonsong40ft": 804000,
        "witak20ft": 591400,
        "user20ft": 633600,
        "woonsong20ft": 707400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "청라2동",
        "distanceKm": 481,
        "witak40ft": 680100,
        "user40ft": 726600,
        "woonsong40ft": 807700,
        "witak20ft": 594100,
        "user20ft": 636400,
        "woonsong20ft": 710400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "청라3동",
        "distanceKm": 481,
        "witak40ft": 680800,
        "user40ft": 727300,
        "woonsong40ft": 808500,
        "witak20ft": 594800,
        "user20ft": 637100,
        "woonsong20ft": 711100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "검단동",
        "distanceKm": 496,
        "witak40ft": 696100,
        "user40ft": 743000,
        "woonsong40ft": 824700,
        "witak20ft": 610400,
        "user20ft": 653000,
        "woonsong20ft": 727500
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "불로대곡동",
        "distanceKm": 490,
        "witak40ft": 691200,
        "user40ft": 737900,
        "woonsong40ft": 819500,
        "witak20ft": 606400,
        "user20ft": 649000,
        "woonsong20ft": 723400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "원당동",
        "distanceKm": 481,
        "witak40ft": 680800,
        "user40ft": 727300,
        "woonsong40ft": 808500,
        "witak20ft": 594800,
        "user20ft": 637100,
        "woonsong20ft": 711100
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "오류왕길동",
        "distanceKm": 496,
        "witak40ft": 698400,
        "user40ft": 745300,
        "woonsong40ft": 827000,
        "witak20ft": 612100,
        "user20ft": 654800,
        "woonsong20ft": 729400
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "당하동",
        "distanceKm": 490,
        "witak40ft": 689700,
        "user40ft": 736300,
        "woonsong40ft": 817500,
        "witak20ft": 604700,
        "user20ft": 647100,
        "woonsong20ft": 721200
      },
      {
        "city": "인천광역시",
        "gu": "서구",
        "dong": "마전동",
        "distanceKm": 489,
        "witak40ft": 688700,
        "user40ft": 735300,
        "woonsong40ft": 816600,
        "witak20ft": 603900,
        "user20ft": 646300,
        "woonsong20ft": 720400
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "숭의2동",
        "distanceKm": 466,
        "witak40ft": 661500,
        "user40ft": 707500,
        "woonsong40ft": 788000,
        "witak20ft": 578500,
        "user20ft": 620400,
        "woonsong20ft": 693800
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "숭의4동",
        "distanceKm": 466,
        "witak40ft": 662400,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694700
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "용현2동",
        "distanceKm": 465,
        "witak40ft": 660600,
        "user40ft": 706600,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "용현3동",
        "distanceKm": 462,
        "witak40ft": 657100,
        "user40ft": 703100,
        "woonsong40ft": 783500,
        "witak20ft": 574900,
        "user20ft": 616800,
        "woonsong20ft": 690200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "용현5동",
        "distanceKm": 465,
        "witak40ft": 660600,
        "user40ft": 706600,
        "woonsong40ft": 787100,
        "witak20ft": 577800,
        "user20ft": 619700,
        "woonsong20ft": 693200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "학익1동",
        "distanceKm": 458,
        "witak40ft": 651100,
        "user40ft": 697000,
        "woonsong40ft": 777200,
        "witak20ft": 570200,
        "user20ft": 612000,
        "woonsong20ft": 685200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "학익2동",
        "distanceKm": 458,
        "witak40ft": 652000,
        "user40ft": 697900,
        "woonsong40ft": 778100,
        "witak20ft": 570900,
        "user20ft": 612700,
        "woonsong20ft": 685900
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "도화1동",
        "distanceKm": 460,
        "witak40ft": 654500,
        "user40ft": 700500,
        "woonsong40ft": 780800,
        "witak20ft": 572800,
        "user20ft": 614700,
        "woonsong20ft": 688000
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안1동",
        "distanceKm": 461,
        "witak40ft": 657100,
        "user40ft": 703100,
        "woonsong40ft": 783500,
        "witak20ft": 574900,
        "user20ft": 616800,
        "woonsong20ft": 690200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안2동",
        "distanceKm": 459,
        "witak40ft": 653700,
        "user40ft": 699600,
        "woonsong40ft": 779900,
        "witak20ft": 572100,
        "user20ft": 614000,
        "woonsong20ft": 687300
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안3동",
        "distanceKm": 456,
        "witak40ft": 651100,
        "user40ft": 697000,
        "woonsong40ft": 777200,
        "witak20ft": 570200,
        "user20ft": 612000,
        "woonsong20ft": 685200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안4동",
        "distanceKm": 458,
        "witak40ft": 651300,
        "user40ft": 697100,
        "woonsong40ft": 777300,
        "witak20ft": 570500,
        "user20ft": 612300,
        "woonsong20ft": 685400
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안5동",
        "distanceKm": 468,
        "witak40ft": 660300,
        "user40ft": 706200,
        "woonsong40ft": 786400,
        "witak20ft": 577300,
        "user20ft": 619100,
        "woonsong20ft": 692300
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안6동",
        "distanceKm": 459,
        "witak40ft": 651300,
        "user40ft": 697100,
        "woonsong40ft": 777300,
        "witak20ft": 570500,
        "user20ft": 612300,
        "woonsong20ft": 685400
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안7동",
        "distanceKm": 457,
        "witak40ft": 651100,
        "user40ft": 697000,
        "woonsong40ft": 777200,
        "witak20ft": 570200,
        "user20ft": 612000,
        "woonsong20ft": 685200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "주안8동",
        "distanceKm": 457,
        "witak40ft": 650300,
        "user40ft": 696100,
        "woonsong40ft": 776300,
        "witak20ft": 569700,
        "user20ft": 611400,
        "woonsong20ft": 684600
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "관교동",
        "distanceKm": 455,
        "witak40ft": 648500,
        "user40ft": 694300,
        "woonsong40ft": 774500,
        "witak20ft": 568300,
        "user20ft": 610000,
        "woonsong20ft": 683200
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "문학동",
        "distanceKm": 456,
        "witak40ft": 649400,
        "user40ft": 695200,
        "woonsong40ft": 775300,
        "witak20ft": 569100,
        "user20ft": 610800,
        "woonsong20ft": 684000
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "숭의13동",
        "distanceKm": 466,
        "witak40ft": 663100,
        "user40ft": 709200,
        "woonsong40ft": 789700,
        "witak20ft": 579900,
        "user20ft": 621900,
        "woonsong20ft": 695400
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "용현14동",
        "distanceKm": 466,
        "witak40ft": 661500,
        "user40ft": 707500,
        "woonsong40ft": 788000,
        "witak20ft": 578500,
        "user20ft": 620400,
        "woonsong20ft": 693800
      },
      {
        "city": "인천광역시",
        "gu": "남구",
        "dong": "도화23동",
        "distanceKm": 464,
        "witak40ft": 659700,
        "user40ft": 705700,
        "woonsong40ft": 786200,
        "witak20ft": 577100,
        "user20ft": 619000,
        "woonsong20ft": 692400
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "강화읍",
        "distanceKm": 530,
        "witak40ft": 734500,
        "user40ft": 782400,
        "woonsong40ft": 865700,
        "witak20ft": 643100,
        "user20ft": 686600,
        "woonsong20ft": 762500
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "선원면",
        "distanceKm": 535,
        "witak40ft": 740000,
        "user40ft": 788000,
        "woonsong40ft": 871600,
        "witak20ft": 648000,
        "user20ft": 691600,
        "woonsong20ft": 767700
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "불은면",
        "distanceKm": 539,
        "witak40ft": 742600,
        "user40ft": 790600,
        "woonsong40ft": 874200,
        "witak20ft": 650200,
        "user20ft": 693900,
        "woonsong20ft": 770000
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "길상면",
        "distanceKm": 531,
        "witak40ft": 734200,
        "user40ft": 782100,
        "woonsong40ft": 865300,
        "witak20ft": 642900,
        "user20ft": 686300,
        "woonsong20ft": 762100
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "화도면",
        "distanceKm": 545,
        "witak40ft": 749000,
        "user40ft": 797200,
        "woonsong40ft": 881100,
        "witak20ft": 655800,
        "user20ft": 699600,
        "woonsong20ft": 775900
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "양도면",
        "distanceKm": 546,
        "witak40ft": 751000,
        "user40ft": 799300,
        "woonsong40ft": 883300,
        "witak20ft": 657600,
        "user20ft": 701400,
        "woonsong20ft": 777800
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "내가면",
        "distanceKm": 552,
        "witak40ft": 757600,
        "user40ft": 806100,
        "woonsong40ft": 890400,
        "witak20ft": 663400,
        "user20ft": 707400,
        "woonsong20ft": 784000
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "하점면",
        "distanceKm": 546,
        "witak40ft": 751300,
        "user40ft": 799600,
        "woonsong40ft": 883700,
        "witak20ft": 657900,
        "user20ft": 701800,
        "woonsong20ft": 778200
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "양사면",
        "distanceKm": 554,
        "witak40ft": 759700,
        "user40ft": 808300,
        "woonsong40ft": 892700,
        "witak20ft": 665200,
        "user20ft": 709200,
        "woonsong20ft": 785900
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "송해면",
        "distanceKm": 539,
        "witak40ft": 744200,
        "user40ft": 792400,
        "woonsong40ft": 876100,
        "witak20ft": 651600,
        "user20ft": 695300,
        "woonsong20ft": 771600
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "교동면",
        "distanceKm": 572,
        "witak40ft": 778500,
        "user40ft": 827500,
        "woonsong40ft": 912600,
        "witak20ft": 681400,
        "user20ft": 725900,
        "woonsong20ft": 803300
      },
      {
        "city": "인천광역시",
        "gu": "강화군",
        "dong": "삼산면",
        "distanceKm": 569,
        "witak40ft": 775500,
        "user40ft": 824500,
        "woonsong40ft": 909500,
        "witak20ft": 678900,
        "user20ft": 723300,
        "woonsong20ft": 800600
      },
      {
        "city": "인천광역시",
        "gu": "옹진군",
        "dong": "영흥면",
        "distanceKm": 487,
        "witak40ft": 689800,
        "user40ft": 736800,
        "woonsong40ft": 819000,
        "witak20ft": 606000,
        "user20ft": 648800,
        "woonsong20ft": 723600
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "파장동",
        "distanceKm": 394,
        "witak40ft": 570900,
        "user40ft": 615200,
        "woonsong40ft": 692900,
        "witak20ft": 502500,
        "user20ft": 543000,
        "woonsong20ft": 614100
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "율천동",
        "distanceKm": 397,
        "witak40ft": 572000,
        "user40ft": 616200,
        "woonsong40ft": 693700,
        "witak20ft": 503200,
        "user20ft": 543600,
        "woonsong20ft": 614700
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "정자1동",
        "distanceKm": 394,
        "witak40ft": 569100,
        "user40ft": 613300,
        "woonsong40ft": 691000,
        "witak20ft": 501000,
        "user20ft": 541400,
        "woonsong20ft": 612400
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "정자2동",
        "distanceKm": 390,
        "witak40ft": 566300,
        "user40ft": 610500,
        "woonsong40ft": 688200,
        "witak20ft": 498900,
        "user20ft": 539300,
        "woonsong20ft": 610400
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "영화동",
        "distanceKm": 390,
        "witak40ft": 568900,
        "user40ft": 613300,
        "woonsong40ft": 691200,
        "witak20ft": 501300,
        "user20ft": 541800,
        "woonsong20ft": 613000
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "송죽동",
        "distanceKm": 391,
        "witak40ft": 568100,
        "user40ft": 612400,
        "woonsong40ft": 690200,
        "witak20ft": 500400,
        "user20ft": 540900,
        "woonsong20ft": 612100
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "조원1동",
        "distanceKm": 390,
        "witak40ft": 568900,
        "user40ft": 613300,
        "woonsong40ft": 691200,
        "witak20ft": 501300,
        "user20ft": 541800,
        "woonsong20ft": 613000
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "연무동",
        "distanceKm": 390,
        "witak40ft": 568000,
        "user40ft": 612400,
        "woonsong40ft": 690300,
        "witak20ft": 500500,
        "user20ft": 541000,
        "woonsong20ft": 612300
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "정자3동",
        "distanceKm": 391,
        "witak40ft": 565500,
        "user40ft": 609700,
        "woonsong40ft": 687200,
        "witak20ft": 498000,
        "user20ft": 538400,
        "woonsong20ft": 609500
      },
      {
        "city": "경기도",
        "gu": "수원시_장 안구",
        "dong": "조원2동",
        "distanceKm": 390,
        "witak40ft": 567200,
        "user40ft": 611500,
        "woonsong40ft": 689200,
        "witak20ft": 499700,
        "user20ft": 540200,
        "woonsong20ft": 611400
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "세류1동",
        "distanceKm": 391,
        "witak40ft": 569800,
        "user40ft": 614200,
        "woonsong40ft": 692200,
        "witak20ft": 502100,
        "user20ft": 542700,
        "woonsong20ft": 614000
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "세류2동",
        "distanceKm": 390,
        "witak40ft": 569700,
        "user40ft": 614200,
        "woonsong40ft": 692200,
        "witak20ft": 502100,
        "user20ft": 542700,
        "woonsong20ft": 614100
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "세류3동",
        "distanceKm": 391,
        "witak40ft": 569700,
        "user40ft": 614200,
        "woonsong40ft": 692200,
        "witak20ft": 502100,
        "user20ft": 542700,
        "woonsong20ft": 614100
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "평동",
        "distanceKm": 390,
        "witak40ft": 569800,
        "user40ft": 614200,
        "woonsong40ft": 692200,
        "witak20ft": 502100,
        "user20ft": 542700,
        "woonsong20ft": 614000
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "서둔동",
        "distanceKm": 393,
        "witak40ft": 570000,
        "user40ft": 614300,
        "woonsong40ft": 692100,
        "witak20ft": 501900,
        "user20ft": 542400,
        "woonsong20ft": 613700
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "구운동",
        "distanceKm": 399,
        "witak40ft": 575500,
        "user40ft": 619900,
        "woonsong40ft": 697700,
        "witak20ft": 506300,
        "user20ft": 546800,
        "woonsong20ft": 617900
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "권선1동",
        "distanceKm": 391,
        "witak40ft": 571500,
        "user40ft": 616000,
        "woonsong40ft": 694100,
        "witak20ft": 503700,
        "user20ft": 544400,
        "woonsong20ft": 615900
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "곡선동",
        "distanceKm": 391,
        "witak40ft": 574200,
        "user40ft": 618800,
        "woonsong40ft": 697000,
        "witak20ft": 506800,
        "user20ft": 547500,
        "woonsong20ft": 619100
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "입북동",
        "distanceKm": 395,
        "witak40ft": 568300,
        "user40ft": 612400,
        "woonsong40ft": 689900,
        "witak20ft": 500000,
        "user20ft": 540300,
        "woonsong20ft": 611200
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "권선2동",
        "distanceKm": 393,
        "witak40ft": 574300,
        "user40ft": 618800,
        "woonsong40ft": 697000,
        "witak20ft": 506300,
        "user20ft": 547000,
        "woonsong20ft": 618500
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "금곡동",
        "distanceKm": 398,
        "witak40ft": 574600,
        "user40ft": 618900,
        "woonsong40ft": 696700,
        "witak20ft": 505600,
        "user20ft": 546100,
        "woonsong20ft": 617300
      },
      {
        "city": "경기도",
        "gu": "수원시_권 선구",
        "dong": "호매실동",
        "distanceKm": 398,
        "witak40ft": 576300,
        "user40ft": 620700,
        "woonsong40ft": 698700,
        "witak20ft": 507200,
        "user20ft": 547800,
        "woonsong20ft": 619100
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "지동",
        "distanceKm": 392,
        "witak40ft": 571600,
        "user40ft": 616100,
        "woonsong40ft": 694100,
        "witak20ft": 503600,
        "user20ft": 544200,
        "woonsong20ft": 615700
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "우만1동",
        "distanceKm": 392,
        "witak40ft": 571600,
        "user40ft": 616100,
        "woonsong40ft": 694100,
        "witak20ft": 503600,
        "user20ft": 544200,
        "woonsong20ft": 615700
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "우만2동",
        "distanceKm": 394,
        "witak40ft": 573400,
        "user40ft": 617900,
        "woonsong40ft": 696000,
        "witak20ft": 505200,
        "user20ft": 545900,
        "woonsong20ft": 617400
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "인계동",
        "distanceKm": 395,
        "witak40ft": 575200,
        "user40ft": 619700,
        "woonsong40ft": 697800,
        "witak20ft": 506700,
        "user20ft": 547300,
        "woonsong20ft": 618800
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "매교동",
        "distanceKm": 393,
        "witak40ft": 571700,
        "user40ft": 616100,
        "woonsong40ft": 694100,
        "witak20ft": 503500,
        "user20ft": 544100,
        "woonsong20ft": 615500
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "매산동",
        "distanceKm": 393,
        "witak40ft": 570800,
        "user40ft": 615200,
        "woonsong40ft": 693100,
        "witak20ft": 502700,
        "user20ft": 543300,
        "woonsong20ft": 614600
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "고등동",
        "distanceKm": 406,
        "witak40ft": 593100,
        "user40ft": 638100,
        "woonsong40ft": 717000,
        "witak20ft": 525100,
        "user20ft": 566200,
        "woonsong20ft": 638400
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "화서1동",
        "distanceKm": 394,
        "witak40ft": 572600,
        "user40ft": 617000,
        "woonsong40ft": 694900,
        "witak20ft": 504300,
        "user20ft": 544900,
        "woonsong20ft": 616200
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "화서2동",
        "distanceKm": 391,
        "witak40ft": 567300,
        "user40ft": 611500,
        "woonsong40ft": 689200,
        "witak20ft": 499600,
        "user20ft": 540000,
        "woonsong20ft": 611200
      },
      {
        "city": "경기도",
        "gu": "수원시_팔 달구",
        "dong": "행궁동",
        "distanceKm": 391,
        "witak40ft": 568900,
        "user40ft": 613300,
        "woonsong40ft": 691200,
        "witak20ft": 501300,
        "user20ft": 541800,
        "woonsong20ft": 613000
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "매탄1동",
        "distanceKm": 395,
        "witak40ft": 577000,
        "user40ft": 621600,
        "woonsong40ft": 699800,
        "witak20ft": 508500,
        "user20ft": 549200,
        "woonsong20ft": 620700
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "매탄2동",
        "distanceKm": 394,
        "witak40ft": 575100,
        "user40ft": 619600,
        "woonsong40ft": 697800,
        "witak20ft": 507100,
        "user20ft": 547800,
        "woonsong20ft": 619300
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "매탄3동",
        "distanceKm": 396,
        "witak40ft": 576100,
        "user40ft": 620700,
        "woonsong40ft": 698900,
        "witak20ft": 507800,
        "user20ft": 548500,
        "woonsong20ft": 620100
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "매탄4동",
        "distanceKm": 395,
        "witak40ft": 576900,
        "user40ft": 621500,
        "woonsong40ft": 699900,
        "witak20ft": 509000,
        "user20ft": 549700,
        "woonsong20ft": 621300
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "원천동",
        "distanceKm": 393,
        "witak40ft": 574300,
        "user40ft": 618800,
        "woonsong40ft": 697000,
        "witak20ft": 506300,
        "user20ft": 547000,
        "woonsong20ft": 618500
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "광교1동",
        "distanceKm": 392,
        "witak40ft": 572400,
        "user40ft": 616900,
        "woonsong40ft": 695100,
        "witak20ft": 504400,
        "user20ft": 545100,
        "woonsong20ft": 616600
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "광교2동",
        "distanceKm": 395,
        "witak40ft": 576100,
        "user40ft": 620700,
        "woonsong40ft": 698900,
        "witak20ft": 507800,
        "user20ft": 548500,
        "woonsong20ft": 620100
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "영통1동",
        "distanceKm": 395,
        "witak40ft": 577600,
        "user40ft": 622300,
        "woonsong40ft": 700800,
        "witak20ft": 510500,
        "user20ft": 551300,
        "woonsong20ft": 623200
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "영통2동",
        "distanceKm": 392,
        "witak40ft": 574000,
        "user40ft": 618600,
        "woonsong40ft": 697000,
        "witak20ft": 507200,
        "user20ft": 548000,
        "woonsong20ft": 619700
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "영통3동",
        "distanceKm": 397,
        "witak40ft": 581200,
        "user40ft": 626000,
        "woonsong40ft": 704500,
        "witak20ft": 513900,
        "user20ft": 554800,
        "woonsong20ft": 626600
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "망포1동",
        "distanceKm": 391,
        "witak40ft": 574900,
        "user40ft": 619600,
        "woonsong40ft": 698000,
        "witak20ft": 508300,
        "user20ft": 549100,
        "woonsong20ft": 620900
      },
      {
        "city": "경기도",
        "gu": "수원시_영 통구",
        "dong": "망포2동",
        "distanceKm": 391,
        "witak40ft": 575700,
        "user40ft": 620400,
        "woonsong40ft": 698900,
        "witak20ft": 509100,
        "user20ft": 549900,
        "woonsong20ft": 621700
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "신흥1동",
        "distanceKm": 405,
        "witak40ft": 595900,
        "user40ft": 641100,
        "woonsong40ft": 720300,
        "witak20ft": 527700,
        "user20ft": 568900,
        "woonsong20ft": 641400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "신흥2동",
        "distanceKm": 405,
        "witak40ft": 596600,
        "user40ft": 641800,
        "woonsong40ft": 721200,
        "witak20ft": 528200,
        "user20ft": 569500,
        "woonsong20ft": 642000
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "신흥3동",
        "distanceKm": 404,
        "witak40ft": 594100,
        "user40ft": 639300,
        "woonsong40ft": 718500,
        "witak20ft": 526300,
        "user20ft": 567500,
        "woonsong20ft": 640000
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "태평1동",
        "distanceKm": 404,
        "witak40ft": 593400,
        "user40ft": 638500,
        "woonsong40ft": 717700,
        "witak20ft": 525800,
        "user20ft": 567000,
        "woonsong20ft": 639400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "태평2동",
        "distanceKm": 406,
        "witak40ft": 595900,
        "user40ft": 641100,
        "woonsong40ft": 720300,
        "witak20ft": 527700,
        "user20ft": 568900,
        "woonsong20ft": 641400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "태평3동",
        "distanceKm": 405,
        "witak40ft": 594300,
        "user40ft": 639400,
        "woonsong40ft": 718600,
        "witak20ft": 526600,
        "user20ft": 567800,
        "woonsong20ft": 640200
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "태평4동",
        "distanceKm": 407,
        "witak40ft": 595900,
        "user40ft": 641100,
        "woonsong40ft": 720300,
        "witak20ft": 527700,
        "user20ft": 568900,
        "woonsong20ft": 641400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "수진1동",
        "distanceKm": 403,
        "witak40ft": 591600,
        "user40ft": 636700,
        "woonsong40ft": 715900,
        "witak20ft": 524400,
        "user20ft": 565600,
        "woonsong20ft": 638000
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "수진2동",
        "distanceKm": 402,
        "witak40ft": 591100,
        "user40ft": 636200,
        "woonsong40ft": 715200,
        "witak20ft": 523900,
        "user20ft": 565000,
        "woonsong20ft": 637400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "단대동",
        "distanceKm": 406,
        "witak40ft": 597400,
        "user40ft": 642700,
        "woonsong40ft": 722100,
        "witak20ft": 528700,
        "user20ft": 570000,
        "woonsong20ft": 642700
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "산성동",
        "distanceKm": 406,
        "witak40ft": 597400,
        "user40ft": 642700,
        "woonsong40ft": 722100,
        "witak20ft": 528700,
        "user20ft": 570000,
        "woonsong20ft": 642700
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "양지동",
        "distanceKm": 407,
        "witak40ft": 598300,
        "user40ft": 643600,
        "woonsong40ft": 723100,
        "witak20ft": 529500,
        "user20ft": 570800,
        "woonsong20ft": 643400
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "신촌동",
        "distanceKm": 412,
        "witak40ft": 599900,
        "user40ft": 645000,
        "woonsong40ft": 724200,
        "witak20ft": 530900,
        "user20ft": 572100,
        "woonsong20ft": 644500
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "고등동",
        "distanceKm": 406,
        "witak40ft": 594300,
        "user40ft": 639400,
        "woonsong40ft": 718400,
        "witak20ft": 526200,
        "user20ft": 567300,
        "woonsong20ft": 639600
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "시흥동",
        "distanceKm": 405,
        "witak40ft": 592200,
        "user40ft": 637200,
        "woonsong40ft": 716100,
        "witak20ft": 524400,
        "user20ft": 565400,
        "woonsong20ft": 637600
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "복정동",
        "distanceKm": 413,
        "witak40ft": 602200,
        "user40ft": 647500,
        "woonsong40ft": 726800,
        "witak20ft": 532700,
        "user20ft": 574000,
        "woonsong20ft": 646500
      },
      {
        "city": "경기도",
        "gu": "성남시_수 정구",
        "dong": "위례동",
        "distanceKm": 418,
        "witak40ft": 611000,
        "user40ft": 656400,
        "woonsong40ft": 736100,
        "witak20ft": 539300,
        "user20ft": 580700,
        "woonsong20ft": 653500
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "성남동",
        "distanceKm": 405,
        "witak40ft": 593400,
        "user40ft": 638500,
        "woonsong40ft": 717700,
        "witak20ft": 525800,
        "user20ft": 567000,
        "woonsong20ft": 639400
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "금광1동",
        "distanceKm": 404,
        "witak40ft": 594800,
        "user40ft": 640000,
        "woonsong40ft": 719400,
        "witak20ft": 526800,
        "user20ft": 568100,
        "woonsong20ft": 640600
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "금광2동",
        "distanceKm": 405,
        "witak40ft": 595700,
        "user40ft": 640900,
        "woonsong40ft": 720300,
        "witak20ft": 527600,
        "user20ft": 568900,
        "woonsong20ft": 641400
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "은행1동",
        "distanceKm": 408,
        "witak40ft": 599300,
        "user40ft": 644600,
        "woonsong40ft": 724000,
        "witak20ft": 530300,
        "user20ft": 571600,
        "woonsong20ft": 644200
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "은행2동",
        "distanceKm": 408,
        "witak40ft": 599300,
        "user40ft": 644600,
        "woonsong40ft": 724000,
        "witak20ft": 530300,
        "user20ft": 571600,
        "woonsong20ft": 644200
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "상대원1동",
        "distanceKm": 402,
        "witak40ft": 592200,
        "user40ft": 637400,
        "woonsong40ft": 716600,
        "witak20ft": 524900,
        "user20ft": 566100,
        "woonsong20ft": 638600
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "상대원2동",
        "distanceKm": 403,
        "witak40ft": 593800,
        "user40ft": 639000,
        "woonsong40ft": 718400,
        "witak20ft": 526000,
        "user20ft": 567300,
        "woonsong20ft": 639900
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "상대원3동",
        "distanceKm": 404,
        "witak40ft": 594800,
        "user40ft": 640000,
        "woonsong40ft": 719400,
        "witak20ft": 526800,
        "user20ft": 568100,
        "woonsong20ft": 640600
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "하대원동",
        "distanceKm": 401,
        "witak40ft": 591600,
        "user40ft": 636700,
        "woonsong40ft": 715900,
        "witak20ft": 524400,
        "user20ft": 565600,
        "woonsong20ft": 638000
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "도촌동",
        "distanceKm": 403,
        "witak40ft": 592400,
        "user40ft": 637500,
        "woonsong40ft": 716700,
        "witak20ft": 525100,
        "user20ft": 566300,
        "woonsong20ft": 638600
      },
      {
        "city": "경기도",
        "gu": "성남시_중 원구",
        "dong": "중앙동",
        "distanceKm": 404,
        "witak40ft": 594100,
        "user40ft": 639300,
        "woonsong40ft": 718500,
        "witak20ft": 526300,
        "user20ft": 567500,
        "woonsong20ft": 640000
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "분당동",
        "distanceKm": 410,
        "witak40ft": 598000,
        "user40ft": 643000,
        "woonsong40ft": 722000,
        "witak20ft": 529300,
        "user20ft": 570400,
        "woonsong20ft": 642500
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "수내3동",
        "distanceKm": 409,
        "witak40ft": 595800,
        "user40ft": 640800,
        "woonsong40ft": 719800,
        "witak20ft": 527300,
        "user20ft": 568400,
        "woonsong20ft": 640500
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "수내1동",
        "distanceKm": 408,
        "witak40ft": 592900,
        "user40ft": 637900,
        "woonsong40ft": 716700,
        "witak20ft": 524700,
        "user20ft": 565700,
        "woonsong20ft": 637800
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "수내2동",
        "distanceKm": 409,
        "witak40ft": 595800,
        "user40ft": 640800,
        "woonsong40ft": 719800,
        "witak20ft": 527300,
        "user20ft": 568400,
        "woonsong20ft": 640500
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "정자2동",
        "distanceKm": 410,
        "witak40ft": 596800,
        "user40ft": 641800,
        "woonsong40ft": 720800,
        "witak20ft": 528000,
        "user20ft": 569100,
        "woonsong20ft": 641200
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "정자3동",
        "distanceKm": 408,
        "witak40ft": 594900,
        "user40ft": 639900,
        "woonsong40ft": 718800,
        "witak20ft": 526500,
        "user20ft": 567600,
        "woonsong20ft": 639800
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "서현1동",
        "distanceKm": 408,
        "witak40ft": 597000,
        "user40ft": 642100,
        "woonsong40ft": 721200,
        "witak20ft": 528500,
        "user20ft": 569600,
        "woonsong20ft": 641800
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "서현2동",
        "distanceKm": 409,
        "witak40ft": 597000,
        "user40ft": 642100,
        "woonsong40ft": 721200,
        "witak20ft": 528500,
        "user20ft": 569600,
        "woonsong20ft": 641800
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "이매1동",
        "distanceKm": 406,
        "witak40ft": 594300,
        "user40ft": 639400,
        "woonsong40ft": 718400,
        "witak20ft": 526200,
        "user20ft": 567300,
        "woonsong20ft": 639600
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "이매2동",
        "distanceKm": 406,
        "witak40ft": 592200,
        "user40ft": 637200,
        "woonsong40ft": 716100,
        "witak20ft": 524400,
        "user20ft": 565400,
        "woonsong20ft": 637600
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "야탑1동",
        "distanceKm": 401,
        "witak40ft": 589600,
        "user40ft": 634600,
        "woonsong40ft": 713600,
        "witak20ft": 522600,
        "user20ft": 563700,
        "woonsong20ft": 635900
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "야탑3동",
        "distanceKm": 402,
        "witak40ft": 590600,
        "user40ft": 635700,
        "woonsong40ft": 714700,
        "witak20ft": 523300,
        "user20ft": 564300,
        "woonsong20ft": 636500
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "야탑2동",
        "distanceKm": 400,
        "witak40ft": 587600,
        "user40ft": 632600,
        "woonsong40ft": 711500,
        "witak20ft": 520700,
        "user20ft": 561700,
        "woonsong20ft": 633900
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "구미동",
        "distanceKm": 405,
        "witak40ft": 591100,
        "user40ft": 636100,
        "woonsong40ft": 714900,
        "witak20ft": 523300,
        "user20ft": 564300,
        "woonsong20ft": 636300
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "운중동",
        "distanceKm": 403,
        "witak40ft": 585900,
        "user40ft": 630600,
        "woonsong40ft": 709100,
        "witak20ft": 517200,
        "user20ft": 558100,
        "woonsong20ft": 629900
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "금곡동",
        "distanceKm": 406,
        "witak40ft": 593100,
        "user40ft": 638100,
        "woonsong40ft": 717000,
        "witak20ft": 525100,
        "user20ft": 566200,
        "woonsong20ft": 638400
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "구미1동",
        "distanceKm": 406,
        "witak40ft": 594100,
        "user40ft": 639100,
        "woonsong40ft": 718000,
        "witak20ft": 525900,
        "user20ft": 567000,
        "woonsong20ft": 639100
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "삼평동",
        "distanceKm": 404,
        "witak40ft": 590200,
        "user40ft": 635100,
        "woonsong40ft": 713900,
        "witak20ft": 522500,
        "user20ft": 563500,
        "woonsong20ft": 635500
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "판교동",
        "distanceKm": 403,
        "witak40ft": 587600,
        "user40ft": 632400,
        "woonsong40ft": 711100,
        "witak20ft": 519400,
        "user20ft": 560300,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "백현동",
        "distanceKm": 405,
        "witak40ft": 591100,
        "user40ft": 636100,
        "woonsong40ft": 714900,
        "witak20ft": 523300,
        "user20ft": 564300,
        "woonsong20ft": 636300
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "정자1동",
        "distanceKm": 407,
        "witak40ft": 593800,
        "user40ft": 638800,
        "woonsong40ft": 717600,
        "witak20ft": 525400,
        "user20ft": 566500,
        "woonsong20ft": 638600
      },
      {
        "city": "경기도",
        "gu": "성남시_분 당구",
        "dong": "정자동",
        "distanceKm": 410,
        "witak40ft": 596800,
        "user40ft": 641800,
        "woonsong40ft": 720800,
        "witak20ft": 528000,
        "user20ft": 569100,
        "woonsong20ft": 641200
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "의정부2동",
        "distanceKm": 469,
        "witak40ft": 675200,
        "user40ft": 722200,
        "woonsong40ft": 804400,
        "witak20ft": 594600,
        "user20ft": 637300,
        "woonsong20ft": 712200
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "호원1동",
        "distanceKm": 464,
        "witak40ft": 668200,
        "user40ft": 715000,
        "woonsong40ft": 796800,
        "witak20ft": 588600,
        "user20ft": 631100,
        "woonsong20ft": 705700
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "장암동",
        "distanceKm": 466,
        "witak40ft": 670500,
        "user40ft": 717300,
        "woonsong40ft": 799100,
        "witak20ft": 590400,
        "user20ft": 633000,
        "woonsong20ft": 707600
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "신곡1동",
        "distanceKm": 466,
        "witak40ft": 670500,
        "user40ft": 717300,
        "woonsong40ft": 799100,
        "witak20ft": 590400,
        "user20ft": 633000,
        "woonsong20ft": 707600
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "신곡2동",
        "distanceKm": 469,
        "witak40ft": 674000,
        "user40ft": 720900,
        "woonsong40ft": 803000,
        "witak20ft": 593500,
        "user20ft": 636100,
        "woonsong20ft": 710800
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "송산1동",
        "distanceKm": 471,
        "witak40ft": 677000,
        "user40ft": 724000,
        "woonsong40ft": 806200,
        "witak20ft": 596000,
        "user20ft": 638700,
        "woonsong20ft": 713600
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "자금동",
        "distanceKm": 472,
        "witak40ft": 678300,
        "user40ft": 725300,
        "woonsong40ft": 807500,
        "witak20ft": 597100,
        "user20ft": 639900,
        "woonsong20ft": 714800
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "녹양동",
        "distanceKm": 473,
        "witak40ft": 678300,
        "user40ft": 725300,
        "woonsong40ft": 807500,
        "witak20ft": 597100,
        "user20ft": 639900,
        "woonsong20ft": 714800
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "호원2동",
        "distanceKm": 467,
        "witak40ft": 671800,
        "user40ft": 718700,
        "woonsong40ft": 800600,
        "witak20ft": 591500,
        "user20ft": 634200,
        "woonsong20ft": 708900
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "흥선동",
        "distanceKm": 470,
        "witak40ft": 674000,
        "user40ft": 720900,
        "woonsong40ft": 803000,
        "witak20ft": 593500,
        "user20ft": 636100,
        "woonsong20ft": 710800
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "가능동",
        "distanceKm": 471,
        "witak40ft": 676100,
        "user40ft": 723100,
        "woonsong40ft": 805200,
        "witak20ft": 595200,
        "user20ft": 637900,
        "woonsong20ft": 712800
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "의정부1동",
        "distanceKm": 470,
        "witak40ft": 674800,
        "user40ft": 721800,
        "woonsong40ft": 803900,
        "witak20ft": 594100,
        "user20ft": 636800,
        "woonsong20ft": 711600
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "송산2동",
        "distanceKm": 471,
        "witak40ft": 677000,
        "user40ft": 724000,
        "woonsong40ft": 806200,
        "witak20ft": 596000,
        "user20ft": 638700,
        "woonsong20ft": 713600
      },
      {
        "city": "경기도",
        "gu": "의정부시",
        "dong": "송산3동",
        "distanceKm": 475,
        "witak40ft": 680500,
        "user40ft": 727600,
        "woonsong40ft": 809900,
        "witak20ft": 598800,
        "user20ft": 641600,
        "woonsong20ft": 716700
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양1동",
        "distanceKm": 403,
        "witak40ft": 579300,
        "user40ft": 623600,
        "woonsong40ft": 701400,
        "witak20ft": 509200,
        "user20ft": 549700,
        "woonsong20ft": 621000
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양2동",
        "distanceKm": 405,
        "witak40ft": 581100,
        "user40ft": 625400,
        "woonsong40ft": 703200,
        "witak20ft": 510700,
        "user20ft": 551200,
        "woonsong20ft": 622400
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양3동",
        "distanceKm": 404,
        "witak40ft": 580100,
        "user40ft": 624400,
        "woonsong40ft": 702200,
        "witak20ft": 509900,
        "user20ft": 550400,
        "woonsong20ft": 621600
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양4동",
        "distanceKm": 403,
        "witak40ft": 580100,
        "user40ft": 624400,
        "woonsong40ft": 702200,
        "witak20ft": 509900,
        "user20ft": 550400,
        "woonsong20ft": 621600
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양5동",
        "distanceKm": 402,
        "witak40ft": 577400,
        "user40ft": 621700,
        "woonsong40ft": 699400,
        "witak20ft": 507700,
        "user20ft": 548100,
        "woonsong20ft": 619200
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양6동",
        "distanceKm": 401,
        "witak40ft": 575600,
        "user40ft": 619900,
        "woonsong40ft": 697500,
        "witak20ft": 506100,
        "user20ft": 546500,
        "woonsong20ft": 617500
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양7동",
        "distanceKm": 400,
        "witak40ft": 574700,
        "user40ft": 619000,
        "woonsong40ft": 696600,
        "witak20ft": 505400,
        "user20ft": 545800,
        "woonsong20ft": 616800
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양8동",
        "distanceKm": 400,
        "witak40ft": 574700,
        "user40ft": 619000,
        "woonsong40ft": 696600,
        "witak20ft": 505400,
        "user20ft": 545800,
        "woonsong20ft": 616800
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "안양9동",
        "distanceKm": 406,
        "witak40ft": 582900,
        "user40ft": 627300,
        "woonsong40ft": 705200,
        "witak20ft": 512200,
        "user20ft": 552700,
        "woonsong20ft": 624000
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "석수1동",
        "distanceKm": 416,
        "witak40ft": 594700,
        "user40ft": 639200,
        "woonsong40ft": 717300,
        "witak20ft": 522000,
        "user20ft": 562700,
        "woonsong20ft": 634100
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "석수2동",
        "distanceKm": 416,
        "witak40ft": 592900,
        "user40ft": 637400,
        "woonsong40ft": 715300,
        "witak20ft": 520400,
        "user20ft": 561000,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "석수3동",
        "distanceKm": 417,
        "witak40ft": 592900,
        "user40ft": 637400,
        "woonsong40ft": 715300,
        "witak20ft": 520400,
        "user20ft": 561000,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "박달1동",
        "distanceKm": 406,
        "witak40ft": 582900,
        "user40ft": 627300,
        "woonsong40ft": 705200,
        "witak20ft": 512200,
        "user20ft": 552700,
        "woonsong20ft": 624000
      },
      {
        "city": "경기도",
        "gu": "안양시_만 안구",
        "dong": "박달2동",
        "distanceKm": 416,
        "witak40ft": 592900,
        "user40ft": 637400,
        "woonsong40ft": 715300,
        "witak20ft": 520400,
        "user20ft": 561000,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "비산1동",
        "distanceKm": 403,
        "witak40ft": 580100,
        "user40ft": 624500,
        "woonsong40ft": 702300,
        "witak20ft": 510100,
        "user20ft": 550600,
        "woonsong20ft": 621900
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "비산2동",
        "distanceKm": 402,
        "witak40ft": 578300,
        "user40ft": 622600,
        "woonsong40ft": 700400,
        "witak20ft": 508400,
        "user20ft": 548900,
        "woonsong20ft": 620100
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "비산3동",
        "distanceKm": 403,
        "witak40ft": 580100,
        "user40ft": 624500,
        "woonsong40ft": 702300,
        "witak20ft": 510100,
        "user20ft": 550600,
        "woonsong20ft": 621900
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "부흥동",
        "distanceKm": 400,
        "witak40ft": 575500,
        "user40ft": 619800,
        "woonsong40ft": 697500,
        "witak20ft": 506200,
        "user20ft": 546600,
        "woonsong20ft": 617700
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "달안동",
        "distanceKm": 400,
        "witak40ft": 575500,
        "user40ft": 619800,
        "woonsong40ft": 697500,
        "witak20ft": 506200,
        "user20ft": 546600,
        "woonsong20ft": 617700
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "관양1동",
        "distanceKm": 404,
        "witak40ft": 581000,
        "user40ft": 625400,
        "woonsong40ft": 703200,
        "witak20ft": 510700,
        "user20ft": 551300,
        "woonsong20ft": 622600
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "관양2동",
        "distanceKm": 403,
        "witak40ft": 581000,
        "user40ft": 625400,
        "woonsong40ft": 703200,
        "witak20ft": 510700,
        "user20ft": 551300,
        "woonsong20ft": 622600
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "부림동",
        "distanceKm": 401,
        "witak40ft": 578300,
        "user40ft": 622600,
        "woonsong40ft": 700400,
        "witak20ft": 508400,
        "user20ft": 548900,
        "woonsong20ft": 620100
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "평촌동",
        "distanceKm": 400,
        "witak40ft": 575500,
        "user40ft": 619800,
        "woonsong40ft": 697500,
        "witak20ft": 506200,
        "user20ft": 546600,
        "woonsong20ft": 617700
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "평안동",
        "distanceKm": 405,
        "witak40ft": 580200,
        "user40ft": 624500,
        "woonsong40ft": 702200,
        "witak20ft": 509800,
        "user20ft": 550300,
        "woonsong20ft": 621400
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "귀인동",
        "distanceKm": 398,
        "witak40ft": 572900,
        "user40ft": 617100,
        "woonsong40ft": 694700,
        "witak20ft": 503900,
        "user20ft": 544300,
        "woonsong20ft": 615300
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "호계1동",
        "distanceKm": 394,
        "witak40ft": 567300,
        "user40ft": 611500,
        "woonsong40ft": 689000,
        "witak20ft": 499200,
        "user20ft": 539500,
        "woonsong20ft": 610400
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "호계2동",
        "distanceKm": 399,
        "witak40ft": 572900,
        "user40ft": 617100,
        "woonsong40ft": 694700,
        "witak20ft": 503900,
        "user20ft": 544300,
        "woonsong20ft": 615300
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "호계3동",
        "distanceKm": 393,
        "witak40ft": 566500,
        "user40ft": 610600,
        "woonsong40ft": 688000,
        "witak20ft": 498600,
        "user20ft": 538900,
        "woonsong20ft": 609800
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "범계동",
        "distanceKm": 399,
        "witak40ft": 572900,
        "user40ft": 617100,
        "woonsong40ft": 694700,
        "witak20ft": 503900,
        "user20ft": 544300,
        "woonsong20ft": 615300
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "신촌동",
        "distanceKm": 397,
        "witak40ft": 570100,
        "user40ft": 614300,
        "woonsong40ft": 691800,
        "witak20ft": 501600,
        "user20ft": 542000,
        "woonsong20ft": 613000
      },
      {
        "city": "경기도",
        "gu": "안양시_동 안구",
        "dong": "갈산동",
        "distanceKm": 396,
        "witak40ft": 570100,
        "user40ft": 614300,
        "woonsong40ft": 691800,
        "witak20ft": 501600,
        "user20ft": 542000,
        "woonsong20ft": 613000
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "심곡동",
        "distanceKm": 444,
        "witak40ft": 632300,
        "user40ft": 677800,
        "woonsong40ft": 757300,
        "witak20ft": 556200,
        "user20ft": 597600,
        "woonsong20ft": 670300
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "부천동",
        "distanceKm": 446,
        "witak40ft": 636600,
        "user40ft": 682100,
        "woonsong40ft": 761800,
        "witak20ft": 559400,
        "user20ft": 600900,
        "woonsong20ft": 673700
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "중동",
        "distanceKm": 453,
        "witak40ft": 643600,
        "user40ft": 689200,
        "woonsong40ft": 769000,
        "witak20ft": 564700,
        "user20ft": 606300,
        "woonsong20ft": 679200
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "신중동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "상동",
        "distanceKm": 455,
        "witak40ft": 647800,
        "user40ft": 693600,
        "woonsong40ft": 773600,
        "witak20ft": 567800,
        "user20ft": 609500,
        "woonsong20ft": 682600
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "대산동",
        "distanceKm": 450,
        "witak40ft": 639400,
        "user40ft": 684900,
        "woonsong40ft": 764600,
        "witak20ft": 561800,
        "user20ft": 603300,
        "woonsong20ft": 676000
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "소사본동",
        "distanceKm": 442,
        "witak40ft": 629700,
        "user40ft": 675100,
        "woonsong40ft": 754400,
        "witak20ft": 554300,
        "user20ft": 595700,
        "woonsong20ft": 668300
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "범안동",
        "distanceKm": 440,
        "witak40ft": 628000,
        "user40ft": 673300,
        "woonsong40ft": 752600,
        "witak20ft": 553100,
        "user20ft": 594400,
        "woonsong20ft": 666900
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "성곡동",
        "distanceKm": 449,
        "witak40ft": 640000,
        "user40ft": 685700,
        "woonsong40ft": 765500,
        "witak20ft": 562000,
        "user20ft": 603600,
        "woonsong20ft": 676500
      },
      {
        "city": "경기도",
        "gu": "부천시",
        "dong": "오정동",
        "distanceKm": 460,
        "witak40ft": 650000,
        "user40ft": 695700,
        "woonsong40ft": 775500,
        "witak20ft": 569700,
        "user20ft": 611300,
        "woonsong20ft": 684300
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명1동",
        "distanceKm": 437,
        "witak40ft": 622800,
        "user40ft": 668000,
        "woonsong40ft": 747000,
        "witak20ft": 548800,
        "user20ft": 590000,
        "woonsong20ft": 662200
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명2동",
        "distanceKm": 437,
        "witak40ft": 622800,
        "user40ft": 668000,
        "woonsong40ft": 747000,
        "witak20ft": 548800,
        "user20ft": 590000,
        "woonsong20ft": 662200
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명3동",
        "distanceKm": 436,
        "witak40ft": 622800,
        "user40ft": 668000,
        "woonsong40ft": 747000,
        "witak20ft": 548800,
        "user20ft": 590000,
        "woonsong20ft": 662200
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명4동",
        "distanceKm": 436,
        "witak40ft": 621900,
        "user40ft": 667000,
        "woonsong40ft": 746000,
        "witak20ft": 548000,
        "user20ft": 589200,
        "woonsong20ft": 661400
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명5동",
        "distanceKm": 436,
        "witak40ft": 621900,
        "user40ft": 667000,
        "woonsong40ft": 746000,
        "witak20ft": 548000,
        "user20ft": 589200,
        "woonsong20ft": 661400
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명6동",
        "distanceKm": 435,
        "witak40ft": 619800,
        "user40ft": 664900,
        "woonsong40ft": 743800,
        "witak20ft": 546100,
        "user20ft": 587200,
        "woonsong20ft": 659400
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "광명7동",
        "distanceKm": 434,
        "witak40ft": 618900,
        "user40ft": 664000,
        "woonsong40ft": 742900,
        "witak20ft": 545500,
        "user20ft": 586600,
        "woonsong20ft": 658800
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "철산1동",
        "distanceKm": 434,
        "witak40ft": 620900,
        "user40ft": 666000,
        "woonsong40ft": 745000,
        "witak20ft": 547400,
        "user20ft": 588600,
        "woonsong20ft": 660800
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "철산2동",
        "distanceKm": 431,
        "witak40ft": 614200,
        "user40ft": 659200,
        "woonsong40ft": 737900,
        "witak20ft": 541000,
        "user20ft": 582000,
        "woonsong20ft": 654000
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "철산3동",
        "distanceKm": 429,
        "witak40ft": 611600,
        "user40ft": 656500,
        "woonsong40ft": 735100,
        "witak20ft": 538400,
        "user20ft": 579400,
        "woonsong20ft": 651300
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "철산4동",
        "distanceKm": 435,
        "witak40ft": 618700,
        "user40ft": 663700,
        "woonsong40ft": 742500,
        "witak20ft": 545000,
        "user20ft": 586100,
        "woonsong20ft": 658200
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "하안1동",
        "distanceKm": 433,
        "witak40ft": 616000,
        "user40ft": 661000,
        "woonsong40ft": 739700,
        "witak20ft": 542500,
        "user20ft": 583500,
        "woonsong20ft": 655500
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "하안2동",
        "distanceKm": 427,
        "witak40ft": 609600,
        "user40ft": 654500,
        "woonsong40ft": 733200,
        "witak20ft": 537000,
        "user20ft": 578000,
        "woonsong20ft": 649900
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "하안3동",
        "distanceKm": 426,
        "witak40ft": 607900,
        "user40ft": 652800,
        "woonsong40ft": 731300,
        "witak20ft": 535100,
        "user20ft": 576000,
        "woonsong20ft": 647800
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "하안4동",
        "distanceKm": 427,
        "witak40ft": 609600,
        "user40ft": 654500,
        "woonsong40ft": 733200,
        "witak20ft": 537000,
        "user20ft": 578000,
        "woonsong20ft": 649900
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "소하1동",
        "distanceKm": 424,
        "witak40ft": 605300,
        "user40ft": 650100,
        "woonsong40ft": 728600,
        "witak20ft": 532400,
        "user20ft": 573300,
        "woonsong20ft": 645100
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "소하2동",
        "distanceKm": 422,
        "witak40ft": 600800,
        "user40ft": 645500,
        "woonsong40ft": 723800,
        "witak20ft": 527900,
        "user20ft": 568700,
        "woonsong20ft": 640300
      },
      {
        "city": "경기도",
        "gu": "광명시",
        "dong": "학온동",
        "distanceKm": 422,
        "witak40ft": 603600,
        "user40ft": 648300,
        "woonsong40ft": 726700,
        "witak20ft": 530600,
        "user20ft": 571500,
        "woonsong20ft": 643200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "팽성읍",
        "distanceKm": 407,
        "witak40ft": 614100,
        "user40ft": 660700,
        "woonsong40ft": 742400,
        "witak20ft": 545600,
        "user20ft": 588000,
        "woonsong20ft": 662500
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "안중읍",
        "distanceKm": 409,
        "witak40ft": 611500,
        "user40ft": 657600,
        "woonsong40ft": 738600,
        "witak20ft": 539700,
        "user20ft": 581700,
        "woonsong20ft": 655700
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "포승읍",
        "distanceKm": 429,
        "witak40ft": 633100,
        "user40ft": 679500,
        "woonsong40ft": 760700,
        "witak20ft": 557300,
        "user20ft": 599500,
        "woonsong20ft": 673500
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "청북읍",
        "distanceKm": 408,
        "witak40ft": 606600,
        "user40ft": 652400,
        "woonsong40ft": 732700,
        "witak20ft": 535000,
        "user20ft": 576700,
        "woonsong20ft": 650100
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "진위면",
        "distanceKm": 390,
        "witak40ft": 585400,
        "user40ft": 630900,
        "woonsong40ft": 710800,
        "witak20ft": 518900,
        "user20ft": 560300,
        "woonsong20ft": 633200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "서탄면",
        "distanceKm": 402,
        "witak40ft": 596500,
        "user40ft": 642000,
        "woonsong40ft": 721900,
        "witak20ft": 527500,
        "user20ft": 569000,
        "woonsong20ft": 641900
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "고덕면",
        "distanceKm": 405,
        "witak40ft": 605900,
        "user40ft": 651900,
        "woonsong40ft": 732500,
        "witak20ft": 534900,
        "user20ft": 576700,
        "woonsong20ft": 650200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "오성면",
        "distanceKm": 410,
        "witak40ft": 611300,
        "user40ft": 657300,
        "woonsong40ft": 738000,
        "witak20ft": 539200,
        "user20ft": 581100,
        "woonsong20ft": 654700
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "현덕면",
        "distanceKm": 422,
        "witak40ft": 626600,
        "user40ft": 672900,
        "woonsong40ft": 754200,
        "witak20ft": 552000,
        "user20ft": 594100,
        "woonsong20ft": 668200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "중앙동",
        "distanceKm": 393,
        "witak40ft": 591900,
        "user40ft": 637600,
        "woonsong40ft": 717800,
        "witak20ft": 523400,
        "user20ft": 565000,
        "woonsong20ft": 638300
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "서정동",
        "distanceKm": 392,
        "witak40ft": 589500,
        "user40ft": 635100,
        "woonsong40ft": 715200,
        "witak20ft": 521700,
        "user20ft": 563300,
        "woonsong20ft": 636400
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "송탄동",
        "distanceKm": 395,
        "witak40ft": 598000,
        "user40ft": 644000,
        "woonsong40ft": 724700,
        "witak20ft": 528700,
        "user20ft": 570600,
        "woonsong20ft": 644300
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "지산동",
        "distanceKm": 391,
        "witak40ft": 588800,
        "user40ft": 634300,
        "woonsong40ft": 714300,
        "witak20ft": 521300,
        "user20ft": 562800,
        "woonsong20ft": 635800
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "송북동",
        "distanceKm": 391,
        "witak40ft": 587200,
        "user40ft": 632700,
        "woonsong40ft": 712600,
        "witak20ft": 520100,
        "user20ft": 561600,
        "woonsong20ft": 634600
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "신장1동",
        "distanceKm": 402,
        "witak40ft": 596500,
        "user40ft": 642000,
        "woonsong40ft": 721900,
        "witak20ft": 527500,
        "user20ft": 569000,
        "woonsong20ft": 641900
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "신장2동",
        "distanceKm": 393,
        "witak40ft": 590500,
        "user40ft": 636100,
        "woonsong40ft": 716100,
        "witak20ft": 522400,
        "user20ft": 564000,
        "woonsong20ft": 637100
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "신평동",
        "distanceKm": 400,
        "witak40ft": 607700,
        "user40ft": 654000,
        "woonsong40ft": 735200,
        "witak20ft": 540300,
        "user20ft": 582400,
        "woonsong20ft": 656500
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "원평동",
        "distanceKm": 400,
        "witak40ft": 608400,
        "user40ft": 654700,
        "woonsong40ft": 736000,
        "witak20ft": 540600,
        "user20ft": 582800,
        "woonsong20ft": 657000
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "통복동",
        "distanceKm": 397,
        "witak40ft": 604100,
        "user40ft": 650300,
        "woonsong40ft": 731300,
        "witak20ft": 534200,
        "user20ft": 576200,
        "woonsong20ft": 650200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "비전1동",
        "distanceKm": 398,
        "witak40ft": 605200,
        "user40ft": 651400,
        "woonsong40ft": 732400,
        "witak20ft": 538100,
        "user20ft": 580100,
        "woonsong20ft": 654000
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "세교동",
        "distanceKm": 397,
        "witak40ft": 602500,
        "user40ft": 648600,
        "woonsong40ft": 729600,
        "witak20ft": 532800,
        "user20ft": 574800,
        "woonsong20ft": 648600
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "비전2동",
        "distanceKm": 401,
        "witak40ft": 609300,
        "user40ft": 655600,
        "woonsong40ft": 737000,
        "witak20ft": 541800,
        "user20ft": 584000,
        "woonsong20ft": 658200
      },
      {
        "city": "경기도",
        "gu": "평택시",
        "dong": "용이동",
        "distanceKm": 397,
        "witak40ft": 606200,
        "user40ft": 652300,
        "woonsong40ft": 733300,
        "witak20ft": 539200,
        "user20ft": 581200,
        "woonsong20ft": 655200
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "생연1동",
        "distanceKm": 514,
        "witak40ft": 722100,
        "user40ft": 770200,
        "woonsong40ft": 854200,
        "witak20ft": 633600,
        "user20ft": 677300,
        "woonsong20ft": 753700
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "생연2동",
        "distanceKm": 513,
        "witak40ft": 722100,
        "user40ft": 770200,
        "woonsong40ft": 854200,
        "witak20ft": 633600,
        "user20ft": 677300,
        "woonsong20ft": 753700
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "중앙동",
        "distanceKm": 520,
        "witak40ft": 728100,
        "user40ft": 776400,
        "woonsong40ft": 860600,
        "witak20ft": 638500,
        "user20ft": 682300,
        "woonsong20ft": 758800
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "보산동",
        "distanceKm": 516,
        "witak40ft": 724200,
        "user40ft": 772400,
        "woonsong40ft": 856500,
        "witak20ft": 635400,
        "user20ft": 679100,
        "woonsong20ft": 755600
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "불현동",
        "distanceKm": 512,
        "witak40ft": 720000,
        "user40ft": 768100,
        "woonsong40ft": 851900,
        "witak20ft": 631800,
        "user20ft": 675500,
        "woonsong20ft": 751800
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "소요동",
        "distanceKm": 520,
        "witak40ft": 728800,
        "user40ft": 777200,
        "woonsong40ft": 861500,
        "witak20ft": 639200,
        "user20ft": 683100,
        "woonsong20ft": 759700
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "상패동",
        "distanceKm": 519,
        "witak40ft": 728400,
        "user40ft": 776700,
        "woonsong40ft": 861000,
        "witak20ft": 638800,
        "user20ft": 682600,
        "woonsong20ft": 759300
      },
      {
        "city": "경기도",
        "gu": "동두천시",
        "dong": "송내동",
        "distanceKm": 510,
        "witak40ft": 718000,
        "user40ft": 766000,
        "woonsong40ft": 849800,
        "witak20ft": 630100,
        "user20ft": 673700,
        "woonsong20ft": 749900
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "일동",
        "distanceKm": 409,
        "witak40ft": 588300,
        "user40ft": 632800,
        "woonsong40ft": 710900,
        "witak20ft": 516800,
        "user20ft": 557500,
        "woonsong20ft": 628900
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "본오1동",
        "distanceKm": 412,
        "witak40ft": 589100,
        "user40ft": 633600,
        "woonsong40ft": 711700,
        "witak20ft": 517400,
        "user20ft": 558100,
        "woonsong20ft": 629600
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "본오2동",
        "distanceKm": 410,
        "witak40ft": 588300,
        "user40ft": 632800,
        "woonsong40ft": 710900,
        "witak20ft": 516800,
        "user20ft": 557500,
        "woonsong20ft": 628900
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "본오3동",
        "distanceKm": 409,
        "witak40ft": 587400,
        "user40ft": 631900,
        "woonsong40ft": 709800,
        "witak20ft": 516000,
        "user20ft": 556700,
        "woonsong20ft": 628100
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "부곡동",
        "distanceKm": 416,
        "witak40ft": 596400,
        "user40ft": 641100,
        "woonsong40ft": 719300,
        "witak20ft": 524300,
        "user20ft": 565100,
        "woonsong20ft": 636700
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "월피동",
        "distanceKm": 415,
        "witak40ft": 595400,
        "user40ft": 640100,
        "woonsong40ft": 718400,
        "witak20ft": 523500,
        "user20ft": 564300,
        "woonsong20ft": 636000
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "성포동",
        "distanceKm": 416,
        "witak40ft": 596400,
        "user40ft": 641100,
        "woonsong40ft": 719300,
        "witak20ft": 524300,
        "user20ft": 565100,
        "woonsong20ft": 636700
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "반월동",
        "distanceKm": 402,
        "witak40ft": 575600,
        "user40ft": 619900,
        "woonsong40ft": 697500,
        "witak20ft": 506100,
        "user20ft": 546500,
        "woonsong20ft": 617500
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "안산동",
        "distanceKm": 420,
        "witak40ft": 602400,
        "user40ft": 647300,
        "woonsong40ft": 725900,
        "witak20ft": 530700,
        "user20ft": 571600,
        "woonsong20ft": 643500
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "이동",
        "distanceKm": 410,
        "witak40ft": 588300,
        "user40ft": 632800,
        "woonsong40ft": 710900,
        "witak20ft": 516800,
        "user20ft": 557500,
        "woonsong20ft": 628900
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "사동",
        "distanceKm": 416,
        "witak40ft": 595500,
        "user40ft": 640200,
        "woonsong40ft": 718400,
        "witak20ft": 523000,
        "user20ft": 563800,
        "woonsong20ft": 635400
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "사이동",
        "distanceKm": 416,
        "witak40ft": 595500,
        "user40ft": 640200,
        "woonsong40ft": 718400,
        "witak20ft": 523000,
        "user20ft": 563800,
        "woonsong20ft": 635400
      },
      {
        "city": "경기도",
        "gu": "안산시_상 록구",
        "dong": "해양동",
        "distanceKm": 421,
        "witak40ft": 601700,
        "user40ft": 646400,
        "woonsong40ft": 724800,
        "witak20ft": 529100,
        "user20ft": 569900,
        "woonsong20ft": 641600
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "와동",
        "distanceKm": 418,
        "witak40ft": 598900,
        "user40ft": 643700,
        "woonsong40ft": 722100,
        "witak20ft": 527400,
        "user20ft": 568300,
        "woonsong20ft": 640000
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "초지동",
        "distanceKm": 422,
        "witak40ft": 604300,
        "user40ft": 649100,
        "woonsong40ft": 727700,
        "witak20ft": 532200,
        "user20ft": 573100,
        "woonsong20ft": 645000
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "선부1동",
        "distanceKm": 425,
        "witak40ft": 608700,
        "user40ft": 653600,
        "woonsong40ft": 732300,
        "witak20ft": 536700,
        "user20ft": 577700,
        "woonsong20ft": 649700
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "선부2동",
        "distanceKm": 425,
        "witak40ft": 609500,
        "user40ft": 654500,
        "woonsong40ft": 733400,
        "witak20ft": 537800,
        "user20ft": 578800,
        "woonsong20ft": 650900
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "선부3동",
        "distanceKm": 421,
        "witak40ft": 602400,
        "user40ft": 647300,
        "woonsong40ft": 725900,
        "witak20ft": 530700,
        "user20ft": 571600,
        "woonsong20ft": 643500
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "대부동",
        "distanceKm": 464,
        "witak40ft": 664400,
        "user40ft": 710800,
        "woonsong40ft": 792000,
        "witak20ft": 581900,
        "user20ft": 624200,
        "woonsong20ft": 698200
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "호수동",
        "distanceKm": 419,
        "witak40ft": 601600,
        "user40ft": 646400,
        "woonsong40ft": 724800,
        "witak20ft": 529500,
        "user20ft": 570400,
        "woonsong20ft": 642100
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "고잔동",
        "distanceKm": 418,
        "witak40ft": 599000,
        "user40ft": 643700,
        "woonsong40ft": 722100,
        "witak20ft": 527000,
        "user20ft": 567800,
        "woonsong20ft": 639500
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "중앙동",
        "distanceKm": 418,
        "witak40ft": 599000,
        "user40ft": 643700,
        "woonsong40ft": 722100,
        "witak20ft": 527000,
        "user20ft": 567800,
        "woonsong20ft": 639500
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "원곡동",
        "distanceKm": 426,
        "witak40ft": 610300,
        "user40ft": 655300,
        "woonsong40ft": 734200,
        "witak20ft": 538500,
        "user20ft": 579600,
        "woonsong20ft": 651700
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "신길동",
        "distanceKm": 424,
        "witak40ft": 607700,
        "user40ft": 652700,
        "woonsong40ft": 731400,
        "witak20ft": 535900,
        "user20ft": 576900,
        "woonsong20ft": 648900
      },
      {
        "city": "경기도",
        "gu": "안산시_단 원구",
        "dong": "백운동",
        "distanceKm": 426,
        "witak40ft": 609500,
        "user40ft": 654500,
        "woonsong40ft": 733300,
        "witak20ft": 537400,
        "user20ft": 578400,
        "woonsong20ft": 650500
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "주교동",
        "distanceKm": 479,
        "witak40ft": 678900,
        "user40ft": 725400,
        "woonsong40ft": 806600,
        "witak20ft": 593400,
        "user20ft": 635700,
        "woonsong20ft": 709700
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "원신동",
        "distanceKm": 475,
        "witak40ft": 676500,
        "user40ft": 723100,
        "woonsong40ft": 804400,
        "witak20ft": 594400,
        "user20ft": 636800,
        "woonsong20ft": 711000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "흥도동",
        "distanceKm": 472,
        "witak40ft": 671400,
        "user40ft": 717700,
        "woonsong40ft": 798600,
        "witak20ft": 587000,
        "user20ft": 629200,
        "woonsong20ft": 703000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "성사1동",
        "distanceKm": 479,
        "witak40ft": 678300,
        "user40ft": 724800,
        "woonsong40ft": 805900,
        "witak20ft": 592700,
        "user20ft": 635000,
        "woonsong20ft": 709000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "성사2동",
        "distanceKm": 478,
        "witak40ft": 677400,
        "user40ft": 723800,
        "woonsong40ft": 804900,
        "witak20ft": 592000,
        "user20ft": 634300,
        "woonsong20ft": 708200
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "효자동",
        "distanceKm": 464,
        "witak40ft": 664100,
        "user40ft": 710400,
        "woonsong40ft": 791300,
        "witak20ft": 581300,
        "user20ft": 623500,
        "woonsong20ft": 697300
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "창릉동",
        "distanceKm": 474,
        "witak40ft": 673700,
        "user40ft": 720100,
        "woonsong40ft": 801200,
        "witak20ft": 589100,
        "user20ft": 631400,
        "woonsong20ft": 705400
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "고양동",
        "distanceKm": 474,
        "witak40ft": 676700,
        "user40ft": 723400,
        "woonsong40ft": 804900,
        "witak20ft": 595000,
        "user20ft": 637500,
        "woonsong20ft": 711900
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "관산동",
        "distanceKm": 477,
        "witak40ft": 679100,
        "user40ft": 725800,
        "woonsong40ft": 807300,
        "witak20ft": 596700,
        "user20ft": 639200,
        "woonsong20ft": 713500
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "능곡동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "화정1동",
        "distanceKm": 478,
        "witak40ft": 677400,
        "user40ft": 723800,
        "woonsong40ft": 804900,
        "witak20ft": 592000,
        "user20ft": 634300,
        "woonsong20ft": 708200
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "화정2동",
        "distanceKm": 470,
        "witak40ft": 667300,
        "user40ft": 713500,
        "woonsong40ft": 794200,
        "witak20ft": 583500,
        "user20ft": 625600,
        "woonsong20ft": 699200
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "행주동",
        "distanceKm": 466,
        "witak40ft": 662300,
        "user40ft": 708400,
        "woonsong40ft": 788900,
        "witak20ft": 579200,
        "user20ft": 621200,
        "woonsong20ft": 694800
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "행신1동",
        "distanceKm": 469,
        "witak40ft": 665600,
        "user40ft": 711800,
        "woonsong40ft": 792500,
        "witak20ft": 582000,
        "user20ft": 624100,
        "woonsong20ft": 697700
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "행신2동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "화전동",
        "distanceKm": 461,
        "witak40ft": 657100,
        "user40ft": 703100,
        "woonsong40ft": 783500,
        "witak20ft": 574900,
        "user20ft": 616800,
        "woonsong20ft": 690200
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "대덕동",
        "distanceKm": 456,
        "witak40ft": 649400,
        "user40ft": 695200,
        "woonsong40ft": 775300,
        "witak20ft": 569100,
        "user20ft": 610800,
        "woonsong20ft": 684000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "행신3동",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "경기도",
        "gu": "고양시_덕 양구",
        "dong": "삼송동",
        "distanceKm": 472,
        "witak40ft": 671900,
        "user40ft": 718300,
        "woonsong40ft": 799500,
        "witak20ft": 587700,
        "user20ft": 630000,
        "woonsong20ft": 704000
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "식사동",
        "distanceKm": 484,
        "witak40ft": 685000,
        "user40ft": 731600,
        "woonsong40ft": 813000,
        "witak20ft": 601300,
        "user20ft": 643700,
        "woonsong20ft": 718000
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "중산동",
        "distanceKm": 489,
        "witak40ft": 690400,
        "user40ft": 737100,
        "woonsong40ft": 818700,
        "witak20ft": 605600,
        "user20ft": 648100,
        "woonsong20ft": 722500
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "정발산동",
        "distanceKm": 485,
        "witak40ft": 685000,
        "user40ft": 731600,
        "woonsong40ft": 813000,
        "witak20ft": 601300,
        "user20ft": 643700,
        "woonsong20ft": 718000
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "풍산동",
        "distanceKm": 482,
        "witak40ft": 682400,
        "user40ft": 728900,
        "woonsong40ft": 810200,
        "witak20ft": 599000,
        "user20ft": 641300,
        "woonsong20ft": 715400
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "백석1동",
        "distanceKm": 477,
        "witak40ft": 677400,
        "user40ft": 723800,
        "woonsong40ft": 804900,
        "witak20ft": 592000,
        "user20ft": 634300,
        "woonsong20ft": 708200
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "마두1동",
        "distanceKm": 479,
        "witak40ft": 678900,
        "user40ft": 725400,
        "woonsong40ft": 806600,
        "witak20ft": 593400,
        "user20ft": 635700,
        "woonsong20ft": 709700
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "마두2동",
        "distanceKm": 481,
        "witak40ft": 680600,
        "user40ft": 727100,
        "woonsong40ft": 808400,
        "witak20ft": 597500,
        "user20ft": 639900,
        "woonsong20ft": 714000
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "장항1동",
        "distanceKm": 479,
        "witak40ft": 679900,
        "user40ft": 726400,
        "woonsong40ft": 807600,
        "witak20ft": 594100,
        "user20ft": 636400,
        "woonsong20ft": 710500
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "장항2동",
        "distanceKm": 481,
        "witak40ft": 682400,
        "user40ft": 728900,
        "woonsong40ft": 810200,
        "witak20ft": 599000,
        "user20ft": 641300,
        "woonsong20ft": 715400
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "고봉동",
        "distanceKm": 483,
        "witak40ft": 684500,
        "user40ft": 731100,
        "woonsong40ft": 812600,
        "witak20ft": 600900,
        "user20ft": 643400,
        "woonsong20ft": 717800
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산동구",
        "dong": "백석2동",
        "distanceKm": 476,
        "witak40ft": 674900,
        "user40ft": 721300,
        "woonsong40ft": 802300,
        "witak20ft": 589900,
        "user20ft": 632100,
        "woonsong20ft": 706000
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "일산1동",
        "distanceKm": 492,
        "witak40ft": 694200,
        "user40ft": 741100,
        "woonsong40ft": 823000,
        "witak20ft": 609100,
        "user20ft": 651700,
        "woonsong20ft": 726300
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "일산2동",
        "distanceKm": 488,
        "witak40ft": 689000,
        "user40ft": 735700,
        "woonsong40ft": 817200,
        "witak20ft": 604500,
        "user20ft": 647000,
        "woonsong20ft": 721300
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "일산3동",
        "distanceKm": 487,
        "witak40ft": 686800,
        "user40ft": 733500,
        "woonsong40ft": 814900,
        "witak20ft": 602700,
        "user20ft": 645100,
        "woonsong20ft": 719400
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "탄현동",
        "distanceKm": 495,
        "witak40ft": 696000,
        "user40ft": 742900,
        "woonsong40ft": 824800,
        "witak20ft": 610500,
        "user20ft": 653100,
        "woonsong20ft": 727700
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "주엽1동",
        "distanceKm": 485,
        "witak40ft": 686800,
        "user40ft": 733500,
        "woonsong40ft": 814900,
        "witak20ft": 602700,
        "user20ft": 645100,
        "woonsong20ft": 719400
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "주엽2동",
        "distanceKm": 487,
        "witak40ft": 687700,
        "user40ft": 734400,
        "woonsong40ft": 815800,
        "witak20ft": 603400,
        "user20ft": 645800,
        "woonsong20ft": 720100
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "대화동",
        "distanceKm": 493,
        "witak40ft": 693400,
        "user40ft": 740200,
        "woonsong40ft": 821900,
        "witak20ft": 608200,
        "user20ft": 650800,
        "woonsong20ft": 725300
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "송포동",
        "distanceKm": 488,
        "witak40ft": 689000,
        "user40ft": 735700,
        "woonsong40ft": 817200,
        "witak20ft": 604500,
        "user20ft": 647000,
        "woonsong20ft": 721300
      },
      {
        "city": "경기도",
        "gu": "고양시_일 산서구",
        "dong": "송산동",
        "distanceKm": 494,
        "witak40ft": 695600,
        "user40ft": 742400,
        "woonsong40ft": 824200,
        "witak20ft": 610100,
        "user20ft": 652700,
        "woonsong20ft": 727300
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "중앙동",
        "distanceKm": 410,
        "witak40ft": 589100,
        "user40ft": 633700,
        "woonsong40ft": 711800,
        "witak20ft": 517500,
        "user20ft": 558200,
        "woonsong20ft": 629800
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "갈현동",
        "distanceKm": 411,
        "witak40ft": 588300,
        "user40ft": 632800,
        "woonsong40ft": 710700,
        "witak20ft": 516700,
        "user20ft": 557300,
        "woonsong20ft": 628700
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "별양동",
        "distanceKm": 408,
        "witak40ft": 586300,
        "user40ft": 630800,
        "woonsong40ft": 708900,
        "witak20ft": 515400,
        "user20ft": 556000,
        "woonsong20ft": 627400
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "부림동",
        "distanceKm": 411,
        "witak40ft": 590800,
        "user40ft": 635400,
        "woonsong40ft": 713700,
        "witak20ft": 519500,
        "user20ft": 560200,
        "woonsong20ft": 631700
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "과천동",
        "distanceKm": 413,
        "witak40ft": 594400,
        "user40ft": 639100,
        "woonsong40ft": 717500,
        "witak20ft": 523300,
        "user20ft": 564100,
        "woonsong20ft": 635900
      },
      {
        "city": "경기도",
        "gu": "과천시",
        "dong": "문원동",
        "distanceKm": 409,
        "witak40ft": 590000,
        "user40ft": 634600,
        "woonsong40ft": 712800,
        "witak20ft": 518700,
        "user20ft": 559500,
        "woonsong20ft": 631100
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "갈매동",
        "distanceKm": 444,
        "witak40ft": 645600,
        "user40ft": 691800,
        "woonsong40ft": 772800,
        "witak20ft": 566800,
        "user20ft": 609000,
        "woonsong20ft": 682900
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "동구동",
        "distanceKm": 438,
        "witak40ft": 638600,
        "user40ft": 684800,
        "woonsong40ft": 765600,
        "witak20ft": 561100,
        "user20ft": 603200,
        "woonsong20ft": 677000
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "인창동",
        "distanceKm": 437,
        "witak40ft": 637000,
        "user40ft": 683100,
        "woonsong40ft": 763900,
        "witak20ft": 559600,
        "user20ft": 601600,
        "woonsong20ft": 675400
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "교문1동",
        "distanceKm": 435,
        "witak40ft": 633600,
        "user40ft": 679600,
        "woonsong40ft": 760300,
        "witak20ft": 556900,
        "user20ft": 598800,
        "woonsong20ft": 672400
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "교문2동",
        "distanceKm": 433,
        "witak40ft": 632000,
        "user40ft": 678000,
        "woonsong40ft": 758500,
        "witak20ft": 555500,
        "user20ft": 597400,
        "woonsong20ft": 670900
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "수택1동",
        "distanceKm": 435,
        "witak40ft": 633600,
        "user40ft": 679600,
        "woonsong40ft": 760300,
        "witak20ft": 556900,
        "user20ft": 598800,
        "woonsong20ft": 672400
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "수택2동",
        "distanceKm": 434,
        "witak40ft": 633600,
        "user40ft": 679600,
        "woonsong40ft": 760300,
        "witak20ft": 556900,
        "user20ft": 598800,
        "woonsong20ft": 672400
      },
      {
        "city": "경기도",
        "gu": "구리시",
        "dong": "수택3동",
        "distanceKm": 433,
        "witak40ft": 633600,
        "user40ft": 679600,
        "woonsong40ft": 760300,
        "witak20ft": 556900,
        "user20ft": 598800,
        "woonsong20ft": 672400
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "와부읍",
        "distanceKm": 439,
        "witak40ft": 642600,
        "user40ft": 688900,
        "woonsong40ft": 770000,
        "witak20ft": 564600,
        "user20ft": 606700,
        "woonsong20ft": 680700
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "진접읍",
        "distanceKm": 470,
        "witak40ft": 676200,
        "user40ft": 723400,
        "woonsong40ft": 805800,
        "witak20ft": 595600,
        "user20ft": 638500,
        "woonsong20ft": 713600
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "화도읍",
        "distanceKm": 464,
        "witak40ft": 670600,
        "user40ft": 717600,
        "woonsong40ft": 799700,
        "witak20ft": 590900,
        "user20ft": 633600,
        "woonsong20ft": 708500
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "진건읍",
        "distanceKm": 452,
        "witak40ft": 657500,
        "user40ft": 704100,
        "woonsong40ft": 785700,
        "witak20ft": 579900,
        "user20ft": 622400,
        "woonsong20ft": 696800
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "오남읍",
        "distanceKm": 472,
        "witak40ft": 678400,
        "user40ft": 725600,
        "woonsong40ft": 808100,
        "witak20ft": 597500,
        "user20ft": 640400,
        "woonsong20ft": 715600
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "퇴계원읍",
        "distanceKm": 447,
        "witak40ft": 649900,
        "user40ft": 696400,
        "woonsong40ft": 777800,
        "witak20ft": 573500,
        "user20ft": 615800,
        "woonsong20ft": 690000
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "별내면",
        "distanceKm": 458,
        "witak40ft": 662800,
        "user40ft": 709500,
        "woonsong40ft": 791300,
        "witak20ft": 584200,
        "user20ft": 626700,
        "woonsong20ft": 701300
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "수동면",
        "distanceKm": 476,
        "witak40ft": 683100,
        "user40ft": 730400,
        "woonsong40ft": 813200,
        "witak20ft": 601400,
        "user20ft": 644500,
        "woonsong20ft": 719900
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "조안면",
        "distanceKm": 425,
        "witak40ft": 630100,
        "user40ft": 676400,
        "woonsong40ft": 757700,
        "witak20ft": 557800,
        "user20ft": 600000,
        "woonsong20ft": 674100
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "호평동",
        "distanceKm": 458,
        "witak40ft": 663200,
        "user40ft": 710000,
        "woonsong40ft": 791800,
        "witak20ft": 584600,
        "user20ft": 627200,
        "woonsong20ft": 701900
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "평내동",
        "distanceKm": 455,
        "witak40ft": 659300,
        "user40ft": 705900,
        "woonsong40ft": 787500,
        "witak20ft": 581300,
        "user20ft": 623800,
        "woonsong20ft": 698200
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "금곡동",
        "distanceKm": 448,
        "witak40ft": 651700,
        "user40ft": 698200,
        "woonsong40ft": 779500,
        "witak20ft": 575000,
        "user20ft": 617300,
        "woonsong20ft": 691500
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "양정동",
        "distanceKm": 443,
        "witak40ft": 645300,
        "user40ft": 691600,
        "woonsong40ft": 772700,
        "witak20ft": 566800,
        "user20ft": 609000,
        "woonsong20ft": 683000
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "별내동",
        "distanceKm": 445,
        "witak40ft": 647900,
        "user40ft": 694300,
        "woonsong40ft": 775400,
        "witak20ft": 568900,
        "user20ft": 611100,
        "woonsong20ft": 685200
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "다산1동",
        "distanceKm": 439,
        "witak40ft": 641000,
        "user40ft": 687200,
        "woonsong40ft": 768200,
        "witak20ft": 563200,
        "user20ft": 605300,
        "woonsong20ft": 679200
      },
      {
        "city": "경기도",
        "gu": "남양주시",
        "dong": "다산2동",
        "distanceKm": 437,
        "witak40ft": 640100,
        "user40ft": 686400,
        "woonsong40ft": 767400,
        "witak20ft": 562500,
        "user20ft": 604600,
        "woonsong20ft": 678600
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "중앙동",
        "distanceKm": 387,
        "witak40ft": 577500,
        "user40ft": 622600,
        "woonsong40ft": 701800,
        "witak20ft": 513200,
        "user20ft": 554400,
        "woonsong20ft": 626800
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "대원동",
        "distanceKm": 388,
        "witak40ft": 579200,
        "user40ft": 624300,
        "woonsong40ft": 703600,
        "witak20ft": 514400,
        "user20ft": 555600,
        "woonsong20ft": 628100
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "남촌동",
        "distanceKm": 388,
        "witak40ft": 578500,
        "user40ft": 623600,
        "woonsong40ft": 702800,
        "witak20ft": 513900,
        "user20ft": 555100,
        "woonsong20ft": 627500
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "신장동",
        "distanceKm": 388,
        "witak40ft": 576400,
        "user40ft": 621300,
        "woonsong40ft": 700200,
        "witak20ft": 511800,
        "user20ft": 552800,
        "woonsong20ft": 625000
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "세마동",
        "distanceKm": 391,
        "witak40ft": 576300,
        "user40ft": 621200,
        "woonsong40ft": 699900,
        "witak20ft": 511000,
        "user20ft": 551900,
        "woonsong20ft": 624000
      },
      {
        "city": "경기도",
        "gu": "오산시",
        "dong": "초평동",
        "distanceKm": 391,
        "witak40ft": 582800,
        "user40ft": 628000,
        "woonsong40ft": 707300,
        "witak20ft": 517500,
        "user20ft": 558600,
        "woonsong20ft": 631000
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "대야동",
        "distanceKm": 439,
        "witak40ft": 627100,
        "user40ft": 672400,
        "woonsong40ft": 751700,
        "witak20ft": 552300,
        "user20ft": 593600,
        "woonsong20ft": 666100
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "신천동",
        "distanceKm": 439,
        "witak40ft": 626300,
        "user40ft": 671600,
        "woonsong40ft": 750800,
        "witak20ft": 551800,
        "user20ft": 593100,
        "woonsong20ft": 665500
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "신현동",
        "distanceKm": 434,
        "witak40ft": 620100,
        "user40ft": 665200,
        "woonsong40ft": 744200,
        "witak20ft": 546600,
        "user20ft": 587800,
        "woonsong20ft": 660000
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "은행동",
        "distanceKm": 440,
        "witak40ft": 628000,
        "user40ft": 673300,
        "woonsong40ft": 752600,
        "witak20ft": 553100,
        "user20ft": 594400,
        "woonsong20ft": 666900
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "매화동",
        "distanceKm": 429,
        "witak40ft": 612300,
        "user40ft": 657300,
        "woonsong40ft": 736000,
        "witak20ft": 539500,
        "user20ft": 580500,
        "woonsong20ft": 652500
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "목감동",
        "distanceKm": 419,
        "witak40ft": 599900,
        "user40ft": 644600,
        "woonsong40ft": 723000,
        "witak20ft": 527700,
        "user20ft": 568500,
        "woonsong20ft": 640100
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "과림동",
        "distanceKm": 431,
        "witak40ft": 614200,
        "user40ft": 659200,
        "woonsong40ft": 737900,
        "witak20ft": 541000,
        "user20ft": 582000,
        "woonsong20ft": 654000
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕2동",
        "distanceKm": 435,
        "witak40ft": 622600,
        "user40ft": 667900,
        "woonsong40ft": 747100,
        "witak20ft": 548900,
        "user20ft": 590200,
        "woonsong20ft": 662600
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕3동",
        "distanceKm": 438,
        "witak40ft": 625300,
        "user40ft": 670600,
        "woonsong40ft": 749900,
        "witak20ft": 551100,
        "user20ft": 592400,
        "woonsong20ft": 664900
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕본동",
        "distanceKm": 432,
        "witak40ft": 618700,
        "user40ft": 663900,
        "woonsong40ft": 743000,
        "witak20ft": 545700,
        "user20ft": 586900,
        "woonsong20ft": 659200
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕1동",
        "distanceKm": 431,
        "witak40ft": 617700,
        "user40ft": 662900,
        "woonsong40ft": 742000,
        "witak20ft": 545000,
        "user20ft": 586200,
        "woonsong20ft": 658500
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "능곡동",
        "distanceKm": 425,
        "witak40ft": 608700,
        "user40ft": 653600,
        "woonsong40ft": 732300,
        "witak20ft": 536700,
        "user20ft": 577700,
        "woonsong20ft": 649700
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "군자동",
        "distanceKm": 422,
        "witak40ft": 605100,
        "user40ft": 650000,
        "woonsong40ft": 728600,
        "witak20ft": 533300,
        "user20ft": 574300,
        "woonsong20ft": 646200
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "월곶동",
        "distanceKm": 439,
        "witak40ft": 627100,
        "user40ft": 672400,
        "woonsong40ft": 751700,
        "witak20ft": 552300,
        "user20ft": 593600,
        "woonsong20ft": 666100
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "연성동",
        "distanceKm": 429,
        "witak40ft": 615500,
        "user40ft": 660600,
        "woonsong40ft": 739600,
        "witak20ft": 543000,
        "user20ft": 584100,
        "woonsong20ft": 656300
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "장곡동",
        "distanceKm": 430,
        "witak40ft": 616400,
        "user40ft": 661500,
        "woonsong40ft": 740500,
        "witak20ft": 543800,
        "user20ft": 585000,
        "woonsong20ft": 657200
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "정왕4동",
        "distanceKm": 438,
        "witak40ft": 624700,
        "user40ft": 670000,
        "woonsong40ft": 749200,
        "witak20ft": 550600,
        "user20ft": 591900,
        "woonsong20ft": 664300
      },
      {
        "city": "경기도",
        "gu": "시흥시",
        "dong": "배곧동",
        "distanceKm": 438,
        "witak40ft": 626300,
        "user40ft": 671600,
        "woonsong40ft": 750800,
        "witak20ft": 551800,
        "user20ft": 593100,
        "woonsong20ft": 665500
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "군포1동",
        "distanceKm": 393,
        "witak40ft": 563800,
        "user40ft": 607800,
        "woonsong40ft": 685000,
        "witak20ft": 496200,
        "user20ft": 536400,
        "woonsong20ft": 607200
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "군포2동",
        "distanceKm": 393,
        "witak40ft": 564700,
        "user40ft": 608700,
        "woonsong40ft": 685900,
        "witak20ft": 496800,
        "user20ft": 537000,
        "woonsong20ft": 607800
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "산본1동",
        "distanceKm": 398,
        "witak40ft": 572100,
        "user40ft": 616300,
        "woonsong40ft": 693700,
        "witak20ft": 503100,
        "user20ft": 543500,
        "woonsong20ft": 614500
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "산본2동",
        "distanceKm": 399,
        "witak40ft": 572900,
        "user40ft": 617100,
        "woonsong40ft": 694500,
        "witak20ft": 503800,
        "user20ft": 544200,
        "woonsong20ft": 615100
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "금정동",
        "distanceKm": 396,
        "witak40ft": 569200,
        "user40ft": 613300,
        "woonsong40ft": 690800,
        "witak20ft": 500700,
        "user20ft": 541000,
        "woonsong20ft": 612000
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "재궁동",
        "distanceKm": 395,
        "witak40ft": 568300,
        "user40ft": 612400,
        "woonsong40ft": 689900,
        "witak20ft": 500000,
        "user20ft": 540300,
        "woonsong20ft": 611200
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "오금동",
        "distanceKm": 395,
        "witak40ft": 567400,
        "user40ft": 611500,
        "woonsong40ft": 688900,
        "witak20ft": 499100,
        "user20ft": 539400,
        "woonsong20ft": 610200
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "수리동",
        "distanceKm": 397,
        "witak40ft": 570300,
        "user40ft": 614400,
        "woonsong40ft": 691800,
        "witak20ft": 501400,
        "user20ft": 541700,
        "woonsong20ft": 612700
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "궁내동",
        "distanceKm": 397,
        "witak40ft": 572100,
        "user40ft": 616300,
        "woonsong40ft": 693700,
        "witak20ft": 503100,
        "user20ft": 543500,
        "woonsong20ft": 614500
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "광정동",
        "distanceKm": 397,
        "witak40ft": 572100,
        "user40ft": 616300,
        "woonsong40ft": 693700,
        "witak20ft": 503100,
        "user20ft": 543500,
        "woonsong20ft": 614500
      },
      {
        "city": "경기도",
        "gu": "군포시",
        "dong": "대야동",
        "distanceKm": 396,
        "witak40ft": 569200,
        "user40ft": 613300,
        "woonsong40ft": 690800,
        "witak20ft": 500700,
        "user20ft": 541000,
        "woonsong20ft": 612000
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "고천동",
        "distanceKm": 388,
        "witak40ft": 559100,
        "user40ft": 603000,
        "woonsong40ft": 680200,
        "witak20ft": 492300,
        "user20ft": 532400,
        "woonsong20ft": 603100
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "부곡동",
        "distanceKm": 389,
        "witak40ft": 560100,
        "user40ft": 604100,
        "woonsong40ft": 681300,
        "witak20ft": 493000,
        "user20ft": 533200,
        "woonsong20ft": 603900
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "오전동",
        "distanceKm": 390,
        "witak40ft": 560900,
        "user40ft": 605000,
        "woonsong40ft": 682300,
        "witak20ft": 493900,
        "user20ft": 534100,
        "woonsong20ft": 604900
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "내손1동",
        "distanceKm": 398,
        "witak40ft": 572900,
        "user40ft": 617100,
        "woonsong40ft": 694700,
        "witak20ft": 503900,
        "user20ft": 544300,
        "woonsong20ft": 615300
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "내손2동",
        "distanceKm": 399,
        "witak40ft": 575500,
        "user40ft": 619800,
        "woonsong40ft": 697500,
        "witak20ft": 506200,
        "user20ft": 546600,
        "woonsong20ft": 617700
      },
      {
        "city": "경기도",
        "gu": "의왕시",
        "dong": "청계동",
        "distanceKm": 401,
        "witak40ft": 577300,
        "user40ft": 621700,
        "woonsong40ft": 699500,
        "witak20ft": 507800,
        "user20ft": 548300,
        "woonsong20ft": 619500
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "천현동",
        "distanceKm": 422,
        "witak40ft": 621800,
        "user40ft": 667800,
        "woonsong40ft": 748400,
        "witak20ft": 547300,
        "user20ft": 589200,
        "woonsong20ft": 662800
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "신장1동",
        "distanceKm": 426,
        "witak40ft": 624800,
        "user40ft": 670700,
        "woonsong40ft": 751200,
        "witak20ft": 549600,
        "user20ft": 591400,
        "woonsong20ft": 664900
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "신장2동",
        "distanceKm": 423,
        "witak40ft": 621800,
        "user40ft": 667800,
        "woonsong40ft": 748400,
        "witak20ft": 547300,
        "user20ft": 589200,
        "woonsong20ft": 662800
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "덕풍1동",
        "distanceKm": 426,
        "witak40ft": 623100,
        "user40ft": 669000,
        "woonsong40ft": 749400,
        "witak20ft": 548200,
        "user20ft": 590000,
        "woonsong20ft": 663300
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "덕풍2동",
        "distanceKm": 426,
        "witak40ft": 623900,
        "user40ft": 669800,
        "woonsong40ft": 750200,
        "witak20ft": 548900,
        "user20ft": 590700,
        "woonsong20ft": 664200
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "덕풍3동",
        "distanceKm": 426,
        "witak40ft": 626400,
        "user40ft": 672400,
        "woonsong40ft": 753000,
        "witak20ft": 551000,
        "user20ft": 592900,
        "woonsong20ft": 666400
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "춘궁동",
        "distanceKm": 421,
        "witak40ft": 617100,
        "user40ft": 662800,
        "woonsong40ft": 743000,
        "witak20ft": 543400,
        "user20ft": 585100,
        "woonsong20ft": 658300
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "초이동",
        "distanceKm": 423,
        "witak40ft": 619800,
        "user40ft": 665600,
        "woonsong40ft": 745800,
        "witak20ft": 545600,
        "user20ft": 587300,
        "woonsong20ft": 660500
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "풍산동",
        "distanceKm": 422,
        "witak40ft": 621200,
        "user40ft": 667100,
        "woonsong40ft": 747500,
        "witak20ft": 546600,
        "user20ft": 588400,
        "woonsong20ft": 661900
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "미사1동",
        "distanceKm": 427,
        "witak40ft": 626400,
        "user40ft": 672400,
        "woonsong40ft": 753000,
        "witak20ft": 551000,
        "user20ft": 592900,
        "woonsong20ft": 666400
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "미사2동",
        "distanceKm": 433,
        "witak40ft": 632700,
        "user40ft": 678800,
        "woonsong40ft": 759500,
        "witak20ft": 556100,
        "user20ft": 598000,
        "woonsong20ft": 671600
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "위례동",
        "distanceKm": 421,
        "witak40ft": 613600,
        "user40ft": 659100,
        "woonsong40ft": 738800,
        "witak20ft": 541300,
        "user20ft": 582800,
        "woonsong20ft": 655600
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "감북동",
        "distanceKm": 421,
        "witak40ft": 615800,
        "user40ft": 661400,
        "woonsong40ft": 741300,
        "witak20ft": 542700,
        "user20ft": 584300,
        "woonsong20ft": 657300
      },
      {
        "city": "경기도",
        "gu": "하남시",
        "dong": "감일동",
        "distanceKm": 421,
        "witak40ft": 615800,
        "user40ft": 661400,
        "woonsong40ft": 741300,
        "witak20ft": 542700,
        "user20ft": 584300,
        "woonsong20ft": 657300
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "포곡읍",
        "distanceKm": 393,
        "witak40ft": 584300,
        "user40ft": 629500,
        "woonsong40ft": 709000,
        "witak20ft": 518400,
        "user20ft": 559700,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "모현읍",
        "distanceKm": 404,
        "witak40ft": 601000,
        "user40ft": 646600,
        "woonsong40ft": 726500,
        "witak20ft": 530900,
        "user20ft": 572400,
        "woonsong20ft": 645500
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "이동읍",
        "distanceKm": 405,
        "witak40ft": 604500,
        "user40ft": 650300,
        "woonsong40ft": 730700,
        "witak20ft": 533400,
        "user20ft": 575200,
        "woonsong20ft": 648600
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "남사면",
        "distanceKm": 407,
        "witak40ft": 605000,
        "user40ft": 650700,
        "woonsong40ft": 730900,
        "witak20ft": 533800,
        "user20ft": 575500,
        "woonsong20ft": 648700
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "원삼면",
        "distanceKm": 410,
        "witak40ft": 613300,
        "user40ft": 659400,
        "woonsong40ft": 740400,
        "witak20ft": 541200,
        "user20ft": 583200,
        "woonsong20ft": 657100
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "백암면",
        "distanceKm": 402,
        "witak40ft": 606600,
        "user40ft": 652800,
        "woonsong40ft": 733800,
        "witak20ft": 535900,
        "user20ft": 577900,
        "woonsong20ft": 651900
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "양지면",
        "distanceKm": 390,
        "witak40ft": 587600,
        "user40ft": 633200,
        "woonsong40ft": 713300,
        "witak20ft": 520200,
        "user20ft": 561800,
        "woonsong20ft": 634900
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "중앙동",
        "distanceKm": 395,
        "witak40ft": 589400,
        "user40ft": 634800,
        "woonsong40ft": 714600,
        "witak20ft": 522100,
        "user20ft": 563500,
        "woonsong20ft": 636400
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "역삼동",
        "distanceKm": 396,
        "witak40ft": 587900,
        "user40ft": 633200,
        "woonsong40ft": 712800,
        "witak20ft": 521100,
        "user20ft": 562400,
        "woonsong20ft": 635200
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "유림동",
        "distanceKm": 391,
        "witak40ft": 582500,
        "user40ft": 627700,
        "woonsong40ft": 707200,
        "witak20ft": 517000,
        "user20ft": 558200,
        "woonsong20ft": 630800
      },
      {
        "city": "경기도",
        "gu": "용인시_처 인구",
        "dong": "동부동",
        "distanceKm": 393,
        "witak40ft": 586600,
        "user40ft": 632000,
        "woonsong40ft": 711700,
        "witak20ft": 519900,
        "user20ft": 561300,
        "woonsong20ft": 634200
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "구갈동",
        "distanceKm": 400,
        "witak40ft": 585400,
        "user40ft": 630300,
        "woonsong40ft": 709200,
        "witak20ft": 518800,
        "user20ft": 559800,
        "woonsong20ft": 631900
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "기흥동",
        "distanceKm": 398,
        "witak40ft": 587300,
        "user40ft": 632400,
        "woonsong40ft": 711500,
        "witak20ft": 520800,
        "user20ft": 561900,
        "woonsong20ft": 634300
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "서농동",
        "distanceKm": 392,
        "witak40ft": 578300,
        "user40ft": 623100,
        "woonsong40ft": 701800,
        "witak20ft": 512100,
        "user20ft": 553000,
        "woonsong20ft": 625000
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "구성동",
        "distanceKm": 393,
        "witak40ft": 578300,
        "user40ft": 623100,
        "woonsong40ft": 701800,
        "witak20ft": 512100,
        "user20ft": 553000,
        "woonsong20ft": 625000
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "마북동",
        "distanceKm": 400,
        "witak40ft": 584800,
        "user40ft": 629600,
        "woonsong40ft": 708300,
        "witak20ft": 517200,
        "user20ft": 558100,
        "woonsong20ft": 630100
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "보정동",
        "distanceKm": 401,
        "witak40ft": 587400,
        "user40ft": 632300,
        "woonsong40ft": 711100,
        "witak20ft": 519900,
        "user20ft": 560900,
        "woonsong20ft": 632900
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "상하동",
        "distanceKm": 402,
        "witak40ft": 590600,
        "user40ft": 635700,
        "woonsong40ft": 714700,
        "witak20ft": 523300,
        "user20ft": 564300,
        "woonsong20ft": 636500
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "신갈동",
        "distanceKm": 395,
        "witak40ft": 580100,
        "user40ft": 624900,
        "woonsong40ft": 703600,
        "witak20ft": 513600,
        "user20ft": 554500,
        "woonsong20ft": 626400
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "영덕1동",
        "distanceKm": 394,
        "witak40ft": 578600,
        "user40ft": 623300,
        "woonsong40ft": 701800,
        "witak20ft": 511300,
        "user20ft": 552100,
        "woonsong20ft": 624000
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "영덕2동",
        "distanceKm": 395,
        "witak40ft": 580100,
        "user40ft": 624900,
        "woonsong40ft": 703600,
        "witak20ft": 513600,
        "user20ft": 554500,
        "woonsong20ft": 626400
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "상갈동",
        "distanceKm": 396,
        "witak40ft": 581800,
        "user40ft": 626700,
        "woonsong40ft": 705400,
        "witak20ft": 515500,
        "user20ft": 556400,
        "woonsong20ft": 628400
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "보라동",
        "distanceKm": 398,
        "witak40ft": 586600,
        "user40ft": 631600,
        "woonsong40ft": 710500,
        "witak20ft": 519900,
        "user20ft": 560900,
        "woonsong20ft": 633100
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "동백1동",
        "distanceKm": 394,
        "witak40ft": 583100,
        "user40ft": 628100,
        "woonsong40ft": 707100,
        "witak20ft": 517400,
        "user20ft": 558500,
        "woonsong20ft": 630700
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "동백2동",
        "distanceKm": 394,
        "witak40ft": 583100,
        "user40ft": 628100,
        "woonsong40ft": 707100,
        "witak20ft": 517400,
        "user20ft": 558500,
        "woonsong20ft": 630700
      },
      {
        "city": "경기도",
        "gu": "용인시_기 흥구",
        "dong": "동백3동",
        "distanceKm": 393,
        "witak40ft": 578900,
        "user40ft": 623800,
        "woonsong40ft": 702700,
        "witak20ft": 513700,
        "user20ft": 554700,
        "woonsong20ft": 626800
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "풍덕천1동",
        "distanceKm": 401,
        "witak40ft": 584000,
        "user40ft": 628800,
        "woonsong40ft": 707400,
        "witak20ft": 516100,
        "user20ft": 557000,
        "woonsong20ft": 628800
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "풍덕천2동",
        "distanceKm": 400,
        "witak40ft": 583200,
        "user40ft": 627900,
        "woonsong40ft": 706400,
        "witak20ft": 515000,
        "user20ft": 555800,
        "woonsong20ft": 627600
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "신봉동",
        "distanceKm": 400,
        "witak40ft": 583200,
        "user40ft": 627900,
        "woonsong40ft": 706400,
        "witak20ft": 515000,
        "user20ft": 555800,
        "woonsong20ft": 627600
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "죽전1동",
        "distanceKm": 402,
        "witak40ft": 587400,
        "user40ft": 632300,
        "woonsong40ft": 711100,
        "witak20ft": 519900,
        "user20ft": 560900,
        "woonsong20ft": 632900
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "죽전2동",
        "distanceKm": 401,
        "witak40ft": 585700,
        "user40ft": 630500,
        "woonsong40ft": 709200,
        "witak20ft": 518000,
        "user20ft": 558900,
        "woonsong20ft": 630900
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "동천동",
        "distanceKm": 404,
        "witak40ft": 590200,
        "user40ft": 635100,
        "woonsong40ft": 713900,
        "witak20ft": 522500,
        "user20ft": 563500,
        "woonsong20ft": 635500
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "상현1동",
        "distanceKm": 397,
        "witak40ft": 577800,
        "user40ft": 622400,
        "woonsong40ft": 700800,
        "witak20ft": 509700,
        "user20ft": 550500,
        "woonsong20ft": 622200
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "상현2동",
        "distanceKm": 400,
        "witak40ft": 583200,
        "user40ft": 627900,
        "woonsong40ft": 706400,
        "witak20ft": 515000,
        "user20ft": 555800,
        "woonsong20ft": 627600
      },
      {
        "city": "경기도",
        "gu": "용인시_수 지구",
        "dong": "성복동",
        "distanceKm": 401,
        "witak40ft": 584100,
        "user40ft": 628800,
        "woonsong40ft": 707300,
        "witak20ft": 515700,
        "user20ft": 556500,
        "woonsong20ft": 628200
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "문산읍",
        "distanceKm": 526,
        "witak40ft": 731900,
        "user40ft": 779900,
        "woonsong40ft": 863400,
        "witak20ft": 640900,
        "user20ft": 684500,
        "woonsong20ft": 760600
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "파주읍",
        "distanceKm": 521,
        "witak40ft": 725700,
        "user40ft": 773500,
        "woonsong40ft": 856600,
        "witak20ft": 635600,
        "user20ft": 679000,
        "woonsong20ft": 754700
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "법원읍",
        "distanceKm": 525,
        "witak40ft": 730700,
        "user40ft": 778600,
        "woonsong40ft": 862100,
        "witak20ft": 639900,
        "user20ft": 683400,
        "woonsong20ft": 759400
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "조리읍",
        "distanceKm": 500,
        "witak40ft": 704100,
        "user40ft": 751300,
        "woonsong40ft": 833600,
        "witak20ft": 617400,
        "user20ft": 660300,
        "woonsong20ft": 735300
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "월롱면",
        "distanceKm": 511,
        "witak40ft": 715000,
        "user40ft": 762500,
        "woonsong40ft": 845200,
        "witak20ft": 626500,
        "user20ft": 669700,
        "woonsong20ft": 745000
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "탄현면",
        "distanceKm": 527,
        "witak40ft": 731800,
        "user40ft": 779600,
        "woonsong40ft": 862900,
        "witak20ft": 640900,
        "user20ft": 684400,
        "woonsong20ft": 760200
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "광탄면",
        "distanceKm": 496,
        "witak40ft": 701400,
        "user40ft": 748800,
        "woonsong40ft": 831500,
        "witak20ft": 615800,
        "user20ft": 658900,
        "woonsong20ft": 734300
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "파평면",
        "distanceKm": 548,
        "witak40ft": 753800,
        "user40ft": 802400,
        "woonsong40ft": 886900,
        "witak20ft": 659900,
        "user20ft": 704000,
        "woonsong20ft": 780800
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "적성면",
        "distanceKm": 547,
        "witak40ft": 756800,
        "user40ft": 805900,
        "woonsong40ft": 891300,
        "witak20ft": 662500,
        "user20ft": 707000,
        "woonsong20ft": 784700
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "군내면",
        "distanceKm": 538,
        "witak40ft": 744500,
        "user40ft": 792800,
        "woonsong40ft": 876900,
        "witak20ft": 651800,
        "user20ft": 695700,
        "woonsong20ft": 772200
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "금촌2동",
        "distanceKm": 498,
        "witak40ft": 699900,
        "user40ft": 747000,
        "woonsong40ft": 829100,
        "witak20ft": 613800,
        "user20ft": 656600,
        "woonsong20ft": 731500
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "금촌1동",
        "distanceKm": 500,
        "witak40ft": 702000,
        "user40ft": 749100,
        "woonsong40ft": 831400,
        "witak20ft": 615700,
        "user20ft": 658500,
        "woonsong20ft": 733400
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "금촌3동",
        "distanceKm": 505,
        "witak40ft": 709200,
        "user40ft": 756600,
        "woonsong40ft": 839300,
        "witak20ft": 621800,
        "user20ft": 664900,
        "woonsong20ft": 740200
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "교하동",
        "distanceKm": 510,
        "witak40ft": 712800,
        "user40ft": 760300,
        "woonsong40ft": 842900,
        "witak20ft": 624700,
        "user20ft": 667800,
        "woonsong20ft": 743000
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "운정1동",
        "distanceKm": 502,
        "witak40ft": 706800,
        "user40ft": 754100,
        "woonsong40ft": 836600,
        "witak20ft": 619700,
        "user20ft": 662700,
        "woonsong20ft": 737800
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "운정2동",
        "distanceKm": 502,
        "witak40ft": 704500,
        "user40ft": 751700,
        "woonsong40ft": 834100,
        "witak20ft": 617900,
        "user20ft": 660800,
        "woonsong20ft": 735900
      },
      {
        "city": "경기도",
        "gu": "파주시",
        "dong": "운정3동",
        "distanceKm": 502,
        "witak40ft": 705500,
        "user40ft": 752800,
        "woonsong40ft": 835100,
        "witak20ft": 618600,
        "user20ft": 661600,
        "woonsong20ft": 736600
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "장호원읍",
        "distanceKm": 392,
        "witak40ft": 608400,
        "user40ft": 654300,
        "woonsong40ft": 734900,
        "witak20ft": 543000,
        "user20ft": 584800,
        "woonsong20ft": 658400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "부발읍",
        "distanceKm": 396,
        "witak40ft": 606200,
        "user40ft": 652300,
        "woonsong40ft": 733300,
        "witak20ft": 539500,
        "user20ft": 581500,
        "woonsong20ft": 655300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "신둔면",
        "distanceKm": 402,
        "witak40ft": 609600,
        "user40ft": 656000,
        "woonsong40ft": 737400,
        "witak20ft": 541700,
        "user20ft": 583900,
        "woonsong20ft": 658200
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "백사면",
        "distanceKm": 410,
        "witak40ft": 620400,
        "user40ft": 667200,
        "woonsong40ft": 749300,
        "witak20ft": 551600,
        "user20ft": 594100,
        "woonsong20ft": 668900
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "호법면",
        "distanceKm": 394,
        "witak40ft": 601300,
        "user40ft": 647300,
        "woonsong40ft": 728000,
        "witak20ft": 535100,
        "user20ft": 577000,
        "woonsong20ft": 650600
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "마장면",
        "distanceKm": 390,
        "witak40ft": 592500,
        "user40ft": 638200,
        "woonsong40ft": 718600,
        "witak20ft": 524300,
        "user20ft": 566000,
        "woonsong20ft": 639300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "대월면",
        "distanceKm": 398,
        "witak40ft": 609400,
        "user40ft": 655600,
        "woonsong40ft": 736700,
        "witak20ft": 542400,
        "user20ft": 584500,
        "woonsong20ft": 658600
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "모가면",
        "distanceKm": 412,
        "witak40ft": 621500,
        "user40ft": 668300,
        "woonsong40ft": 750500,
        "witak20ft": 552000,
        "user20ft": 594600,
        "woonsong20ft": 669400
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "설성면",
        "distanceKm": 390,
        "witak40ft": 601600,
        "user40ft": 647300,
        "woonsong40ft": 727600,
        "witak20ft": 536300,
        "user20ft": 578000,
        "woonsong20ft": 651300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "율면",
        "distanceKm": 394,
        "witak40ft": 608900,
        "user40ft": 654900,
        "woonsong40ft": 735700,
        "witak20ft": 543000,
        "user20ft": 584900,
        "woonsong20ft": 658600
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "창전동",
        "distanceKm": 398,
        "witak40ft": 606200,
        "user40ft": 652300,
        "woonsong40ft": 733300,
        "witak20ft": 539500,
        "user20ft": 581500,
        "woonsong20ft": 655300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "중리동",
        "distanceKm": 396,
        "witak40ft": 604000,
        "user40ft": 650000,
        "woonsong40ft": 730900,
        "witak20ft": 537700,
        "user20ft": 579600,
        "woonsong20ft": 653300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "관고동",
        "distanceKm": 397,
        "witak40ft": 606200,
        "user40ft": 652300,
        "woonsong40ft": 733300,
        "witak20ft": 539500,
        "user20ft": 581500,
        "woonsong20ft": 655300
      },
      {
        "city": "경기도",
        "gu": "이천시",
        "dong": "증포동",
        "distanceKm": 398,
        "witak40ft": 607600,
        "user40ft": 653700,
        "woonsong40ft": 734700,
        "witak20ft": 540600,
        "user20ft": 582600,
        "woonsong20ft": 656600
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "공도읍",
        "distanceKm": 398,
        "witak40ft": 606200,
        "user40ft": 652300,
        "woonsong40ft": 733300,
        "witak20ft": 539200,
        "user20ft": 581200,
        "woonsong20ft": 655200
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "보개면",
        "distanceKm": 415,
        "witak40ft": 624200,
        "user40ft": 671000,
        "woonsong40ft": 753200,
        "witak20ft": 554200,
        "user20ft": 596800,
        "woonsong20ft": 671700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "금광면",
        "distanceKm": 422,
        "witak40ft": 632700,
        "user40ft": 679900,
        "woonsong40ft": 762600,
        "witak20ft": 561500,
        "user20ft": 604400,
        "woonsong20ft": 679700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "서운면",
        "distanceKm": 406,
        "witak40ft": 616100,
        "user40ft": 662600,
        "woonsong40ft": 744300,
        "witak20ft": 548000,
        "user20ft": 590300,
        "woonsong20ft": 664800
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "미양면",
        "distanceKm": 413,
        "witak40ft": 622300,
        "user40ft": 669100,
        "woonsong40ft": 751300,
        "witak20ft": 552600,
        "user20ft": 595200,
        "woonsong20ft": 670100
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "대덕면",
        "distanceKm": 408,
        "witak40ft": 617000,
        "user40ft": 663700,
        "woonsong40ft": 745600,
        "witak20ft": 548200,
        "user20ft": 590700,
        "woonsong20ft": 665400
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "양성면",
        "distanceKm": 405,
        "witak40ft": 610000,
        "user40ft": 656200,
        "woonsong40ft": 737400,
        "witak20ft": 538800,
        "user20ft": 580900,
        "woonsong20ft": 654900
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "원곡면",
        "distanceKm": 401,
        "witak40ft": 607000,
        "user40ft": 653300,
        "woonsong40ft": 734500,
        "witak20ft": 536500,
        "user20ft": 578600,
        "woonsong20ft": 652700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "일죽면",
        "distanceKm": 403,
        "witak40ft": 614200,
        "user40ft": 660600,
        "woonsong40ft": 742100,
        "witak20ft": 546600,
        "user20ft": 588800,
        "woonsong20ft": 663100
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "죽산면",
        "distanceKm": 405,
        "witak40ft": 614900,
        "user40ft": 661400,
        "woonsong40ft": 742900,
        "witak20ft": 546700,
        "user20ft": 589000,
        "woonsong20ft": 663400
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "삼죽면",
        "distanceKm": 411,
        "witak40ft": 620400,
        "user40ft": 667200,
        "woonsong40ft": 749400,
        "witak20ft": 551200,
        "user20ft": 593800,
        "woonsong20ft": 668600
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "고삼면",
        "distanceKm": 411,
        "witak40ft": 616900,
        "user40ft": 663300,
        "woonsong40ft": 744600,
        "witak20ft": 547300,
        "user20ft": 589500,
        "woonsong20ft": 663700
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성1동",
        "distanceKm": 412,
        "witak40ft": 621500,
        "user40ft": 668300,
        "woonsong40ft": 750500,
        "witak20ft": 552000,
        "user20ft": 594600,
        "woonsong20ft": 669400
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성2동",
        "distanceKm": 415,
        "witak40ft": 624200,
        "user40ft": 671200,
        "woonsong40ft": 753600,
        "witak20ft": 554400,
        "user20ft": 597100,
        "woonsong20ft": 672300
      },
      {
        "city": "경기도",
        "gu": "안성시",
        "dong": "안성3동",
        "distanceKm": 411,
        "witak40ft": 619800,
        "user40ft": 666500,
        "woonsong40ft": 748500,
        "witak20ft": 550400,
        "user20ft": 592900,
        "woonsong20ft": 667700
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "통진읍",
        "distanceKm": 505,
        "witak40ft": 708700,
        "user40ft": 755900,
        "woonsong40ft": 838200,
        "witak20ft": 621000,
        "user20ft": 664000,
        "woonsong20ft": 739000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "고촌읍",
        "distanceKm": 468,
        "witak40ft": 664700,
        "user40ft": 710900,
        "woonsong40ft": 791600,
        "witak20ft": 581400,
        "user20ft": 623400,
        "woonsong20ft": 697000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "양촌읍",
        "distanceKm": 500,
        "witak40ft": 702200,
        "user40ft": 749300,
        "woonsong40ft": 831300,
        "witak20ft": 615600,
        "user20ft": 658400,
        "woonsong20ft": 733100
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "대곶면",
        "distanceKm": 510,
        "witak40ft": 712600,
        "user40ft": 760000,
        "woonsong40ft": 842400,
        "witak20ft": 624200,
        "user20ft": 667200,
        "woonsong20ft": 742200
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "월곶면",
        "distanceKm": 515,
        "witak40ft": 718600,
        "user40ft": 766100,
        "woonsong40ft": 848800,
        "witak20ft": 629400,
        "user20ft": 672600,
        "woonsong20ft": 747900
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "하성면",
        "distanceKm": 508,
        "witak40ft": 710900,
        "user40ft": 758200,
        "woonsong40ft": 840500,
        "witak20ft": 622800,
        "user20ft": 665800,
        "woonsong20ft": 740800
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "사우동",
        "distanceKm": 482,
        "witak40ft": 682400,
        "user40ft": 728900,
        "woonsong40ft": 810200,
        "witak20ft": 599000,
        "user20ft": 641300,
        "woonsong20ft": 715400
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "풍무동",
        "distanceKm": 479,
        "witak40ft": 678300,
        "user40ft": 724800,
        "woonsong40ft": 805900,
        "witak20ft": 592700,
        "user20ft": 635000,
        "woonsong20ft": 709000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "장기동",
        "distanceKm": 491,
        "witak40ft": 692200,
        "user40ft": 739000,
        "woonsong40ft": 820600,
        "witak20ft": 607100,
        "user20ft": 649600,
        "woonsong20ft": 724000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "운양동",
        "distanceKm": 488,
        "witak40ft": 689000,
        "user40ft": 735700,
        "woonsong40ft": 817200,
        "witak20ft": 604500,
        "user20ft": 647000,
        "woonsong20ft": 721300
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "김포본동",
        "distanceKm": 484,
        "witak40ft": 682700,
        "user40ft": 729200,
        "woonsong40ft": 810300,
        "witak20ft": 596200,
        "user20ft": 638500,
        "woonsong20ft": 712500
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "장기본동",
        "distanceKm": 495,
        "witak40ft": 696900,
        "user40ft": 743800,
        "woonsong40ft": 825700,
        "witak20ft": 611200,
        "user20ft": 653900,
        "woonsong20ft": 728500
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "구래동",
        "distanceKm": 502,
        "witak40ft": 704400,
        "user40ft": 751500,
        "woonsong40ft": 833600,
        "witak20ft": 617400,
        "user20ft": 660200,
        "woonsong20ft": 735000
      },
      {
        "city": "경기도",
        "gu": "김포시",
        "dong": "마산동",
        "distanceKm": 499,
        "witak40ft": 702200,
        "user40ft": 749300,
        "woonsong40ft": 831300,
        "witak20ft": 615600,
        "user20ft": 658400,
        "woonsong20ft": 733100
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "봉담읍",
        "distanceKm": 398,
        "witak40ft": 579600,
        "user40ft": 624300,
        "woonsong40ft": 702600,
        "witak20ft": 511100,
        "user20ft": 551900,
        "woonsong20ft": 623600
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "우정읍",
        "distanceKm": 425,
        "witak40ft": 622400,
        "user40ft": 668300,
        "woonsong40ft": 748600,
        "witak20ft": 547600,
        "user20ft": 589300,
        "woonsong20ft": 662600
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "향남읍",
        "distanceKm": 410,
        "witak40ft": 599600,
        "user40ft": 644800,
        "woonsong40ft": 724100,
        "witak20ft": 530800,
        "user20ft": 572000,
        "woonsong20ft": 644400
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "남양읍",
        "distanceKm": 422,
        "witak40ft": 609100,
        "user40ft": 654200,
        "woonsong40ft": 733100,
        "witak20ft": 538000,
        "user20ft": 579100,
        "woonsong20ft": 651300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "매송면",
        "distanceKm": 402,
        "witak40ft": 582600,
        "user40ft": 627200,
        "woonsong40ft": 705400,
        "witak20ft": 513000,
        "user20ft": 553700,
        "woonsong20ft": 625200
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "비봉면",
        "distanceKm": 410,
        "witak40ft": 591500,
        "user40ft": 636200,
        "woonsong40ft": 714700,
        "witak20ft": 521200,
        "user20ft": 562000,
        "woonsong20ft": 633600
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "마도면",
        "distanceKm": 423,
        "witak40ft": 612400,
        "user40ft": 657700,
        "woonsong40ft": 737100,
        "witak20ft": 540700,
        "user20ft": 582000,
        "woonsong20ft": 654600
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "송산면",
        "distanceKm": 430,
        "witak40ft": 624100,
        "user40ft": 669700,
        "woonsong40ft": 749700,
        "witak20ft": 549300,
        "user20ft": 590900,
        "woonsong20ft": 663900
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "서신면",
        "distanceKm": 440,
        "witak40ft": 636900,
        "user40ft": 682800,
        "woonsong40ft": 763200,
        "witak20ft": 559100,
        "user20ft": 601000,
        "woonsong20ft": 674400
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "팔탄면",
        "distanceKm": 410,
        "witak40ft": 597500,
        "user40ft": 642600,
        "woonsong40ft": 721700,
        "witak20ft": 529000,
        "user20ft": 570100,
        "woonsong20ft": 642400
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "장안면",
        "distanceKm": 426,
        "witak40ft": 622500,
        "user40ft": 668300,
        "woonsong40ft": 748600,
        "witak20ft": 547800,
        "user20ft": 589500,
        "woonsong20ft": 662800
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "양감면",
        "distanceKm": 406,
        "witak40ft": 601100,
        "user40ft": 646600,
        "woonsong40ft": 726500,
        "witak20ft": 531300,
        "user20ft": 572800,
        "woonsong20ft": 645700
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "정남면",
        "distanceKm": 404,
        "witak40ft": 591500,
        "user40ft": 636500,
        "woonsong40ft": 715500,
        "witak20ft": 524000,
        "user20ft": 565100,
        "woonsong20ft": 637400
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "진안동",
        "distanceKm": 390,
        "witak40ft": 573900,
        "user40ft": 618600,
        "woonsong40ft": 697100,
        "witak20ft": 507600,
        "user20ft": 548400,
        "woonsong20ft": 620100
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "병점1동",
        "distanceKm": 389,
        "witak40ft": 572900,
        "user40ft": 617600,
        "woonsong40ft": 696100,
        "witak20ft": 506900,
        "user20ft": 547700,
        "woonsong20ft": 619500
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "병점2동",
        "distanceKm": 391,
        "witak40ft": 575600,
        "user40ft": 620300,
        "woonsong40ft": 698900,
        "witak20ft": 509500,
        "user20ft": 550300,
        "woonsong20ft": 622100
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "반월동",
        "distanceKm": 391,
        "witak40ft": 576600,
        "user40ft": 621300,
        "woonsong40ft": 699900,
        "witak20ft": 510200,
        "user20ft": 551100,
        "woonsong20ft": 623000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "기배동",
        "distanceKm": 392,
        "witak40ft": 573200,
        "user40ft": 617800,
        "woonsong40ft": 696100,
        "witak20ft": 505700,
        "user20ft": 546400,
        "woonsong20ft": 617900
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "화산동",
        "distanceKm": 391,
        "witak40ft": 574900,
        "user40ft": 619600,
        "woonsong40ft": 698000,
        "witak20ft": 508300,
        "user20ft": 549100,
        "woonsong20ft": 620900
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄2동",
        "distanceKm": 395,
        "witak40ft": 582900,
        "user40ft": 627800,
        "woonsong40ft": 706700,
        "witak20ft": 517000,
        "user20ft": 558100,
        "woonsong20ft": 630300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄1동",
        "distanceKm": 393,
        "witak40ft": 579900,
        "user40ft": 624800,
        "woonsong40ft": 703600,
        "witak20ft": 514400,
        "user20ft": 555400,
        "woonsong20ft": 627400
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄3동",
        "distanceKm": 394,
        "witak40ft": 580000,
        "user40ft": 624900,
        "woonsong40ft": 703600,
        "witak20ft": 514100,
        "user20ft": 555000,
        "woonsong20ft": 627000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄4동",
        "distanceKm": 400,
        "witak40ft": 589600,
        "user40ft": 634700,
        "woonsong40ft": 713900,
        "witak20ft": 522900,
        "user20ft": 564000,
        "woonsong20ft": 636300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄5동",
        "distanceKm": 397,
        "witak40ft": 585000,
        "user40ft": 630000,
        "woonsong40ft": 709000,
        "witak20ft": 518900,
        "user20ft": 560000,
        "woonsong20ft": 632300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "새솔동",
        "distanceKm": 421,
        "witak40ft": 604300,
        "user40ft": 649100,
        "woonsong40ft": 727700,
        "witak20ft": 532200,
        "user20ft": 573100,
        "woonsong20ft": 645000
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄7동",
        "distanceKm": 394,
        "witak40ft": 586300,
        "user40ft": 631600,
        "woonsong40ft": 711000,
        "witak20ft": 519900,
        "user20ft": 561200,
        "woonsong20ft": 633800
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄6동",
        "distanceKm": 390,
        "witak40ft": 581900,
        "user40ft": 627000,
        "woonsong40ft": 706300,
        "witak20ft": 516700,
        "user20ft": 557900,
        "woonsong20ft": 630300
      },
      {
        "city": "경기도",
        "gu": "화성시",
        "dong": "동탄8동",
        "distanceKm": 393,
        "witak40ft": 585300,
        "user40ft": 630500,
        "woonsong40ft": 710000,
        "witak20ft": 519200,
        "user20ft": 560500,
        "woonsong20ft": 633100
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "오포읍",
        "distanceKm": 402,
        "witak40ft": 596700,
        "user40ft": 642100,
        "woonsong40ft": 721900,
        "witak20ft": 527700,
        "user20ft": 569200,
        "woonsong20ft": 642100
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "초월읍",
        "distanceKm": 401,
        "witak40ft": 600800,
        "user40ft": 646600,
        "woonsong40ft": 727000,
        "witak20ft": 530500,
        "user20ft": 572200,
        "woonsong20ft": 645600
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "곤지암읍",
        "distanceKm": 405,
        "witak40ft": 607800,
        "user40ft": 653900,
        "woonsong40ft": 734900,
        "witak20ft": 536700,
        "user20ft": 578700,
        "woonsong20ft": 652600
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "도척면",
        "distanceKm": 406,
        "witak40ft": 608300,
        "user40ft": 654300,
        "woonsong40ft": 735100,
        "witak20ft": 536900,
        "user20ft": 578800,
        "woonsong20ft": 652500
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "퇴촌면",
        "distanceKm": 420,
        "witak40ft": 622700,
        "user40ft": 668900,
        "woonsong40ft": 749800,
        "witak20ft": 548700,
        "user20ft": 590700,
        "woonsong20ft": 664500
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "남종면",
        "distanceKm": 427,
        "witak40ft": 629600,
        "user40ft": 675900,
        "woonsong40ft": 757000,
        "witak20ft": 554400,
        "user20ft": 596600,
        "woonsong20ft": 670600
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "남한산성면",
        "distanceKm": 414,
        "witak40ft": 615000,
        "user40ft": 661000,
        "woonsong40ft": 741700,
        "witak20ft": 542200,
        "user20ft": 584100,
        "woonsong20ft": 657700
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "경안동",
        "distanceKm": 406,
        "witak40ft": 604100,
        "user40ft": 649800,
        "woonsong40ft": 730000,
        "witak20ft": 533100,
        "user20ft": 574800,
        "woonsong20ft": 648000
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "송정동",
        "distanceKm": 408,
        "witak40ft": 604400,
        "user40ft": 650000,
        "woonsong40ft": 730100,
        "witak20ft": 533700,
        "user20ft": 575300,
        "woonsong20ft": 648400
      },
      {
        "city": "경기도",
        "gu": "광주시",
        "dong": "광남동",
        "distanceKm": 402,
        "witak40ft": 598100,
        "user40ft": 643700,
        "woonsong40ft": 723600,
        "witak20ft": 528700,
        "user20ft": 570200,
        "woonsong20ft": 643300
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "백석읍",
        "distanceKm": 490,
        "witak40ft": 695600,
        "user40ft": 743100,
        "woonsong40ft": 826000,
        "witak20ft": 611500,
        "user20ft": 654700,
        "woonsong20ft": 730200
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "은현면",
        "distanceKm": 513,
        "witak40ft": 722100,
        "user40ft": 770200,
        "woonsong40ft": 854200,
        "witak20ft": 633600,
        "user20ft": 677300,
        "woonsong20ft": 753700
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "남면",
        "distanceKm": 526,
        "witak40ft": 734800,
        "user40ft": 783300,
        "woonsong40ft": 867800,
        "witak20ft": 644000,
        "user20ft": 688000,
        "woonsong20ft": 764900
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "광적면",
        "distanceKm": 494,
        "witak40ft": 702100,
        "user40ft": 749700,
        "woonsong40ft": 832900,
        "witak20ft": 616900,
        "user20ft": 660200,
        "woonsong20ft": 736000
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "장흥면",
        "distanceKm": 479,
        "witak40ft": 684400,
        "user40ft": 731600,
        "woonsong40ft": 814000,
        "witak20ft": 602200,
        "user20ft": 645100,
        "woonsong20ft": 720200
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "양주1동",
        "distanceKm": 476,
        "witak40ft": 681700,
        "user40ft": 728900,
        "woonsong40ft": 811300,
        "witak20ft": 600000,
        "user20ft": 642900,
        "woonsong20ft": 717900
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "양주2동",
        "distanceKm": 489,
        "witak40ft": 696600,
        "user40ft": 744100,
        "woonsong40ft": 827000,
        "witak20ft": 612300,
        "user20ft": 655400,
        "woonsong20ft": 730900
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천1동",
        "distanceKm": 502,
        "witak40ft": 709100,
        "user40ft": 756800,
        "woonsong40ft": 840200,
        "witak20ft": 622600,
        "user20ft": 666000,
        "woonsong20ft": 742000
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천2동",
        "distanceKm": 493,
        "witak40ft": 700500,
        "user40ft": 748100,
        "woonsong40ft": 831100,
        "witak20ft": 615400,
        "user20ft": 658600,
        "woonsong20ft": 734300
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천3동",
        "distanceKm": 501,
        "witak40ft": 706900,
        "user40ft": 754600,
        "woonsong40ft": 838000,
        "witak20ft": 620800,
        "user20ft": 664200,
        "woonsong20ft": 740000
      },
      {
        "city": "경기도",
        "gu": "양주시",
        "dong": "회천4동",
        "distanceKm": 499,
        "witak40ft": 705100,
        "user40ft": 752800,
        "woonsong40ft": 836000,
        "witak20ft": 619400,
        "user20ft": 662700,
        "woonsong20ft": 738500
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "소흘읍",
        "distanceKm": 494,
        "witak40ft": 702100,
        "user40ft": 749700,
        "woonsong40ft": 832900,
        "witak20ft": 616900,
        "user20ft": 660200,
        "woonsong20ft": 736000
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "군내면",
        "distanceKm": 516,
        "witak40ft": 724900,
        "user40ft": 773100,
        "woonsong40ft": 857300,
        "witak20ft": 636000,
        "user20ft": 679800,
        "woonsong20ft": 756500
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "내촌면",
        "distanceKm": 487,
        "witak40ft": 694800,
        "user40ft": 742400,
        "woonsong40ft": 825600,
        "witak20ft": 611200,
        "user20ft": 654500,
        "woonsong20ft": 730200
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "가산면",
        "distanceKm": 507,
        "witak40ft": 714800,
        "user40ft": 762800,
        "woonsong40ft": 846500,
        "witak20ft": 627600,
        "user20ft": 671100,
        "woonsong20ft": 747300
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "신북면",
        "distanceKm": 524,
        "witak40ft": 733200,
        "user40ft": 781700,
        "woonsong40ft": 866200,
        "witak20ft": 643000,
        "user20ft": 687000,
        "woonsong20ft": 763900
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "창수면",
        "distanceKm": 541,
        "witak40ft": 749700,
        "user40ft": 798600,
        "woonsong40ft": 883800,
        "witak20ft": 656500,
        "user20ft": 700900,
        "woonsong20ft": 778300
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "영중면",
        "distanceKm": 542,
        "witak40ft": 752000,
        "user40ft": 801000,
        "woonsong40ft": 886400,
        "witak20ft": 658500,
        "user20ft": 703000,
        "woonsong20ft": 780500
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "일동면",
        "distanceKm": 544,
        "witak40ft": 753500,
        "user40ft": 802500,
        "woonsong40ft": 887800,
        "witak20ft": 659700,
        "user20ft": 704100,
        "woonsong20ft": 781600
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "이동면",
        "distanceKm": 562,
        "witak40ft": 772100,
        "user40ft": 821500,
        "woonsong40ft": 907500,
        "witak20ft": 675700,
        "user20ft": 720600,
        "woonsong20ft": 798800
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "영북면",
        "distanceKm": 562,
        "witak40ft": 772600,
        "user40ft": 822100,
        "woonsong40ft": 908300,
        "witak20ft": 676100,
        "user20ft": 721100,
        "woonsong20ft": 799400
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "관인면",
        "distanceKm": 583,
        "witak40ft": 794100,
        "user40ft": 844300,
        "woonsong40ft": 931500,
        "witak20ft": 694700,
        "user20ft": 740200,
        "woonsong20ft": 819200
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "화현면",
        "distanceKm": 519,
        "witak40ft": 729600,
        "user40ft": 778100,
        "woonsong40ft": 862700,
        "witak20ft": 640100,
        "user20ft": 684100,
        "woonsong20ft": 761000
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "포천동",
        "distanceKm": 516,
        "witak40ft": 724900,
        "user40ft": 773100,
        "woonsong40ft": 857300,
        "witak20ft": 636000,
        "user20ft": 679800,
        "woonsong20ft": 756500
      },
      {
        "city": "경기도",
        "gu": "포천시",
        "dong": "선단동",
        "distanceKm": 502,
        "witak40ft": 710000,
        "user40ft": 757900,
        "woonsong40ft": 841500,
        "witak20ft": 623700,
        "user20ft": 667200,
        "woonsong20ft": 743300
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "가남읍",
        "distanceKm": 393,
        "witak40ft": 605300,
        "user40ft": 651200,
        "woonsong40ft": 731900,
        "witak20ft": 539600,
        "user20ft": 581400,
        "woonsong20ft": 655000
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "점동면",
        "distanceKm": 412,
        "witak40ft": 626200,
        "user40ft": 673100,
        "woonsong40ft": 755300,
        "witak20ft": 557200,
        "user20ft": 599800,
        "woonsong20ft": 674800
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "능서면",
        "distanceKm": 399,
        "witak40ft": 610800,
        "user40ft": 657000,
        "woonsong40ft": 738100,
        "witak20ft": 543800,
        "user20ft": 585900,
        "woonsong20ft": 660000
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "흥천면",
        "distanceKm": 406,
        "witak40ft": 617700,
        "user40ft": 664300,
        "woonsong40ft": 746000,
        "witak20ft": 549500,
        "user20ft": 591900,
        "woonsong20ft": 666500
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "금사면",
        "distanceKm": 408,
        "witak40ft": 619900,
        "user40ft": 666600,
        "woonsong40ft": 748600,
        "witak20ft": 551000,
        "user20ft": 593500,
        "woonsong20ft": 668300
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "산북면",
        "distanceKm": 413,
        "witak40ft": 620700,
        "user40ft": 667300,
        "woonsong40ft": 749000,
        "witak20ft": 550800,
        "user20ft": 593200,
        "woonsong20ft": 667700
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "대신면",
        "distanceKm": 416,
        "witak40ft": 628000,
        "user40ft": 675100,
        "woonsong40ft": 757700,
        "witak20ft": 558000,
        "user20ft": 600800,
        "woonsong20ft": 676100
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "북내면",
        "distanceKm": 425,
        "witak40ft": 639500,
        "user40ft": 687100,
        "woonsong40ft": 770500,
        "witak20ft": 568200,
        "user20ft": 611400,
        "woonsong20ft": 687300
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "강천면",
        "distanceKm": 421,
        "witak40ft": 635800,
        "user40ft": 683100,
        "woonsong40ft": 766100,
        "witak20ft": 565200,
        "user20ft": 608200,
        "woonsong20ft": 683900
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "여흥동",
        "distanceKm": 411,
        "witak40ft": 624400,
        "user40ft": 671200,
        "woonsong40ft": 753400,
        "witak20ft": 555600,
        "user20ft": 598200,
        "woonsong20ft": 673000
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "중앙동",
        "distanceKm": 408,
        "witak40ft": 622300,
        "user40ft": 669000,
        "woonsong40ft": 751000,
        "witak20ft": 553800,
        "user20ft": 596300,
        "woonsong20ft": 671000
      },
      {
        "city": "경기도",
        "gu": "여주시",
        "dong": "오학동",
        "distanceKm": 417,
        "witak40ft": 631200,
        "user40ft": 678400,
        "woonsong40ft": 761100,
        "witak20ft": 561400,
        "user20ft": 604200,
        "woonsong20ft": 679500
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "연천읍",
        "distanceKm": 565,
        "witak40ft": 775300,
        "user40ft": 824900,
        "woonsong40ft": 911100,
        "witak20ft": 678400,
        "user20ft": 723300,
        "woonsong20ft": 801600
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "전곡읍",
        "distanceKm": 547,
        "witak40ft": 756800,
        "user40ft": 805900,
        "woonsong40ft": 891300,
        "witak20ft": 662500,
        "user20ft": 707000,
        "woonsong20ft": 784700
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "군남면",
        "distanceKm": 569,
        "witak40ft": 779300,
        "user40ft": 829000,
        "woonsong40ft": 915300,
        "witak20ft": 682000,
        "user20ft": 727000,
        "woonsong20ft": 805400
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "청산면",
        "distanceKm": 535,
        "witak40ft": 744300,
        "user40ft": 793100,
        "woonsong40ft": 878000,
        "witak20ft": 652000,
        "user20ft": 696200,
        "woonsong20ft": 773400
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "백학면",
        "distanceKm": 562,
        "witak40ft": 772100,
        "user40ft": 821500,
        "woonsong40ft": 907500,
        "witak20ft": 675700,
        "user20ft": 720600,
        "woonsong20ft": 798800
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "미산면",
        "distanceKm": 566,
        "witak40ft": 775700,
        "user40ft": 825200,
        "woonsong40ft": 911200,
        "witak20ft": 678900,
        "user20ft": 723800,
        "woonsong20ft": 801900
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "왕징면",
        "distanceKm": 565,
        "witak40ft": 775300,
        "user40ft": 824900,
        "woonsong40ft": 911100,
        "witak20ft": 678400,
        "user20ft": 723300,
        "woonsong20ft": 801600
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "신서면",
        "distanceKm": 583,
        "witak40ft": 793600,
        "user40ft": 843700,
        "woonsong40ft": 930700,
        "witak20ft": 694300,
        "user20ft": 739700,
        "woonsong20ft": 818600
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "중면",
        "distanceKm": 584,
        "witak40ft": 795600,
        "user40ft": 845800,
        "woonsong40ft": 932800,
        "witak20ft": 696000,
        "user20ft": 741400,
        "woonsong20ft": 820400
      },
      {
        "city": "경기도",
        "gu": "연천군",
        "dong": "장남면",
        "distanceKm": 553,
        "witak40ft": 762500,
        "user40ft": 811600,
        "woonsong40ft": 897100,
        "witak20ft": 667400,
        "user20ft": 712000,
        "woonsong20ft": 789600
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "가평읍",
        "distanceKm": 524,
        "witak40ft": 735000,
        "user40ft": 783600,
        "woonsong40ft": 868500,
        "witak20ft": 644600,
        "user20ft": 688700,
        "woonsong20ft": 765900
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "설악면",
        "distanceKm": 475,
        "witak40ft": 685200,
        "user40ft": 733000,
        "woonsong40ft": 816700,
        "witak20ft": 604300,
        "user20ft": 647700,
        "woonsong20ft": 723800
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "청평면",
        "distanceKm": 487,
        "witak40ft": 696300,
        "user40ft": 744200,
        "woonsong40ft": 827800,
        "witak20ft": 612900,
        "user20ft": 656400,
        "woonsong20ft": 732500
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "상면",
        "distanceKm": 511,
        "witak40ft": 721700,
        "user40ft": 770200,
        "woonsong40ft": 854900,
        "witak20ft": 634100,
        "user20ft": 678100,
        "woonsong20ft": 755000
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "북면",
        "distanceKm": 543,
        "witak40ft": 752800,
        "user40ft": 802000,
        "woonsong40ft": 887600,
        "witak20ft": 659400,
        "user20ft": 704000,
        "woonsong20ft": 781700
      },
      {
        "city": "경기도",
        "gu": "가평군",
        "dong": "조종면",
        "distanceKm": 514,
        "witak40ft": 724600,
        "user40ft": 773200,
        "woonsong40ft": 858000,
        "witak20ft": 636400,
        "user20ft": 680500,
        "woonsong20ft": 757600
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "양평읍",
        "distanceKm": 426,
        "witak40ft": 637100,
        "user40ft": 684400,
        "woonsong40ft": 767300,
        "witak20ft": 565100,
        "user20ft": 608100,
        "woonsong20ft": 683600
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "강상면",
        "distanceKm": 424,
        "witak40ft": 635800,
        "user40ft": 683000,
        "woonsong40ft": 765800,
        "witak20ft": 564000,
        "user20ft": 606900,
        "woonsong20ft": 682400
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "강하면",
        "distanceKm": 420,
        "witak40ft": 628000,
        "user40ft": 674700,
        "woonsong40ft": 756600,
        "witak20ft": 556800,
        "user20ft": 599300,
        "woonsong20ft": 674000
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "양서면",
        "distanceKm": 427,
        "witak40ft": 633300,
        "user40ft": 679900,
        "woonsong40ft": 761600,
        "witak20ft": 560800,
        "user20ft": 603200,
        "woonsong20ft": 677700
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "옥천면",
        "distanceKm": 430,
        "witak40ft": 640200,
        "user40ft": 687300,
        "woonsong40ft": 770000,
        "witak20ft": 567500,
        "user20ft": 610400,
        "woonsong20ft": 685700
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "서종면",
        "distanceKm": 442,
        "witak40ft": 649700,
        "user40ft": 696700,
        "woonsong40ft": 779000,
        "witak20ft": 574500,
        "user20ft": 617200,
        "woonsong20ft": 692200
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "단월면",
        "distanceKm": 467,
        "witak40ft": 681200,
        "user40ft": 729500,
        "woonsong40ft": 814200,
        "witak20ft": 602100,
        "user20ft": 646000,
        "woonsong20ft": 723100
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "청운면",
        "distanceKm": 475,
        "witak40ft": 689600,
        "user40ft": 738200,
        "woonsong40ft": 823300,
        "witak20ft": 609100,
        "user20ft": 653200,
        "woonsong20ft": 730500
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "양동면",
        "distanceKm": 443,
        "witak40ft": 658000,
        "user40ft": 706200,
        "woonsong40ft": 790600,
        "witak20ft": 583500,
        "user20ft": 627200,
        "woonsong20ft": 704100
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "지평면",
        "distanceKm": 442,
        "witak40ft": 656100,
        "user40ft": 704100,
        "woonsong40ft": 788200,
        "witak20ft": 581500,
        "user20ft": 625100,
        "woonsong20ft": 701600
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "용문면",
        "distanceKm": 449,
        "witak40ft": 662100,
        "user40ft": 710000,
        "woonsong40ft": 793900,
        "witak20ft": 586100,
        "user20ft": 629600,
        "woonsong20ft": 705900
      },
      {
        "city": "경기도",
        "gu": "양평군",
        "dong": "개군면",
        "distanceKm": 423,
        "witak40ft": 634800,
        "user40ft": 682200,
        "woonsong40ft": 765300,
        "witak20ft": 563800,
        "user20ft": 606900,
        "woonsong20ft": 682600
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "신북읍",
        "distanceKm": 548,
        "witak40ft": 764200,
        "user40ft": 814700,
        "woonsong40ft": 902600,
        "witak20ft": 670600,
        "user20ft": 716300,
        "woonsong20ft": 796100
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "동면",
        "distanceKm": 543,
        "witak40ft": 759600,
        "user40ft": 810100,
        "woonsong40ft": 898100,
        "witak20ft": 666900,
        "user20ft": 712600,
        "woonsong20ft": 792400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "동산면",
        "distanceKm": 504,
        "witak40ft": 719700,
        "user40ft": 769000,
        "woonsong40ft": 855300,
        "witak20ft": 634000,
        "user20ft": 678700,
        "woonsong20ft": 757100
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "신동면",
        "distanceKm": 523,
        "witak40ft": 737800,
        "user40ft": 787300,
        "woonsong40ft": 873800,
        "witak20ft": 648500,
        "user20ft": 693400,
        "woonsong20ft": 772000
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "동내면",
        "distanceKm": 527,
        "witak40ft": 743200,
        "user40ft": 793200,
        "woonsong40ft": 880400,
        "witak20ft": 653400,
        "user20ft": 698700,
        "woonsong20ft": 777800
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "남면",
        "distanceKm": 506,
        "witak40ft": 718200,
        "user40ft": 766900,
        "woonsong40ft": 851900,
        "witak20ft": 631600,
        "user20ft": 675800,
        "woonsong20ft": 753100
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "남산면",
        "distanceKm": 515,
        "witak40ft": 726500,
        "user40ft": 775400,
        "woonsong40ft": 860800,
        "witak20ft": 638500,
        "user20ft": 682900,
        "woonsong20ft": 760500
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "서면",
        "distanceKm": 536,
        "witak40ft": 750300,
        "user40ft": 800100,
        "woonsong40ft": 887000,
        "witak20ft": 658600,
        "user20ft": 703700,
        "woonsong20ft": 782500
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "사북면",
        "distanceKm": 569,
        "witak40ft": 783500,
        "user40ft": 834100,
        "woonsong40ft": 922100,
        "witak20ft": 685700,
        "user20ft": 731500,
        "woonsong20ft": 811300
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "북산면",
        "distanceKm": 593,
        "witak40ft": 809500,
        "user40ft": 861400,
        "woonsong40ft": 951700,
        "witak20ft": 707900,
        "user20ft": 754800,
        "woonsong20ft": 836500
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "교동",
        "distanceKm": 531,
        "witak40ft": 746700,
        "user40ft": 796600,
        "woonsong40ft": 883700,
        "witak20ft": 656000,
        "user20ft": 701300,
        "woonsong20ft": 780400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "조운동",
        "distanceKm": 530,
        "witak40ft": 745700,
        "user40ft": 795700,
        "woonsong40ft": 882800,
        "witak20ft": 655300,
        "user20ft": 700500,
        "woonsong20ft": 779600
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "약사명동",
        "distanceKm": 530,
        "witak40ft": 745700,
        "user40ft": 795700,
        "woonsong40ft": 882800,
        "witak20ft": 655300,
        "user20ft": 700500,
        "woonsong20ft": 779600
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "근화동",
        "distanceKm": 530,
        "witak40ft": 745700,
        "user40ft": 795700,
        "woonsong40ft": 882800,
        "witak20ft": 655300,
        "user20ft": 700500,
        "woonsong20ft": 779600
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "소양동",
        "distanceKm": 531,
        "witak40ft": 746700,
        "user40ft": 796600,
        "woonsong40ft": 883700,
        "witak20ft": 656000,
        "user20ft": 701300,
        "woonsong20ft": 780400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "후평1동",
        "distanceKm": 533,
        "witak40ft": 750200,
        "user40ft": 800400,
        "woonsong40ft": 887800,
        "witak20ft": 659100,
        "user20ft": 704500,
        "woonsong20ft": 783900
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "후평2동",
        "distanceKm": 530,
        "witak40ft": 746000,
        "user40ft": 796000,
        "woonsong40ft": 883100,
        "witak20ft": 655600,
        "user20ft": 700900,
        "woonsong20ft": 780000
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "후평3동",
        "distanceKm": 529,
        "witak40ft": 745000,
        "user40ft": 795000,
        "woonsong40ft": 882200,
        "witak20ft": 654800,
        "user20ft": 700100,
        "woonsong20ft": 779300
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "효자1동",
        "distanceKm": 528,
        "witak40ft": 743600,
        "user40ft": 793500,
        "woonsong40ft": 880600,
        "witak20ft": 653700,
        "user20ft": 698900,
        "woonsong20ft": 777800
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "효자2동",
        "distanceKm": 528,
        "witak40ft": 743900,
        "user40ft": 793900,
        "woonsong40ft": 881000,
        "witak20ft": 653900,
        "user20ft": 699100,
        "woonsong20ft": 778100
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "효자3동",
        "distanceKm": 529,
        "witak40ft": 744900,
        "user40ft": 794800,
        "woonsong40ft": 881900,
        "witak20ft": 654600,
        "user20ft": 699800,
        "woonsong20ft": 778900
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "석사동",
        "distanceKm": 526,
        "witak40ft": 741800,
        "user40ft": 791700,
        "woonsong40ft": 878800,
        "witak20ft": 652300,
        "user20ft": 697500,
        "woonsong20ft": 776400
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "퇴계동",
        "distanceKm": 526,
        "witak40ft": 741600,
        "user40ft": 791500,
        "woonsong40ft": 878400,
        "witak20ft": 652000,
        "user20ft": 697100,
        "woonsong20ft": 776000
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "강남동",
        "distanceKm": 528,
        "witak40ft": 743600,
        "user40ft": 793500,
        "woonsong40ft": 880600,
        "witak20ft": 653700,
        "user20ft": 698900,
        "woonsong20ft": 777800
      },
      {
        "city": "강원도",
        "gu": "춘천시",
        "dong": "신사우동",
        "distanceKm": 537,
        "witak40ft": 752700,
        "user40ft": 802800,
        "woonsong40ft": 890200,
        "witak20ft": 661100,
        "user20ft": 706400,
        "woonsong20ft": 785600
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "홍천읍",
        "distanceKm": 503,
        "witak40ft": 720600,
        "user40ft": 770400,
        "woonsong40ft": 857500,
        "witak20ft": 635500,
        "user20ft": 680700,
        "woonsong20ft": 759700
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "화촌면",
        "distanceKm": 533,
        "witak40ft": 750300,
        "user40ft": 800700,
        "woonsong40ft": 888600,
        "witak20ft": 659500,
        "user20ft": 705100,
        "woonsong20ft": 784900
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "두촌면",
        "distanceKm": 558,
        "witak40ft": 776300,
        "user40ft": 827400,
        "woonsong40ft": 916500,
        "witak20ft": 680900,
        "user20ft": 727200,
        "woonsong20ft": 807900
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "내촌면",
        "distanceKm": 570,
        "witak40ft": 788000,
        "user40ft": 839600,
        "woonsong40ft": 929500,
        "witak20ft": 690800,
        "user20ft": 737400,
        "woonsong20ft": 818800
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "서석면",
        "distanceKm": 553,
        "witak40ft": 773300,
        "user40ft": 824900,
        "woonsong40ft": 914800,
        "witak20ft": 679200,
        "user20ft": 725800,
        "woonsong20ft": 807200
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "동면",
        "distanceKm": 515,
        "witak40ft": 733000,
        "user40ft": 783100,
        "woonsong40ft": 870700,
        "witak20ft": 645600,
        "user20ft": 691000,
        "woonsong20ft": 770400
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "남면",
        "distanceKm": 496,
        "witak40ft": 711400,
        "user40ft": 760500,
        "woonsong40ft": 846500,
        "witak20ft": 627100,
        "user20ft": 671600,
        "woonsong20ft": 749700
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "서면",
        "distanceKm": 512,
        "witak40ft": 725700,
        "user40ft": 774800,
        "woonsong40ft": 860500,
        "witak20ft": 638300,
        "user20ft": 682800,
        "woonsong20ft": 760700
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "북방면",
        "distanceKm": 504,
        "witak40ft": 721600,
        "user40ft": 771400,
        "woonsong40ft": 858500,
        "witak20ft": 636200,
        "user20ft": 681300,
        "woonsong20ft": 760300
      },
      {
        "city": "강원도",
        "gu": "홍천군",
        "dong": "내면",
        "distanceKm": 616,
        "witak40ft": 834400,
        "user40ft": 887900,
        "woonsong40ft": 981000,
        "witak20ft": 729100,
        "user20ft": 777300,
        "woonsong20ft": 861300
      }
    ],
    "ulsan2Way": [
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "용당동",
        "distanceKm": 51,
        "witak40ft": 274900,
        "user40ft": 286100,
        "woonsong40ft": 304500,
        "witak20ft": 245200,
        "user20ft": 254600,
        "woonsong20ft": 270000
      },
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "감만1동",
        "distanceKm": 53,
        "witak40ft": 280100,
        "user40ft": 291500,
        "woonsong40ft": 310300,
        "witak20ft": 249600,
        "user20ft": 259300,
        "woonsong20ft": 275100
      },
      {
        "city": "부산광역시",
        "gu": "남구",
        "dong": "우암동",
        "distanceKm": 53,
        "witak40ft": 280100,
        "user40ft": 291500,
        "woonsong40ft": 310300,
        "witak20ft": 249600,
        "user20ft": 259300,
        "woonsong20ft": 275100
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "옥동",
        "distanceKm": 16,
        "witak40ft": 157600,
        "user40ft": 165200,
        "woonsong40ft": 177500,
        "witak20ft": 137900,
        "user20ft": 144300,
        "woonsong20ft": 154700
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "야음장생포동",
        "distanceKm": 11,
        "witak40ft": 139900,
        "user40ft": 146900,
        "woonsong40ft": 158300,
        "witak20ft": 121700,
        "user20ft": 127600,
        "woonsong20ft": 137200
      },
      {
        "city": "울산광역시",
        "gu": "남구",
        "dong": "선암동",
        "distanceKm": 11,
        "witak40ft": 139900,
        "user40ft": 146900,
        "woonsong40ft": 158300,
        "witak20ft": 121700,
        "user20ft": 127600,
        "woonsong20ft": 137200
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "농소1동",
        "distanceKm": 23,
        "witak40ft": 182000,
        "user40ft": 190300,
        "woonsong40ft": 203800,
        "witak20ft": 164300,
        "user20ft": 171300,
        "woonsong20ft": 182700
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "농소2동",
        "distanceKm": 26,
        "witak40ft": 193100,
        "user40ft": 201700,
        "woonsong40ft": 215800,
        "witak20ft": 174400,
        "user20ft": 181600,
        "woonsong20ft": 193400
      },
      {
        "city": "울산광역시",
        "gu": "북구",
        "dong": "효문동",
        "distanceKm": 18,
        "witak40ft": 164700,
        "user40ft": 172500,
        "woonsong40ft": 185100,
        "witak20ft": 145500,
        "user20ft": 152000,
        "woonsong20ft": 162600
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "온산읍",
        "distanceKm": 5,
        "witak40ft": 118100,
        "user40ft": 124500,
        "woonsong40ft": 134800,
        "witak20ft": 102800,
        "user20ft": 108200,
        "woonsong20ft": 116900
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "언양읍",
        "distanceKm": 36,
        "witak40ft": 226000,
        "user40ft": 235600,
        "woonsong40ft": 251400,
        "witak20ft": 198800,
        "user20ft": 207000,
        "woonsong20ft": 220300
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "온양읍",
        "distanceKm": 12,
        "witak40ft": 143500,
        "user40ft": 150700,
        "woonsong40ft": 162300,
        "witak20ft": 124900,
        "user20ft": 130900,
        "woonsong20ft": 140600
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "청량읍",
        "distanceKm": 10,
        "witak40ft": 136200,
        "user40ft": 143100,
        "woonsong40ft": 154400,
        "witak20ft": 118600,
        "user20ft": 124500,
        "woonsong20ft": 134000
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "웅촌면",
        "distanceKm": 23,
        "witak40ft": 182000,
        "user40ft": 190300,
        "woonsong40ft": 203800,
        "witak20ft": 164300,
        "user20ft": 171300,
        "woonsong20ft": 182700
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "두동면",
        "distanceKm": 33,
        "witak40ft": 216000,
        "user40ft": 225300,
        "woonsong40ft": 240600,
        "witak20ft": 191600,
        "user20ft": 199500,
        "woonsong20ft": 212300
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "두서면",
        "distanceKm": 44,
        "witak40ft": 252300,
        "user40ft": 262700,
        "woonsong40ft": 279900,
        "witak20ft": 219900,
        "user20ft": 228700,
        "woonsong20ft": 243200
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "상북면",
        "distanceKm": 39,
        "witak40ft": 235900,
        "user40ft": 245900,
        "woonsong40ft": 262200,
        "witak20ft": 206100,
        "user20ft": 214500,
        "woonsong20ft": 228300
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "삼남면",
        "distanceKm": 33,
        "witak40ft": 216000,
        "user40ft": 225300,
        "woonsong40ft": 240600,
        "witak20ft": 191600,
        "user20ft": 199500,
        "woonsong20ft": 212300
      },
      {
        "city": "울산광역시",
        "gu": "울주군",
        "dong": "삼동면",
        "distanceKm": 26,
        "witak40ft": 193100,
        "user40ft": 201700,
        "woonsong40ft": 215800,
        "witak20ft": 174400,
        "user20ft": 181600,
        "woonsong20ft": 193400
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "구룡포읍",
        "distanceKm": 93,
        "witak40ft": 378700,
        "user40ft": 394200,
        "woonsong40ft": 420000,
        "witak20ft": 335500,
        "user20ft": 348600,
        "woonsong20ft": 370200
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "연일읍",
        "distanceKm": 84,
        "witak40ft": 357300,
        "user40ft": 371900,
        "woonsong40ft": 396100,
        "witak20ft": 317000,
        "user20ft": 329300,
        "woonsong20ft": 349600
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "오천읍",
        "distanceKm": 79,
        "witak40ft": 345200,
        "user40ft": 359200,
        "woonsong40ft": 382500,
        "witak20ft": 306600,
        "user20ft": 318400,
        "woonsong20ft": 338000
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "대송면",
        "distanceKm": 80,
        "witak40ft": 347700,
        "user40ft": 361800,
        "woonsong40ft": 385300,
        "witak20ft": 308700,
        "user20ft": 320600,
        "woonsong20ft": 340400
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "동해면",
        "distanceKm": 88,
        "witak40ft": 366800,
        "user40ft": 381800,
        "woonsong40ft": 406700,
        "witak20ft": 325300,
        "user20ft": 337900,
        "woonsong20ft": 358900
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "장기면",
        "distanceKm": 90,
        "witak40ft": 371700,
        "user40ft": 386900,
        "woonsong40ft": 412100,
        "witak20ft": 329500,
        "user20ft": 342300,
        "woonsong20ft": 363400
      },
      {
        "city": "경상북도",
        "gu": "포항시 남구",
        "dong": "제철동",
        "distanceKm": 81,
        "witak40ft": 350100,
        "user40ft": 364400,
        "woonsong40ft": 388100,
        "witak20ft": 310800,
        "user20ft": 322900,
        "woonsong20ft": 342800
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "선산읍",
        "distanceKm": 181,
        "witak40ft": 570700,
        "user40ft": 595300,
        "woonsong40ft": 636500,
        "witak20ft": 498300,
        "user20ft": 519000,
        "woonsong20ft": 553500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "고아읍",
        "distanceKm": 167,
        "witak40ft": 541800,
        "user40ft": 564900,
        "woonsong40ft": 603700,
        "witak20ft": 474400,
        "user20ft": 493900,
        "woonsong20ft": 526500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "해평면",
        "distanceKm": 163,
        "witak40ft": 533400,
        "user40ft": 556100,
        "woonsong40ft": 594200,
        "witak20ft": 467400,
        "user20ft": 486600,
        "woonsong20ft": 518500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "산동면",
        "distanceKm": 158,
        "witak40ft": 523000,
        "user40ft": 545200,
        "woonsong40ft": 582300,
        "witak20ft": 458600,
        "user20ft": 477400,
        "woonsong20ft": 508600
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "신평2동",
        "distanceKm": 156,
        "witak40ft": 518700,
        "user40ft": 540700,
        "woonsong40ft": 577600,
        "witak20ft": 455000,
        "user20ft": 473600,
        "woonsong20ft": 504500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "진미동",
        "distanceKm": 162,
        "witak40ft": 531400,
        "user40ft": 554000,
        "woonsong40ft": 591900,
        "witak20ft": 465700,
        "user20ft": 484800,
        "woonsong20ft": 516500
      },
      {
        "city": "경상북도",
        "gu": "구미시",
        "dong": "양포동",
        "distanceKm": 163,
        "witak40ft": 533400,
        "user40ft": 556100,
        "woonsong40ft": 594200,
        "witak20ft": 467400,
        "user20ft": 486600,
        "woonsong20ft": 518500
      }
    ]
  };

  Map portList = {
    "부산북항기점(왕복)": "busan2Way",
    "부산북항기점(편도)": "busan1Way",
    "울산북항기점(왕복)": "ulsan2Way"
  };

  void getLocData(String portCondition) {
    city = [];
    dataList = detailValues[portCondition];

    for (int i = 0; i < dataList.length; i++) {
      city.add(dataList[i]['city']);
    }
    city = city.toSet().toList();
    notifyListeners();
  }

  void getCalculateValue() {
    dataList = detailValues[portCondition];
    print(woonimCondition);
    print(containerCondition);
    print(portCondition);

    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i]['city'] == pointedCity &&
          dataList[i]['gu'] == pointedGu &&
          dataList[i]['dong'] == pointedDong) {
        pointedIndex = i;
        print('i를 찾았습니다. $i');
        break;
      }
    }

    if (woonimCondition == 'Wi') {
      if (containerCondition == 'ft20') {
        midResultMenu = 'witak20ft';
        midResult = dataList[pointedIndex][midResultMenu];
      } else if (containerCondition == 'ft40') {
        midResultMenu = 'witak40ft';
        midResult = dataList[pointedIndex][midResultMenu];
      } else if (containerCondition == 'ft46') {
        midResult =
            (dataList[pointedIndex]['witak40ft'] * 1.125).ceil().toInt();
      }
    } else if (woonimCondition == 'Woo') {
      if (containerCondition == 'ft20') {
        midResultMenu = 'woonsong20ft';
        midResult = dataList[pointedIndex][midResultMenu];
      } else if (containerCondition == 'ft40') {
        midResultMenu = 'woonsong40ft';
        midResult = dataList[pointedIndex][midResultMenu];
      } else if (containerCondition == 'ft46') {
        midResult =
            (dataList[pointedIndex]['woonsong40ft'] * 1.125).ceil().toInt();
      }
    } else if (woonimCondition == 'User') {
      if (containerCondition == 'ft20') {
        midResultMenu = 'user20ft';
        midResult = dataList[pointedIndex][midResult];
      } else if (containerCondition == 'ft40') {
        midResultMenu = 'user40ft';
        midResult = dataList[pointedIndex][midResult];
      } else if (containerCondition == 'ft46') {
        midResult = (dataList[pointedIndex]['user40ft'] * 1.125).ceil().toInt();
      }
    }
    pointedKm = dataList[pointedIndex]['distanceKm'].toString();
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
            MaterialPageRoute(builder: (context) => WoonimPage()),
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
              '2/20 단계',
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
                  '운반 컨테이너를\n선택해주세요.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '어떤 컨테이너인지 확인이 필요하신가요?',
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
                    service.containerCondition = 'ft20';
                    service.pointedFeet = '20FT 컨테이너';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortPage()),
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
                    '20ft 컨테이너(20톤)',
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
                    service.containerCondition = 'ft40';
                    service.pointedFeet = '40FT 컨테이너';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortPage()),
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
                    '40ft 컨테이너(23톤)',
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
                    service.containerCondition = 'ft46';
                    service.pointedFeet = '46FT 컨테이너';
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortPage()),
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
                    '46ft 컨테이너(12.5% up)',
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

class PortPage extends StatefulWidget {
  const PortPage({Key? key}) : super(key: key);

  @override
  State<PortPage> createState() => _PortPageState();
}

class _PortPageState extends State<PortPage> {
  String? selectedDepPort;
  String? selectedLandPort;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateService>(
      builder: (context, service, child) {
        List port = service.portList.keys.toList();
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
                        service.pointedPort = value;
                        service.portCondition = service.portList[value];
                        service.getLocData(service.portCondition);
                        print(service.portCondition);
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
      },
    );
  }
}

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

List gu = [];
List dong = [];

class _DestinationPageState extends State<DestinationPage> {
  String? selectedCity;
  String? selectedGu;
  String? selectedDong;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateService>(builder: (context, service, child) {
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
                  items: service.city
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
                      gu = [];
                      dong = [];
                      for (int i = 0; i < service.dataList.length; i++) {
                        if (service.dataList[i]['city'] == selectedCity) {
                          gu.add(service.dataList[i]['gu']);
                        }
                      }
                      gu = gu.toSet().toList();
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
                      dong = [];
                      for (int i = 0; i < service.dataList.length; i++) {
                        if (service.dataList[i]['city'] == selectedCity &&
                            service.dataList[i]['gu'] == selectedGu) {
                          dong.add(service.dataList[i]['dong']);
                        }
                      }
                      print(selectedCity);
                      print(selectedGu);
                      dong = dong.toSet().toList();
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
                      service.pointedCity = selectedCity;
                      service.pointedGu = selectedGu;
                      service.pointedDong = selectedDong;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            '주소가 설정되었습니다.'), //snack bar의 내용. icon, button같은것도 가능하다.
                        duration: Duration(seconds: 2), //올라와있는 시간
                      ));
                      service.getLocData(service.portCondition);
                      service.getCalculateValue();
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
    });
  }
}

class AddpercentPage extends StatefulWidget {
  AddpercentPage({Key? key}) : super(key: key);

  @override
  State<AddpercentPage> createState() => _AddpercentPageState();
}

class _AddpercentPageState extends State<AddpercentPage> {
  List<Map<String, dynamic>> tag = [
    {
      'option': '통행제한지역 30%',
      'isCheck': false,
      'addingOpt': 30,
      'addingMethod': 'x',
      'tooltip': '툴팁내용'
    },
    {
      'option': '검색대통과(X-ray) 96,000원',
      'isCheck': false,
      'addingOpt': '96000',
      'addingMethod': '+',
      'tooltip': '툴팁내용'
    },
    {
      'option': '산간벽지,오지 20%',
      'isCheck': false,
      'addingOpt': 20,
      'addingMethod': 'x',
      'tooltip': '툴팁내용'
    },
    {
      'option': '밥테일 1회 100%',
      'isCheck': false,
      'addingOpt': 100,
      'addingMethod': 'x',
      'tooltip': '툴팁내용'
    },
  ];
  List addingFactors = [];
  int addingFee = 0;
  bool addingXray = false;
  double maxFactor = 0;
  double totalAddingFactor = 0;
  int maxFactorIndex = 0;
  List addingOptions = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateService>(builder: (context, service, child) {
      print('기본운임은:');
      print(service.midResult);
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
                              totalAddingFactor = 0;
                              addingFactors = [];
                              addingXray = false;
                              addingOptions = [];
                              // Xray 조건일 경우엔 addingXray 조정, 다른 조건일땐 addingFactors 조정
                              for (int i = 0; i < tag.length; i++) {
                                if (tag[i]['isCheck'] == true) {
                                  if (tag[i]['option'] ==
                                      '검색대통과(X-ray) 96,000원') {
                                    addingXray = true;
                                    addingOptions.add(tag[i]['option'] + ' 할증');
                                  } else {
                                    addingFactors.add(tag[i]['addingOpt']);
                                    addingOptions.add(tag[i]['option'] + ' 할증');
                                  }
                                }
                              }
                              print('addingFactors:$addingFactors');
                              print('addingXray: $addingXray');
                              service.addingXray = addingXray;
                              addingFee = 0;
                              service.addingFactors = addingFactors;
                              // addingFactors가 없을때, 1개일떄, 2개이상일때를 나누어 addingFee 계산
                              if (addingFactors.isEmpty) {
                                totalAddingFactor = 0;
                                print('factor가 없는경우 $totalAddingFactor');
                              } else if (addingFactors.length == 1) {
                                totalAddingFactor = addingFactors[0].toDouble();
                                print('factor가 1개인 경우 $totalAddingFactor');
                              } else {
                                maxFactorIndex = 0;
                                print('factor가 2개 이상인 경우 $totalAddingFactor');
                                for (int i = 1; i < addingFactors.length; i++) {
                                  if (addingFactors[i - 1] < addingFactors[i]) {
                                    maxFactorIndex = i;
                                  }
                                }
                                for (int i = 0; i < addingFactors.length; i++) {
                                  if (i == maxFactorIndex) {
                                    totalAddingFactor =
                                        totalAddingFactor + addingFactors[i];
                                  } else {
                                    totalAddingFactor = totalAddingFactor +
                                        addingFactors[i] / 2;
                                  }
                                }
                                print(
                                    'factor가 2개 이상인 경우 결과값: $totalAddingFactor');
                              }
                              addingFee = (service.midResult *
                                      totalAddingFactor.toInt()) ~/
                                  100;
                              print('전체 합계는: $totalAddingFactor');
                              // addingXray 조건에 따라 addingFee에 반영 불반영 결정
                              if (addingXray == true) {
                                addingFee = addingFee + 96000;
                                print('Xray값을 더합니다. $addingFee');
                              }
                              print(tag[index]['isCheck']);
                              print(tag[index]['option']);
                              print('추가운임:$addingFee');
                              print('=============================');
                              service.addingFee = addingFee;
                              service.addingOptions = addingOptions;
                              service.finalResult =
                                  (service.addingFee! + service.midResult)!;
                            });
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
              MaterialPageRoute(builder: (context) => addPecent2Page()),
            );
          },
          child: Text('확인'),
        ),
      );
    });
  }
}

class addPecent2Page extends StatefulWidget {
  const addPecent2Page({Key? key}) : super(key: key);

  @override
  State<addPecent2Page> createState() => _addPecent2PageState();
}

bool containerBar = false;
bool timeBar = false;
bool dangerBar = false;
bool weightBar = false;
List<Map<String, dynamic>> tag2 = [
  {
    'option': '심야 (22:00~06:00) 20%',
    'isCheck': false,
    'addingOpt': 20,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '도로통행제산 화물 20%',
    'isCheck': false,
    'addingOpt': 20,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': 'TANK 컨테이너 30%',
    'isCheck': false,
    'addingOpt': 30,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '냉동 컨테이너 30%',
    'isCheck': false,
    'addingOpt': 30,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '덤프 컨테이너 25%',
    'isCheck': false,
    'addingOpt': 25,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '플레시백 컨테이너 (액체) 20%',
    'isCheck': false,
    'addingOpt': 20,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '플레시백 컨테이너 (가루,칩) 10%',
    'isCheck': false,
    'addingOpt': 200,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '위험물,유독물,유해화학물질 30%',
    'isCheck': false,
    'addingOpt': 30,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '화약물 100%',
    'isCheck': false,
    'addingOpt': 100,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '방사성 물질 200%',
    'isCheck': false,
    'addingOpt': 200,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '중량물 일반 10%',
    'isCheck': false,
    'addingOpt': 10,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '중량물 테레프탈산 10%',
    'isCheck': false,
    'addingOpt': 10,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
  {
    'option': '활대품 (폭,높이,길이초과) 10%',
    'isCheck': false,
    'addingOpt': 10,
    'addingMethod': 'x',
    'tooltip': '툴팁내용'
  },
];

class _addPecent2PageState extends State<addPecent2Page> {
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
              '2/20 단계',
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '추가 할증 옵션을\n선택해주세요',
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
                  Column(
                    children: [
                      // set 시작 (시간)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            timeBar = !timeBar;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Color(0xffB4B9C3),
                            ),
                            Text(
                              '시간',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            timeBar
                                ? Icon(
                                    CupertinoIcons.arrowtriangle_up_fill,
                                    size: 18,
                                  )
                                : Icon(
                                    CupertinoIcons.arrowtriangle_down_fill,
                                    size: 18,
                                  ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(374, 37),
                          primary: Color(0xffB4B9C3),
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xffB4B9C3),
                          ),
                        ),
                      ),
                      timeBar
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  tag2[0]['isCheck'] = !tag2[0]['isCheck'];
                                });
                              },
                              style: tag2[0]['isCheck']
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
                                tag2[0]['option'].toString(),
                                style: tag2[0]['isCheck']
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
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      // set 완료(시간)
                      // set 시작 (컨테이너)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            containerBar = !containerBar;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Color(0xffB4B9C3),
                            ),
                            Text(
                              '컨테이너',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            containerBar
                                ? Icon(
                                    CupertinoIcons.arrowtriangle_up_fill,
                                    size: 18,
                                  )
                                : Icon(
                                    CupertinoIcons.arrowtriangle_down_fill,
                                    size: 18,
                                  ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(374, 37),
                          primary: Color(0xffB4B9C3),
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xffB4B9C3),
                          ),
                        ),
                      ),
                      containerBar
                          ? Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[1]['isCheck'] = !tag2[1]['isCheck'];
                                    });
                                  },
                                  style: tag2[1]['isCheck']
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
                                    tag2[1]['option'].toString(),
                                    style: tag2[1]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[2]['isCheck'] = !tag2[2]['isCheck'];
                                    });
                                  },
                                  style: tag2[2]['isCheck']
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
                                    tag2[2]['option'].toString(),
                                    style: tag2[2]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[3]['isCheck'] = !tag2[3]['isCheck'];
                                    });
                                  },
                                  style: tag2[3]['isCheck']
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
                                    tag2[3]['option'].toString(),
                                    style: tag2[3]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[4]['isCheck'] = !tag2[4]['isCheck'];
                                    });
                                  },
                                  style: tag2[4]['isCheck']
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
                                    tag2[4]['option'].toString(),
                                    style: tag2[4]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[5]['isCheck'] = !tag2[5]['isCheck'];
                                    });
                                  },
                                  style: tag2[5]['isCheck']
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
                                    tag2[5]['option'].toString(),
                                    style: tag2[5]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[6]['isCheck'] = !tag2[6]['isCheck'];
                                    });
                                  },
                                  style: tag2[6]['isCheck']
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
                                    tag2[6]['option'].toString(),
                                    style: tag2[6]['isCheck']
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
                              ],
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      SizedBox(
                        height: 10,
                      ), // set 완료 (컨테이너)
                      // set 시작 (위험물)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dangerBar = !dangerBar;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Color(0xffB4B9C3),
                            ),
                            Text(
                              '위험물',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            dangerBar
                                ? Icon(
                                    CupertinoIcons.arrowtriangle_up_fill,
                                    size: 18,
                                  )
                                : Icon(
                                    CupertinoIcons.arrowtriangle_down_fill,
                                    size: 18,
                                  ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(374, 37),
                          primary: Color(0xffB4B9C3),
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xffB4B9C3),
                          ),
                        ),
                      ),
                      dangerBar
                          ? Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[7]['isCheck'] = !tag2[7]['isCheck'];
                                    });
                                  },
                                  style: tag2[7]['isCheck']
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
                                    tag2[7]['option'].toString(),
                                    style: tag2[7]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[8]['isCheck'] = !tag2[8]['isCheck'];
                                    });
                                  },
                                  style: tag2[8]['isCheck']
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
                                    tag2[8]['option'].toString(),
                                    style: tag2[8]['isCheck']
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
                              ],
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      SizedBox(
                        height: 10,
                      ), // set 완료 (위험물)
                      // set 시작 (중량물)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            weightBar = !weightBar;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Color(0xffB4B9C3),
                            ),
                            Text(
                              '중량물',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            containerBar
                                ? Icon(
                                    CupertinoIcons.arrowtriangle_up_fill,
                                    size: 18,
                                  )
                                : Icon(
                                    CupertinoIcons.arrowtriangle_down_fill,
                                    size: 18,
                                  ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(374, 37),
                          primary: Color(0xffB4B9C3),
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xffB4B9C3),
                          ),
                        ),
                      ),
                      weightBar
                          ? Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[9]['isCheck'] = !tag2[9]['isCheck'];
                                    });
                                  },
                                  style: tag2[9]['isCheck']
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
                                    tag2[9]['option'].toString(),
                                    style: tag2[9]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[10]['isCheck'] =
                                          !tag2[10]['isCheck'];
                                    });
                                  },
                                  style: tag2[10]['isCheck']
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
                                    tag2[10]['option'].toString(),
                                    style: tag2[10]['isCheck']
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
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tag2[11]['isCheck'] =
                                          !tag2[11]['isCheck'];
                                    });
                                  },
                                  style: tag2[11]['isCheck']
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
                                    tag2[11]['option'].toString(),
                                    style: tag2[11]['isCheck']
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
                              ],
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      SizedBox(
                        height: 10,
                      ), // set 완료 (컨테이너)
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ElevatedButton(
            onPressed: () {
              double totalAddingFactor = 0;
              List addingFactors = [];
              List addingOptions = [];
              int maxFactorIndex = 0;
              for (int i = 0; i < tag2.length; i++) {
                if (tag2[i]['isCheck'] == true) {
                  addingFactors.add(tag2[i]['addingOpt']);
                  addingOptions.add(tag2[i]['option'] + ' 할증');
                }
              }
              print('addingFactors:$addingFactors');
              print(service.addingXray);
              int addingFee = 0;
              // addingFactors가 없을때, 1개일떄, 2개이상일때를 나누어 addingFee 계산
              if (service.addingFactors.isEmpty) {
                if (addingFactors.isEmpty) {
                  totalAddingFactor = 0;
                  print('factor가 없는경우 $totalAddingFactor');
                } else if (addingFactors.length == 1) {
                  totalAddingFactor = addingFactors[0].toDouble();
                  print('factor가 1개인 경우 $totalAddingFactor');
                } else {
                  maxFactorIndex = 0;
                  print('factor가 2개 이상인 경우 $totalAddingFactor');
                  for (int i = 1; i < addingFactors.length; i++) {
                    if (addingFactors[i - 1] < addingFactors[i]) {
                      maxFactorIndex = i;
                    }
                  }
                  for (int i = 0; i < addingFactors.length; i++) {
                    if (i == maxFactorIndex) {
                      totalAddingFactor = totalAddingFactor + addingFactors[i];
                    } else {
                      totalAddingFactor =
                          totalAddingFactor + addingFactors[i] / 2;
                    }
                  }
                  print('factor가 2개 이상인 경우 결과값: $totalAddingFactor');
                }
              } else {
                addingFactors = List.from(service.addingFactors)
                  ..addAll(addingFactors);
                addingOptions = List.from(service.addingOptions)
                  ..addAll(addingOptions);
                if (addingFactors.isEmpty) {
                  totalAddingFactor = 0;
                  print('factor가 없는경우 $totalAddingFactor');
                } else if (addingFactors.length == 1) {
                  totalAddingFactor = addingFactors[0].toDouble();
                  print('factor가 1개인 경우 $totalAddingFactor');
                } else {
                  maxFactorIndex = 0;
                  print('factor가 2개 이상인 경우 $totalAddingFactor');
                  for (int i = 1; i < addingFactors.length; i++) {
                    if (addingFactors[i - 1] < addingFactors[i]) {
                      maxFactorIndex = i;
                    }
                  }
                  for (int i = 0; i < addingFactors.length; i++) {
                    if (i == maxFactorIndex) {
                      totalAddingFactor = totalAddingFactor + addingFactors[i];
                    } else {
                      totalAddingFactor =
                          totalAddingFactor + addingFactors[i] / 2;
                    }
                  }
                  print('factor가 2개 이상인 경우 결과값: $totalAddingFactor');
                }
              }
              addingFee =
                  (service.midResult * totalAddingFactor.toInt()) ~/ 100;
              print('전체 합계는: $totalAddingFactor');
              // addingXray 조건에 따라 addingFee에 반영 불반영 결정
              if (service.addingXray == true) {
                addingFee = addingFee + 96000;
                print('Xray값을 더합니다. $addingFee');
              }
              print('추가운임:$addingFee');
              print('=============================');
              service.addingFee = addingFee;
              service.addingOptions = addingOptions;
              service.finalResult = (service.addingFee! + service.midResult)!;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resultPage()),
              );
            },
            child: Text('확인'),
          ),
        );
      },
    );
  }
}

class resultPage extends StatefulWidget {
  const resultPage({Key? key}) : super(key: key);

  @override
  State<resultPage> createState() => _resultPage();
}

class _resultPage extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateService>(builder: (context, service, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
            '최종 계산 결과',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      '기사님의 예상 안전 운임 금액',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868A93),
                      ),
                    ),
                    Text(
                      f.format(service.finalResult) + '원',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff0169FF),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xff0169FF),
                    ),
                    height: 100,
                    width: 374,
                    //color: Color(0xff0169FF),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '기본운임',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFff),
                                ),
                              ),
                              Text(
                                f.format(service.midResult) + '원',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '할증금액',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFff),
                                ),
                              ),
                              Text(
                                f.format(service.addingFee) + '원',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFff),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color(0xffB4B9C3),
                    ),
                  ),
                  width: 374,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '선택한 옵션',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'ⓘ',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff0169FF),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                    label: Text(
                                      service.pointedFeet.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0169FF),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff0169FF),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                    label: Text(
                                      service.pointedKm.toString() + 'Km',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0169FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Chip(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xff0169FF),
                                ),
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                                label: Text(
                                  service.pointedwoonim.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff0169FF),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Chip(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xff0169FF),
                                ),
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                                label: Text(
                                  service.pointedPort.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff0169FF),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff0169FF),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                    label: Text(
                                      service.pointedCity.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0169FF),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff0169FF),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                    label: Text(
                                      service.pointedGu.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0169FF),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff0169FF),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                    label: Text(
                                      service.pointedDong.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0169FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '적용 할증',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'ⓘ',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                                height: 40 *
                                    service.addingOptions.length
                                        .toDouble(), // 나중에 크기가 아이템 갯수와 연동되게 할 것
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: service.addingOptions.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .smallcircle_fill_circle_fill,
                                            color: Color(0xff0169FF),
                                          ),
                                          Text('   '),
                                          Text(
                                            service.addingOptions[index]
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Color(0xffF2F2F2),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '1. 할증률은 기본운임을 기준으로 적용됩니다.',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. 다수의 할증 조항을 적용시, 할증률 중 가장 높은 할증률을 적용한 후, 나머지 할증률은 50%씩만 적용합니다.',
                              style: TextStyle(
                                color: Color(0xff868A93),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(182, 55),
                  primary: Color(0xffEDF3FE),
                ),
                onPressed: () {},
                child: Text(
                  '내용 복사하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0169FF),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(182, 55),
                  primary: Color(0xff0169FF),
                ),
                onPressed: () {},
                child: Text(
                  '다시 계산하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
