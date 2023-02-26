part of 'pages.dart';

class LoadingPage extends StatelessWidget {
  static const String routename = '/loadingpage';

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //     Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => Wrapper(),
    //         )));
    return Scaffold(
      backgroundColor: putihh,
      body: LayoutBuilder(
        builder: (p0, p1) => Stack(
          children: [
            SvgPicture.asset(
              'assets/bg_atas.svg',
              width: p1.maxWidth,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/bg_bwh.svg',
                color: hitam,
                width: p1.maxWidth,
              ),
            ),
            Center(
              child: AnimatedSplashScreen(
                backgroundColor: putihh,
                splashIconSize: 1000,
                splashTransition: SplashTransition.slideTransition,
                animationDuration: const Duration(seconds: 2),
                duration: 3000,
                nextScreen: Wrapper(),
                splash: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: p1.maxWidth * 0.2,
                      height: p1.maxHeight * 0.2,
                      child: Image.asset('assets/pilkada1.png',
                          fit: BoxFit.fitWidth),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    Text(
                      "SISTEM INFORMASI",
                      style: textpoppin.copyWith(
                          fontWeight: FontWeight.w400,
                          color: colorbiru,
                          fontSize: p1.maxHeight * 0.02),
                    ),
                    Text(
                      "PILKADA",
                      style: textpoppin.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorbiru,
                          fontSize: p1.maxHeight * 0.06),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
