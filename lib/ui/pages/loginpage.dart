part of 'pages.dart';

class LoginPage extends StatefulWidget {
  static const String routename = '/loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isemailvalid = false;

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AppStarted());

    _onLoginbuttonpressed() {
      context
          .read<LoginBloc>()
          .add(LoginButton(email: username.text, password: password.text));
    }

    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: putihh,
        body: Stack(children: [
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
          Padding(
            padding: EdgeInsets.only(
                top: p1.maxHeight * 0.15,
                left: p1.maxWidth * 0.032,
                right: p1.maxWidth * 0.032),
            child: Column(
              children: [
                Center(
                  child: Column(
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
                            fontSize: p1.maxHeight * 0.03),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: textpoppin.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorbiru,
                          fontSize: p1.maxHeight * 0.03),
                    ),
                    Text(
                      "Silahkan Masukkan Email Dan Password\nAnda Dengan Benar",
                      style:
                          textpoppin.copyWith(fontSize: p1.maxHeight * 0.018),
                    ),
                    SizedBox(
                      height: p1.maxHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: p1.maxHeight * 0.02,
                          right: p1.maxHeight * 0.02),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: textpoppin.copyWith(
                                  fontSize: p1.maxHeight * 0.02),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: putih,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextField(
                                  onChanged: (text) {
                                    isemailvalid =
                                        EmailValidator.validate(text);
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  controller: username,
                                  style: textpoppin,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: p1.maxHeight * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: textpoppin.copyWith(
                                  fontSize: p1.maxHeight * 0.02),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: putih,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                controller: password,
                                style: textpoppin,
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: p1.maxHeight * 0.07,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state is LoginLoaded
                        ? const SpinKitFadingFour(
                            color: colororange,
                            size: 50,
                          )
                        : Container(
                            width: p1.maxWidth * 0.4,
                            height: p1.maxHeight * 0.06,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: hitam.withOpacity(0.2),
                                      offset: const Offset(3, 3))
                                ],
                                color: colorbiru,
                                borderRadius: BorderRadius.circular(2)),
                            child: TextButton(
                              onPressed: () {
                                _onLoginbuttonpressed();
                                setState(() {});
                                // AutoRouter.of(context).replace(HomeRoute());
                              },
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: textpoppin.copyWith(
                                      color: putih,
                                      fontSize: p1.maxHeight * 0.016)),
                            ),
                          );
                  },
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state is LoginFailure
                        ? Text(
                            "Password atau Username Salah",
                            style: textpoppin.copyWith(
                                fontSize: p1.maxHeight * 0.02,
                                color: colororange),
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
