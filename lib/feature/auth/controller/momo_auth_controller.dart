import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/feature/auth/repository/momo_auth_repository.dart';

final momoAuthControllerProvider = Provider(
  (ref) {
    final momoAuthRepository = ref.watch(momoAuthRepositoryProvider);
    return MomoAuthController(momoAuthRepository: momoAuthRepository);
  },
);

class MomoAuthController {
  final MomoAuthRepository momoAuthRepository;

  MomoAuthController({required this.momoAuthRepository});

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    momoAuthRepository.verifySmsCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: mounted);
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) {
    momoAuthRepository.sendSmsCode(context: context, phoneNumber: phoneNumber);
  }
}
