import 'dart:io';
import 'dart:math';

class Expressao {
  String dado;
  List ordem = [];
  num resultado = 0.0;
  static Map<String, Function> regras = {
    '^': (int index, List formula) {
      num result = 0;
      result = pow(
          double.parse(formula[index - 1]), double.parse(formula[index + 1]));
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '*': (int index, List formula) {
      double result = 0;
      result =
          double.parse(formula[index - 1]) * double.parse(formula[index + 1]);
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '/': (int index, List formula) {
      double result = 0;
      result =
          double.parse(formula[index - 1]) / double.parse(formula[index + 1]);
      formula.removeAt(index + 1);
      formula.removeAt(index);
      formula[index - 1] = result.toString();
    },
    '+': (int index, List formula) {
      double result = 0;
      if (index == 0) {
        result = double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula[index] = result.toString();
      } else {
        result =
            double.parse(formula[index - 1]) + double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula.removeAt(index);
        formula[index - 1] = result.toString();
      }
    },
    '-': (int index, List formula) {
      double result = 0;
      if (index == 0) {
        result = (-1) * double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula[index] = result.toString();
      } else {
        result =
            double.parse(formula[index - 1]) - double.parse(formula[index + 1]);
        formula.removeAt(index + 1);
        formula.removeAt(index);
        formula[index - 1] = result.toString();
      }
    },
  };

  static List stringToList({
    required String valor,
  }) {
    List resultado = [];
    bool unirNum = false;
    bool unirLetras = false;
    Set num = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'};
    Set letras = {'s', 'e', 'n', 'c', 'o', 't', 'g'};
    for (int i = 0; i < valor.length; i++) {
      if (valor[i] == ' ') {
      } else if (num.contains(valor[i])) {
        if (unirNum) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirNum = true;
      } else if (letras.contains(valor[i])) {
        if (unirLetras) {
          if (resultado.length == 0) resultado.add('');
          resultado.last += valor[i];
        } else {
          resultado.add(valor[i]);
        }
        unirLetras = true;
      } else {
        resultado.add(valor[i]);
        unirNum = false;
        unirLetras = false;
      }
    }
    return resultado;
  }

  Expressao({required this.dado}) {
    this.ordem = stringToList(valor: this.dado);
  }

  calcularFormula({required List formula}) {
    for (String op in regras.keys) {
      int i = 0;
      int tamanho = formula.length;
      while (true) {
        if (i >= tamanho) break;
        if (formula[i] == op) {
          regras[op]!(i, formula);
          i = 0;
          tamanho = formula.length;
          print(
              '= ${formula.reduce((value, element) => value += ' ' + element)}');
        }
        i++;
      }
    }
    return formula[0];
  }

  void calcular() {
    var result = calcularFormula(formula: ordem);
  }
}

void main(List<String> args) {
  String entrada = '';
  do {
    entrada = stdin.readLineSync().toString();
    if (entrada == '') break;
    Expressao expressao = Expressao(dado: entrada);
    expressao.calcular();
  } while (true);
}
