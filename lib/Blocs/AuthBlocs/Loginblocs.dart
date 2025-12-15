import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive_app/Events/AuthEvents/loginevents.dart';
import 'package:revive_app/Repositries/AuthRepos/loginrepo.dart';
import 'package:revive_app/State/Revivestate.dart';

class Loginblocs extends Bloc<Loginevents, Revivestate> {
  final LoginRepo _authrepo = LoginRepo();
  Loginblocs() : super(ReviveInitial()) {
    on<LoginRequested>(loginevent);
  }

  Future<void> loginevent(
    LoginRequested event,
    Emitter<Revivestate> emit,
  ) async {
    emit(ReviveLoading());
    try {
      final user = await _authrepo.LoginUser(
        email: event.email,
        password: event.password,
      );
      emit(ReviveLoaded({'user': user}));
    } catch (e) {
      emit(ReviveError(e.toString()));
    }
  }
}
