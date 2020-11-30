class Transporte{

  String id;
  String empresa;
  String tipo;
  String trecho;
  String data;
  String hora;
  String preco;

  Transporte(this.id, this.empresa, this.tipo, this.trecho, this.data, this.hora, this.preco);

  Transporte.fromMap(Map<String, dynamic>map, String id){
    this.id = id ?? '';
    this.empresa = map['empresa'];
    this.tipo = map['tipo'];
    this.trecho = map['trecho'];
    this.data = map['data'];
    this.hora = map['hora'];
    this.preco = map['preco'];
  }

}