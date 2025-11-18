data Bebida = Bebida { nomeB :: String, tipoB :: String, precoB :: Double }
data StatusPedido = Aberto | Entregue | Cancelado
data Pedido = Pedido { bebidas :: [Bebida], statusP :: StatusPedido }

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido bs Cancelado) = 0
valorTotalPedido (Pedido bs _) = sum (map precoB bs) + 5

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida"
primeiraBebida (Pedido (b:_) _) = nomeB b
