class Mascota {
  int _id;
  String _nombre;
  String _especie;
  String _raza;
  String _sexo;

  Mascota({id = 0, nombre = '', especie = '', raza = '', sexo = ''})
      : _id = id,
        _nombre = nombre,
        _especie = especie,
        _raza = raza,
        _sexo = sexo;

  Mascota.fromSnapshot(dynamic snapshot)
      : _id = int.parse(snapshot['id'].toString()),
        _nombre = snapshot['nombre'],
        _especie = snapshot['especie'],
        _raza = snapshot['raza'],
        _sexo = snapshot['sexo'];

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
