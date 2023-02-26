import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorbiru = Color(0xff243763);
const Color colororange = Color(0xffFF6E31);
const Color putihh = Color(0xffFFEBB7);
const Color coklatputih = Color(0xffAD8E70);
const Color hitam = Color.fromARGB(255, 0, 0, 0);
const Color putih = Color.fromARGB(255, 255, 255, 255);
const Color abuabu = Color(0xffD9D9D9);
const LinearGradient colorbackground = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.5, 1],
  colors: [
    Color(0xffFFFFFF),
    Color(0xffF36E35),
  ],
);
const LinearGradient colorcontainer = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff243763),
    Color(0xffF36E35),
  ],
);

final TextStyle textpoppin = GoogleFonts.poppins(fontWeight: FontWeight.w400);
