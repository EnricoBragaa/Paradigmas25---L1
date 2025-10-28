class Hunter {
  constructor(nome, local, idade) {
    this.nome = nome;
    this.localizacao = local;
    this.idade = idade;
  }
}

class Especialista extends Hunter {
  constructor(nome, habilidade) {
    super(nome);
    this.habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} usou ${this.habilidadeNen} em ${lat}, ${long}`;
  }
}

class Manipulador extends Hunter {
  constructor(nome, alvo) {
    super(nome);
    this.alvoAtual = alvo;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} está manipulando ${this.alvoAtual.nome} em ${lat}, ${long}`;
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set();
  }

  adicionarHunter(hunter) {
    this.hunters.add(hunter);
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(lat, long) {
    let resultados = [];
    this.hunters.forEach(h => {
      resultados.push(h.rastrearLocal(lat, long));
    });
    return resultados;
  }
}

// Teste simples
let h1 = new Especialista("Kurapika", "Correntes");
let h2 = new Manipulador("Illumi", h1);
let b = new Batalhao();
b.adicionarHunter(h1);
b.adicionarHunter(h2);

console.log(b.iniciarRastreamento("10.0", "20.0"));
