class Pessoa {
  String nome;
  int idade;
  double altura;
  double peso;
  String? avatar;

  Pessoa(this.nome, this.idade, this.altura, this.peso, [this.avatar]);

  double imc() {
    return peso / (altura * altura);
  }

  String diagnostico() {
    if (imc() < 18.5) {
      return 'Abaixo do peso';
    } else if (imc() < 24.9) {
      return 'Peso normal';
    } else if (imc() < 29.9) {
      return 'Sobrepeso';
    } else if (imc() < 34.9) {
      return 'Obesidade grau 1';
    } else if (imc() < 39.9) {
      return 'Obesidade grau 2';
    } else {
      return 'Obesidade grau 3';
    }
  }
}
