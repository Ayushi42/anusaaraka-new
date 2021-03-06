
(defrule upon0
(declare (salience 5000))
(id-root ?id upon)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) accept|acknowledge|add|admit|agree|allege|announce|answer|argue|arrange|assert|assume|assure|believe|boast|check|claim|comment|complain|concede|conclude|confirm|consider|contend|convince|decide|demonstrate|deny|determine|discover|dispute|doubt|dream|elicit|ensure|estimate|expect|explain|fear|feel|figure|find|foresee|forget|gather|guarantee|guess|hear|hold|hope|imagine|imply|indicate|inform|insist|judge|know|learn|maintain|mean|mention|note|notice|notify|object|observe|perceive|persuade|pledge|pray|predict|pretend|promise|prophesy|prove|read|realize|reason|reassure|recall|reckon|record|reflect|remark|remember|repeat|reply|report|require|resolve|reveal|say|see|sense|show|state|suggest|suppose|swear|teach|tell|think|threaten|understand|vow|warn|wish|worry|write)
(id-word =(+ ?id 1) what|when|where|why|how|who)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id isa_ke_Upara_ki))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  upon.clp 	upon0   "  ?id "  isa_ke_Upara_ki )" crlf))
)

(defrule upon1
(declare (salience 4900))
(id-root ?id upon)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) what|when|where|why|how|who)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id usa_ke_Upara_ki))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  upon.clp 	upon1   "  ?id "  usa_ke_Upara_ki )" crlf))
)

(defrule upon2
(declare (salience 4800))
(id-root ?id upon)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_Upara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  upon.clp 	upon2   "  ?id "  ke_Upara )" crlf))
)

;@@@ Added by Prachi Rathore[17-1-14]
;No further action appears to have been taken in the matter until Lord Curzon came upon the scene. [gyannidhi]
;ऐसा प्रतीत होता है कि लार्ड कर्ज़न के आने तक इस विषय में आगे कोई कार्यवाही नहीं की गई।
(defrule upon3
(declare (salience 5000))
(id-root ?id upon)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA-upon_saMbanXI  ?id1 ?id2)
(id-root ?id1 come)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 A_jA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " upon.clp	 upon3  "  ?id "  " ?id1 "  A_jA  )" crlf))
)
;"upon","Prep","1.ke_Upara/UzcA/para"
;The cat jumped upon the table.
;--"2.najZaxIka"
;Diwali is almost upon us again.
;
