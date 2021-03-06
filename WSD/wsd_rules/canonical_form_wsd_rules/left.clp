;$$$---Modified by Nandin(14-4-14)
;File modified by Meena (22.8.09)
;Take the first left.   ;Added eng-sentence
(defrule left0
(declare (salience 5000))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(kriyA-object ?id1 ?id)
(id-cat_coarse ?id noun)
;(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id bAzyeM_modza))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  left.clp  	left0   "  ?id "  bAzyeM_modza )" crlf))
)

(defrule left1
(declare (salience 4900))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id bAzyA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp 	left1   "  ?id "  bAzyA )" crlf))
)



(defrule left2
(declare (salience 4800))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id bAzyA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp 	left2   "  ?id "  bAzyA )" crlf))
)

;@@@----Added by Nandini(14-4-14)
;The Left only has a small chance of winning power.
(defrule left3
(declare (salience 4950))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-det_viSeRaNa  2 1)
;(kriya-subject ?id1 ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id vAma_xala))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp 	left3   "  ?id "  vAma_xala )" crlf))
)

;@@@----Added by Nandini(14-4-14)
;She was sitting on my left.
;vaha merI bAzyIM ora para bETI WI.
(defrule left4
(declare (salience 5050))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(kriyA-on_saMbanXI  ?id1 ?id)
(id-root ?id1 sit|stand|walk|run)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id bAzyIM_ora))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  left.clp  	left4   "  ?id "  bAzyIM_ora )" crlf))
)

;@@@----Added by Nandini(14-4-14)
;To the left of the library is the bank.[olad]
;puswakAlaya ki bAzyIM ora bEMka  hE.
(defrule left5
(declare (salience 5080))
(id-root ?id left)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-of_saMbanXI  ?id ?id1)
(id-root ?id1 library|house)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id bAzyIM_ora))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  left.clp  	left5   "  ?id "  bAzyIM_ora )" crlf))
)

;Modified by Meena(2.3.10);added (or(kriyA-object ?id ?id2)(kriyA-in_saMbanXI  ?id ?id2))
;He left in the morning.
;I left the party after seeing Ann there . 
;(defrule left3
;(declare (salience 4300))
;(id-root ?id leave)
;?mng <-(meaning_to_be_decided ?id)
;(id-word ?id left )
;(kriyA-subject ?id ?id1)
;(or(kriyA-object ?id ?id2)
;(kriyA-in_saMbanXI  ?id ?id2)(kriyA-kriyA_viSeRaNa  ?id ?id2))
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id calA_jA))
;(assert (id-H_vib_mng ?id yA))
;(assert (kriyA_id-object_viBakwi ?id se))  ;added by Meena(2.3.10)
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp    ;left3   "  ?id "   calA_jA )" crlf)
;(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng   " ?*wsd_dir* "  left.clp    left3   ;"  ?id "  yA )" crlf)
;(printout wsd_fp "(dir_name-file_name-rule_name-kriyA_id-object_viBakwi   " ?*wsd_dir* "   ;left.clp       left3   "  ?id " se )" crlf)
;)
;)




;Added by Meena (22.08.09)
;He left all his money to the orphanage.
;(defrule left4
;(declare (salience 4300))
;(id-root ?id leave)
;?mng <-(meaning_to_be_decided ?id)
;(kriyA-object ?id ?id1)
;(id-root ?id1 money|wealth|house|land|property|business)
;(kriyA-to_saMbanXI  ?id ?id2)
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id Coda_jA))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp      ;left4   "  ?id "  CodZa_jA )" crlf)
;)
;)



;The train left on time.
;(defrule left5
;(declare (salience 4200))
;(id-root ?id leave)
;?mng <-(meaning_to_be_decided ?id)
;(id-word ?id1 train|bus)
;(kriyA-subject ?id ?id1)
;(id-cat_coarse ?id verb)
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id CUta))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp      ;left5   "  ?id "  CUta )" crlf)
;)
;)


;Modified by Meena(3.3.10)
;I say it is a damn shame that he left . 
;(defrule left6
;(declare (salience 4000))
;(id-root ?id leave)
;?mng <-(meaning_to_be_decided ?id)
;(id-word ?id left )
;(kriyA-subject ?id ?id1)
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id calA_jA))
;(assert (id-H_vib_mng ?id yA))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp    ;left6  "  ?id "   calA_jA )" crlf)
;(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng   " ?*wsd_dir* "  left.clp    left6   ;"  ?id "  yA )" crlf)
;)
;)

;Added by Aditya and Hardik(5.6.13),IIT(BHU)
;I was left alone.
;We are left behind.
;(defrule left7
;(declare (salience 4100))
;(id-root ?id leave)
;?mng <-(meaning_to_be_decided ?id)
;(id-root = (- ?id 1) be|am) 
;(kriyA-subject ?id ?id1)
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id CUta))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  left.clp 	;left7   "  ?id "  CUta )" crlf))
;)

;"left","Adj","1.bAzyA"
;Some people write with their left hand. 
;--"2.vAma paMWa"
;The left parties.
;
;
