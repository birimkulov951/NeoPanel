import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';

class PasswordRecoveryBloc extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  final Repository repository;
  final SharedPrefHelper prefHelper;

  PasswordRecoveryBloc({this.repository, this.prefHelper}) : super(InitialPasswordRecovery());

  get initialState => InitialPasswordRecovery();

  @override
  Stream<PasswordRecoveryState> mapEventToState(PasswordRecoveryEvent event) async* {
    if (event is GenerateNewPasswordTwo) {
      yield* _mapAuthorizeToState(event);
    } else if(event is PasswordRecoveryStateChange) {
      yield InitialPasswordRecovery();
    }
  }

  Stream<PasswordRecoveryState> _mapAuthorizeToState(PasswordRecoveryEvent event) async* {
    try {
      yield PasswordRecoveryLoading();

      print(event.email);

      var generateForgotPasswordCode = await repository.generateForgotPasswordCode(event.email);

      if (generateForgotPasswordCode.props.isNotEmpty) {
        yield PasswordRecoveryForgotPasswordHasData();
        var generateNewPassword = await repository.generateNewPassword(generateForgotPasswordCode.code, event.email);
        if (generateNewPassword.props.isNotEmpty) {
          yield PasswordRecoveryNewPasswordHasData();
        } else {
          yield PasswordRecoveryNoData('password could not generated');
        }
      } else {
        yield PasswordRecoveryNoData('code could not generated');
      }



    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield PasswordRecoveryNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield PasswordRecoveryNoInternetConnection();
      } else {
        yield PasswordRecoveryError(e.toString());
      }
    } catch (e) {
      yield PasswordRecoveryError(e.toString());
    }

  }


}
