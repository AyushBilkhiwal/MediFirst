


class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message="An Unknown error occured. "]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted.');

      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Account already exist for this email.');

      case 'operation-not--allowed':
        return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

}