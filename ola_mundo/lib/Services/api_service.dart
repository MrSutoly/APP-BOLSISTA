import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../models/bolsista_model.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3000';
  
  Future<List<Bolsista>> getBolsistas() async {
    final response = await http.get(Uri.parse('$baseUrl/bolsistas'), 
      headers: {"Accept": "application/json"}
    ).timeout(Duration(seconds: 10)); 
    
    if (response.statusCode == 200) {
      print("Resposta recebida: ${response.body}"); 
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Bolsista.fromJson(json)).toList();
    }
    throw Exception('Erro ao carregar bolsistas. Status code: ${response.statusCode}');
  }

  Future<bool> createBolsista(Bolsista bolsista) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bolsista'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(bolsista.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erro ao criar bolsista');
    }
  }

  Future<Bolsista> pegarPorId(int id) async{
    try{   
    final response = await http.get(Uri.parse('$baseUrl/bolsistas/$id'));
    if(response.statusCode == 200){
      return Bolsista.fromJson(jsonDecode(response.body));
    }else if(response.statusCode == 404){
      throw Exception('Bolsista não encontrado');

    }else{
      throw Exception('Erro ao carregar bolsista: ${response.statusCode}');
    }
    }catch(e){
      throw Exception('Erro ao carregar bolsista: $e');
    }
  }

  Future<String> pegarComprovantePorId(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/bolsistas/$id/comprovante'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['comprovanteUrl'];
    } else {
      throw Exception('Erro ao carregar comprovante');
    }
  }


  Future<bool> updateBolsista(Bolsista bolsista, {File? comprovanteFile}) async {
  try {
    if (comprovanteFile != null) {
      
      
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('$baseUrl/atualizar/${bolsista.id}')
      );

      String dataFormatada = bolsista.dataNascimento.toIso8601String().split('T')[0];
      print("Data formatada: $dataFormatada");
      
      request.fields['nome_completo'] = bolsista.nome;
      request.fields['data_nascimento'] = dataFormatada;
      request.fields['curso'] = bolsista.curso;
      
      request.files.add(await http.MultipartFile.fromPath(
        'file', comprovanteFile.path
      ));
      
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      
      if (response.statusCode == 200) {
        return true;
      } else {
        print("Erro na resposta: $responseBody");
        throw Exception('Erro ao atualizar bolsista: ${response.statusCode}');
      }
    } else {
      final response = await http.put(
        Uri.parse('$baseUrl/atualizar/${bolsista.id}'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'nome_completo': bolsista.nome,
          'data_nascimento': bolsista.dataNascimento.toIso8601String(),
          'curso': bolsista.curso,
        }),
      );
      
      if (response.statusCode == 200) {
        return true;
      } else {
        print("Erro na resposta: ${response.body}");
        throw Exception('Erro ao atualizar bolsista: ${response.statusCode}');
      }
    }
  } catch (e) {
    print("Erro ao enviar requisição: $e");
    rethrow;
  }
}

  Future<bool> deleteBolsista(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/deletar/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Erro ao deletar bolsista');
    }
  }
}