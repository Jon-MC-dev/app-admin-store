import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:app4/src/pages/edicion_page.dart';

class BaseTabla extends StatelessWidget {
  AbstractController controller; // Controller
  Widget form; // FormMarca
  String nombreTabla;
  Function celdasSyle;
  ColumnWidthMode modoColumna;
  List<Map<String, dynamic>> namesColumns;
  var widgetMenuKFDrawer;
  BaseTabla(
      {this.controller,
      this.form,
      this.nombreTabla,
      this.namesColumns,
      this.widgetMenuKFDrawer,
      this.celdasSyle,
      this.modoColumna = ColumnWidthMode.fill});

  @override
  Widget build(BuildContext context) {
    this.controller.context = context;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              IconoMenu(widgetMenu: this.widgetMenuKFDrawer),
              TituloWidget(
                texto: this.nombreTabla,
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
                              future: this.controller.getData(),
                              builder: (BuildContext buildContext,
                                  AsyncSnapshot<dynamic> asyncSnapshot) {
                                if (asyncSnapshot.hasData) {
                                  this
                                      .controller
                                      .modelDataSource
                                      .setlista(asyncSnapshot.data);
                                  return SfDataGrid(
                                    columnSizer: ColumnSizer(),
                                    columnWidthMode: modoColumna,
                                    source: this.controller.modelDataSource,
                                    onQueryCellStyle:
                                        (QueryCellStyleArgs args) {
                                      if (celdasSyle != null) {
                                        return celdasSyle(args);
                                      }
                                      return null;
                                    },
                                    onQueryRowStyle: (QueryRowStyleArgs args) {
                                      if (args.rowIndex % 2 != 0) {
                                        return DataGridCellStyle(
                                            backgroundColor: Colors.grey[100]);
                                      }
                                      return null;
                                    },
                                    cellBuilder: (contex, column, rowIndex) {
                                      int id = this
                                          .controller
                                          .modelDataSource
                                          .lista[rowIndex]
                                          .id;
                                      return PopupMenuButton(
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            child: FlatButton(
                                              child: Text("Editar"),
                                              textColor: Colors.white,
                                              color: Colors.yellow[600],
                                              onPressed: () {
                                                this.controller.accion =
                                                    this.controller.saveChanges;
                                                this.controller.objModel.id =
                                                    id;
                                                // this.controller.text = nombre;
                                                print(
                                                    "El id para editar es: [$id]");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EdicionPagina(
                                                              editar: true,
                                                              pagina:
                                                                  '${this.nombreTabla}',
                                                              formulario:
                                                                  this.form,
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
                                                    "Se eliminara el ID: ${this.controller.modelDataSource.lista[rowIndex].id}, ${this.nombreTabla}: ");
                                                this.controller.objModel.id =
                                                    this
                                                        .controller
                                                        .modelDataSource
                                                        .lista[rowIndex]
                                                        .id;
                                                this.controller.deteleData();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },

                                    columns: [
                                      ..._createColumns(),
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
            this.controller.accion = this.controller.addData;
            print("this.controller.addData: ");
            print(this.controller.addData);
            print(
                "this.controller.accion: ---------------------------------------");
            print(this.controller.accion);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EdicionPagina(
                        editar: false,
                        pagina: this.nombreTabla,
                        formulario: this.form,
                      )),
            );
          },
          child: Icon(Icons.add_circle),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  List<GridColumn> _createColumns() {
    List<GridColumn> listaColumns = new List<GridColumn>();
    for (var colum in this.namesColumns) {
      GridColumn columna;
      if (colum['tipo'] == 'texto') {
        columna = GridTextColumn(
          mappingName: colum['mappingName'],
          headerText: colum['label'],
          textAlignment: Alignment.center,
          headerTextAlignment: Alignment.center,
        );
      } else if (colum['tipo'] == 'numerico') {
        columna = GridNumericColumn(
          mappingName: colum['mappingName'],
          headerText: colum['label'],
          textAlignment: Alignment.center,
          headerTextAlignment: Alignment.center,
        );
      }

      listaColumns.add(columna);
    }
    return listaColumns;
  }
}
