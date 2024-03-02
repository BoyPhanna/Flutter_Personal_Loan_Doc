// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_pdf/bloc/clien_bloc.dart';
import 'package:image_to_pdf/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClienBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello boy",
        home: HomePage(),
      ),
    );
  }
}
