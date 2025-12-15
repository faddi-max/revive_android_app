import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive_app/Events/AuthEvents/signupevents.dart';
import 'package:revive_app/Repositries/AuthRepos/signuprepo.dart';
import 'package:revive_app/State/Revivestate.dart';

class SignupBloc extends Bloc<SignupRequested, Revivestate> {
  final SignupRepo _signuprepo = SignupRepo();

  SignupBloc() : super(ReviveInitial()) {
    on<SignupRequested>(signupevent);
  }

  Future<void> signupevent(
    SignupRequested event,
    Emitter<Revivestate> emit,
  ) async {
    emit(ReviveLoading());
    try {
      final user = await _signuprepo.signupuser(
        fullname: event.fullname,
        email: event.email,
        password: event.password,
        phone: event.phone,
      );

      emit(ReviveLoaded({'user': user}));
    } catch (e) {
      emit(ReviveError(e.toString()));
      throw Exception(e.toString());
    }
  }
}
