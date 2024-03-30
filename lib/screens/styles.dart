import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loge_moi/constants.dart';

TextStyle titleStyle({color = Colors.black}) => GoogleFonts.poppins(
      fontSize: 25,
      color: color,
      fontWeight: FontWeight.w600,
    );
TextStyle grayStyle({color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 15, color: Colors.grey);
