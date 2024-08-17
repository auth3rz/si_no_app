import 'package:flutter/material.dart';

//s SE REFIERE A SIZE

///RETORNA ANCHO RESPONSIVO
double sw(double d, BuildContext context) {
  final s = MediaQuery.of(context).size;
  return s.width * d;
}


///RETORNA ALTO RESPONSIVO
double sh(double d, BuildContext context) {
  final s = MediaQuery.of(context).size;
  return s.height * d;
}