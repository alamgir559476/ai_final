;;; Simple strips blocks world from Smith and Peot

(define (domain simple-blocks)
  (:requirements :strips :equality)
  (:predicates (on ?x ?y)
	       (clear ?x))
  (:constants Table)

  (:action Move_to_table
	     :parameters (?obj ?src)
	     :precondition (and (on ?obj ?src) (clear ?obj)
                                 (not (= ?obj Table)) (not (= ?src Table)))
	     :effect (and (on ?obj Table) (clear ?src) (not (on ?obj ?src))))
  (:action Move_to_Stack
	     :parameters (?obj ?src ?dst)
	     :precondition (and (on ?obj ?src) (clear ?obj) (clear ?dst)
                                  (not (= ?obj Table)) (not (= ?dst Table)) (not (= ?obj ?dst)))
	     :effect (and (on ?obj ?dst) (clear ?src)
                           (not (on ?obj ?src)) (not (clear ?dst)))))

