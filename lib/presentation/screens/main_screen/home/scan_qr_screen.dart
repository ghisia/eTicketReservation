import 'package:car_ticket/controller/home/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scan QR Code'),
      ),
      body: GetBuilder(
          init: QRcodeController(),
          builder: (QRcodeController qrController) {
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: QRView(
                    key: qrController.qrKey,
                    onQRViewCreated: qrController.onQRViewCreated,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: qrController.isVerifying 
                      ? const CircularProgressIndicator()
                      : const Text('Scan a code'),
                  ),
                )
              ],
            );
          }),
    );
  }
}
