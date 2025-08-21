class Raca {
  String? nome;
  String? descricao;
  String? imagem;

  Raca({this.nome, this.descricao, this.imagem});

  static Raca fromJson(Map<String, dynamic> json) {
    return Raca(
      nome: json['attributes']['name'],
      descricao: json['attributes']['description'],
    );
  }
}
