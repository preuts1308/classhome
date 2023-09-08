import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_basic/views/screens/home/home_view_model.dart';
import 'package:mvvm_basic/views/widgets/my_custom_text_form_field.dart';

import '../../styles/general_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeViewModel _homeVM = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.grey[200],
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 40),
              child: const CircleAvatar(
                maxRadius: 120,
                minRadius: 60,
                backgroundColor: Colors.black,
                //child: Padding(padding: EdgeInsets.all(50)),
                backgroundImage: NetworkImage(
                    'https://s1.ppllstatics.com/lasprovincias/www/multimedia/202112/12/media/cortadas/gatos-kb2-U160232243326NVC-624x385@Las%20Provincias.jpg'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Text(
                'Bienvenido',
                style: styleTextTitle(context, 30),
              ),
            ),
            Form(
              child: Column(
                children: [
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Email',
                  //     border: const OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(19))
                  //     )
                  //   ),
                  // ),
                  // TextFormField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //       hintText: 'Contraseña',
                  //       border: const OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(19))
                  //       )
                  //   ),
                  // ),
                  myCustomTextFormField(
                      controller: _homeVM.getEmailController(),
                      hintText: 'Email',
                      onChanged: (value) {
                        setState(() {
                          _homeVM.validateEmail();
                        });
                      }
                  ),
                  const SizedBox(height: 10,),
                  _homeVM.getIsValidEmail() ? const SizedBox(height: 10,) : Text('error'),
                  const SizedBox(height: 10,),
                  myCustomTextFormField(
                      controller: _homeVM.getPasswordController(),
                      hintText: 'Contraseña', obscureText: true,
                      onChanged: (value) {
                      setState(() {
                      _homeVM.validatePassword();
                        });
                     }
                  ),

                  const SizedBox(height: 10,),
                  _homeVM.getIsValidPassword()? const SizedBox(height: 10,) : Text('error contraseña debil'),
                  const SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/profile');
                  }, child: Text('Ir perfil'))
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
