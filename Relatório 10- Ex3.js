class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave === this.#autorSecreto && this.enigmas.has(num)) {
      return this.enigmas.get(num);
    } else {
      return "Acesso negado!";
    }
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade);
    this.diario = diario;
  }
}

class CabanaMisterio {
  constructor(diario) {
    this.diario = diario;
    this.funcionarios = [];
  }

  listarFuncionarios() {
    return this.funcionarios.map(f => f.nome);
  }
}

// Teste simples
let d1 = new Diario("Dipper");
d1.adicionarEnigma(1, "Cuidado com Bill Cipher!");
console.log(d1.decodificar("Dipper", 1)); // Mostra o enigma
