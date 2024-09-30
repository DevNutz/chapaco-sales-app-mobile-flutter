import 'package:chapacosales/pages/DummyPage.dart';
import 'package:chapacosales/widgets/CustomInput.dart';
import 'package:chapacosales/widgets/VersionText.dart';
import 'package:chapacosales/widgets/LoadingOverlay.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool isLoading = false;
  String phoneNumber = 'tel:+591-78789345';

  Future<void> startLogging() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DummyPage()),
    );
  }


  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform the login action here (e.g., API call)
      await startLogging();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in with $_email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Image(image: AssetImage('assets/mdi_beer.png')),
                SizedBox(height: 20.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                              fontSize: 32.0,
                              height: 40.0 / 32.0, // Flutter uses a multiplier for line height
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                              color: Color(0xFFE8E2D4)
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Para ingresar al sistema, por favor ingresa tus credenciales, recuerda no compartirlas con externos',
                          style: TextStyle(
                              fontSize: 14.0,
                              height: 20.0 / 14.0, // Flutter uses a multiplier for line height
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              color: Color(0xFFE8E2D4)
                          ),
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 43.0),
                CustomInput(
                  hintText: 'Nombre de Usuario',
                  validator: (value) {
                    /*if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'username not found';
                    }*/
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 26.0),
                CustomInput(
                    hintText: 'Contraseña',
                    type: TextInputType.visiblePassword,
                    icon: Icons.remove_red_eye,
                    onSaved: (value) {
                      _password = value!;
                    }
                ),
                const SizedBox(height: 46.0),
                Container(
                  height: 46.0,
                  width: 247.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1C6A1), // Background color #D1C6A1
                    borderRadius: BorderRadius.circular(100.0), // Border radius of 100px
                  ),
                  child: TextButton(
                    onPressed: _login,
                    child: Text(
                      'INGRESAR',
                      style: TextStyle(
                        color: Colors.black, // Text color (change as needed)
                        fontSize: 16.0, // Font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 63.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    children: [
                      TextSpan(
                        text: 'Si tienes problemas para ingresar al sistema, contactate con el gerente a este telefono ',
                        style: TextStyle(
                          fontSize: 14.0,
                          height: 20.0 / 14.0, // Flutter uses a multiplier for line height
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          color: Color(0xFFE8E2D4),
                        ),
                      ),
                      TextSpan(
                        text: '78789345',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async { // Replace with your phone number
                            if (await canLaunchUrl(Uri.parse(phoneNumber))) {
                              await launchUrl(Uri.parse(phoneNumber));
                            } else {
                              throw 'Could not launch $phoneNumber';
                            }
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 63.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: VersionText()
                )
              ],
            ),
          ),
        ),
      )
      ),
      backgroundColor: Color(0xFF43664E),
    );
  }
}
