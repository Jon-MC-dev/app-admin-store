import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablaDetalles extends StatelessWidget {
  RxList<Detalle> detalles = <Detalle>[].obs;
  DetalleDataSource detalleDataSource;
  void Function({bool modoEdicion, int index}) openEdit;
  TablaDetalles({this.detalles, this.detalleDataSource, this.openEdit}) {
    detalleDataSource.setListaDetalles(detalles);
  }
  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: detalleDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      cellBuilder: (contex, column, rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[300],
                ),
                onPressed: () {
                  detalles.removeAt(rowIndex);
                }),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.yellow[300],
                ),
                onPressed: () {
                  this.openEdit(index: rowIndex, modoEdicion: true);
                })
          ],
        );
      },
      columns: <GridColumn>[
        GridTextColumn(
          mappingName: 'caracteristica',
          headerText: 'Caracteristica',
        ),
        GridTextColumn(
          mappingName: 'descripcion',
          headerText: 'Descripcion',
        ),
        GridWidgetColumn(
          mappingName: 'botones',
          headerText: 'Acciones',
        )
      ],
    );
  }
}

class Detalle {
  Detalle(this.caracteristica, this.descripcion);
  String caracteristica;
  String descripcion;
  Widget botones;
}

class DetalleDataSource extends DataGridSource<Detalle> {
  List<Detalle> _listaDetalles = [];

  List<Detalle> get dataSource => _listaDetalles;

  setListaDetalles(List<Detalle> lista) {
    this._listaDetalles.clear();
    this._listaDetalles.addAll(lista);
  }

  @override
  Object getValue(Detalle detalle, String nombreColumna) {
    switch (nombreColumna) {
      case 'caracteristica':
        return detalle.caracteristica;
        break;
      case 'descripcion':
        return detalle.descripcion;
        break;
      case 'botones':
        return detalle.botones;
        break;
    }
  }
}
