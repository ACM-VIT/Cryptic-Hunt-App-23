import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  QrScanner({Key? key, required this.onScan}) : super(key: key);
  void Function(String) onScan;

  @override
  State<StatefulWidget> createState() => QrScannerState();
}

class QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  // Widget getQrView() {
  //   return QRView(key: qrKey, onQRViewCreated: _onQRViewCreated);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
              borderRadius: 10,
              borderLength: 20,
              borderWidth: 10,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      widget.onScan(scanData.code!.substring(7));
      // print("-------------------------${scanData.code!}-----------------");
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
