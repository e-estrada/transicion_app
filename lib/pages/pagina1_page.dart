import 'package:flutter/material.dart';
import 'package:transicion_app/pages/pagina2_page.dart';


class Pagina1Page extends StatelessWidget {
 const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: const Center(
        child: Text('Página 1'),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: () {

        Navigator.push(context, _crearRuta());
        
      },
      child: const Icon(Icons.arrow_right_alt),
     ),
   );
  }
  
  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => const Pagina2Page(),
      transitionDuration: const Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        // return SlideTransition(
        //   position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero).animate(curveAnimation),
        //   child: child,
        // );

        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        //   child: child,
        // );

        // return RotationTransition(
        //   turns: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        //   child: child,
        // );

        // return FadeTransition(
        //   opacity:  Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        //   child: child,
        // );

        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
          child: FadeTransition(
            opacity:  Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
            child: child,
          ),
        );

      },

    );
  }

}