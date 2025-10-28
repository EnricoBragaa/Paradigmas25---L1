class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(qtd) {
    this.#gasRestante -= qtd;
    if (this.#gasRestante < 0) this.#gasRestante = 0;
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado {
  constructor(nome, modeloGear) {
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.gear.usarGas(10);
    return `${this.nome} está explorando. Gas restante: ${this.gear.getGas()}`;
  }

  verificarEquipamento() {
    return `${this.nome} usa o gear ${this.gear.modelo}`;
  }
}

class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
  }

  relatarStatus() {
    return this.membros.map(s => s.verificarEquipamento());
  }

  explorarTerritorio() {
    return this.membros.map(s => s.explorarTerritorio());
  }
}

// Teste simples
let s1 = new Soldado("Mikasa", "ODM-X");
let s2 = new Soldado("Levi", "ODM-Z");
let esquadrao = new Esquadrao("Levi", [s1, s2]);
console.log(esquadrao.explorarTerritorio());
