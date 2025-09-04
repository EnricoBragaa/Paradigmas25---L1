use std::io;

fn eh_par(x: i32) -> bool {
    x % 2 == 0
}

fn main() {
    let mut entrada = String::new();

    println!("Jogador 1, escolha (par ou ímpar):");
    io::stdin().read_line(&mut entrada).unwrap();
    let escolha = entrada.trim().to_string();
    entrada.clear();

    println!("Jogador 1, digite um número:");
    io::stdin().read_line(&mut entrada).unwrap();
    let n1: i32 = entrada.trim().parse().unwrap();
    entrada.clear();

    println!("Jogador 2, digite um número:");
    io::stdin().read_line(&mut entrada).unwrap();
    let n2: i32 = entrada.trim().parse().unwrap();

    let soma = n1 + n2;
    println!("A soma foi {}", soma);

    if (eh_par(soma) && escolha == "par") || (!eh_par(soma) && escolha == "ímpar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
