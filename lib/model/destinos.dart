class Destino{

  String id;
  String destino;
  String ida;
  String volta;  

  Destino(this.id, this.destino, this.ida, this.volta);

  //Converter documento em um objeto
  Destino.fromMap(Map<String, dynamic>map, String id){

    this.id = id ?? '';
    this.destino = map['destino'];
    this.ida = map['ida'];
    this.volta = map['volta'];
   
  }
}
