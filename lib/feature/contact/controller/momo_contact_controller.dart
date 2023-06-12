import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo/feature/contact/repository/momo_contact_repository.dart';

final momoContactsControllerProvider = FutureProvider(
  (ref) {
    final contactsRepository = ref.watch(momoContactsRepositoryProvider);
    return contactsRepository.getAllContacts();
  },
);
