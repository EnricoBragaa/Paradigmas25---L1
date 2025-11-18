data Banda = Banda { nomeBanda :: String, genero :: String, cache :: Double }
data StatusEvento = Ativo | Encerrado | CanceladoE
data Evento = Evento { bandas :: [Banda], statusE :: StatusEvento }

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ CanceladoE) = 0
custoTotalEvento (Evento bs _) = (sum (map cache bs)) * 1.2

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda"
bandaAbertura (Evento (b:_) _) = nomeBanda b

bandaFinal :: Evento -> String
bandaFinal (Evento [] _) = "Nenhuma banda"
bandaFinal (Evento bs _) = nomeBanda (last bs)

main3 :: IO ()
main3 = do
    let b1 = Banda "Alpha" "Rock" 1000
    let b2 = Banda "Beta" "Pop" 800
    let b3 = Banda "Gamma" "Metal" 1200
    let e1 = Evento [b1,b2] Ativo
    let e2 = Evento [b2,b3,b1] Encerrado
    let e3 = Evento [b1] CanceladoE
    print (custoTotalEvento e1)
    print (custoTotalEvento e2)
    print (custoTotalEvento e3)
