DnD Hand Book
O Dnd Hand Book é um aplicativo que utiliza a Api do D&D 5th edição para trazer algumas facilidades e funcionalidades úteis para os jogadores.

Plataformas:
* [Github] {https://github.com/L-Mosca/DnD_Handbook}
* [Firebase] {https://console.firebase.google.com/u/1/project/dnd-5th/overview?hl=pt-br}

Como rodar o projeto:
* Clone o projeto a partir do git, branchs:
    * master (conteúdo distribuido para as plataformas de produção)
    * dev (conteúdo mais atualizado)
* Após abrir o projeto, utilizar 'flutter pub get' para baixar todas as dependências
* Para executar o app na flavor de homologação use o comando 'flutter run --flavor dev -t lib/main.dart'
* Para executar o app na flavor de produção use o comando 'flutter run --flavor prod -t lib/main.dart'

Tecnologias:
* Clean Architecture
* Repository por escopo
* [Dart] {https://dart.dev/guides}
* [GetX] {https://pub.dev/packages/get}
* [flutter_bloc] {https://pub.dev/packages/flutter_bloc}

Build Environment

Prod
Ambiente de produção para ser usado em release na loja. Evite fazer testes nesse amviente

Dev
Ambiente de desenvolvimento usado para releases internos. Faça testes aqui

Liberação de builds

Produção
A liberação para produção deve ser feita através da Play Store - Apple Store

Instrução para liberação

Android
* Primeiro lembre-se de mudar a constante que define a flavor do projeto (Hml ou Prod)
* Mude o nome e o código da versão nos arquivos pubspec.yaml
* Rode o comando 'flutter build apk -t lib/main.dart --flavor=$flavorName --release'
* $flavorName pode ser 'dev' para homologação ou 'prod' para produção

IOS
