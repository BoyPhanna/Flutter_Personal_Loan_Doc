// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_pdf/bloc/clien_bloc.dart';
import 'package:image_to_pdf/models/cliens_model.dart';
import 'package:image_to_pdf/pages/edit/update_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ClientWidget extends StatelessWidget {
  final Clien clien;
  const ClientWidget({
    required this.clien,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 8, right: 8),
      width: 370,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.blue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            clien.name,
            style: TextStyle(fontFamily: "KhmerOS", fontSize: 18),
          ),
          Text(
            "\$ ${clien.amount}",
            style: TextStyle(fontFamily: "KhmerOS", fontSize: 18),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateClienPage(
                              clien: clien,
                            )));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.yellow,
              )),
          IconButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.warning,
                  text: 'តើអ្នកប្រាកដទេ?ថាចង់លុប',
                  confirmBtnText: 'យល់ព្រម',
                  confirmBtnColor: const Color.fromARGB(255, 175, 81, 76),
                  onConfirmBtnTap: () {
                    context.read<ClienBloc>().add(DeleteClien(id: clien.id!));
                    context.read<ClienBloc>().add(FetchCliens());
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
