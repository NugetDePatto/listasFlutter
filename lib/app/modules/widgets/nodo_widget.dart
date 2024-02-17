import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/Nodo.dart';

class NodoWidget extends StatelessWidget {
  final Nodo? nodo;
  const NodoWidget({super.key, this.nodo});

  @override
  Widget build(BuildContext context) {
    if (nodo != null) {
      return Obx(() {
        return Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              child: Center(
                child: Text(
                  nodo!.numero.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.green[900]),
                ),
              ),
            ),
            Container(
              height: 2,
              width: 20,
              color: Colors.green[900],
            ),
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[900],
              ),
            ),
            nodo!.siguiente != null
                ? NodoWidget(
                    nodo: nodo!.siguiente,
                  )
                : nodoNull(),
          ],
        );
      });
    } else {
      return nodoNull();
    }
  }

  Container nodoNull() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green[100],
      ),
      child: Center(
        child: Text(
          '\'\'',
          style: TextStyle(fontSize: 30, color: Colors.green[900]),
        ),
      ),
    );
  }
}
