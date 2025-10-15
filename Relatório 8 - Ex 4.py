from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao


class NetRunner(Cibernetico):
    def __init__(self, nome, custo_implante, funcao_implante):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} está realizando um hack usando {self.implante.funcao}.")


class Faccao:
    def __init__(self, membros):
        self.membros = membros

    def atacar(self):
        for membro in self.membros:
            membro.realizar_hack()
