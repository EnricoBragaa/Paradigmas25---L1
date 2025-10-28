class Pokemon {
  #vida; // atributo privado

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
  }

  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}, mas foi um ataque genérico.`);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonus;
  }

  atacar(alvo) {
    console.log(`${this.nome} lançou uma bola de fogo!`);
    alvo.receberDano(10 + this.bonusAtaque);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, cura) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = cura;
  }

  atacar(alvo) {
    console.log(`${this.nome} atacou com jato d'água e se curou!`);
    alvo.receberDano(8);
  }
}

// Teste simples
let charmander = new PokemonFogo("Charmander", 50, 5);
let squirtle = new PokemonAgua("Squirtle", 60, 3);

charmander.atacar(squirtle);
console.log("Vida de Squirtle:", squirtle.getVida());
