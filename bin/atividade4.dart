import 'package:atividade4/atividade4.dart' as atividade4;
import 'dart:io';

List<Produto> produtosList = [];

class Produto {
  late String nome;
  late double preco;
  late int quantidadeEmEstoque;
  String? descricao;

  Produto(this.nome, this.preco, this.quantidadeEmEstoque, {this.descricao});

  get getNome => nome;
  get getPreco => preco;
  get getQuantidadeEstoque => quantidadeEmEstoque;
  get getDescricao => descricao;

  set setNome(String name) {
    nome = name;
  }

  set setPreco(double newPreco) {
    preco = newPreco;
  }

  set setQuantidade(int newQuantidade) {
    quantidadeEmEstoque = newQuantidade;
  }

  set setDescricao(String newDescricao) {
    descricao = newDescricao;
  }

  late int venda;

  void vender(int quantidade) {
    if (quantidade > 0 && quantidade <= quantidadeEmEstoque) {
      quantidadeEmEstoque -= quantidade;
      print(
        "Venda bem-sucedida de $getNome. Estoque restante: $quantidadeEmEstoque",
      );
    } else {
      print(
        "Venda mal-sucedida de $getNome. Quantidade insuficiente em estoque.",
      );
    }
  }

  void reporEstoque(int quantidade) {
    if (quantidade > 0) {
      quantidadeEmEstoque += quantidade;
      print("Estoque reposto. Estoque atual: $quantidadeEmEstoque");
    } else {
      print("Não é possível repor quantidade negativa ou zero.");
    }
  }

  void reduzirestoque(int quantidade) {
    if (quantidadeEmEstoque > quantidade && quantidade > 0) {
      quantidadeEmEstoque -= quantidade;
    }
  }
}

String entradaString() {
  String? entrada;
  do {
    entrada = stdin.readLineSync();
  } while (entrada == null);
  return entrada;
}

Produto? acharProduto() {
  print("digite o nome do produto:");
  String nome = entradaString();

  if (produtosList.isNotEmpty) {
    for (var element in produtosList) {
      if (element.nome == nome) {
        return element;
      } else {
        print("Produto não encontrado");
      }
    }
    return null;
  } else {
    print("A lista esta vazia");
    return null;
  }
}

void litarProdutos() {
  print("Lista de produtos:");

  for (var produto in produtosList) {
    print(
      "Produto: ${produto.getNome}, Preço: ${produto.getPreco}, Quantidade disponível: ${produto.getQuantidadeEstoque} Descrição: ${produto.getDescricao}",
    );
    print("-" * 50);
  }
}

void main() {
  bool sair = false;

  void enter() {
    stdin.readLineSync();
  }

  while (!sair) {
    print("O que você deseja fazer?");
    print("-" * 60);
    print("1 - Comprar");
    print("2 - Repor Estoque");
    print("3 - Adicionar Produto");
    print("4 - Listar Produtos");
    print("5 - Sair");
    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case "1":
        Produto? produtoSelecionado = acharProduto();
        print("Digite a quantidade:");
        int quantidade = int.parse(entradaString());
        if (produtoSelecionado != null) {
          produtoSelecionado.reduzirestoque(quantidade);
        }

        break;
// teste
      case "2":
        print("Escolha um produto para repor estoque");
        break;

      case "3":
        print("Qual é o nome do produto?");
        String? nome = stdin.readLineSync();

        print("Qual é o preço do produto?");
        double preco = double.parse(stdin.readLineSync()!);

        print("Qual é a quantidade em estoque?");
        int quantidadeEmEstoque = int.parse(stdin.readLineSync()!);

        print("Deseja adicionar uma descrição? (opcional)");
        String? descricao = stdin.readLineSync();

        Produto novoProduto = Produto(
          nome!,
          preco,
          quantidadeEmEstoque,
          descricao: descricao,
        );
        produtosList.add(novoProduto);

        print("Produto '$nome' adicionado com sucesso!");
        break;

      case "4":
        litarProdutos();
        print("Pressione enter para sair");
        enter();

        break;

      case "5":
        sair = true;
        print("Saindo...");
        break;

      default:
        print("Opção inválida. Tente novamente.");
    }
  }
}

// ● Crie uma classe CarrinhoDeCompras que utilize a classe Produto.
// ● Implemente um sistema de persistência para salvar e carregar os dados dos
// produtos.
// ● Adicione tratamento de erros, como verificar se a quantidade vendida é um número
// positivo.

class CarrinhoDeCompras {}
