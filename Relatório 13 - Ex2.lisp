(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Safe Shallows Fish" :ambiente "Shallows" :periculosidade "Baixa" :vida-media 4)
   (make-criatura :nome "Reaper Leviathan" :ambiente "Deep" :periculosidade "Alta" :vida-media 15)
   (make-criatura :nome "Ghost Ray" :ambiente "Deep" :periculosidade "Média" :vida-media 8)
   (make-criatura :nome "Crab Squid" :ambiente "Deep" :periculosidade "Alta" :vida-media 10)))

(defun filtra-por-perigo (catalogo)
  (remove-if
   (lambda (cri) (string-equal (criatura-periculosidade cri) "Baixa"))
   catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar
   (lambda (cri)
     (format nil "~A: Vive em [~A]"
             (criatura-nome cri)
             (criatura-ambiente cri)))
   (remove-if-not
    (lambda (cri) (string-equal (criatura-ambiente cri) "Deep"))
    catalogo)))

(format t "~%--- Criaturas perigosas (exceto baixa) ---~%")
(dolist (c (filtra-por-perigo *catalogo*))
  (format t "~A (~A)~%" (criatura-nome c) (criatura-periculosidade c)))

(format t "~%--- Relatório Deep ---~%")
(dolist (linha (relatorio-profundidade *catalogo*))
  (format t "~A~%" linha))
