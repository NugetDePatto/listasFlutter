import 'package:get/get.dart';

class Nodo {
  final Rx<Nodo?> _siguiente = Rx<Nodo?>(null);
  final RxInt _numero = 0.obs;

  Nodo(int numero, {Nodo? siguiente}) {
    _siguiente.value = siguiente;
    _numero.value = numero;
  }

  Nodo? get siguiente => _siguiente.value;
  int get numero => _numero.value;

  set siguiente(Nodo? value) => _siguiente.value = value;
  set numero(int value) => _numero.value = value;

  Rx<Nodo?> get getSiguiente => _siguiente;
}
