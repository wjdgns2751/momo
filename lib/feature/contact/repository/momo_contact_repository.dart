import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/common/models/momo_user_model.dart';

final momoContactsRepositoryProvider = Provider(
  (ref) {
    return MomoContactsRepository(firestore: FirebaseFirestore.instance);
  },
);

class MomoContactsRepository {
  final FirebaseFirestore firestore;

  MomoContactsRepository({required this.firestore});

  Future<List<List<MomoUserModel>>> getAllContacts() async {
    List<MomoUserModel> firebaseContacts = [];
    List<MomoUserModel> phoneContacts = [];

    try {
      // 플러터 연락처 권한 요청
      if (await FlutterContacts.requestPermission()) {
        // Firestore에서 'users' 컬렉션의 데이터 가져오기
        final userCollection = await firestore.collection('users').get();
        // 휴대폰의 모든 연락처 가져오기
        final allContactsInThePhone = await FlutterContacts.getContacts(
          withProperties: true,
        );

        bool isContactFound = false;

        // 휴대폰의 각 연락처에 대해 루프 실행
        for (var contact in allContactsInThePhone) {
          // Firestore의 각 연락처와 비교
          for (var firebaseContactData in userCollection.docs) {
            var firebaseContact =
                MomoUserModel.fromMap(firebaseContactData.data());
            // 연락처의 전화번호와 Firestore의 연락처 전화번호 비교
            if (contact.phones[0].number.replaceAll(' ', '') ==
                firebaseContact.phoneNumber) {
              // 일치하는 연락처를 firebaseContacts 리스트에 추가
              firebaseContacts.add(firebaseContact);
              isContactFound = true;
              break;
            }
          }
          // 일치하는 연락처가 없으면 phoneContacts 리스트에 추가
          if (!isContactFound) {
            phoneContacts.add(
              MomoUserModel(
                userName: contact.displayName,
                uid: '',
                profileImageUrl: '',
                active: false,
                lastSeen: 0,
                phoneNumber: contact.phones[0].number.replaceAll(' ', ''),
                groupId: [],
              ),
            );
          }

          isContactFound = false;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return [firebaseContacts, phoneContacts];
  }
}
