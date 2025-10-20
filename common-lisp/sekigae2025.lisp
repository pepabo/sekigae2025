; $ clisp sekigae2025.lisp
(let ((member (vector "zipper" "takutaka" "drumato" "ressy" "shibatch" "masaki" "shiroru" "ryu-ch" "kmsm")))
  (loop for i from 0 below (length member)
        do (let ((j (random (length member))))
             (rotatef (aref member i) (aref member j))
             (format t "~a: ~a~%" (1+ i) (aref member i)))))
