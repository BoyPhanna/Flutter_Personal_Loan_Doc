import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  final Uint8List byte;
  const PdfPage({required this.byte, super.key});

  @override
  State<PdfPage> createState() => _PdfPageState(byte: byte);
}

class _PdfPageState extends State<PdfPage> {
  final Uint8List byte;
  _PdfPageState({required this.byte});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PdfPreview(
          initialPageFormat: PdfPageFormat.a4,
          build: (format) => _generatePdf(format, byte),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, Uint8List byte) async {
    final pdf = pw.Document();

    final image = pw.MemoryImage(byte);

    // pdf.addPage(pw.MultiPage(
    //   pageFormat: PdfPageFormat.a4,
    //   margin: pw.EdgeInsets.only(top: 40, left: 20, right: 20),
    //   build: (pw.Context context) {
    //     return [
    //       pw.Center(
    //         child: pw.Image(image),
    //       ),
    //     ];
    //   },
    // ));

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.only(top: 50),
        build: (context) {
          return pw.Center(
            child: pw.Image(image),
          );
        },
      ),
    );
    return pdf.save();
  }
}
