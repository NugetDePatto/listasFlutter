import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/nodo_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas sencillas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.numero,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.insertarInicio();
                  },
                  child: const Text('Inicio'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.insertarFinal();
                  },
                  child: const Text('Final'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => NodoWidget(
                        nodo: controller.getRaiz,
                      ),
                    ),

                    // GetX<HomeController>(
                    //   builder: (controller) => NodoWidget(
                    //     nodo: controller.getRaiz,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.partirVoltear();
                  },
                  child: const Text('Partir y Voltear'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.eliminarLista();
                  },
                  child: const Text('Eliminar raiz'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
