class Hospedagem{

  String id;
  String hotel;
  String end;
  String tel;
  String checkin;
  String checkout;
  String preco;

  Hospedagem(this.id, this.hotel, this.end, this.tel, this.checkin, this.checkout, this.preco);

  Hospedagem.fromMap(Map<String, dynamic>map, String id){
    this.id = id ?? '';
    this.hotel = map['hotel'];
    this.end = map['end'];
    this.tel = map['tel'];
    this.checkin = map['checkin'];
    this.checkout = map['checkout'];
    this.preco = map['preco'];
  }

}