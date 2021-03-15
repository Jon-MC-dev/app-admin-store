import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';

class PrincipalPage extends KFDrawerContent {
  @override
  _PrincipalPage createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalPage> {
  List<List<dynamic>> _lista = [
    [
      'Adquisiciones',
      'Colores',
      'Categorias',
      'Marcas',
      'Personas',
      'Productos',
      'Usuarios',
      'Ventas'
    ],
    [
      Colors.blue,
      Colors.green,
      Colors.cyan,
      Colors.teal,
      Colors.red,
      Colors.purple,
      Colors.orange,
      Colors.lime
    ],
    [
      Icons.shopping_bag,
      Icons.color_lens,
      Icons.payments,
      Icons.mark_email_read_rounded,
      Icons.people,
      Icons.check_box_outline_blank_rounded,
      Icons.person_pin_outlined,
      Icons.shopping_cart_rounded,
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            IconoMenu(widgetMenu: widget),
            TituloWidget(
              texto: "Principal",
            ),
            Flexible(
              child: Container(
                //color: Colors.blueGrey,
                child: GridView.builder(
                    padding: EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 30),
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.15,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: _lista[0].length,
                    itemBuilder: (BuildContext ctx, index) {
                      return targeta('${_lista[0][index]}', _lista[1][index],
                          _lista[2][index]);
                    }),
              ),
            ),
            Flexible(
                child: Container(
              padding:
                  EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 30),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset('lib/src/assets/img/tiendaa.jpg',
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Administración de tienda",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              /*
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.teal)
                               */
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget targeta(String texto, Color color, IconData icono) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
      //borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(13.0),
            bottomLeft: const Radius.circular(13.0),
            topRight: const Radius.circular(13.0),
            bottomRight: const Radius.circular(13.0),
          ),
        ),
        child: InkWell(
          onTap: () {
            print("Hola " + texto);
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(texto),
                  Icon(icono),
                ]),
          ),
        ),
      ),
    );
  }
}
