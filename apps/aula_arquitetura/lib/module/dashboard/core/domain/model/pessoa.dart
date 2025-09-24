class Pessoa {
  String nome;
  String sobrenome;
  String cpf;
  String? telefone;
  String? genero;
  String? dataNascimento;

  Pessoa({
    required this.nome,
    required this.sobrenome,
    required this.cpf,
    this.telefone,
    this.genero,
    this.dataNascimento,
  });
}
