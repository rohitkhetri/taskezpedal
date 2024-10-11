import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    // Registering the event handler for AuthSignInRequested
    on<AuthSignInRequested>((event, emit) async {
      emit(AuthInitial()); // Optional: Emit the initial state first
      try {
        // Attempt to sign in with Firebase
        await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthAuthenticated()); // Emit Authenticated state on success
      } catch (e) {
        emit(AuthError(e.toString())); // Emit AuthError if something goes wrong
      }
    });

    // Registering the event handler for AuthSignUpRequested
    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthInitial()); // Optional: Emit the initial state first
      try {
        // Attempt to create a user with Firebase
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthAuthenticated()); // Emit Authenticated state on success
      } catch (e) {
        emit(AuthError(e.toString())); // Emit AuthError if something goes wrong
      }
    });
  }
}
