
class FacturaElectronica {

  String _clave =  "" ;
  int _codigoActividad  = 0;
  String _numeroConsecutivo   =  "" ;
  String _fecha  =  "" ;
  String _nombre ="";

  //emisor
  FacturaElectronica(this._clave , this._codigoActividad ,
  this._numeroConsecutivo ,this._fecha, this._nombre);

  FacturaElectronica.fromParseXml(Map<String,dynamic> xml){
    if(xml == null ) return ;
    else FacturaElectronica(xml["Clave"], xml["CodigoActividad"],
                           xml["NumeroConsecutivo"],  xml["FechaEmision"],  xml["Nombre"] ) ;

  }

  get clave => this._clave;
  get codigoActividad  => this._codigoActividad;
  get numeroconsecutivo  => this._numeroConsecutivo;
  get fecha => this._fecha;
  get nombre => this._nombre;

}