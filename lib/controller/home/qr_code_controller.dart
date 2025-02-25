import 'package:car_ticket/domain/models/ticket/ticket.dart';
import 'package:car_ticket/domain/repositories/payment_repository/payment_repository_imp.dart';
import 'package:car_ticket/domain/repositories/shared/shared_preference_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:car_ticket/presentation/screens/main_screen/home/success_fail_qr_code_screen.dart';

class QRcodeController extends GetxController {
  final PaymentRepositoryImpl paymentRepository = Get.put(PaymentRepositoryImpl());
  final TicketAppSharedPreferenceRepository sharedPreferenceRepository = TicketAppSharedPreferenceRepository();
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrcontroller;
  bool isVerifying = false;
  bool completingCheckingTicket = false;

  List<ExcelTicket> ticketsList = [];
  ExcelTicket selectedTicket = ExcelTicket.empty;

  void onQRViewCreated(QRViewController controller) {
    qrcontroller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      verifyingQrCode(result);
      update();
    });
  }

  verifyingQrCode(Barcode? result) async {
    try {
      if (result == null || result.code == null) return;
      
      isVerifying = true;
      update();
      
      if (result.code!.length == 36) {
        qrcontroller?.pauseCamera();
        await completeCheckingTicket(selectedTicket);
      }
      
      isVerifying = false;
      update();
    } catch (e) {
      isVerifying = false;
      update();
      Get.snackbar('Error', 'Failed to verify QR code');
    }
  }

  setSelectedTicket(ExcelTicket ticket) async {
    selectedTicket = ticket;
    await completeCheckingTicket(ticket);
    update();
  }

  completeCheckingTicket(ExcelTicket ticket) async {
    try {
      completingCheckingTicket = true;
      update();

      if (ticket.carId == result!.code && !ticket.isExpired && !ticket.isUsed) {
        final updateTicket = ticket.copyWith(isExpired: true, isUsed: true);
        await paymentRepository.updateTicket(updateTicket);
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Checked',
            content: 'Ticket has been checked successfully enjoy your ride',
            isSuccessful: true,
            ticket: ticket));
      } else if (ticket.carId == result!.code && ticket.isExpired) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Expired',
            content: 'Ticket has been expired',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code && !ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Used',
            content: 'Ticket has been used',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code && ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Used',
            content: 'Ticket has been used',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          ticket.isExpired &&
          ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Expired',
            content: 'Ticket has been expired',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          ticket.isExpired &&
          !ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Expired',
            content: 'Ticket has been expired',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          !ticket.isExpired &&
          ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Used',
            content: 'Ticket has been used',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          !ticket.isExpired &&
          !ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Used',
            content: 'Ticket has been used',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          ticket.isExpired &&
          ticket.isUsed) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Expired',
            content: 'Ticket has been expired',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else if (ticket.carId == result!.code &&
          ticket.isExpired &&
          !ticket.isUsed) {
        completingCheckingTicket = false;
        update();
      } else if (ticket.carId != result!.code) {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Car Mismatch',
            content: 'You are trying to check ticket for another car',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      } else {
        completingCheckingTicket = false;
        update();
        Get.to(() => QrCodeResultScreen(
            title: 'Ticket Not Found',
            content: 'Ticket not found',
            isSuccessful: false,
            ticket: ExcelTicket.empty));
      }
    } catch (e) {
      completingCheckingTicket = false;
      update();
      rethrow;
    }
  }

  @override
  void onClose() {
    qrcontroller?.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    qrcontroller?.dispose();
    super.dispose();
  }
}
