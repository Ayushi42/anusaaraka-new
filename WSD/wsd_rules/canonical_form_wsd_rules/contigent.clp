
(defrule contigent0
(declare (salience 5000))
(id-root ?id contigent)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id prAsafgika))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  contigent.clp 	contigent0   "  ?id "  prAsaMgika )" crlf))
)

;"contigent","Adj","1.prAsaMgika"
(defrule contigent1
(declare (salience 4900))
(id-root ?id contigent)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id tolI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  contigent.clp 	contigent1   "  ?id "  tolI )" crlf))
)

;"contigent","N","1.tolI"
