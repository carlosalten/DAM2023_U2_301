class Mascota {
  int _id;
  String _nombre;
  String _especie;
  String _raza;
  String _sexo;

  Mascota(dynamic data)
      : _id = int.parse(data['id'].toString()),
        _nombre = data['nombre'],
        _especie = data['especie'],
        _raza = data['raza'],
        _sexo = data['sexo'];

  //get
  //tipo_dat get nombre => atributo_que_retorna

  //set
  //set nombre(tipo valor) => atributo = valor

  int get id => this._id;
  set id(int id) => this._id = id;

  String get nombre => this._nombre;
  set nombre(String nombre) => this._nombre = nombre;

  String get especie => this._especie;
  set especie(String especie) => this._especie = especie;

  String get raza => this._raza;
  set raza(String raza) => this._raza = raza;

  String get sexo => this._sexo;
  set sexo(String sexo) => this._sexo = sexo;
}
