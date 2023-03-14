(define (domain blocks-world-domain)
  (:requirements :strips :equality :conditional-effects)
  (:constants Table)
  (:predicates (on ?x ?y)
	       (clear ?x)
	       (block ?b)
	       )

  (:action move
	     :parameters (?obj ?src ?dst)
	     :precondition (and (on ?obj ?src) (clear ?obj) (clear ?dst)
				 (not (= ?dst ?src)) (not (= ?obj ?src))
				 (not (= ?obj ?dst)) (not (= ?obj Table)))
	     :effect
	     (and (on ?obj ?dst) (not (on ?obj ?src))
		   (when (not (= ?src Table)) (clear ?src))
		   (when (not (= ?dst Table)) (not (clear ?dst))))))
