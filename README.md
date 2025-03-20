<h1>APP-BOLSISTA</h1>

<h3>Um aplicativo mobile feito em flutter para gerenciar bolsistas pelo método HTTP</h3>

## 🛠️ Tecnologias Utilizadas

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

## 🧍‍♂️ Models
- Representa um bolsista com atributos como ID, nome, datanascimento, curso e comrpovanteUrl.
- Inclui métodos para a conversão de/para JSON.

## 💡 Stores
- 🔔 cadastro_store: Gerencia o estado do processo de cadastro, armazenando os dados do formulário de cadastro e se comunica com a API para criar um novo bolsista.
  <br></br>
- 🔔 atualizar_store: Carrega os dados do bolsista escolhido a partir do ID e os guarda em variaveis locais para serem comparadas se teve alguma atualização da parte do usuário.
  <br></br>
- 🔔 delete_store: Espera um ID para chamar a API e excluir o comprovante e o registro do bolsista.
  <br></br>
- 🔔 listar_store: Gerencia a listagem de bolsistas, obtendo os dados de todos os bolsista no banco por meio da API e os armazenando em uma ObservableList para exibição futura.
  <br></br>
- 🔔 timer_store: Guarda funções para iniciar, pausar e formatar o tempo para ser chamado na página.
### 📄 Pages
  - 📜 cadastro_page: Onde é estruturado uma função para selecionar um arquivo e todos os campos do Form que são validados por meio de uma key.
  - 📜 atualizar_page: Com base no ID passado pela listar_page ele puxa os dados do bolsista e os armazena como valor inicial em cada TextFormField para serem atualizados.
  - 📜 timer_page: Com base no ID passado pela listar_page ele mostra uma mensagem com o nome e também um timer e abaixo dele botão de start que quando o timer esta rodando ele muda para pause. E tambem abaixo disso aparece a quantidade de vezes que o timer foi startado e pausado.
  - 📜 listar_page: Declaramos as stores de listar, atualizar, deletar e o themeApp. Iniciamos todos os bolsistas pelo método initState e eles sao mostrados dessa forma:
  - 📜 Iniciamos um **ListView.builder** que, de acordo com a quantidade de bolsistas, cria um **Card** com um **ExpansionTile** para cada bolsista.
    - Dentro de **Card**, existem **título** e **subtítulo**:  
    -  **Título**: Mostra o nome do bolsista.  
    -  **Subtítulo**: Mostra o ID do bolsista. 
- Dentro de **ExpansionTile**, existem **4 opções**:  
  - 📝 **Ícone de Editar**: Leva o usuário para a tela de atualização.  
  - ⏳ **Ícone de Timer**: Leva o usuário para a tela de Timer.  
  - 🗑️ **Ícone de Deletar**: Remove o registro e o comprovante do bolsista da lista.  
  - 📄 **Ícone de PDF**: Só aparece quando o Card é expandido, e ele leva para a tela de mostrar arquivo.
  - E quando é expandido ele mostra os dados de nascimento e curso que o bolsista está matriculado.

  ## 🃏 Utils
  - 📁 file_picker_util: Onde fica a função para selecionar um arquivo.
  - ⏲️ temporary_cirectory: Onde fica a função para limpar o cache temporário.
  - 🔴 theme_app: Onde é armazenado todas as cores que são utilizadas no app.

  ## 📁 BackEnd
  - 💽 server.js: Importamos todas as rotas de routes importamos o express e definimos a sintaxe das rotas e iniciamos o servidor na porta que está definida no mesmo.
    <p>📁Data:</p>
    - 💽 db.js: Define os dados para logar no banco e tenta se conectar com o mesmo.
    <p>📁Middleware:</p>
    - 💽 uploads.js: Contém o multer, que é responsavel por gerenciar a pasta uploads, onde é guardado o comprovante de cada bolsista.
    <p>📁routes:</p>
  - 💽 route_create: Define a rota POST, onde é responsável por levar os dados de um bolsista com o comproante para dentro do banco de dados.
  - 💽 route_delete: Define a rota DELETE, onde é responsável por procurar o comprovante do bolsista exlcui-lo e depois excluir o bolsista em si.
  - 💽 route_read: Defina as rotas GET(/) onde pega todos os bolsistas, GET(/:id) onde pega um bolsista pelo ID e GET(/:id/comprovante) onde pega o comprovante de um bolsista pelo ID.

    ## 📁 Estrutura do Projeto
    
  ### 📂 Arquivos Do Sistema
  ```

  📦 APP-BOLSISTA
  ├── 📜 BackEnd/
   ├── 📜 package.json
   ├── 📜 server.js
   └── 📂 src/
       ├── 📂 data/
            └──📜db.js
       ├── 📂 middleware/
           └── 📜uploads.js
       ├── 📂 routes/
            ├──📜route_create.js
            ├──📜route_delete.js
            ├──📜route_read.js
            └── 📜route_update.js
    └──📂 uploads/

  └── 📂 ola_mundo/
    ├── 📂 lib/
      ├── 📂 Services/
       │   └── 📜 api_service.dart
       ├── 📂 Stores/
       │   ├── 📜 atualizar_store.dart
       │   ├── 📜 delete_store.dart
       │   ├── 📜 listar_store.dart
       │   └── 📜 cadastro_store.dart
       ├── 📂 models/
       │   └── 📜 bolsista_model.dart
       ├── 📂 utils/
       │   ├── 📜 theme_app.dart
       │   └── 📜 file_picker_util.dart
       └── 📂 views/
           ├── 📜 listar_pag.dart
           ├── 📜 cadastro_page.dart
           ├──📜 atualizar_page.dart
           └──📜 timer_page.dart
  ```
  ## ⚠️ Validações e Tratamento de Erros
    - Verificação de status de resposta da API.
    - Tratamento de erros de conexão.
    - Validação de dados de entrada.
    - Verificação de existencia de pasta.

  ## 🚀 Como Compilar
  ```bash
  cd BackEnd
  npm install
  npm start
  ```
  ```bash
  cd ola_mundo
  flutter pub get
  flutter run
  ```
## 🎮 Como Usar
-  1.🏃‍♂️Execute o BackEnd.
-  2.🏃‍♂️Execute o ola_mundo.
-  3.📋Navegue pela lista de bolsista.
-  4.➕ Adicione, edite ou exclua bolsistas.
  
    
