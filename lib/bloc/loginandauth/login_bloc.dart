import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/bloc/loginandauth/auth_bloc.dart';
import 'package:pilkada/services/AuthService.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Authentication? auth;
  AuthBloc? authbloc;
  LoginBloc({Authentication? auth, AuthBloc? authbloc})
      : super(LoginInitial()) {
    auth = Authentication();
    authbloc = AuthBloc(auth: auth);
    on<LoginEvent>((event, emit) async {
      if (event is LoginButton) {
        emit(LoginLoaded());
        try {
          final token = await auth!.loginapi(event.email, event.password);
          authbloc!.add(Loggedin(token: token));

          emit(LoginInitial());
        } catch (e) {
          emit(LoginFailure(error: e.toString()));
        }
      }
    });
  }
}
