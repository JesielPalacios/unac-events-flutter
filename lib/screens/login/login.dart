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

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    validarSesion();
    return Scaffold(
        // appBar: AppBar(
        //   // title: Text("Iniciar Sesióne"),
        //   automaticallyImplyLeading: false,
        // ),
        body: ListView(
          children: [
            Container(
                // Fondo de la aplicacion
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('./assets/Fondo.png'), fit: BoxFit.cover)),
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Logo
                        Image.asset(
                          './assets/UNAC_Logo.png',
                          // height: 370,
                          height: 320,
                        ),
                        // SizedBox(height: 51),
                        // Input de mail y contraseña
                        obtenerCampoEmail(),
                        SizedBox(height: 20),
                        obtenerCampoContrasena(),
                        // // SizedBox(
                        // //   height: 5,
                        // // ),
                        // // Text(
                        // //   "¿Olvidaste la contraseña?",
                        // //   style: TextStyle(),
                        // // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        obtenerBotonIniciarSesion(),
                        // Container(
                        //   alignment: Alignment.center,
                        //   child: Row(
                        //     children: [
                        //       Text("¿Eres nuevo?"),
                        //       GestureDetector(
                        //           child: Text(
                        //             "Regístrate",
                        //             style: TextStyle(
                        //                 color: Colors.blue,
                        //                 decoration: TextDecoration.underline),
                        //           ),
                        //           onTap: () {
                        //             setState(() {
                        //               AlertDialog dialog = AlertDialog(
                        //                 title: Text(
                        //                   'Registro de usuarios',
                        //                 ),
                        //                 content: Text(
                        //                     'Todo el registro de usuarios debe ser desde la página web a la que puede acceder a continuación, esta app móvil sólo es para registro y asistencia de eventos.',
                        //                     style: TextStyle(color: Colors.white)),
                        //                 elevation: 24.0,
                        //                 backgroundColor: Colors.red,
                        //                 titleTextStyle: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white,
                        //                     fontSize: 15),
                        //                 actions: [
                        //                   TextButton(
                        //                       onPressed: () {
                        //                         Clipboard.setData(new ClipboardData(
                        //                                 text: 'www.google.com'))
                        //                             .then((_) {
                        //                           ScaffoldMessenger.of(context)
                        //                               .showSnackBar(SnackBar(
                        //                                   content: Text(
                        //                                       "Copiado al portapepeles!",
                        //                                       style: TextStyle(
                        //                                           color: Colors
                        //                                               .white))));
                        //                         });
                        //                       },
                        //                       child: Text("Copiar dirección web")),
                        //                   TextButton(
                        //                       onPressed: () {
                        //                         Navigator.pop(context);
                        //                       },
                        //                       child: Text("Salir",
                        //                           style: TextStyle(
                        //                               color: Colors.white
                        //                                   .withOpacity(0.6)))),
                        //                 ],
                        //               );

                        //               showDialog(
                        //                   context: context,
                        //                   builder: (BuildContext context) {
                        //                     return dialog;
                        //                   });
                        //             });
                        //           })
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )),
          ],
        )

        // body: Container(
        //   // Fondo de la aplicacion
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('./assets/Fondo.png'), fit: BoxFit.cover)),
        //   padding: EdgeInsets.only(left: 50, right: 50),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         // Logo
        //         Image.asset(
        //           'assets/UNAC_Logo.png',
        //           height: 300,
        //         ),
        //         SizedBox(height: 51),
        //         // Input de mail y contraseña
        //         TextField(
        //           controller: mail,
        //           style: TextStyle(color: Colors.white),
        //           decoration: InputDecoration(
        //               enabledBorder: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(4),
        //                   borderSide: BorderSide(color: Colors.white)),
        //               prefixIcon: Icon(
        //                 Icons.account_circle_outlined,
        //                 color: Colors.white,
        //               ),
        //               hintText: 'USERNAME or MAIL',
        //               hintStyle: TextStyle(color: Colors.white)),
        //         ),
        //         SizedBox(height: 20),
        //         TextField(
        //           controller: password,
        //           style: TextStyle(fontSize: 14),
        //           obscureText: true,
        //           decoration: InputDecoration(
        //               enabledBorder: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(4),
        //                   borderSide: BorderSide(color: Colors.white)),
        //               prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
        //               hintText: 'PASSWORD',
        //               hintStyle: TextStyle(color: Colors.white)),
        //         ),
        //         // SizedBox(
        //         //   height: 5,
        //         // ),
        //         // Text(
        //         //   "¿Olvidaste la contraseña?",
        //         //   style: TextStyle(),
        //         // ),
        //         SizedBox(
        //           height: 5,
        //         ),
        //         Container(
        //           margin: EdgeInsets.only(top: 25),
        //           width: 300,
        //           height: 45,
        //           decoration:
        //               BoxDecoration(borderRadius: BorderRadius.circular(10)),
        //           child: FlatButton(
        //             color: Colors.white,
        //             child: Text(
        //               "LOGIN",
        //               style: TextStyle(
        //                   color: Color(0xff2148C0), fontWeight: FontWeight.bold),
        //             ),
        //             onPressed: () {},
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  TextFormField obtenerCampoEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.white)),
          prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.white),
          // labelText: "Correo electrónico",
          // labelStyle: TextStyle(color: Colors.white),
          hintText: "Correo electrónico",
          hintStyle: TextStyle(color: Colors.white)),
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
      // decoration: InputDecoration(labelText: "Contraseña"),
      // style: TextStyle(fontSize: 22),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.white)),
          prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
          // labelText: "Correo electrónico",
          // labelStyle: TextStyle(color: Colors.white),
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Colors.white)),
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

  // ElevatedButton obtenerBotonIniciarSesion() {
  Container obtenerBotonIniciarSesion() {
    // return ElevatedButton(
    //     onPressed: () {
    //       // if (formKey.currentState!.validate()) {
    //       //   formKey.currentState!.save();
    //       //   validarToken(emailIngresado, contrasenaIngresada);
    //       // }
    //       validarToken(emailIngresado, contrasenaIngresada);
    //     },
    //     child: Text("Iniciar Sesión"));
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: 300,
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
        color: Colors.white,
      // child: ElevatedButton(
      //   style: ButtonStyle(backgroundColor: Colors.white),
        child: Text(
          "Iniciar sesión",
          style:
              TextStyle(color: Color(0xff2148C0), fontWeight: FontWeight.bold),
        ),
        // onPressed: () {},
        onPressed: () {
          // if (formKey.currentState!.validate()) {
          //   formKey.currentState!.save();
          //   validarToken(emailIngresado, contrasenaIngresada);
          // }
          validarToken(emailIngresado, contrasenaIngresada);
        },
      ),
    );
  }

  void validarToken(String email, String contrasena) async {
    //     AuthProvider ap = AuthProvider();
    // AuthResponse ar =
    //     await ap.obtenerToken(emailIngresado, contrasenaIngresada);


    AuthProvider ap = AuthProvider();
    AuthResponse ar = 
    await ap.obtenerToken('admin@localhost.com', '12345678');
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


// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController mail = TextEditingController();
//   TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       // Fondo de la aplicacion
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/fondo.png'), fit: BoxFit.cover)),
//       padding: EdgeInsets.only(left: 50, right: 50),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Logo
//             Image.asset(
//               'assets/UNAC_Logo.png',
//               height: 300,
//             ),
//             SizedBox(height: 51),
//             // Input de mail y contraseña
//             TextField(
//               controller: mail,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide: BorderSide(color: Colors.white)),
//                   prefixIcon: Icon(
//                     Icons.account_circle_outlined,
//                     color: Colors.white,
//                   ),
//                   hintText: 'USERNAME or MAIL',
//                   hintStyle: TextStyle(color: Colors.white)),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: password,
//               style: TextStyle(fontSize: 14),
//               obscureText: true,
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide: BorderSide(color: Colors.white)),
//                   prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
//                   hintText: 'PASSWORD',
//                   hintStyle: TextStyle(color: Colors.white)),
//             ),
//             // SizedBox(
//             //   height: 5,
//             // ),
//             // Text(
//             //   "¿Olvidaste la contraseña?",
//             //   style: TextStyle(),
//             // ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 25),
//               width: 300,
//               height: 45,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(10)),
//               child: FlatButton(
//                 color: Colors.white,
//                 child: Text(
//                   "LOGIN",
//                   style: TextStyle(
//                       color: Color(0xff2148C0), fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     )
//     );
//   }
// }
