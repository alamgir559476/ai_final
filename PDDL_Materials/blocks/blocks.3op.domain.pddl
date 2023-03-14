(define (domain blocks_world)
  (:requirements :strips)
  (:predicates (on-table ?x) (on ?x ?y) (clear ?x))

  (:action Move_from_Stack_to_Table
    :parameters (?obj ?src)
    :precondition (and (clear ?obj) (on ?obj ?src))
    :effect (and (clear ?src) (on-table ?obj) (not (on ?obj ?src))))

  (:action Move_from_Stack_to_Stack
    :parameters (?obj ?src ?dst)
    :precondition (and (clear ?obj) (clear ?dst) (on ?obj ?src))
    :effect (and (clear ?src) (on ?obj ?dst) (not (clear ?dst)) (not (on ?obj ?src))))

  (:action Move_from_Table_to_Stack
    :parameters (?obj ?dst)
    :precondition (and (clear ?obj) (clear ?dst) (on-table ?obj))
    :effect (and (on ?obj ?dst) (not (clear ?dst)) (not (on-table ?obj))))
  )