/*
clase modelo de los objetos del XML. 
se crea los atributos que tendra el documento a persear
y se asigna los datos a los atributos a traves de un  Map
donde se le setean al contructor para crear objetos.

*/
class FacturaElectronica {

  //atributos
  String _clave =  "" ;
  int _codigoActividad  = 0;
  String _numeroConsecutivo   =  "" ;
  String _fecha  =  "" ;
  String _emisor ="";
  String _receptor = "";

  //contructor
  FacturaElectronica(this._clave , this._codigoActividad ,
  this._numeroConsecutivo ,this._fecha, this._emisor ,this._receptor);


  // contructor propio para mapear los atributos
  FacturaElectronica.fromParseXml(Map<String,dynamic> xml){
    if(xml == null ) return ;
    else FacturaElectronica(xml["Clave"], xml["CodigoActividad"],
                           xml["NumeroConsecutivo"],  xml["FechaEmision"],  xml["Emisor"],
                             xml["Receptor"]) ;

  }


  // get de los atributos
  get clave => this._clave;
  get codigoActividad  => this._codigoActividad;
  get numeroconsecutivo  => this._numeroConsecutivo;
  get fecha => this._fecha;
  get emisor => this._emisor;
  get receptor => this._receptor;

}