(defun c:rew (/ )
(setq ss (ssadd) e1 (car (setq esel (entsel "\nSelect First line: ")))); setq
(setq e2 (car (entsel "\nSelect Second line: ")))

(setq p1 (vlax-curve-getStartPoint e1))
(setq p2 (vlax-curve-getEndPoint e1))
(setq p3 (vlax-curve-getStartPoint e2))
(setq p4 (vlax-curve-getEndPoint e2))

(setq dist1 (+ (distance p1 p3) (distance p2 p4)))
(setq dist2 (+ (distance p1 p4) (distance p2 p3)))


(if (< dist1 dist2)

	(progn
		(command "_.line" (vlax-curve-getStartPoint e1) (vlax-curve-getStartPoint e2) "")
		(ssadd (entlast) ss)
		(command "_.line" (vlax-curve-getEndPoint e1) (vlax-curve-getEndPoint e2) "")
		(ssadd (entlast) ss)
		(ssadd e2 ss)
		(command "_.join" e1 ss "")
		(princ)
	)
	(progn
		(command "_.line" (vlax-curve-getStartPoint e1) (vlax-curve-getEndPoint e2) "")
		(ssadd (entlast) ss)
		(command "_.line" (vlax-curve-getEndPoint e1) (vlax-curve-getStartPoint e2) "")
		(ssadd (entlast) ss)
		(ssadd e2 ss)
		(command "_.join" e1 ss "")
		(princ)
	)
)

)