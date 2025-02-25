import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import '../../../controller/home/qr_code_controller.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
      ),
      body: GetBuilder<QRcodeController>(
        init: QRcodeController(),
        builder: (controller) {
          return Stack(
            children: [
              QRView(
                key: controller.qrKey,
                onQRViewCreated: controller.onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Theme.of(context).primaryColor,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
              if (controller.isVerifying)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}