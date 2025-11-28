import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive_app/Events/AuthEvents/loginevents.dart';
import 'package:revive_app/State/Revivestate.dart';

class Loginblocs extends Bloc<Loginevents, Revivestate> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Loginblocs() : super(ReviveInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(ReviveLoading());

      try {
        UserCredential userCredential = await _firebaseAuth
            .signInWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
        emit(ReviveLoaded({'data': userCredential.user}));
      } on FirebaseAuthException catch (e) {
        emit(ReviveError(e.message ?? 'Login Failed'));
      }
    });
  }
}
