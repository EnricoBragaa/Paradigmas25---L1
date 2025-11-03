class Personagem {
    String nome;
    int idade;
    int vida;

    void mostrarInfo() {
        System.out.println("Nome: " + nome + ", Idade: " + idade + ", Vida: " + vida);
    }
}

class Cavaleiro extends Personagem {
    void atacar() {
        System.out.println(nome + " atacou com a espada!");
    }
}

class Mago extends Personagem {
    void lançarMagia() {
        System.out.println(nome + " lançou uma magia!");
    }
}
class Ex1 {
    public static void main(String[] args) {
        Cavaleiro c = new Cavaleiro();
        c.nome = "Arthur";
        c.idade = 25;
        c.vida = 100;
        c.mostrarInfo();
        c.atacar();

        Mago m = new Mago();
        m.nome = "Merlin";
        m.idade = 60;
        m.vida = 80;
        m.mostrarInfo();
        m.lançarMagia();
    }
}
