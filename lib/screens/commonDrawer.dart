import 'package:flutter/material.dart';
import 'package:taller_vehicular/screens/inicio/inicio.dart';
import 'package:taller_vehicular/screens/login/login.dart';
import 'package:taller_vehicular/screens/login/provider/authProvider.dart';
import 'package:taller_vehicular/screens/perfil/perfil.dart';

class CommonDrawer {
  static var cabecera = DrawerHeader(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Menú principal"),
            ],
          ),
          color: Colors.blue));

  static ListTile obtenerElemento(
      Icon icono, String nombre, String ruta, BuildContext contexto) {
    return ListTile(
      leading: icono,
      title: Text(nombre),
      onTap: () {
        Navigator.pushNamed(contexto, ruta);
      },
    );
  }

  static var info = AboutListTile(
      child: Text("Sobre la App"),
      icon: Icon(Icons.info),
      applicationVersion: "v1.0.1",
      applicationName: "Asistente Eventos UNAC",
      applicationIcon: Icon(Icons.adb));

  static ListTile etiquetaSalir(
      Icon icono, String nombre, String ruta, BuildContext contexto) {
    return ListTile(
      leading: icono,
      title: Text(nombre),
      onTap: () {
        // Aquí se debe llalmar a una función que elimine el token de la session
        // del usuario y lo lleve a la pantalla de login.
        AuthProvider _ap = AuthProvider();
        _ap.cerrarSesion();
        Navigator.pushNamed(contexto, ruta);
      },
    );
  }

  static Drawer obtenerDrawer(BuildContext contexto) {
    return Drawer(
      child: ListView(
        children: [
          cabecera,
          obtenerElemento(
              Icon(Icons.home), "Inicio", EstructuraInicio.ruta, contexto),
          obtenerElemento(
              Icon(
                Icons.settings_applications,
              ),
              "Perfil",
              EstructuraPerfil.ruta,
              contexto),
          info,
          etiquetaSalir(Icon(Icons.account_balance_wallet_outlined), "Salir",
              LoginPage.ruta, contexto),
          // LoginPage.validarSesion()
        ],
      ),
    );
  }
}
