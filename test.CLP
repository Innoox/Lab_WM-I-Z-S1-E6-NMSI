(deffacts startup
	(father Wasili Kostya)
	(father Wasili Lesya)
	(father Piotr Maxim)
	(father Piotr Wika)
	(father Tolya Wasili)
	(father Tolya Piotr)
	(father Kolya Natka)
	(father Kolya Tanya)
	(mother Natka Kostya)
	(mother Natka Lesya)
	(mother Tanya Maxim)
	(mother Tanya Wika)
	(mother Walya Wasili)
	(mother Walya Piotr)
	(mother Galya Natka)
	(mother Galya Tanya)
	(m Wasili)
	(m Piotr)
	(m Kostya)
	(m Maxim)
	(m Tolya)
	(m Kolya)
	(f Natka)
	(f Tanya)
	(f Lesya)
	(f Wika)
	(f Walya)
	(f Galya)
)

(defrule MAIN::son
  	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(m ?y)
	=>
	(assert(son ?y ?x))
	(printout t ?y " is son to " ?x crlf)
)

(defrule MAIN::daughter
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(f ?y)
	=>
	(assert(daughter ?y ?x))
	(printout t ?y " is daughter to " ?x crlf)
)

(defrule MAIN::grandfather
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(father ?z ?x)
	(m ?z)
	=>
	(assert(grandfather ?z ?y))
	(printout t ?z " is grandfather to " ?y crlf)
)

(defrule MAIN::grandmother
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(mother ?z ?x)
	(f ?z)
	=>
	(assert(grandmother ?z ?y))
	(printout t ?z " is grandmother to " ?y crlf)
)

(defrule MAIN::grandson
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(or	(father ?y ?z)
		(mother ?y ?z)
	)
	(m ?z)
	=>
	(assert(grandson ?z ?x))
	(printout t ?z " is grandson to " ?x crlf)
)

(defrule MAIN::granddaughter
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(or	(father ?y ?z)
		(mother ?y ?z)
	)
	(f ?z)
	=>
	(assert(grandson ?z ?x))
	(printout t ?z " is granddaughter to " ?x crlf)
)

(defrule MAIN::brother
	(and
		(or
			(m ?x)
			(f ?x)
		)
		(m ?y)
		(or
			(m ?z)
			(f ?z)
		)
		(father ?x ?y)
		(father ?x ?z)
	)
	=>
	(if	(neq ?y ?z)
		then
		(assert(brother ?y ?z))
		(printout t ?y " is brother to " ?z crlf)
	)
)

(defrule MAIN::sister
	(and
		(or
			(m ?x)
			(f ?x)
		)
		(f ?y)
		(or
			(m ?z)
			(f ?z)
		)
		(father ?x ?y)
		(father ?x ?z)
	)
	=>
	(if	(neq ?y ?z)
		then
		(assert(sister ?y ?z))
		(printout t ?y " is sister to " ?z crlf)
	)
)

(defrule MAIN::near_ancestor
	(or	(father ?x ?y)
		(mother ?x ?y)
    	)
	(or	(m ?y)
		(f ?y)
	)
    	=>
    	(assert(near_ancestor ?x ?y))
    	(printout t ?x " is near_ancestor to " ?y crlf)
)

(defrule MAIN::ancestor
	(or
		(or
			(father ?z ?x)
			(mother ?z ?x)
		)
		(and
			(or
				(father ?y ?x)
				(mother ?y ?x)
			)
			(or
				(father ?z ?y)
				(mother ?z ?y)
			)
		)
	)
    	=>
    	(assert(ancestor ?z ?x))
    	(printout t ?z " is ancestor " ?x crlf)
)

(defrule MAIN::near_descendant
	(or	(father ?x ?y)
		(mother ?x ?y)
	)
	(or	(m ?y)
		(f ?y)
	)
	=>
	(assert(near_descendant ?x ?y))
	(printout t ?y " is near_descendant to " ?x crlf)
)

(defrule MAIN::descendant
	(or
		(or
			(father ?z ?x)
			(mother ?z ?x)
		)
		(and
			(or
				(father ?z ?y)
				(mother ?z ?y)
			)
			(or
				(father ?y ?x)
				(mother ?y ?x)
			)
		)
	)
	=>
	(assert(descendant ?x ?z))
	(printout t ?x " is descendant " ?z crlf)
)