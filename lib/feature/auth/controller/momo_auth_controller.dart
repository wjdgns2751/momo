import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/common/models/momo_user_model.dart';
import 'package:momo/feature/auth/repository/momo_auth_repository.dart';

final momoAuthControllerProvider = Provider(
  (ref) {
    final momoAuthRepository = ref.watch(momoAuthRepositoryProvider);
    return MomoAuthController(momoAuthRepository: momoAuthRepository, ref: ref);
  },
);
final momoUserInfoAuthProvider = FutureProvider(
  (ref) {
    final momoAuthController = ref.watch(momoAuthControllerProvider);
    return momoAuthController.getCurrentUserInfo();
  },
);

class MomoAuthController {
  final MomoAuthRepository momoAuthRepository;
  final ProviderRef ref;

  MomoAuthController({required this.ref, required this.momoAuthRepository});

  Future<MomoUserModel?> getCurrentUserInfo() async {
    MomoUserModel? user = await momoAuthRepository.getCurrentUserInfo();
    return user;
  }

  void saveUserInfoToFireStore(
      {required String userName,
      required var profileImage,
      required BuildContext context,
      required bool mounted}) {
    momoAuthRepository.saveUserInfoToFireStore(
        userName: userName,
        profileImage: profileImage,
        ref: ref,
        context: context,
        mounted: mounted);
  }

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
