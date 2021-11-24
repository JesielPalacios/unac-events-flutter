import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taller_vehicular/screens/inicio/inicio.dart';
import 'package:taller_vehicular/screens/login/model/authResponse.dart';
import 'package:taller_vehicular/screens/login/provider/authProvider.dart';
import 'package:taller_vehicular/screens/perfil/perfil.dart';

class LoginPage extends StatefulWidget {
  static String ruta = "/login";

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emailIngresado = "";
  String contrasenaIngresada = "";

  @override
  Widget build(BuildContext context) {
    validarSesion();
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Iniciar Sesióne"),
        //   automaticallyImplyLeading: false,
        // ),
        body: Container(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              obtenerCampoEmail(),
              obtenerCampoContrasena(),
              obtenerBotonIniciarSesion(),
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text("¿Eres nuevo?"),
                    GestureDetector(
                        child: Text(
                          "Regístrate",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          setState(() {
                            AlertDialog dialog = AlertDialog(
                              title: Text(
                                'Registro de usuarios',
                              ),
                              content: Text(
                                  'Todo el registro de usuarios debe ser desde la página web a la que puede acceder a continuación, esta app móvil sólo es para registro y asistencia de eventos.',
                                  style: TextStyle(color: Colors.white)),
                              elevation: 24.0,
                              backgroundColor: Colors.red,
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Clipboard.setData(new ClipboardData(
                                              text: 'www.google.com'))
                                          .then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Copiado al portapepeles!",
                                                    style: TextStyle(
                                                        color: Colors.white))));
                                      });
                                    },
                                    child: Text("Copiar dirección web")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Salir",
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.6)))),
                              ],
                            );

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return dialog;
                                });
                          });
                        })
                  ],
                ),
              )
            ],
          ),
        )));
  }

  TextFormField obtenerCampoEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Correo electrónico", hintText: "john.doe@mail.com"),
      validator: (value) {
        String patron = r'^[^@]+@[^@]+\.[^@]+$';
        RegExp regExp = new RegExp(patron);
        if (regExp.hasMatch(value!)) {
          return null;
        } else {
          return "El email no es válido";
        }
      },
      onSaved: (value) {
        emailIngresado = value!;
      },
    );
  }

  TextFormField obtenerCampoContrasena() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Contraseña"),
      validator: (value) {
        if (value!.length > 5) {
          return null;
        } else {
          return "La contraseña no cumple requisitos mínimos de seguridad";
        }
      },
      onSaved: (value) {
        contrasenaIngresada = value!;
      },
    );
  }

  ElevatedButton obtenerBotonIniciarSesion() {
    return ElevatedButton(
        onPressed: () {
          // if (formKey.currentState!.validate()) {
          //   formKey.currentState!.save();
          //   validarToken(emailIngresado, contrasenaIngresada);
          // }
          validarToken(emailIngresado, contrasenaIngresada);
        },
        child: Text("Iniciar Sesión"));
  }

  void validarToken(String email, String contrasena) async {
    AuthProvider ap = AuthProvider();
    AuthResponse ar = await ap.obtenerToken('admin@localhost.com', '12345678');
    // await ap.obtenerToken(emailIngresado, contrasenaIngresada);

    print(ar.message);

    if (ar.message != "OK") {
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', ar.token!);

      formKey.currentState!.reset();

      Navigator.pushNamed(context, EstructuraInicio.ruta);
      // Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, EstructuraInicio.ruta);
    }
  }

  validarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');

    bool existeToken = token == null ? false : true;

    if (existeToken) {
      Navigator.pushNamed(context, EstructuraInicio.ruta);
      // Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, EstructuraInicio.ruta);
    }
  }
}
