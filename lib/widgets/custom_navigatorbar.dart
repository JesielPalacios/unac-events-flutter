import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taller_vehicular/providers/ui.provider.dart';

class CustomNavigatonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // En caso de que este código estuviera dentro de una función o método
    // se debería colocarl el listen:false para que no intente redibujar
    // esa función porque va a dar un error.
    // final uiProvider = Provider.of<UiProvider>(context, listen: false);
    final uiProvider = Provider.of<UiProvider>(context);

    // final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      // onTap: (int i) => print('opt: $i'),
      // En este caso no se pasa por parámetros porque en la clse uiProvider
      // no es un método, sino un setter. Por lo que se puede hacer una
      // asignación directa.
      // onTap: (int i) => uiProvider.selectedMenuOpt (i),
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: uiProvider.selectedMenuOpt,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Eventos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Mis eventos'),
        ]);
  }
}
