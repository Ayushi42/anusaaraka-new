
(defrule home0
(declare (salience 5000))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id homing )
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id lakRyaBexI_misAila))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_word_mng  " ?*wsd_dir* "  home.clp  	home0   "  ?id "  lakRyaBexI_misAila )" crlf))
)

;"homing","Adj","1.lakRyaBexI misAila"
;pAkiswAna kA tohI vimAna 'homing'lakRyaBexI misAila se mAra girAyA.
;


;
(defrule home4
(declare (salience 4600))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(id-word =(+ ?id 1) towards)    ;Added by Meena(17.9.10)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Gara_lOta))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  home.clp 	home4   "  ?id "  Gara_lOta )" crlf))
)

;"home","V","1.Gara_lOtanA"
;Birds homed towards their nests


;@@@ Added by Prachi Rathore[24-1-14]
;I began to feel I was really homing in on the answer.
;मैंने महसूस करना आरम्भ किया कि मैं वास्तव में सीधा उत्तर पर  पहुँच रहा था . 
(defrule home5
(declare (salience 5000))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(kriyA-upasarga  ?id ?id1)
(id-root ?id1 in)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 sIXA_pahuzca))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " home.clp  home5  "  ?id "  " ?id1 " sIXA_pahuzca)" crlf))
)

;@@@ Added by Prachi Rathore[24-1-14]
;The missile homed in on the target.[oald]
;प्रक्षेपास्ट्र ने निशाने पर सीधा वार किया . 
(defrule home6
(declare (salience 5100))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id verb)
(kriyA-upasarga  ?id ?id1)
(id-root ?id1 in)
(kriyA-on_saMbanXI  ?id ?id2)
(id-root ?id2 target|victim)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 sIXA_vAra_kara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " home.clp  home6  "  ?id "  " ?id1 " sIXA_vAra_kara)" crlf))
)



;xxxxxxxxxx Default Rule xxxxxxxxxxxxxxxxx
;"home","Adv","1.Gara"
;usake 'home' meM kiwane saxasya hEM?
;
(defrule home2
(declare (salience 4800))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adverb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Gara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  home.clp 	home2   "  ?id "  Gara )" crlf))
)


;"home","N","1.Gara"
;prawyeka vyakwi ke mana meM icCA rahawI hE ki usakA Kuxa kA 'home'(Gara) ho.
(defrule home3
(declare (salience 4700))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Gara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  home.clp 	home3   "  ?id "  Gara )" crlf))
)

;"home","Adj","1.GarelU"
;GarelU upakaraNa aXika upayogI hEM.

(defrule home1
(declare (salience 4900))
(id-root ?id home)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id GarelU))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  home.clp 	home1   "  ?id "  GarelU )" crlf))
)
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;Added by Meena(17.9.10)
;(defrule home5
;;(declare (salience 4700))
;(id-root ?id home)
;?mng <-(meaning_to_be_decided ?id)
;;(id-cat_coarse ?id noun)
;=>
;(retract ?mng)
;(assert (id-wsd_root_mng ?id Gara))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  home.clp      home5   "  ?id "  Gara )" crlf))
;)

;

