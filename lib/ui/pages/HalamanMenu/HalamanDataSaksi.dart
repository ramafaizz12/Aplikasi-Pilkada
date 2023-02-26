part of '../pages.dart';

class HalamanDataSaksi extends StatelessWidget {
  List gambar = [
    'assets/icon1.svg',
    'assets/icon6.svg',
  ];
  List nama = [
    'TPS',
    'SAKSI TPS',
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
                itemCount: 2,
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
                                          ? HalamanDataSaksitps()
                                          : const Text(""),
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
