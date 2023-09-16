import 'package:equatable/equatable.dart';

import '../../../data/models/new_model.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
}

class CredentialInitial extends CredentialState {
  @override
  List<Object> get props => [];
}

class CredentialLoading extends CredentialState {
  @override
  List<Object> get props => [];
}

class CredentialSuccess extends CredentialState {


  const CredentialSuccess();
  @override
  List<Object> get props => [];
}

class CredentialFailure extends CredentialState {
  final String message;

  const CredentialFailure(this.message);
  @override
  List<Object> get props => [
        message,
      ];
}

class CredentialGetDataUserLoading extends CredentialState {
  const CredentialGetDataUserLoading();
  @override
  List<Object> get props => [];
}

class CredentialGetDataUserSuccess extends CredentialState {
  final UserModel user;

  const CredentialGetDataUserSuccess(this.user);
  @override
  List<Object> get props => [user];
}

class CredentialGetDataUserError extends CredentialState {
  final String message;

  const CredentialGetDataUserError(this.message);
  @override
  List<Object> get props => [message];
}
