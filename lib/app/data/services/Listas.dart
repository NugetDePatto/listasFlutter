import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/Nodo.dart';

class Listas {
  // Nodo? raiz;
  Rx<Nodo?> raiz = Rx<Nodo?>(null);

  //agregar al inicio
  void insertarInicio(int numero) {
    raiz.value = Nodo(numero, siguiente: raiz.value);
  }

  void insertarFinal(int numero) {
    Nodo nuevo = Nodo(numero);

    if (raiz.value == null) {
      raiz.value = nuevo;
    } else {
      Nodo? auxiliar = raiz.value;
      while (auxiliar!.siguiente != null) {
        auxiliar = auxiliar.siguiente;
      }
      auxiliar.siguiente = nuevo;
    }
  }

  void imprimir() {
    Nodo? auxiliar = raiz.value;
    while (auxiliar != null) {
      print(auxiliar.numero);
      auxiliar = auxiliar.siguiente;
    }
  }

  int tamanio() {
    Nodo? aux = raiz.value;
    int contador = 0;

    while (aux != null) {
      contador++;
      aux = aux.siguiente;
    }

    return contador;
  }

  void partirVoltear() {
    Nodo? raizMitad = raiz.value;
    Nodo? auxMitad = raiz.value;
    Nodo? auxFinal = raiz.value;

    int length = tamanio();

    int i = length % 2 == 1 ? 0 : -1;

    while (auxFinal!.siguiente != null) {
      i++;
      if (i < (length / 2) - 1) auxMitad = auxMitad!.siguiente;
      if (i < (length / 2)) raiz.value = raiz.value!.siguiente;

      auxFinal = auxFinal.siguiente;
    }

    if (auxFinal != auxMitad) {
      auxMitad!.siguiente = null;
      auxFinal.siguiente = raizMitad;

      if (length % 2 == 1) {
        Nodo? aux = raiz.value;
        raiz.value = raiz.value!.siguiente;
        aux!.siguiente = null;
        auxMitad.siguiente = aux;
      }
    }
  }
}
