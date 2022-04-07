import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indeed/src/models/contact_model.dart';
import 'package:http/http.dart' as http;

import 'contact_repository.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  ContactRepository repository = ContactRepository();

  loadContacts() async{
    emit(ContactLoading());
    try{
      final contactRaw = await http
          .get(Uri.parse('https://jsonkeeper.com/b/QHNI'));
      // String contactRaw = await repository.loadAsset();
      List<dynamic> contactList = jsonDecode(contactRaw.body);
      List<ContactModel> contactModelList = contactList.map<ContactModel>((e) => ContactModel.fromJSON(e)).toList();
      emit(ContactLoaded(contactModelList));
    }catch(ex){
      print(ex);
      emit(ContactLoadError(ex.toString()));
    }

  }
}
