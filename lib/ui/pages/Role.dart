part of 'pages.dart';

class Role extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();
    context.read<DataprofileBloc>();
    return BlocBuilder<DataprofileBloc, DataprofileState>(
      builder: (context, state) {
        if (state is DataprofileLoaded) {
          if (state.data!.role == 'admin') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectAdmin());
            return HomePage(
                haldata: HalamanDataAdmin(), dashboard: DashboardAdmin());
          }
          if (state.data!.role == 'saksi') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectSaksi());
            return HomePage(
                haldata: HalamanDataSaksi(), dashboard: DashboardSaksi());
          }
          if (state.data!.role == 'calek') {
            context.read<DatadashboardBloc>().add(DatadashboardConnectCalek());
            return HomePage(
                haldata: HalamanDataa(), dashboard: Dashboardcalek());
          }
          if (state.data!.role == 'kordinator') {
            context
                .read<DatadashboardBloc>()
                .add(DatadashboardConnectKordinator());
            return HomePage(
                haldata: HalamanDataa(), dashboard: DashboardKoordinator());
          }
          if (state.data!.role == 'relawan') {
            context
                .read<DatadashboardBloc>()
                .add(DatadashboardConnectRelawan());
            return HomePage(
                haldata: HalamanDataa(), dashboard: DashboardRelawan());
          }
        }
        return const HalamanLoading();
      },
    );
  }
}
