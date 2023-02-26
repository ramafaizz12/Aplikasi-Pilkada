part of '../pages.dart';

class HalamanDataAdmin extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon2.svg',
    'assets/icon3.svg',
    'assets/icon4.svg',
    'assets/icon5.svg',
    'assets/icon6.svg',
    'assets/icon7.svg',
    'assets/icon5.svg',
  ];
  List nama = [
    'TPS',
    'GRUP RELAWAN',
    'RELAWAN',
    'JUMLAH DPT',
    'KOORDINATOR',
    'SAKSI TPS',
    'PENERIMA AKSESORIS',
    'CALEG'
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxHeight,
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) => ContainerDatabaru(
                  fungsi: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanTemplateData(
                                  haldata: (index == 0)
                                      ? HalamanDataTps()
                                      : (index == 1)
                                          ? HalamanDataGruprelawan()
                                          : (index == 2)
                                              ? HalamanDataRelawan()
                                              : (index == 3)
                                                  ? HalamanJumlahdpt()
                                                  : (index == 4)
                                                      ? HalamanKoordinator()
                                                      : (index == 5)
                                                          ? HalamanDataSaksitps()
                                                          : (index == 6)
                                                              ? HalamanAksesoris()
                                                              : (index == 7)
                                                                  ? HalamanCaleg()
                                                                  : const Text(
                                                                      ""),
                                )));
                  },
                  nama: nama[index],
                  gambar: gambar[index],
                  width: p1.maxWidth * 0.25,
                  height: p1.maxHeight * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
