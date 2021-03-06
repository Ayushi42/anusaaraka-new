

;FILE MODIFIED BY MEENA(26.3.10) Have deleted the redundant rules 1,2 & 3

(defrule over0
(declare (salience 5000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id1 burden)
(kriyA-upasarga ?id ?id1)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 bahuwa_lAxa_xe))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " over.clp	over0  "  ?id "  " ?id1 "  bahuwa_lAxa_xe  )" crlf))
)



(defrule over1
(declare (salience 4800))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id1 haul)
(kriyA-upasarga ?id ?id1)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 sampUrNa_marammawa_kara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " over.clp	over1 "  ?id "  " ?id1 "  saMpUrNa_marammawa_kara  )" crlf))
)


(defrule over2
(declare (salience 4600))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id1 heat)
(kriyA-upasarga ?id ?id1)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 bahuwa_garma_kara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " over.clp	over2  "  ?id "  " ?id1 "  bahuwa_garma_kara  )" crlf))
)



(defrule over3
(declare (salience 4400))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) there)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over3   "  ?id "  - )" crlf))
)

;Go && ask the guy over there.
(defrule over4
(declare (salience 4300))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) all)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id meM))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over4   "  ?id "  meM )" crlf))
)

(defrule over5
(declare (salience 4200))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) integer|whole number|number)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se_aXika))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over5   "  ?id "  se_aXika )" crlf))
)

(defrule over6
(declare (salience 4100))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) all)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Bara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over6   "  ?id "  Bara )" crlf))
)

(defrule over7
(declare (salience 0))
;(declare (salience 4000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adverb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id nIce_girA_huA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over7   "  ?id "  nIce_girA_huA )" crlf))
)

;"over","Adv","1.nIce_girA_huA"
;Handle the rose carefully. Don't knock it over.
;--"2.xUsarI_ora"
;Turn the patient over carefully.
;--"3.waka"
;He has gone over to France.
;--"4.varRa_se_jyAxA"
;Children over fifteen need a full ticket on the journey.
;--"5.bacA_huA"
;Is any food left over?
;--"6.Kawama"
;That is all over.
;--"7.bArabAra"
;She has called up several times over.


;Added by Meena(23.8.10)
;We looked all over for the ring . 
(defrule all_over
(declare (salience 4500))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
;(id-root =(- ?id 1) all)
(idiom_type_1  =(- ?id 1) ?id)
(kriyA-for_saMbanXI ?kri ?saMb) 
=>
(retract ?mng)
(assert (id-wsd_word_mng ?id sarvawra))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp      all_over   "  ?id "  sarvawra )" crlf))
)






;Added by Meena(21.8.10)
;;That is all over now . 
;;By the time we arrived the meeting was over . 
;(defrule over8-a
;(declare (salience 4500))
;(id-root ?id over)
;?mng <-(meaning_to_be_decided ?id)
;(id-root =(- ?id 1) be)
;(or(kriyA-subject =(- ?id 1) ?subj)(kriyA-upsarga =(- ?id 1) ?id)(idiom_type_1  =(- ?id 1) ?id))
;=>
;(retract ?mng)
;;(assert (id-wsd_root_mng ?id samApwa_ho))
;(assert (affecting_id-affected_ids-wsd_group_root_mng ?id =(- ?id 1) samApwa_ho))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " over.clp  over8-a  "  ?id "  " (- ?id 1) "  samApwa_ho  )" crlf))
;;(if ?*debug_flag* then
;;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp      over8-a   "  ?id "  samApwa_ho )" crlf))
;)




;
(defrule over8
(declare (salience 3900))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kriketa_kI_ovara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over8   "  ?id "  kriketa_kI_ovara )" crlf))
)

;"over","N","1.kriketa_kI_ovara"
;That was a wonderful over by Kapil Dev.
;
(defrule over9
(declare (salience 3800))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id Pref)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id bAhya))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over9   "  ?id "  bAhya )" crlf))
)

;"over","Pref","1.bAhya"
;That is a warm overcoat.
;--"2.ArapAra"
;The overarching bridge connects two main points.
;--"3.jyAxA"
;She is overambitious.
;



;Modified by Meena(12.10.10)
;Added by Meena(26.3.10)
;Prices have tended downwards over recent years .
(defrule over10
(declare (salience 3700))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(or (kriyA-over_saMbanXI  ?id1 =(+ ?id 1))(kriyA-over_saMbanXI  ?id1 =(+ ?id 2)))
(not(id-root =(+ ?id 1)|=(+ ?id 2) emotion))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id meM))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp      over10   "  ?id "  meM )" crlf))
)


;@@@ Added by Sonam Gupta MTEch IT Banasthali 2013
;She has being rowing again over money with her husband. 
;वह उसके पति के साथ पैसे को लेकर फिर से झगड कर रही थी.
(defrule over11
(declare (salience 3700))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-root ?id1 money|capital|income|fund|cash|wealth|asset|earning|wage)
(kriyA-over_saMbanXI  ?kri ?id1)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ko_lekara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp      over11   "  ?id " ko_lekara )" crlf))
)




;Added by Meena(13.5.10)
;You have to be over 16 to bet . 
(defrule over12
(declare (salience 3600))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(kriyA-over_saMbanXI  ?id1 =(+ ?id 1))
(id-cat_coarse =(+ ?id 1) number|noun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se_Upara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp      over12   "  ?id " se_Upara )" crlf))
)




;Salience reduced by Meena(26.3.10)
(defrule over13
(declare (salience 0))
;(declare (salience 3700))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_Upara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over13   "  ?id "  ke_Upara )" crlf))
)

;@@@ Added by Sonam Gupta MTech IT Banasthali 2013
;The teacher blew up over his student. [Gyannidhi]
;शिक्षक उसके विद्यार्थी पर भडक गया . 
(defrule over14
(declare (salience 3600))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA-over_saMbanXI  ? ?)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id para))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over14   "  ?id "  para )" crlf))
)


;@@@ Added by Sonam Gupta MTech IT Banasthali 3-1-2014
;Spring was over and summer had set in. [Gyannidhi]
;बसन्त ऋतु खत्म थी और ग्रीष्म आ चुकी थी . 
(defrule over15
(declare (salience 5000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id particle)
(subject-subject_samAnAXikaraNa  ? ?id)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Kawma))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over15   "  ?id "  Kawma )" crlf))
)


;@@@ Added by Sonam Gupta MTech IT Banasthali 6-1-2014
;It was all over very quickly. [Cambridge]
;यह सब बहुत जल्दी खत्म हुआ . 
(defrule over16
(declare (salience 5000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA_viSeRaNa-kriyA_viSeRaNa_viSeRaka  ?id ?)
(viSeRya-viSeRaNa  ?id ?)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id Kawma))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over16   "  ?id "  Kawma )" crlf))
)

;@@@ Added by Sonam Gupta MTech IT Banasthali 6-1-2014
;Suitable for children aged 5 and over. [Cambridge]
;5 वर्ष या उससे अधिक उम्र के बच्चों के लिए सही. 
(defrule over17
(declare (salience 5000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adverb)
(id-root =(- ?id 1) and)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id usase_aXika))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over17   "  ?id "  usase_aXika )" crlf))
)

;@@@ Added by Sonam Gupta MTech IT Banasthali 6-1-2014
;She placed the quilt over the bed. [Cambridge]
;उसने रजाई को बिस्तर पर रखा . 
(defrule over18
(declare (salience 5000))
(id-root ?id over)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA-over_saMbanXI  ? ?)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id para))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  over.clp 	over18   "  ?id "  para )" crlf))
)

;"over","Prep","1.Upara"
;Keep it over the cupboard.
;--"2.isa_ora_se_usa_ora_waka"
;It is impossible to build a bridge over Brahmaputra.
;--"3.suxUra"
;Snowfall is reported all over the country.
;--"4.se_jyAxA"
;Over 4 million copies of that book have been sold.
;--"5.bIca"
;Discuss it over the lunch.
;--"6.xaramiyAz"
;We shall be at Madras over Christmas && the New year.
;--"7.kaTinAiyAz_se_mukwa"
;It will take her ages to get over the tragedy.
;--"8.prasAriwa"
;I heard it over the radio.
;--"9.wejZa_AvAjZa"
;Nothing could be heard over the traffic din.
;
