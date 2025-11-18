(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo-iwai*
  (list
   (make-item :nome "Katana Negra" :tipo "Arma" :preco 100 :forca-magica 120)
   (make-item :nome "Punhal Enferrujado" :tipo "Arma" :preco 40 :forca-magica 60)
   (make-item :nome "Poção Vermelha" :tipo "Pocao" :preco 20 :forca-magica 10)
   (make-item :nome "Orbe Antigo" :tipo "Artefato" :preco 200 :forca-magica 300)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let* ((armas (remove-if-not
                 (lambda (it) (string-equal (item-tipo it) "Arma"))
                 catalogo))
         (armas-com-preco
          (mapcar
           (lambda (it)
             (make-item
              :nome (item-nome it)
              :tipo (item-tipo it)
              :preco (adiciona-imposto (item-preco it))
              :forca-magica (item-forca-magica it)))
           armas))
         (relatorio
          (mapcar
           (lambda (it)
             (format nil "~A | Força Final: ~A"
                     (item-nome it)
                     (bonus-maldicao (item-forca-magica it))))
           armas-com-preco)))
    relatorio))

(processa-venda *catalogo-iwai*)
