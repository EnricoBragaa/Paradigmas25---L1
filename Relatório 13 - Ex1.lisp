(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 5) (< peso 20)) 10)
    ((and (>= idade 5) (<= idade 12) (>= peso 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string-equal nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string-equal nome-da-erva "Lótus")   (* preco-base 1.5))
    (t preco-base)))

(let* ((peso 60)
       (idade 14)
       (preco-base 10)
       (dosagem (calcula-dosagem peso idade))
       (preco-final (ajusta-preco preco-base "Lótus")))
  (format t "Dosagem: ~A ml~%" dosagem)
  (format t "Preço final da erva Lótus: ~A moedas~%" preco-final))
