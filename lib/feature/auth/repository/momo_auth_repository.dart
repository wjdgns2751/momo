import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/common/helper/momo_alert_dialog.dart';
import 'package:momo/common/helper/momo_loading_dialog.dart';
import 'package:momo/common/models/momo_user_model.dart';
import 'package:momo/common/repository/firebase_storage_repository.dart';
import 'package:momo/common/routes/routes.dart';

final momoAuthRepositoryProvider = Provider((ref) {
  return MomoAuthRepository(
      auth: FirebaseAuth.instance, fireStore: FirebaseFirestore.instance);
});

class MomoAuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;

  MomoAuthRepository({required this.auth, required this.fireStore});

  Future<MomoUserModel?> getCurrentUserInfo() async {
    MomoUserModel? momoUser;
    final momoUserInfo =
        await fireStore.collection('users').doc(auth.currentUser?.uid).get();

    if (momoUserInfo.data() == null) return momoUser;
    momoUser = MomoUserModel.fromMap(momoUserInfo.data()!);
    return momoUser;
  }

  void saveUserInfoToFireStore(
      {required String userName,
      required var profileImage,
      required ProviderRef ref,
      required BuildContext context,
      required bool mounted}) async {
    try {
      momoLoadingDialog(context: context, message: '사용자정보를 저장중입니다.');

      String uid = auth.currentUser!.uid;
      String profileImageUrl = profileImage is String ? profileImage : '';
      if (profileImage != null && profileImage is! String) {
        profileImageUrl = await ref
            .read(firebaseStorageRepositoryProvider)
            .storeFileToFirebase('profileImage/$uid', profileImage);
      }
      MomoUserModel userModel = MomoUserModel(
          userName: userName,
          uid: uid,
          profileImageUrl: profileImageUrl,
          active: true,
          phoneNumber: auth.currentUser!.phoneNumber!,
          groupId: []);

      await fireStore.collection('users').doc(uid).set(userModel.toMap());

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.homePage,
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  //SMS 코드 검증
  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      momoLoadingDialog(context: context, message: '인증번호 코드를 확인중입니다.');

      final credential = PhoneAuthProvider.credential(
          verificationId: smsCodeId, smsCode: smsCode);
      await auth.signInWithCredential(credential);

      //사용자
      MomoUserModel? momoUser = await getCurrentUserInfo();

      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.uesrInfoPage, (route) => false,
          arguments: momoUser?.profileImageUrl);
    } on FirebaseAuthException catch (exception) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: exception.toString());
    }
  }

  //SMS 코드를 전송하는 기능
  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      momoLoadingDialog(context: context, message: '인증번호 코드를 발송중입니다.');
      //인증 관련 작업을 수행
      await auth.verifyPhoneNumber(
        //when : 인증이 완료
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          //로그인
          await auth.signInWithCredential(credential);
        },
        //when : 인증이 실패
        verificationFailed: (reason) {
          showAlertDialog(context: context, message: reason.toString());
        },
        //when : SMS 코드가 전송되었을 때
        codeSent: (smsCodeId, resendSmsCodeId) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.verificationPage,
            (route) => false,
            arguments: {
              'phoneNumber': phoneNumber,
              'verificationId': smsCodeId,
            },
          );
        },
        //when : 제한 시간 초과
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } on FirebaseAuth catch (exception) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: exception.toString());
    }
  }

  //
}
