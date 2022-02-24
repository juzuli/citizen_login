import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indeed/src/models/contact_model.dart';

import 'contact_repository.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  ContactRepository repository = ContactRepository();

  loadContacts() async{
    emit(ContactLoading());
    try{
      String contactRaw = await repository.loadAsset();
      List<dynamic> contactList = jsonDecode(contactRaw);
      List<ContactModel> contactModelList = contactList.map<ContactModel>((e) => ContactModel.fromJSON(e)).toList();
      emit(ContactLoaded(contactModelList));
    }catch(ex){
      print(ex);
      emit(ContactLoadError(ex.toString()));
    }

  }
}
