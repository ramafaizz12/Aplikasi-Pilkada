part of '../pages.dart';

class DashboardKoordinator extends StatelessWidget {
  const DashboardKoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatadashboardBloc, DatadashboardState>(
      builder: (context, state) {
        return state is DataDashboardLoaded
            // kasih kondisi sini
            ? LayoutBuilder(
                builder: (p0, p1) => Column(
                  children: [
                    Container(
                      width: p1.maxWidth,
                      height: p1.maxHeight * 0.2,
                      decoration: BoxDecoration(
                          color: colororange,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Jumlah TPS",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.05,
                                color: putih,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            state.data!.tps.toString(),
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.05,
                                color: putih,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.05,
                    ),

                    // kasih kondisi sini juga
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerTps(
                          width: p1.maxWidth * 0.42,
                          height: p1.maxHeight * 0.3,
                          nama: 'Jumlah Caleg',
                          angka: state.data!.calek.toString(),
                        ),
                        ContainerTps(
                          width: p1.maxWidth * 0.42,
                          height: p1.maxHeight * 0.3,
                          nama: 'Jumlah Relawan',
                          angka: state.data!.relawan.toString(),
                        )
                      ],
                    )
                  ],
                ),
              )
            : const Text("Data Cannot Load");
      },
    );
  }
}
