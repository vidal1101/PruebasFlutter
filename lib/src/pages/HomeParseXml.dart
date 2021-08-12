import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:beta_app/src/models/facturaElectronica.dart';

class HomeParseXml extends StatefulWidget {
  @override
  _HomeParseXmlState createState() => _HomeParseXmlState();
}

class _HomeParseXmlState extends State<HomeParseXml> {
  Future<List<FacturaElectronica>> getFacturaFromXML(
      BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context).loadString(
        "assets/data/ATV_eFAC_50614062100011662004700100002010000000002161165308.xml");
        //print(xmlString.toString());
    var raw = xml.parse(xmlString);
    var elements = raw.findAllElements("FacturaElectronica");
    print(elements.toString());

    return elements.map((element) {
      return FacturaElectronica(
          element.findElements("Clave").first.text,
          int.parse(
            element.findElements("CodigoActividad").first.text,
          ),
          element.findElements("NumeroConsecutivo").first.text,
          element.findElements("FechaEmision").first.text , 
          element.findElements("Emisor").first.text.toString());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parse XML'),
      ),
      body: Container(
        child: FutureBuilder(
            future: getFacturaFromXML(context),
            builder: (context, AsyncSnapshot<List<FacturaElectronica>> data) {
              if (data.hasData) {
                List<FacturaElectronica> factura = data.requireData;

                return ListView.builder(
                    itemCount: factura.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( "codigo Actividad: "+factura[index].codigoActividad.toString()),
                          Text("Clave: "+factura[index].clave.toString()),
                          Text("Fecha: "+factura[index].fecha.toString()),
                          Text("Nombre: "+factura[index].nombre.toString()),
                        
                        ],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
