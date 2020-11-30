class Usuario{

  String id;
  String nome;
  String cpf;
  String email;
  String telefone;
  String senha;

  Usuario(this.id, this.nome, this.cpf, this.email, this.telefone, this.senha);

  //Converter documento em um objeto
  Usuario.fromMap(Map<String, dynamic>map, String id){

    this.id = id ?? '';
    this.nome = map['nome'];
    this.cpf = map['cpf'];
    this.email = map['email'];
    this.telefone = map['telefone'];
    this.senha = map['senha'];
  }

  get user => this.nome;
  get password => this.senha;
}