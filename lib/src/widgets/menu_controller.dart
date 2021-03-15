import 'package:app4/src/pages/usuario_persona_page.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/pages/ventas_page.dart';
import 'package:app4/src/pages/productos_page.dart';
import 'package:app4/src/pages/principal_page.dart';
import 'package:app4/src/pages/marcas_page.dart';
import 'package:app4/src/pages/categoria_page.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: PrincipalPage(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: PrincipalPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Marcas', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MarcasPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Categoria', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: CategoriaPage(),
        ),
        KFDrawerItem.initWithPage(
          text:
              Text('UsuarioPersonaPage', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: UsuarioPersonaPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Productos', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: ProductosPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Ventas', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: VentasPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(147, 206, 222, 1),
              Color.fromRGBO(4, 96, 6, 23)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Salir',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        header: Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            //width: MediaQuery.of(context).size.width * 0.6,
            child: Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
