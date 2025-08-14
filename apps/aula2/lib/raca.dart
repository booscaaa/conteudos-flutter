class Raca {
  String? nome;
  String? descricao;

  Raca({this.nome, this.descricao});

  static Raca fromJson(Map<String, dynamic> json) {
    return Raca(
      nome: json['attributes']['name'],
      descricao: json['attributes']['description'],
    );
  }
}
