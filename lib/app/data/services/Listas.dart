import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/Nodo.dart';

class Listas {
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

  eliminar(int numero) {
    raiz.value = eliminarRecursivo(raiz.value, numero);
  }

  Nodo? eliminarRecursivo(Nodo? aux, int numero) {
    if (aux != null) {
      if (aux.numero == numero) {
        return aux.siguiente;
      } else {
        aux.siguiente = eliminarRecursivo(aux.siguiente, numero);
      }
    }
    return aux;
  }

  void imprimir() {
    Nodo? auxiliar = raiz.value;
    while (auxiliar != null) {
      print(auxiliar.numero);
      auxiliar = auxiliar.siguiente;
    }
  }

  void partirVoltear() {
    if (raiz.value != null || raiz.value!.siguiente != null) return;

    Nodo? cabeza = raiz.value;
    Nodo? cola = raiz.value;
    Nodo? aux = raiz.value;

    int tamanio = 1;
    while (cola!.siguiente != null) {
      cola = cola.siguiente;
      tamanio++;
    }

    int mitad = (tamanio ~/ 2) + (tamanio % 2);

    for (int i = 1; i < mitad; i++) {
      aux = aux!.siguiente;
    }

    raiz.value = aux!.siguiente;
    aux.siguiente = null;

    cola.siguiente = cabeza;
  }
}
