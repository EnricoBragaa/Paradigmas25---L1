module Rastreavel
  def obter_localizacao(hora)
    puts "#{@nome} está sendo rastreado às #{hora}."
  end
end

module Perigoso
  def calcular_risco
    "ALTO"
  end
end

class Participante
  def initialize(nome)
    @nome = nome
  end
end

class Detetive < Participante
  include Rastreavel

  def initialize(nome, localizacao)
    super(nome)
    @localizacao = localizacao
  end

  def to_s
    "Detetive #{@nome} em #{@localizacao}"
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome, localizacao)
    super(nome)
    @localizacao = localizacao
  end

  def to_s
    "Criminoso #{@nome} em #{@localizacao}"
  end
end

class Cenario
  def initialize(participantes)
    @participantes = participantes
  end

  def identificar_ameacas
    perigosos = @participantes.select do |p|
      p.respond_to?(:calcular_risco)
    end
    perigosos
  end

  def exibir_ameacas
    lista = identificar_ameacas
    puts "Participantes perigosos:"
    lista.each { |p| puts p.to_s }
  end
end

puts "Digite a localização de Sherlock:"
local_sherlock = gets.chomp
puts "Digite a localização de Moriarty:"
local_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock", local_sherlock)
moriarty = MestreDoCrime.new("Moriarty", local_moriarty)

cenario = Cenario.new([sherlock, moriarty])
cenario.exibir_ameacas
