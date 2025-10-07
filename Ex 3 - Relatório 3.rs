use std::io;

fn tabuada(n: i32, inf: i32, sup: i32) {
    let mut i = inf;
    while i <= sup {
        println!("{} x {} = {}", n, i, n * i);
        i += 1;
    }
}

fn main() {
    let mut entrada = String::new();

    println!("Digite o número da tabuada:");
    io::stdin().read_line(&mut entrada).unwrap();
    let n: i32 = entrada.trim().parse().unwrap();
    entrada.clear();

    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let inf: i32 = entrada.trim().parse().unwrap();
    entrada.clear();

    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let sup: i32 = entrada.trim().parse().unwrap();

    tabuada(n, inf, sup);
}
