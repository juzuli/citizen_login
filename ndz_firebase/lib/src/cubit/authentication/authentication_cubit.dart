import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndz_firebase/src/cubit/authentication/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {

  //dependency injection
  final AuthRepository authRepository;
  AuthenticationCubit(this.authRepository) : super(AuthenticationInitial());

  registerUserEmailPassword(String email,String password)async{
    emit(AuthenticationLoading());
    try{
      UserCredential userCredential = await authRepository.registerWithEmailPassword(email, password);
      if(userCredential == null){
        emit(AuthenticationError());
      }else{
        emit(AuthenticationSuccess(userCredential));
      }
    }catch(ex){
      emit(AuthenticationError());
    }

  }
  signInUserEmailPassword(String email,String password) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await authRepository.loginWithEmailPassword(email, password);
      if (userCredential == null) {
        emit(AuthenticationError());
      } else {
        emit(AuthenticationSuccess(userCredential));
      }
    } catch (ex) {
      emit(AuthenticationError());
    }
  }
}
