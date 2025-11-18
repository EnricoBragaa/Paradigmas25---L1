(defstruct ocorrencia nome ritual nivel-medo agentes-enviados)

(defun soma-medo-recursiva (lista-ocorrencias)
  (if (null lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
         (soma-medo-recursiva (cdr lista-ocorrencias)))))

(defun analise-final (lista-ocorrencias)
  (let* ((soma (soma-medo-recursiva lista-ocorrencias))
         (len (length lista-ocorrencias))
         (media (if (> len 0) (/ (float soma) len) 0.0))
         (criticas (remove-if-not
                    (lambda (o)
                      (and (> (length (ocorrencia-agentes-enviados o)) 3)
                           (> (ocorrencia-nivel-medo o) media)))
                    lista-ocorrencias)))
    (mapcar #'ocorrencia-nome criticas)))

(setq lista-exemplo
      (list
       (make-ocorrencia :nome "Vila Sombria" :ritual "Noite Eterna" :nivel-medo 7 :agentes-enviados '("A" "B" "C" "D"))
       (make-ocorrencia :nome "Mina Abandonada" :ritual "Eco Profundo" :nivel-medo 4 :agentes-enviados '("E" "F"))
       (make-ocorrencia :nome "Igreja Velha" :ritual "Cântico" :nivel-medo 6 :agentes-enviados '("G" "H" "I" "J" "K"))
       (make-ocorrencia :nome "Fazenda Silente" :ritual "Ritual da Colheita" :nivel-medo 3 :agentes-enviados '("L"))
       (make-ocorrencia :nome "Estação Abandonada" :ritual "Luz Fria" :nivel-medo 8 :agentes-enviados '("M" "N" "O" "P"))))

(analise-final lista-exemplo)
