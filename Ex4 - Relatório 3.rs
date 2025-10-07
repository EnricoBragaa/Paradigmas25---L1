use std::io;

fn calcular_media(n1: f64, n2: f64, n3: f64) -> f64 {
    (n1 * 2.0 + n2 * 3.0 + n3 * 5.0) / 10.0
}

// função simples pra ler número (aceita 7.5 ou 7,5)
fn ler_f64() -> f64 {
    let mut s = String::new();
    io::stdin().read_line(&mut s).unwrap();
    let s = s.trim().replace(',', ".");
    s.parse::<f64>().unwrap()
}

fn main() {
    println!("Digite a nota 1:");
    let n1 = ler_f64();

    println!("Digite a nota 2:");
    let n2 = ler_f64();

    println!("Digite a nota 3:");
    let n3 = ler_f64();

    let media = calcular_media(n1, n2, n3);
    println!("Média = {:.2}", media);

    if media >= 7.0 {
        println!("Aprovado!");
    } else {
        println!("Reprovado!");
    }
}
