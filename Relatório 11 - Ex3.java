import java.util.ArrayList;

class Divisao {
    String nome;

    Divisao(String nome) {
        this.nome = nome;
    }

    void mostrarInfo() {
        System.out.println("Divisão: " + nome);
    }
}

class Castelo {
    String nome;
    ArrayList<Divisao> divisoes = new ArrayList<>();

    Castelo(String nome) {
        this.nome = nome;
    }

    void adicionarDivisao(Divisao d) {
        divisoes.add(d);
    }

    void mostrarInfo() {
        System.out.println("Castelo: " + nome);
        for (Divisao d : divisoes) {
            d.mostrarInfo();
        }
    }
}

 class Ex3 {
    public static void main(String[] args) {
        Castelo castelo = new Castelo("Castelo Negro");
        castelo.adicionarDivisao(new Divisao("Torre"));
        castelo.adicionarDivisao(new Divisao("Pátio"));
        castelo.adicionarDivisao(new Divisao("Sala do Trono"));

        castelo.mostrarInfo();
    }
}

