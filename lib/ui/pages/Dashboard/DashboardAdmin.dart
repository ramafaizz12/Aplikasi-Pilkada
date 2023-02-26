part of '../pages.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

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
                            "Jumlah DPT",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.05,
                                color: putih,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            state.data!.dpt.toString(),
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
                          width: p1.maxWidth * 0.3,
                          height: p1.maxHeight * 0.3,
                          nama: 'Jumlah TPS',
                          angka: state.data!.tps.toString(),
                        ),
                        ContainerTps(
                          width: p1.maxWidth * 0.3,
                          height: p1.maxHeight * 0.3,
                          nama: 'Jumlah Relawan\nYang Direkrut',
                          angka: state.data!.relawan.toString(),
                        ),
                        ContainerTps(
                          width: p1.maxWidth * 0.3,
                          height: p1.maxHeight * 0.3,
                          nama: 'Jumlah Grup\nRelawan',
                          angka: state.data!.gruprelawan.toString(),
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
