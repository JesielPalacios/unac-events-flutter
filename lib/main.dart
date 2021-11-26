import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taller_vehicular/providers/ui.provider.dart';

// import 'package:taller_vehicular/pages/home_page.dart';
// import 'package:taller_vehicular/pages/mapa_page.dart';
import 'package:taller_vehicular/screens/inicio/inicio.dart';
import 'package:taller_vehicular/screens/login/login.dart';
import 'package:taller_vehicular/screens/perfil/perfil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taller Vehicular',
        initialRoute: '/login',
        routes: {
          // 'home': (_) => HomePage(),
          // 'mapa': (_) => MapaPage(),
          EstructuraInicio.ruta: (BuildContext context) => EstructuraInicio(),
          EstructuraPerfil.ruta: (BuildContext context) => EstructuraPerfil(),
          LoginPage.ruta: (BuildContext context) => LoginPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.indigo.shade800,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.indigo.shade800)),
      ),
    );
  }
}
