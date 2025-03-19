class Bolsista {
  final int? id;
  final String nome;
  final DateTime dataNascimento;
  final String curso;
  final String comprovanteUrl;

  const Bolsista({
    this.id,
    required this.nome,
    required this.dataNascimento,
    required this.curso,
    required this.comprovanteUrl,
  });

  factory Bolsista.fromJson(Map<String, dynamic> json) {
    return Bolsista(
      id: json['id'],
      nome: json['nome_completo'],
      dataNascimento: DateTime.parse(json['data_nascimento']),
      curso: json['curso'],
      comprovanteUrl: json['comprovante']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome_completo': nome,
      'data_nascimento': dataNascimento.toIso8601String(),
      'curso': curso,
      'comprovante': comprovanteUrl.isEmpty ? null : comprovanteUrl,
    };
  }
}



