// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_AuthControllerBase.user', context: context);

  @override
  UserCredential? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserCredential? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthControllerBase.signInWithEmailAndPassword',
      context: context);

  @override
  Future<dynamic> signInWithEmailAndPassword() {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
