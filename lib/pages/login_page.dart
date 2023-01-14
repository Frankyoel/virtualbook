
// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_virtual_book_g5/pages/register_page.dart';
import 'package:my_virtual_book_g5/services/auth_service.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceso'),),
      body: const ContenidoLG(),
    );
  }
}

class ContenidoLG extends StatelessWidget {
  const ContenidoLG({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          FormRegistro(),
        ],
      ),
    );
  }
}

class FormRegistro extends StatefulWidget {
  const FormRegistro({
    Key? key,
  }) : super(key: key);

  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
   // final isValid = _formKey.currentState!.validate();

    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: 15),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Requerido';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Contraseña'),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Requerido';
                }
                if (value.length < 6) {
                  return '6 datos como minimo';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                   if (_formKey.currentState!.validate()){
                    await authService.siginWithEmailAndPassword(_emailController.text, _passwordController.text);
                    {Navigator.pop(context);Navigator.pop(context);}
                   }
                },
                child: const Text('Ingresar')),
            const SizedBox(height: 10),
            const Center(
              child: Text('¿Aun no tienes una cuenta?'),
            ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterPage()));
                    },
                    child: const Text('Registrate aqui'),
                  ),
                ),
             
          ])),
    );
  }


}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 35),
          width: double.infinity,
          height: 200,
          color: Color.fromARGB(188, 106, 159, 234),
          child: Column(children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(
                    width: 5, color: Color.fromARGB(255, 3, 15, 149)),
                //  image: DecorationImage(
                //    image: AssetImage('assets/github.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'MY VIRTUAL BOOK',
                )),
          ]),
        )
      ],
    );
  }
}