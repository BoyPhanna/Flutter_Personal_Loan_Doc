// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_to_pdf/models/cliens_model.dart';
import 'package:image_to_pdf/pages/print/print_page.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class ViewPage extends StatefulWidget {
  final Clien clien;
  const ViewPage({required this.clien, super.key});

  @override
  State<ViewPage> createState() => _ViewPageState(clien: clien);
}

class _ViewPageState extends State<ViewPage> {
  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  final Clien clien;
  _ViewPageState({required this.clien});
  Uint8List? byte;
  double herderFont = 10;

  @override
  Widget build(BuildContext context) {
    List<String> address = clien.address.split("-");
    String name = "ជា ឃុនបញ្ញារិទ្ធ";
    String gender = "ប្រុស";
    String dob = "03-09-1999";
    String nationality = "ខ្មែរ";
    String job = "មន្រ្ដីឥណទាន";
    String homeNumber = ".......";
    String vilage = "លូ";
    String distric = "ស្វាយបាក";
    String comune = "ឫស្សីកែវ";
    String provin = "ភ្នំពេញ";
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bytes2 = await controller.capture();
          byte = bytes2;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PdfPage(
                        byte: byte!,
                      )));
        },
        child: Icon(Icons.print),
      ),
      appBar: AppBar(backgroundColor: Colors.blue),
      body: WidgetsToImage(
        controller: controller,
        child: Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 254, 253, 255)),
            width: 400,
            height: 565,
            child: Column(
              children: [
                Text(
                  "ព្រះរាជាណាចក្រកម្ពុជា",
                  style: TextStyle(
                    fontFamily: "KhmerMoul",
                    fontSize: herderFont,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "ជាតិ សាសនា ព្រះមហាក្សត្រ",
                  style: TextStyle(
                    fontFamily: "KhmerMoul",
                    fontSize: herderFont,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "កិច្ចសន្យា ខ្ចីប្រាក់",
                  style: TextStyle(
                    fontFamily: "KhmerOS",
                    fontWeight: FontWeight.bold,
                    fontSize: herderFont,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Text(
                  '''
        នាងខ្ញុំ/ខ្ញុំបាទឈ្មោះ ${clien.name} ភេទ ${clien.gender} ថ្ងៃខែឆ្នាំកំណើត ${clien.dob} សញ្ញាតិ ${clien.nationality} មុខរបរ ${clien.job} មានទីលំនៅ ផ្ទះលេខ ${address[0]} ភូមិ ${address[1]} ឃុំ/សង្កាត់ ${address[2]} ស្រុក/ខណ្ឌ ${address[3]} ខេត្ដ/រាជធានី ${address[4]} ។ បានខ្ចីប្រាក់ចំនួន \$ ${clien.amount} ជាអក្សរ ${moneyText(clien.amount)} ។
        ពីឈ្មោះ ${name} ភេទ ${gender} ថ្ងៃខែឆ្នាំកំណើត ${dob} សញ្ញាតិ $nationality មុខរបរ $job មានទីលំនៅ ផ្ទះលេខ $homeNumber ភូមិ $vilage ឃុំ/សង្កាត់ $distric ស្រុក/ខណ្ឌ $comune ខេត្ដ/រាជធានី $provin ។
                  ''',
                  style: TextStyle(
                      fontFamily: "KhmerOS", fontSize: 10, height: 1.5),
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "តាមលក្ខណ្ឌនៃការខ្ចីដូចខាងក្រោម៖",
                      style: TextStyle(
                          fontFamily: "KhmerOS",
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Text(
                  '''     
        នាងខ្ញុំ/ខ្ញុំបាទ សន្យាបង់ប្រាក់មួយខែចំនួន \$${clien.pay} លើប្រាក់សរុបដែលបានខ្ចីឲ្យទៅឈ្មោះ $name រៀងរាល់ថ្ងៃទី ${clien.date} ឲ្យបានទៀងទាត់។
        នាងខ្ញុំ/ខ្ញុំបាទ សន្យាបង់ប្រាក់ គ្រប់ចំនួនទៅឲ្យឈ្មោះ $name ក្នុងរយៈពេល ${clien.numberlate} ថ្ងៃយ៉ាងយូរក្រោយពីឈ្មោះ $name បានផ្ដល់ព័ត៌មានពីការទារប្រាក់។
        កិច្ចសន្យានេះបានប្រគល់ទុកនៅនឹងឈ្មោះ $name ជាម្ខាស់ប្រាក់មួយច្បាប់ និង ឈ្មោះ ${clien.name} ជាអ្នកខ្ចីមួយច្បាប់ ដោយផ្ដិតមេដៃស្ដាំភាគីអ្នកខ្ចីប្រាក់ និងភាគីម្ចាស់ប្រាក់ជាភស្ដុតាង។''',
                  style: TextStyle(
                      fontFamily: "KhmerOS", fontSize: 10, height: 1.5),
                )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "ធ្វើនៅ.......ថ្ងៃទី.......ខែ......ឆ្នាំ...........    ",
                      style: TextStyle(
                        fontFamily: "KhmerMoul",
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "ស្នាមមេដៃភាគីអ្នកខ្ចីប្រាក់ ",
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        "សាក្សី ",
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        "ស្នាមមេដៃភាគីម្ចាស់ប្រាក់ ",
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        clien.name,
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        "................",
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        "ជា ឃុនបញ្ញារិទ្ធិ ",
                        style: TextStyle(
                          fontFamily: "KhmerMoul",
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  String moneyText(String m) {
    String g = "";
    var dop = {
      '0': '',
      '1': 'ដប់',
      '2': 'ម្ភៃ',
      '3': 'សាមសិប',
      '4': 'សែសិប',
      '5': 'ហាសិប',
      '6': 'ហុកសិប',
      '7': 'ចិតសិប',
      '8': 'ប៉ែតសិប',
      '9': 'កៅសិប',
    };
    var reay = {
      '0': '',
      '1': 'មួយ',
      '2': 'ពី',
      '3': 'បី',
      '4': 'បួន',
      '5': 'ប្រាំ',
      '6': 'ប្រាំមួយ',
      '7': 'ប្រាំពីរ',
      '8': 'ប្រាំបី',
      '9': 'ប្រាំបួន',
    };
    for (int i = 0; i < m.length; i++) {
      if (m.length - i == 3) {
        g += reay[m[i]]! + "រយ";
      }
      if (m.length - i == 2) {
        g += dop[m[i]]!;
      }
      if (m.length - i == 1) {
        g += reay[m[i]]!;
      }
    }
    return g + " ដុល្លាអាមេរិកគត់";
  }
}
