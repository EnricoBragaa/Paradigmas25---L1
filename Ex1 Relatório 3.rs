use std::io;

fn verificar_senha(s: &str) -> bool {
    if s.len() < 8 {
        return false;
    }
    let mut tem_numero = false;
    let mut tem_maiuscula = false;

    for c in s.chars() {
        if c.is_digit(10) {
            tem_numero = true;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }

    tem_numero && tem_maiuscula
}

fn main() {
    let mut senha = String::new();

    loop {
        senha.clear();
        println!("Digite uma senha:");
        io::stdin().read_line(&mut senha).unwrap();
        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida, tente de novo!");
        }
    }
}
