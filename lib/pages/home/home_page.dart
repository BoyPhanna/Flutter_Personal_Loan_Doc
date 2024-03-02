// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_pdf/bloc/clien_bloc.dart';
import 'package:image_to_pdf/pages/home/widgets/client_widget.dart';
import 'package:image_to_pdf/pages/new_clien/new_clien_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewClienPage()));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.green,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "អតិថិជនទាំងអស់",
            style: TextStyle(fontFamily: "KhmerMoul"),
          )),
      body: BlocBuilder<ClienBloc, ClienState>(
        builder: (context, state) {
          if (state is ClienInitial) {
            context.read<ClienBloc>().add(const FetchCliens());
          }
          if (state is DisplayCliens) {
            return ListView.builder(
              itemCount: state.cliens.length,
              itemBuilder: (context, index) {
                return ClientWidget(
                  clien: state.cliens[index],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
