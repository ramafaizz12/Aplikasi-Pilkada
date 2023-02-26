import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pilkada/models/dashboard.dart';
import 'package:pilkada/services/AuthService.dart';

part 'datadashboard_event.dart';
part 'datadashboard_state.dart';

class DatadashboardBloc extends Bloc<DatadashboardEvent, DatadashboardState> {
  DatadashboardBloc({Authentication? auth}) : super(DatadashboardInitial()) {
    auth = Authentication();
    on<DatadashboardEvent>((event, emit) async {
      if (event is DatadashboardConnectAdmin) {
        var data = await auth!.getdatadashboardadmin();
        emit(DataDashboardLoaded(data: data));
      }
      if (event is DatadashboardConnectCalek) {
        var data = await auth!.getdatadashboardcalek();
        emit(DataDashboardLoaded(data: data));
      }
      if (event is DatadashboardConnectKordinator) {
        var data = await auth!.getdatadashboardkordinator();
        emit(DataDashboardLoaded(data: data));
      }
      if (event is DatadashboardConnectRelawan) {
        var data = await auth!.getdatadashboardrelawan();
        emit(DataDashboardLoaded(data: data));
      }
      if (event is DatadashboardConnectSaksi) {
        var data = await auth!.getdatadashboardsaksi();
        emit(DataDashboardLoaded(data: data));
      }
    });
  }
}
