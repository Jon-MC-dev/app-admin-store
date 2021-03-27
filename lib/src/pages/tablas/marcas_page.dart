import 'package:app4/src/forms/marca_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:app4/src/controllers/marca_controller.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';
import 'package:app4/src/models/marca_model.dart';
import 'package:app4/src/pages/edicion_page.dart';

class MarcasPage extends KFDrawerContent {
  @override
  _MarcasPage createState() => _MarcasPage();
}

class _MarcasPage extends State<MarcasPage> {
  //MarcaDataSource marcasDataSource;
  MarcaController c;
  FormMarca formMarca;

  @override
  void initState() {
    formMarca = FormMarca();
    c = Get.put(MarcaController());
    print("marcaDataListo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    c.context = context;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              IconoMenu(widgetMenu: widget),
              TituloWidget(
                texto: "Marcas",
              ),
              Flexible(
                child: Container(
                  //color: Colors.lime[300],
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: c.getMarcas(),
                              builder: (BuildContext buildContext,
                                  AsyncSnapshot<List<Marca>> asyncSnapshot) {
                                if (asyncSnapshot.hasData) {
                                  c.marcaDataSource = MarcaDataSource();
                                  c.marcaDataSource
                                      .setlista(asyncSnapshot.data);
                                  return SfDataGrid(
                                    source: c.marcaDataSource,
                                    columnWidthMode: ColumnWidthMode.fill,
                                    onQueryRowStyle: (QueryRowStyleArgs args) {
                                      if (args.rowIndex % 2 != 0) {
                                        return DataGridCellStyle(
                                            backgroundColor: Colors.grey[100]);
                                      }
                                      return null;
                                    },
                                    cellBuilder: (contex, column, rowIndex) {
                                      int id =
                                          c.marcaDataSource.lista[rowIndex].id;
                                      String nombre = c.marcaDataSource
                                          .lista[rowIndex].nombre;
                                      return PopupMenuButton(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            child: FlatButton(
                                              child: Text("Editar"),
                                              textColor: Colors.white,
                                              color: Colors.yellow[600],
                                              onPressed: () {
                                                c.accion = c.guardarEdicion;
                                                c.marca.id = id;
                                                c.marcaController.text = nombre;
                                                print(
                                                    "El id para editar es: [$id]");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EdicionPagina(
                                                              editar: true,
                                                              pagina: 'Marca',
                                                              formulario:
                                                                  formMarca,
                                                            )));
                                              },
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: FlatButton(
                                              child: Text("Eliminar"),
                                              textColor: Colors.white,
                                              color: Colors.red[400],
                                              onPressed: () {
                                                print(
                                                    "Se eliminara el ID: ${c.marcaDataSource.lista[rowIndex].id}, Marca: ${c.marcaDataSource.lista[rowIndex].nombre}");
                                                c.marca.id = c.marcaDataSource
                                                    .lista[rowIndex].id;
                                                c.eliminarMarca();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },

                                    columns: [
                                      GridNumericColumn(
                                        mappingName: 'id',
                                        headerText: 'ID',
                                        textAlignment: Alignment.center,
                                        headerTextAlignment: Alignment.center,
                                      ),
                                      GridTextColumn(
                                        mappingName: 'nombre',
                                        headerText: 'Nombre',
                                        textAlignment: Alignment.center,
                                        headerTextAlignment: Alignment.center,
                                      ),
                                      GridWidgetColumn(
                                          mappingName: '',
                                          headerText: 'Acciones')
                                    ],
                                    //source: null,
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            c.accion = c.agregarMarca;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EdicionPagina(
                        editar: false,
                        pagina: 'Marca',
                        formulario: formMarca,
                      )),
            );
          },
          child: Icon(Icons.add_circle),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
