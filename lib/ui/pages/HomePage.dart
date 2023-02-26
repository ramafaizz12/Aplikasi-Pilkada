part of 'pages.dart';

class HomePage extends StatefulWidget {
  dynamic haldata;
  dynamic dashboard;

  HomePage({this.haldata, this.dashboard});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>();

    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: putih,
        body: Stack(
          children: [
            Container(
              width: p1.maxWidth,
              height: p1.maxHeight,
              decoration: const BoxDecoration(gradient: colorbackground),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/bg_bwh.svg',
                color: hitam,
                width: p1.maxWidth,
              ),
            ),
            SvgPicture.asset(
              'assets/bg_atas.svg',
              width: p1.maxWidth,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: p1.maxHeight * 0.15,
                  left: p1.maxWidth * 0.03,
                  right: p1.maxWidth * 0.03),
              child: HalamanHome(
                haldata: widget.haldata,
                dashboard: widget.dashboard,
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //       width: p1.maxWidth,
            //       height: p1.maxHeight * 0.1,
            //       decoration: BoxDecoration(color: colororange),
            //       child: LayoutBuilder(
            //         builder: (p0, btm) => BottomNavigationBar(
            //             selectedLabelStyle: textpoppin,
            //             unselectedLabelStyle: textpoppin,
            //             unselectedItemColor: putih,
            //             selectedItemColor: colorbiru,
            //             type: BottomNavigationBarType.fixed,
            //             backgroundColor: colororange,
            //             onTap: (value) {
            //               setState(() {
            //                 bottomnavbarindex = value;
            //                 pagecontrol.jumpToPage(value);
            //                 // pagecontrol.jumpToPage(value);
            //               });
            //             },
            //             currentIndex: bottomnavbarindex,
            //             items: [
            //               BottomNavigationBarItem(
            //                   label: 'Home',
            //                   icon: Container(
            //                     height: btm.maxHeight * 0.3,
            //                     child: Image.asset(
            //                       'assets/vectorhome.png',
            //                       color: (bottomnavbarindex == 0)
            //                           ? colorbiru
            //                           : putih,
            //                     ),
            //                   )),
            //               BottomNavigationBarItem(
            //                   label: 'Data',
            //                   icon: Container(
            //                     height: btm.maxHeight * 0.3,
            //                     child: Image.asset(
            //                       'assets/vectordata.png',
            //                       color: (bottomnavbarindex == 1)
            //                           ? colorbiru
            //                           : putih,
            //                     ),
            //                   )),
            //               BottomNavigationBarItem(
            //                   label: 'Profil',
            //                   icon: Container(
            //                     height: btm.maxHeight * 0.3,
            //                     child: Image.asset(
            //                       'assets/vectororg.png',
            //                       color: (bottomnavbarindex == 2)
            //                           ? colorbiru
            //                           : putih,
            //                     ),
            //                   )),
            //             ]),
            //       )),
            // ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: p1.maxHeight * 0.05, right: p1.maxHeight * 0.02),
                child: SizedBox(
                  width: p1.maxWidth * 0.1,
                  height: p1.maxHeight * 0.1,
                  child: FittedBox(
                    child: FloatingActionButton(
                      elevation: 10,
                      backgroundColor: colororange,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text(
                                "Apakah anda yakin ingin keluar ?",
                                style: textpoppin.copyWith(
                                    fontSize: p1.maxHeight * 0.02),
                              ),
                              content: Row(
                                children: [
                                  Container(
                                    width: p1.maxWidth * 0.3,
                                    height: p1.maxHeight * 0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: putih,
                                        border: Border.all(
                                            color: colorbiru, width: 1.0)),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: Text(
                                          "Tidak",
                                          style: textpoppin.copyWith(
                                              color: colorbiru,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  SizedBox(
                                    width: p1.maxWidth * 0.01,
                                  ),
                                  Container(
                                    width: p1.maxWidth * 0.3,
                                    height: p1.maxHeight * 0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: hitam.withOpacity(0.2),
                                              offset: const Offset(3, 3))
                                        ],
                                        color: colorbiru,
                                        border: Border.all(
                                            color: colorbiru, width: 1.0)),
                                    child: TextButton(
                                        onPressed: () {
                                          context
                                              .read<AuthBloc>()
                                              .add(LoggedOut());
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: Text(
                                          "Ya",
                                          style: textpoppin.copyWith(
                                              color: putih,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                ],
                              )),
                        );
                      },
                      child: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
