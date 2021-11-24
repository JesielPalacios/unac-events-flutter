import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


  String codigo = 'No hay ningún código de evento';
class ScanButton extends StatefulWidget {
  @override
  _ScanButtonState createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          // https: //pub.dev/packages/flutter_barcode_scanner
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //                                             COLOR_CODE,
          //                                             CANCEL_BUTTON_TEXT,
          //                                             isShowFlashIcon,
          //                                             scanMode);

          // FlutterBarcodeScanner.getBarcodeStreamReceiver(
          //         "#ff6666", "Cancel", false, ScanMode.DEFAULT)
          //     .listen((barcode) {
          //   /// barcode to be used
          // });

          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#9D8BEF', 'Cancelar la foto', false, ScanMode.QR);
          // '#3D8BEF', 'Cancelar', false, ScanMode.QR);

          // final barcodeScanRes = 'https://www.google.com';

          print(barcodeScanRes);
          setState(() {
            codigo = barcodeScanRes;
          });
          // https://www.qrcode.es/es/generador-qr-code/
        });
  }
}

String codigoExport() {
  return codigo;
}