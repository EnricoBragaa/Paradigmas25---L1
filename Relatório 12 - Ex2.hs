data Item = Item { nomeI :: String, categoria :: String, precoI :: Double }
data CompraZelda = CompraZelda { itensZ :: [Item] }

calculaDesconto :: [Item] -> Double
calculaDesconto xs =
    if sum (map precoI xs) > 200
    then sum (map precoI xs) * 0.10
    else 0

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda xs)
    | total > 200 = total - calculaDesconto xs
    | otherwise = total + 15
    where total = sum (map precoI xs)

main2 :: IO ()
main2 = do
    let i1 = Item "Espada" "Arma" 150
    let i2 = Item "Poção" "Poção" 40
    let i3 = Item "Escudo" "Equipamento" 120
    let c1 = CompraZelda [i1, i2]
    let c2 = CompraZelda [i1, i3]
    let c3 = CompraZelda [i2]
    print (valorFinal c1)
    print (valorFinal c2)
    print (valorFinal c3)
