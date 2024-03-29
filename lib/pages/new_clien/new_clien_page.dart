// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_pdf/bloc/clien_bloc.dart';
import 'package:image_to_pdf/models/cliens_model.dart';
import 'package:image_to_pdf/pages/view/view_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class NewClienPage extends StatefulWidget {
  const NewClienPage({super.key});

  @override
  State<NewClienPage> createState() => _NewClienPageState();
}

List<String> options = ["ប្រុស", "ស្រី"];

class _NewClienPageState extends State<NewClienPage> {
  TextEditingController clienNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nationallityController = TextEditingController();
  TextEditingController homeNumberController = TextEditingController();
  TextEditingController vilageController = TextEditingController();
  TextEditingController districController = TextEditingController();
  TextEditingController comuneController = TextEditingController();
  TextEditingController provinController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController datePayController = TextEditingController();
  TextEditingController numberOfdaysController = TextEditingController();
  String address = "";

  String curentOption = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curentOption = options[0];
    nationallityController.text = "ខ្មែរ";
    provinController.text = "ភ្នំពេញ";
    numberOfdaysController.text = "2";
    datePayController.text = "25";
    payController.text = "10";
    amountController.text = "60";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ថែមអតិថិជនថ្មី"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextField(
              controller: clienNameController,
              decoration: InputDecoration(labelText: "ឈ្មោះអតិថិជន"),
            ),
            Text("ភេទ"),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: options[0],
                      groupValue: curentOption,
                      onChanged: (value) {
                        setState(() {
                          curentOption = value.toString();
                        });
                      },
                    ),
                    Text("ប្រុស"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: options[1],
                      groupValue: curentOption,
                      onChanged: (value) {
                        setState(() {
                          curentOption = value.toString();
                        });
                      },
                    ),
                    Text("ស្រី")
                  ],
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: dobController,
              decoration: InputDecoration(labelText: "ថ្ងៃខែឆ្នាំកំណើត"),
            ),
            TextField(
              controller: nationallityController,
              decoration: InputDecoration(labelText: "សញ្ជាតិ"),
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(labelText: "មុខរបរ"),
            ),
            Text("ទីលំនៅបច្ចុប្បន្ន"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: TextField(
                    controller: homeNumberController,
                    decoration: InputDecoration(labelText: "ផ្ទះលេខ"),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    controller: vilageController,
                    decoration: InputDecoration(labelText: "ភូមិ"),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    controller: districController,
                    decoration: InputDecoration(labelText: "ឃុំ/សង្កាត់"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: TextField(
                    controller: comuneController,
                    decoration: InputDecoration(labelText: "ស្រុក/ខណ្ឌ"),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 100,
                  child: TextField(
                    controller: provinController,
                    decoration: InputDecoration(labelText: "ខេត្ដ/ក្រុង"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(labelText: "ខ្ចីប្រាក់ចំននួន"),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: payController,
                    decoration: InputDecoration(labelText: "បង់មួយខែចំនួន"),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: datePayController,
                    decoration: InputDecoration(labelText: "បង់រៀងរាល់ថ្ងៃទី"),
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: numberOfdaysController,
              decoration: InputDecoration(labelText: "ចំនួនថ្ងៃដែលអាចយឺត"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = clienNameController.text;
                      address = homeNumberController.text +
                          "-" +
                          vilageController.text +
                          "-" +
                          districController.text +
                          "-" +
                          comuneController.text +
                          "-" +
                          provinController.text;
                      context.read<ClienBloc>().add(AddClient(
                            name: name,
                            gender: curentOption,
                            dob: dobController.text,
                            nationality: nationallityController.text,
                            job: jobController.text,
                            address: address,
                            amount: amountController.text,
                            pay: payController.text,
                            date: datePayController.text,
                            numberlate: numberOfdaysController.text,
                          ));
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'ទិន្នន័យត្រូវបានរក្សារទុក',
                        confirmBtnText: 'យល់ព្រម',
                        cancelBtnTextStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 195, 21)),
                      );
                      context.read<ClienBloc>().add(FetchCliens());
                    },
                    child: Text("រក្សាទុក")),
                ElevatedButton(
                    onPressed: () {
                      address = homeNumberController.text +
                          "-" +
                          vilageController.text +
                          "-" +
                          districController.text +
                          "-" +
                          comuneController.text +
                          "-" +
                          provinController.text;
                      Clien clien = Clien(
                        name: clienNameController.text,
                        gender: curentOption,
                        dob: dobController.text,
                        nationality: nationallityController.text,
                        job: jobController.text,
                        address: address,
                        amount: amountController.text,
                        pay: payController.text,
                        date: datePayController.text,
                        numberlate: numberOfdaysController.text,
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPage(
                                    clien: clien,
                                  )));
                    },
                    child: Text("ព្រីន")),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
