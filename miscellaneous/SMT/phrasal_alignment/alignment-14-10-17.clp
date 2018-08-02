;This file is added by Shirisha Manju (9-10-14)


(deftemplate score (slot anu_id (default 0))(slot man_id (default 0))(slot weightage_sum (default 0))(multislot heuristics (default 0))(multislot rule_names (default 0)))

(deftemplate alignment (slot anu_id (default 0))(slot man_id (default 0))(multislot anu_meaning (default 0))(multislot man_meaning(default 0)))

(deftemplate manual_word_info (slot head_id (default 0))(multislot word (default 0))(multislot word_components (default 0))(multislot root (default 0))(multislot root_components (default 0))(multislot vibakthi (default 0))(multislot vibakthi_components (default 0))(slot tam (default 0))(multislot tam_components (default 0))(multislot group_ids (default 0)))

;=============================== modify/remove score fact for same weight ================

(defrule modify_score_with_punct
(declare (salience 102))
?f0<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum ?sum))
?f1<-(id-right_punctuation  ?aid PUNCT-ClosedParen)
(manual_id-word =(+ ?mid 1) @PUNCT-ClosedParen)
=>
	(retract ?f1)
	(bind ?sum (+ ?sum 1))
        (modify ?f0 (weightage_sum ?sum))
)
;-----------------------------------------------------------------------------------
(defrule modify_score_with_prev_word_align 
(declare (salience 102))
?f0<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum ?w))
(score (anu_id ?aid1) (man_id ?mid) (weightage_sum ?w))
(test (neq ?aid ?aid1))
(score_fact =(- ?aid 1) =(- ?mid 1) ? $?)
=>
	(bind ?sum (+ ?w 3))
        (modify ?f0 (weightage_sum ?sum))
)	

(defrule get_same_wt_fact
(declare (salience 130))
?f0<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum ?w))
?f1<-(score (anu_id ?aid1) (man_id ?mid) (weightage_sum ?w))
(test (neq ?aid ?aid1))
=>
	(retract ?f0 ?f1)
	(assert (man_id-wt-anu_ids ?mid ?w ?aid ?aid1))
)

(defrule add_same_wt_fact
(declare (salience 140))
?f0<-(man_id-wt-anu_ids ?mid ?w $?ids)
?f1<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum ?w))
=>
	(retract ?f0 ?f1)
	(assert (man_id-wt-anu_ids ?mid ?w $?ids ?aid))
)


(defrule modify_score_with_prep_of
(declare (salience 120))
?f0<-(man_id-wt-anu_ids ?mid ?w $?p ?aid $?p1)
(manual_word_info (head_id ?mid)(group_ids $? ?lid))
(manual_id-word ?lid ke|kA)
(score_fact ?aid1 =(+ ?lid 1) ? $?)
(id-word =(+ ?aid1 1) of)
(id-word ?aid&:(= (+ ?aid1 2) ?aid) ?)
=>
	(retract ?f0)
        (bind ?sum (+ ?w 3))
	(assert (score (anu_id ?aid) (man_id ?mid) (weightage_sum ?sum)))
)


;(defrule modify_score_fact_with_conj
;(declare (salience 102))
;?f0<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum 1))
;(not (score (weightage_sum ?s&:(> ?s 1) )))
;(alignment (anu_id =(- ?aid 1))(man_id =(- ?mid 1)) (anu_meaning Ora) )
;=>
;        (modify ?f0 (weightage_sum 2))
;)
;-----------------------------------------------------------------------------------
;(defrule modify_score_for_same_wt
;(declare (salience 101))
;?f0<-(score (anu_id ?aid) (man_id ?mid) (weightage_sum ?score) )
;?f1<-(score (anu_id ?aid) (man_id ?mid1) (weightage_sum ?score) )
;(test (> (fact-index ?f0) (fact-index ?f1)))
;(or (id-HM-source ?aid $?m ?)(id-Apertium_output ?aid $?m))
;(manual_word_info (head_id ?mid) (word $?m))
;(not (manual_word_info (head_id ?mid1) (word $?m)))
;=>
;	(bind ?score (+ ?score 1))
;	(modify ?f0 (weightage_sum ?score))
;)
;;-----------------------------------------------------------------------------------
;;a biennial life cycle. eka xvivArRika jIvana cakra
;(defrule rm_score_with_same_wt
;(declare (salience 100))
;?f1<-(score (anu_id ?aid)(man_id ?mid)(weightage_sum ?score))
;?f2<-(score (anu_id ?aid1)(man_id ?mid)(weightage_sum ?score))
;(test (neq ?aid ?aid1))
;(id-Apertium_output ?aid $?m)
;(id-Apertium_output ?aid1 $?m1)
;(manual_word_info (head_id ?mid) (word $?m $?m1))
;(not (aligned_anu_id ?aid))
;=>
;        (retract ?f1)
;        (assert (removed_aid ?aid))
;)
;;-----------------------------------------------------------------------------------
;(defrule rm_score_with_same_wt1
;(declare (salience 100))
;?f1<-(score (anu_id ?aid)(man_id ?mid)(weightage_sum ?score))
;?f2<-(score (anu_id ?aid1)(man_id ?mid)(weightage_sum ?score))
;(test (neq ?aid ?aid1))
;(not (score (anu_id ?aid) (man_id ?mid1) (weightage_sum ?score1&:(>= ?score1 ?score))))
;(not (score (anu_id ?aid1) (man_id ?mid1) (weightage_sum ?score1&:(>= ?score1 ?score))))
;(not (aligned_anu_id ?aid))
;(not (manual_id-word 2 .))
;=>
;	(retract ?f1 ?f2)
;	(assert (removed_aid ?aid))
;)
(defrule modify_score_fact
(declare (salience 110))
(man_id-wt-anu_ids ?mid ?w $?p ?aid $?p1)
(aligned_anu_id ?aid)
=>
	(retract ?f0)
	


;-----------------------------------------------------------------------------------
;We see leaves falling from trees and water flowing down a dam.
;hama pedoM se girawe hue pawwoM ko waWA bAzXa se bahawe hue pAnI ko xeKawe hEM .
(defrule rm_wrong_score_fact
(declare (salience 110))
?f0<-(score (anu_id ?aid))
(or (aligned_anu_id ?aid) (removed_aid ?aid))
(not (got_score ?aid ?))
=>
        (retract ?f0)
)
;-----------------------------------------------------------------------------------
;I hope I can remember the words.
;mEM una SabxoM ko yAxa kara sakawA hUM.
(defrule rm_wrong_score_fact1
(declare (salience 110))
?f0<-(score (man_id ?mid))
(aligned_man_id ?mid)
(not (got_score ? ?mid))
=>
        (retract ?f0)
)
;-----------------------------------------------------------------------------------
;Taking diet rich in vitamin-A can also be helpful in keeping eyes healthy. 
;vitAmina-e se BarapUra AhAra lenA BI AzKoM ko svasWa banAe raKane meM maxaxagAra sAbiwa ho sakawA hE.
(defrule rm_aux_score
(declare (salience 110))
(score (anu_id ?aid) (man_id ?mid)(heuristics $? anu_exact_match  $?))
(root-verbchunk-tam-chunkids ? ? ? $? ?id $? ?aid)
?f0<-(score (anu_id ?id) )
=>
	(retract ?f0)
)
;================================== alignment using score ============================

;Ex for Not: We see [leaves] falling from trees and water flowing down a dam. 
;Anu: hama bAzXa kama bahawe_hue pedoM Ora pAnI se girawe_hue pawwiyoM ko xeKawe hEM.
;Man: hama pedoM se girawe hue [pawwoM ko] waWA bAzXa se bahawe hue pAnI ko xeKawe hEM .
(defrule align_with_max_sum
(declare (salience 90))
?f1<-(score (anu_id ?aid)(man_id ?mid)(weightage_sum ?score)(heuristics $?h)(rule_names $?r))
(not (score (weightage_sum ?score1&:(> ?score1 ?score))))
(id-Apertium_output ?aid $?a_mng)
?f0<-(manual_word_info (group_ids $?d ?mid $?d1))
(not (aligned_anu_id ?aid))
=>
        (retract ?f0 ?f1)
        (assert (alignment (anu_id ?aid)(man_id ?mid)(anu_meaning $?a_mng)(man_meaning $?d ?mid $?d1)))
	(assert (aligned_anu_id ?aid))
	(assert (aligned_man_id ?mid))
	(assert (score_fact ?aid ?mid ?score $?h - $?r))
)
;-----------------------------------------------------------------------------------
;Ex: if aper output not present then consider hindi meaning
; According to this model, the positive charge of the atom is uniformly distributed [throughout] the volume of the atom and the negatively charged electrons are embedded in it like seeds in a watermelon.
;isa moYdala ke anusAra, paramANu kA Xana AveSa paramANu meM [pUrNawayA] ekasamAna rUpa se viwariwa hE waWA qNa AveSiwa ilektroYna isameM TIka usI prakAra anwaHsWApiwa hEM jEse kisI warabUja meM bIja.
(defrule align_with_max_sum1
(declare (salience 80))
?f1<-(score (anu_id ?aid)(man_id ?mid)(weightage_sum ?score)(heuristics $?h)(rule_names $?r))
(not (score (weightage_sum ?score1&:(> ?score1 ?score))))
(not (id-Apertium_output ?aid $?))
(id-HM-source ?aid $?amng ?)
?f0<-(manual_word_info (head_id ?mid) (group_ids $?ids))
(not (aligned_anu_id ?aid))
=>
        (retract ?f0 ?f1)
        (assert (alignment (anu_id ?aid)(man_id ?mid)(anu_meaning $?amng)(man_meaning $?ids)))
        (assert (aligned_anu_id ?aid))
        (assert (aligned_man_id ?mid))
	(assert (score_fact ?aid ?mid ?score $?h - $?r))
)

;(defrule get_manual_scope
;(declare (salience 10))
;(alignment (anu_id ?aid) (man_id ?mid))



 
;(id-grp_ids ?mid -  $? ?id)
;(or (anu_id-man_id-src-rule_name =(+ ?aid 1) ?mid1&:(= (+ ?id 1) ?mid1) $?) (anu_id-man_id-src-rule_name =(- ?aid 1) ?mid1&:(= (- ?mid 1) ?mid1) $?))
;(chunk_name-chunk_ids ? $?grp)
;(test (integerp (member$ ?mid1 $?grp)))
;(test (integerp (member$ ?mid $?grp)))
;(not (anu_id-man_id-src-rule_name ?aid ?mid $? manual_scope $?))
;=>
;        (assert (anu_id-man_id-type ?aid ?mid  manual_scope))
;        (assert (anu_id-man_id-src-rule_name ?aid ?mid manual_scope get_manual_scope))
;)
;;-----------------------------------



;================================= replace id with word ==============================

(defrule replace_id_with_word_for_nos
(declare (salience -500))
?f<-(alignment (anu_id ?aid)(man_id ?mid)(anu_meaning $?anu_mng)(man_meaning $?pre ?id $?pos))
?f1<-(manual_id-word ?id ?h_mng)
(test (numberp ?h_mng))
=>
        (retract ?f1)
        (bind ?h_mng (string-to-field (str-cat @ ?h_mng)))
        (modify ?f (man_meaning $?pre ?h_mng  $?pos))  
)
;-----------------------------------------------------------------------------------
(defrule replace_id_with_word
(declare (salience -501))
?f<-(alignment (anu_id ?aid)(man_id ?mid)(anu_meaning $?anu_mng)(man_meaning $?pre ?id $?pos))
?f1<-(manual_id-word ?id $?h_mng)
=>
        (retract ?f ?f1)
        (if (member$ ?h_mng (create$ @PUNCT-Comma @PUNCT-Dot @PUNCT-QuestionMark @PUNCT-DoubleQuote @PUNCT-DoubleQuote @PUNCT-Semicolon @PUNCT-Colon @PUNCT-SingleQuote @PUNCT-OpenParen @PUNCT-ClosedParen @PUNCT-Exclamation @SYM-Dollar)) then
        (modify ?f (man_meaning $?pre $?pos))  
        else
        (modify ?f (man_meaning $?pre $?h_mng  $?pos))  
        )
)

(defrule save_new_score_fact
(declare (salience -502))
(score_fact ?aid ?mid ?sc $?h - $?r)
(not (got_score ?aid ?mid))
=>
	(assert (score (anu_id ?aid) (man_id ?mid) (weightage_sum ?sc) (heuristics $?h)(rule_names $?r)))
	(assert (got_score ?aid ?mid))
)

;==================== get left over ids info =======================================

(defglobal ?*lids* = (create$ )) 

(defrule get_left_over_ids
(declare (salience -503))
?f0<-(manual_id-word ?id ?mng)
(manual_word_info (head_id ?id)) 
=>
	(retract ?f0)
	(bind ?*lids* (create$  ?*lids* ?id))
)

(defrule print_left_over_ids
(declare (salience -504))
=>
	(bind $?ids (sort > ?*lids*))
	(assert (left_over_ids  $?ids))
	(save-facts "align_score_new.dat" local score)
)

