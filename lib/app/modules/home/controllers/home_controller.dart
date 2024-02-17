import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listas/app/data/services/Listas.dart';

class HomeController extends GetxController {
  Listas listas = Listas();

  TextEditingController numero = TextEditingController();

  get getRaiz => listas.raiz.value;

  bool noEsNumero() {
    if (int.tryParse(numero.text) == null) {
      Get.snackbar(
        'Error',
        'No es un numero',
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }
    return false;
  }

  void insertarInicio() {
    if (noEsNumero()) return;
    listas.insertarInicio(int.parse(numero.text));
    numero.clear();
  }

  void insertarFinal() {
    if (noEsNumero()) return;
    listas.insertarFinal(int.parse(numero.text));
    numero.clear();
  }

  void partirVoltear() => listas.partirVoltear();

  void eliminarLista() {
    listas.raiz.value = null;
  }
}
