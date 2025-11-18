data Servico = Servico { nomeS :: String, tipoS :: String, precoS :: Double }
data StatusAtend = EmAndamento | Finalizado | CanceladoA
data Atendimento = Atendimento { servs :: [Servico], statusA :: StatusAtend }

bonusEspiritual :: [Servico] -> Double
bonusEspiritual xs
    | length xs > 3 = soma * 1.25
    | soma > 500 = soma * 0.90
    | otherwise = soma
    where soma = sum (map precoS xs)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento xs CanceladoA) = 0
valorFinalAtendimento (Atendimento xs _) = bonusEspiritual xs

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço"
descricaoPrimeiroServico (Atendimento (s:_) _) =
    nomeS s ++ " - " ++ tipoS s

main4 :: IO ()
main4 = do
    let s1 = Servico "Banho Azul" "Banho" 200
    let s2 = Servico "Massagem Oni" "Massagem" 150
    let s3 = Servico "Banquete Real" "Banquete" 300
    let s4 = Servico "Harmonia" "Banho" 100
    let a1 = Atendimento [s1,s2] EmAndamento
    let a2 = Atendimento [s1,s2,s3,s4] Finalizado
    let a3 = Atendimento [s3] CanceladoA
    print (valorFinalAtendimento a1)
    print (valorFinalAtendimento a2)
    print (valorFinalAtendimento a3)
