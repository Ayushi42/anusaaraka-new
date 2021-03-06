;; FILE MODIFIED BY MEENA (22.8.09)

;@@@ Added by Sukhada (14-08-14)
;It appears to be moving toward a middle ground. 
;यह  बीच की जमीन की ओर जाता हुआ लगता है.
;All students appeared to take the assessments seriously. 
;सब विद्यार्थी राय को गम्भीरता से लेते हुए लगे.
;He appeared to take great satisfaction in connecting adoptive parents with disabled kids. 
;वह दत्तक माँ बाप को विकलाङ्ग बच्चों से मिलाने में बहुत सन्तोष अनुभव करता हुआ लगा.
;They appear to show genuine concern about your welfare. 
;;;वे आपके हित में वास्तविक दिलचस्पी दिखाते हुए लगते हैं.
;She appeared to enjoy it. 
;वह इसका आनन्द उठाती हुई लगी.
(defrule appear_seem_to
(declare (salience 5000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(or (kriyA-kqxanwa_karma ?kri ?inf) (kriyA-kriyArWa_kriyA  ?kri ?inf))
(id-root ?kri appear|seem)
(to-infinitive ?id  ?inf)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?inf wA_huA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* " to.clp    appear_seem_to  "  ?id "  -  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng   " ?*wsd_dir* " to.clp    appear_seem_to  "  ?inf "  wA_huA  )" crlf))
)


;$$$ Modified by Sukhada (14-08-14) -- added below sentences with translations
;7000 people turned out to see him. === -ने के लिये #### Raising predicate
;7000 लोग उसे देखने के लिए  आये.
;Another patient was caused to hear her small son. === -ने के लिये #### ECM verb passive 
;अन्य मरीज को उसके छोटे बेटे से बात करने के लिए  राजी किया गया था.
;Chinese person shall be caused to be removed there-from to the country from whence he came. === -ने के लिये #### ECM verb passive ;
;चीनी व्यक्ति को  जहाँ से वह आया है उस देश को जाने के लिये मज़बूर किया जाना चाहिये.
;I should not have been caused to live so long. === -ने के लिये #### ECM verb passive 
;मुझे इतने लंबे समय जीवित रहने के लिए मज़बूर नहीं किया जाना चाहिये.
;National holidays were declared to mark the wedding. === -ने के लिये #### ECM verb passive ;
;विवाहोत्सव यादगार बनाने के लिए राष्ट्रिय अवकाश घोषित किए गये थे.
;The agent agreed to pay her $ 800 for a night. === -ने के लिये #### Subject control verb
;एजेंट उसे एक रात के लिये  $800 देने के लिये मान गया.
(defrule to39
(declare (salience 1900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid ke_lie))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to39   " ?id "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to39  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to39 "  ?rid " ke_liye )" crlf)
)
)
;The instructor persuaded Mary to take that course



;Added by Meena(12.4.10)
;Everyone has a right to education.  (2nd linkage gives correct parse)
(defrule to0
(declare (salience 6000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(viSeRya-to_saMbanXI =(- ?id 1) =(+ ?id 1))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* " to.clp    to0  "  ?id "   kA  )" crlf))
)




(defrule to1
(declare (salience 5000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word ?rid follow)
(kriyA-upasarga ?id ?id1)
(id-cat_coarse ?id verb)
=>
(retract ?mng)
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id ?id1 isake_bAxa_meM))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng   " ?*wsd_dir* " to.clp	to1  "  ?id "  " ?id1 "  isake_bAxa_meM  )" crlf))
)



(defrule to2
(declare (salience 4800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) considered )
(id-word =(+ ?id 1) be)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to2   "  ?id "  - )" crlf))
)



(defrule to3
(declare (salience 4700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word ?id1 prefer)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kI_apekRA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to3   "  ?id "  kI_apekRA )" crlf))
)



;Added by Meena(8.9.10)
;Because of the recession the company is to axe 350 jobs . 
(defrule to4
(declare (salience 4600))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) be)
(not(id-root ?rid become|guide|give|create)) ;Added 'give' by Roja(15-12-10);The purpose of this note is to give simple sentences for translation. Added 'create' by Roja(19-11-13). Ex: The main purpose of industry is to create wealth.
(to-infinitive  ?id ?rid)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid vAlA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to4   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to4   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to4   "  ?rid " vAlA )" crlf))
)





(defrule to5
(declare (salience 4700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) is)
(to-infinitive  ?id ?rid)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to5  "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to5   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to5   "  ?rid " 0 )" crlf))
)

;To stimulate is to cause to be alert && energetic.



(defrule to6
(declare (salience 4500))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) turn)
(id-cat_coarse =(+ ?id 1) adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to6   "  ?id "  - )" crlf))
)

;The paper turned from red to green.


;$$$ Modified 'wsd_root_mng' to 'affecting_id-affected_ids-wsd_group_root_mng' by Roja(27-04-14). Suggested by Chaitanya Sir.
;He talked to him in order to secure the account.
(defrule to7
(declare (salience 4400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) order )
(id-word =(- ?id 2) in)
(to-infinitive  ?id ?rid)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid ke_lie))
(assert (affecting_id-affected_ids-wsd_group_root_mng ?id =(- ?id 1) =(- ?id 2) -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp   	to7   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-affecting_id-affected_ids-wsd_group_root_mng  " ?*wsd_dir* "  to.clp     to7  "  ?id "  "(- ?id 1)" "(- ?id 2)"   -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to7  "  ?rid " ke_liye )" crlf))
)




(defrule to8
(declare (salience 4300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) from)
(id-cat_coarse =(+ ?id 1) ~verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id waka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to8   "  ?id "  waka )" crlf))
)

;He ran from point A to point B.
; Ram is believed to have killed Ravana.
;from_list(previous_root,subj_subj_raising_verb.dat) && following_word=have	-	0




(defrule to9                            
(declare (salience 4200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) appear|believe|seem)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to9   "  ?id "  - )" crlf))
)




(defrule to10
(declare (salience 4100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) begin|cease|choose|continue|dislike|forget|hate|learn|like|love|mean|need|prefer|remember|start|teach|want)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to10   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to10  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to10  "  ?rid " 0 )" crlf))
)

; I want him to pass the exam





(defrule to11
(declare (salience 4000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) begin|start|like|love|forget)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to11   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to11  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to11  "  ?rid " 0 )" crlf))
)

; Anne began to cry.
;following_root=seem && following_category=verb	{tam:wA_huA}	0
;They seem to resemble each other.




(defrule to12
(declare (salience 3900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) going )
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to12   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to12  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to12  "  ?rid " 0 )" crlf))
)

;He is going to start it.





(defrule to13
(declare (salience 3800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) ability)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid kI))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to13   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to13  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to13  "  ?rid " kI )" crlf))
)

;He has ability to cross the river.




;$$$ Modified by Shirisha Manju (19-03-14) Suggested by Sukhada
;added afford in the list
;I can not afford to buy a house.
;mEM Gara KarIxane kA Karca_nahIM_uTA sakawA hUz.
(defrule to14
(declare (salience 3700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) opportunity|afford)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid kA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to14   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to14  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to14  "  ?rid " kA )" crlf))
)

;Modified by sheetal(18-03-10)
;He has the opportunity to go to school.






(defrule to15
(declare (salience 2950));salience changed by sheetal
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) way|method|procedure|order)
(to-infinitive  ?id ?rid)
(not(id-root ?rid catch))  ;Added by Meena(22.3.11) so that we get "pakadane ke liye" for "to catch" in the ex.The old man had to walk a long way to catch the bus .
(id-cat_coarse ?rid verb)
(not (kriyA-kriyA_viSeRaNa  ?kriyA =(- ?id 1)));Added by sheetal 4:The old man had to walk a long way to catch the bus .
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid kA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp        to15   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to15  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to15  "  ?rid " kA )" crlf))
)

;This is the right way to go.
;This is the way to go.





(defrule to16
(declare (salience 3500))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 2) aim|purpose|plan|idea);changed =(- ?id 1) to =(- ?id 2) by sheetal(21-09-09)
(id-root =(- ?id 1) is|are|be|was|were|been|am|become) ;Added "become" to the list by sheetal(21-09-09) 
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to16   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to16  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to16  "  ?rid " 0 )" crlf))
)

;His aim was to become president.






(defrule to17
(declare (salience 3400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) is|are|be|was|were|been|am)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid vAlA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to17   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to17  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to17  "  ?rid "  vAlA)" crlf))
)

;He was to become president.




(defrule to18
(declare (salience 3300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) think)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to18   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to18  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to18  "  ?rid "  0 )" crlf)
)
)


; I thought it right to resign.
;I expect to go to the party tomorrow . 


;Modified by Meena(1.9.10);removed the word "decide" from the list so that all words in the list are feminine and made another rule for this to18_kA
;Modified by Meena(14.6.10)
;Added "decide" in the list(Meena 28.5.10)
;Police is still hoping to find the dead woman's killer .
(defrule to18_kI
(declare (salience 3200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(kriyA-kqxanwa_karma  =(- ?id 1)  ?rid)
(id-root =(- ?id 1) hope|desire|wish|expect|need)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid kI))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp    to18_kI   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to18_kI  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to18_kI  "  ?rid "  kI )" crlf)
)
)
;I expect to go to the party tomorrow .
;Modified by manju




;Modified by Meena(1.9.10);removed the words "hope|desire|wish|expect|need" (all feminine verbs) from the list and made another rule for them to18_kI
;Modified by Meena(14.6.10)
;Added "decide" in the list(Meena 28.5.10)
;The professor decided to write a book.
(defrule to18_kA
(declare (salience 3200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(kriyA-kqxanwa_karma  =(- ?id 1)  ?rid)
(id-root =(- ?id 1) decide)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid kA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp    to18_kA   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to18_kA  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to18_kA  "  ?rid "  kA )" crlf)
)
)


;They intend to go there.




(defrule to19
(declare (salience 3000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) propose|promise)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to19   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to19  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to19  "  ?rid "  0 )" crlf)
)
)

;They promised her to go there.





(defrule to20
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) fear|agree)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid se))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to20   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to20  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to20  "  ?rid "  se )" crlf)
)
)

;They fear to go there.





;Added by Meena(1.9.09);;(assert (id-H_vib_mng ?rid 0)) , here H-vib_mng should be "0" and not "-"
;I managed to go .
;I finally managed to get a word in.
(defrule to21
(declare (salience 3000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) manage)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
;(assert (make_verbal_noun ?rid))  
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid 0))
(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to021   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp          to21   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp       to21  "  ?rid "  0 )" crlf)
)
)


;$$$ Modified by Prachi Rathore : added quick in the list
;The others were quick [to] protest.[gyan-nidhi]
;वे इसका विरोध करने के लिए उतावले थे।
;Added the word anxious in the list [28-12-13]
;Added the word will in the list [30-12-13]
;He was so anxious to go to heaven that he did not want to risk offending the elephant. [gyan-nidhi]
;If you are willing to try I'll tell you what I want.[gyan-nidhi]
;Added by Meena(2.9.09)The salience in this rule should be higher than that in "to21";(assert (id-H_vib_mng ?rid 0)) , here H-vib_mng should be "0" and not "-"
;It is iMpossible to reach on time for the function.
(defrule to22
(declare (salience 3000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(not(id-root ?rid fix|catch|word|quick|anxious|will))
(id-cat_coarse =(- ?id 1) adjective) ;Added by Meena(6.4.11)
(or(saMjFA-to_kqxanwa  =(- ?id 1)  ?rid)(kriyA-kriyArWa_kriyA  ?kri ?rid)(kriyA-kqxanwa_karma  ?kri ?rid))
    ;Sukhada may need to change this relation, here "impossible" is adjective and not saMjFA  ,then we will change the rule name also . Renamed saMjFA-kqxanwa as saMjFA-to_kqxanwa by Manju (05-02-11)
(subject-subject_samAnAXikaraNa  ?id3 ?id1)
(to-infinitive  ?id ?rid)                       
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid 0))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to22   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to22   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to22  "  ?rid "  0 )" crlf)
)
)



;Added by Meena(6.4.11)
;Galelio was the first scientist to claim that the earth moves around the sun.
(defrule to23
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(or(saMjFA-to_kqxanwa  ?id1 ?id2)(kriyA-kriyArWa_kriyA  ?kri ?rid))    
(subject-subject_samAnAXikaraNa  ?id3 ?id1)
(not(id-root ?id1 manner))    ;Added by Meena (8.4.11)
(not(kriyA-dummy_subject  ?kri ?id3))
(not(id-root ?rid resign|drive|fix|hear))
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid ke_lie))    
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to23   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to23   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to23  "  ?rid "  ke_liye )" crlf)
)
)




;;Added by Meena(1.9.10)
;;This time I am determined to give a simple sentence for testing . 
(defrule to24
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(not(id-root ?rid fix))
(saMjFA-to_kqxanwa  ?lid ?rid)    ;Sukhada may need to change this relation, here "impossible" is adjective and not saMjFA  ,then we will change the rule name also. Renamed saMjFA-kqxanwa as saMjFA-to_kqxanwa by Manju (05-02-11)
(subject-subject_samAnAXikaraNa  ?id1 ?lid)
(kriyA-object  ?rid ?obj)
(to-infinitive  ?id ?rid)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to24   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to24   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to24  "  ?rid "  ke_liye )" crlf)
)
)


;Modified by Meena(15.9.09)
;But my efforts to win his heart have failed . 
(defrule to25
(declare (salience 2800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
;(not(id-root ?rid understand))
(or(saMjFA-to_kqxanwa  ?id1 ?rid)(kriyA-kriyA_mUla ?id2 ?id1));Renamed saMjFA-kqxanwa as saMjFA-to_kqxanwa by Manju(05-02-11)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to25   " ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to25   "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to25  "  ?rid "  ke_liye )" crlf)
)
)



;;Added by Meena(8.2.11)
;;Experienced programmers can quickly learn enough Python using this book to get immersed in natural language processing.
;(defrule to023
;(declare (salience 2800))
;(id-root ?id to)
;?mng <-(meaning_to_be_decided ?id)
;(to-infinitive  ?id ?rid)
;(id-root ?rid get)
;(id-root =(+ ?id 2) ?)
;;(or(saMjFA-to_kqxanwa  ?id1 ?rid)(kriyA-kriyA_mUla ?id2 ?id1));Renamed saMjFA-kqxanwa as saMjFA-to_kqxanwa by Manju(05-02-11)
;;(id-cat_coarse ?rid verb)
;=>
;(retract ?mng)
;(assert (make_verbal_noun =(+ ?id 2)))
;(assert (id-wsd_root_mng ?id -))
;(assert (id-H_vib_mng =(+ ?id 2) ke_liye))
;(if ?*debug_flag* then
;(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to023   " (+ ?id 2) " )" crlf)
;(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to023   "  ?id "  -)" crlf)
;(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to023  "  (+ ?id 2) "  ke_liye )" crlf)
;)
;)




;I sleep to take rest.
;previous_word=enough && previous_minus_two_category=adjective && following_category=verb	{tam:ne_ke_liye}	0
;He is strong enough to lift this.


(defrule to26
(declare (salience 2700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) what|when|where|why|how|who)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to26   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to26  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to26  "  ?rid "  0 )" crlf)
)
)

;I don't know how to do it.
;I shall show you how to operate it





(defrule to27
(declare (salience 2600))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse =(- ?id 1) adjective)
(id-word =(- ?id 2) too)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid ke_lie))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to27   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to27  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to27  "  ?rid "  ke_liye )" crlf)
)
)


;She is too weak to carry this box.


(defrule to28
(declare (salience 2500))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) duty|responsibility)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to28   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to28  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to28  "  ?rid " 0 )" crlf)
)
)


;It is my duty to go.
;previous_category=noun && from_list(previous_verb,is|are|be|was|were|been|am) && following_category=verb	{tam:nA_ke_liye}	0
;He is the right person to go to Paris && negotiate.





(defrule to29
(declare (salience 2400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) afraid|horrified|terrified)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid se))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to29   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to29  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to29  "  ?rid " se )" crlf)
)
)


;I was afraid to go home.






(defrule to30
(declare (salience 2300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) happy|glad|sad|shocked|surprised|amazed|pleased|disheartened|dismayed|disappointed|delighted)
(id-cat_coarse =(+ ?id 1) verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id  -))
(assert (id-H_vib_mng (+  ?id  1) 0_kara))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to30  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-rule_name-id-H_vib_mng 	 " ?*wsd_dir* "  to.clp     to30   "  (+  ?id  1) "  0_kara )" crlf))
)


;We were glad to see him.
;from_list(previous_word,easy_nA_meM_to.dat) && following_category=verb	{tam:ne_meM}	0
;It is easy to learn Hindi.
;His speech was difficult to follow






(defrule to31
(declare (salience 2200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word ?rid it|It|is)
(id-cat_coarse =(- ?id 1) adjective)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to31   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to31 "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to31 "  ?rid " 0 )" crlf))
)


;It is nice to see you again.




;Modified by Meena(16.9.09); added (kriyA-ke_liye  ?id1 ?id) and given (id-H_vib_mng..) as ke_liye
;Dick is important to fix the problem .
(defrule to32
(declare (salience 3000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(not(id-root 1 it))
(not(id-root =(+ ?id 1) reach|resign));resign Added by Roja.(19-05-11)I thought it is right to resign. 
(id-cat_coarse =(- ?id 1) adjective)
(to-infinitive  ?id ?rid)
(or(kriyA-kqxanwa_viSeRaNa  ?kri ?rid)(kriyA-kriyArWa_kriyA  ?kri ?rid))  ;Added by Meena(6.4.11)
;(kriyA-ke_liye  ?id1 ?id)           ;Commented by Meena(6.4.11) 
;(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
;(assert (id-H_vib_mng ?rid 0))
(assert (id-H_vib_mng ?rid ke_lie))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to32   "  ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to32  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to32 "  ?rid " ke_liye )" crlf)
)
)


;She is anxious to please.
;from_list(previous_verb,prayojana_to.dat) && following_category=verb	{tam:ne_ke_liye}	0
;All are requested to reach in time.
;Attempts have been made to understand what this picture signifies.
;It is used to flavour rice.
;That is the most I can do to help you






(defrule to33
(declare (salience 2000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
;(id-word 1 ?id)
(test (eq ?id 1)) ;Commented above line and added test condition by Roja 04-11-13 automatically by a programme.
(id-word ?id1 is|am|are|was|were)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to33   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to33  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to33 "  ?rid " 0 )" crlf)
)
)





;Added by Meena(22.01.10)
;I want her to know about it.
(defrule to34
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root ?rid  know)
(to-infinitive  ?id ?rid)
(kriyA-about_saMbanXI ?rid ?id1)
=>
(retract ?mng)
(assert (id-H_vib_mng ?rid -))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to34  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to34 "  ?rid " - )" crlf)
)
)


;Added by Meena(23.3.10)
;The upper middle-class tend to go into business or become the professionals .
;I was unable to word my feelings at the Ritu's husband's death.
(defrule to35
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(kriyA-kqxanwa_karma  ?id1 ?rid)
(not(id-root ?rid talk|hear))     ;constraint added by Meena(27.4.10)
(not(id-root =(- ?id 1) decide))
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid ke_lie))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to35   " ?id "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to35  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to35 "  ?rid " ke_liye )" crlf)
)
)





;Added by Meena(27.4.10)
;He wanted to talk to his boss . 
(defrule to36
(declare (salience 2800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(kriyA-kqxanwa_karma  ?id1 ?rid)
(id-root ?rid talk)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to36   " ?id "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to36  "  ?id "  -)" crlf)
)
)




;Modified by Meena(27.4.10)
;;Added by Meena(5.4.10) ;The rule needs  more thinking.
;;Losing to a younger player was a bitter pill to swallow . 
(defrule to37
(declare (salience 2300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(kriyA-kriyArWa_kriyA  ?id1 ?rid)
(id-root ?rid swallow)      ;condition added by Meena(27.4.10)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid -))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to37   " ?id "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to37  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to37 "  ?rid " - )" crlf)
)
)





;Added by Meena(28.4.10)
;He was the first Asian scientist to win the Nobel Prize . 
(defrule to38
(declare (salience 2900)) ;Salince increased by Meena(6.4.11) 
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
;(kriyA-kriyArWa_kriyA  ?id1 ?rid)
(or(saMjFA-to_kqxanwa  =(- ?id 1) ?rid)(kriyA-kriyArWa_kriyA  ?kri ?rid))
(id-root ?id1 Prize|prize|lottery)
(kriyA-object  ?rid ?id1)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid vAlA))
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to38   " ?id "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to38  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to38 "  ?rid " vAlA )" crlf)
)
)





(defrule to40
(declare (salience 1800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) as)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to40   "  ?id "  - )" crlf))
)




(defrule to41
(declare (salience 1700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) read)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp   to41   "  ?id "  ke_liye )" crlf))
)

;The teacher reads to her students daily.



(defrule to42
(declare (salience 1600))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(+ ?id 1) cardinal)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id waka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to42   "  ?id "  waka )" crlf))
)

(defrule to43
(declare (salience 1500))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) follow)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id waka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to43   "  ?id "  waka )" crlf))
)

;Modified by Sukhada
;The girl running to the shop is my friend . 
;Indeed, the branch of optics in which one completely neglects the finiteness of the wavelength is called geometrical optics and a ray is defined as the path of energy propagation in the limit of wavelength [tending to] zero.
(defrule to44
(declare (salience 1400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) walk|point|carry|run|cycle|tend) ;used root instead of word  ;Added tend in the list by Manju (23-08-13) Suggested by Chaitanya Sir 
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kI_ora))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to44   "  ?id "  kI_ora )" crlf))
)



(defrule to45
(declare (salience 900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) agree|speak|talk|whisper|think)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to45   "  ?id "  se )" crlf))
)

 
(defrule to46
(declare (salience 400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(- ?id 1) belong)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to46   "  ?id "  kA )" crlf))
)

(defrule to47
(declare (salience 300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) rush)
(id-word =(+ ?id 1) animate)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to47   "  ?id "  ke_liye )" crlf))
)

(defrule to48
(declare (salience 200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) make)
(id-word =(+ ?id 1) animate)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to48   "  ?id "  kA )" crlf))
)

(defrule to49
(declare (salience 100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) expose)
(id-word =(+ ?id 1) air|water)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id meM))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to49   "  ?id "  meM )" crlf))
)



(defrule to50
(declare (salience -100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) expose)
(id-word =(+ ?id 1) public)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_sAmane))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to50   "  ?id "  ke_sAmane )" crlf))
)

(defrule to51
(declare (salience -200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) expose)
(id-word =(+ ?id 1) sun)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_sAmane))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to51   "  ?id "  ke_sAmane )" crlf))
)

(defrule to52
(declare (salience -300))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) down )
(id-word =(- ?id 2) lead)
(id-word =(+ ?id 1) animate)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to52   "  ?id "  - )" crlf))
)

(defrule to53
(declare (salience -400))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) fell )
(id-word =(+ ?id 1) animate)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id waka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to53   "  ?id "  waka )" crlf))
)

(defrule to54
(declare (salience -500))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) done )
(id-word =(+ ?id 1) hair)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ko))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to54   "  ?id "  ko )" crlf))
)

(defrule to55
(declare (salience -600))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) threat )
(id-word =(+ ?id 1) peace|peacefulness|peace of mind|repose|serenity|tranquility|quietness|quietude|calmness|calm|peace treaty)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to55   "  ?id "  ke_liye )" crlf))
)

(defrule to56
(declare (salience -700))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) moment )
(id-word =(+ ?id 1) soldiers|military|servicemen|military man|military personnel)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to56   "  ?id "  ke_liye )" crlf))
)

(defrule to57
(declare (salience -800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) cursor )
(id-word =(+ ?id 1) left|position|point|place)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ora))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to57   "  ?id "  ora )" crlf))
)

(defrule to58
(declare (salience -900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) pen )
(id-word =(+ ?id 1) animate)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ko))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to58   "  ?id "  ko )" crlf))
)

(defrule to59
(declare (salience -1000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-word =(- ?id 1) next )
(id-cat_coarse =(+ ?id 1) ~verb)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_karIba))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to59   "  ?id "  ke_karIba )" crlf))
)





;Modified by Meena(30.4.10)
;Added by Meena(28.4.10)
;She gave birth to twins .
;Some schools do not give weightage to extracurricular activities .  
(defrule to60
(declare (salience 200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI ?id1 ?id2)
(or(id-root ?id2  activity)(id-word ?id2  ?str&:(and (not (numberp ?str))(gdbm_lookup_p "animate.gdbm" ?str)))(id-cat_coarse ?id2 PropN))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id  ko))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to60  "  ?id "  ko)" crlf)
)
)


;Added by Meena(28.4.10)
;To the people of India he is the symbol of mature wisdom .
(defrule to61
(declare (salience 100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(or (kriyA-to_saMbanXI ?id1 ?id2)(viSeRya-to_saMbanXI ?id1 ?id2));Added by Roja(17-12-10) ;this rule is modified to stop the rule firing in unneccesary cases.Eg: He made negative comments to the press . 
(viSeRya-of_saMbanXI  ?id2 ?id3)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id  ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to61  "  ?id "  ke_liye)" crlf)
)
)


(defrule to62
(declare (salience -100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ko))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to62   "  ?id "  ko )" crlf))
)
;



;Rule added by Meena(22.8.09)
;He left all his money to the orphanage .
(defrule to63
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root ?id2 money|property|thing|belonging)
(kriyA-object ?id1 ?id2)
(kriyA-to_saMbanXI  ?id1 ?id3)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to63   "  ?id "  ke_liye )" crlf))
)




;Modified by Meena(11.2.11); added "cinema" in the list.
;Modified by Meena(25.5.10); added store in the list.
;Modified by Meena(3.5.10); added market in the list. 
;Modified by Meena(29.4.10)
;Rule added by Meena(20.11.09)
;If John was with Lisa last night , who went to the movie with Diane .
(defrule to64
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root ?id2 store|market|school|hospital|station|home|movie|market|bazar|Bombay|Delhi|Paris|cinema)  ;make a data base for places and PropN(place names)
;(id-root ?id1 go)
(kriyA-to_saMbanXI  ?id1 ?id2)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to64   "  ?id "  - )" crlf))
)







;To whom were you speaking ? (Modified by Meena 27.3.10)
;;He is not related to me .(Modified by Meena 22.8.09)
;;I should have talked to you before inviting John . Added by sukhada
(defrule to65_saMbanXI
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-root ?id1 talk|relate|speak|lose)    ;Added speak in the list(Meena(27.3.10));ex. for lose: 'Losing to a younger player was a bitter pill to swallow.'
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to65_saMbanXI   "  ?id "  se )" crlf))
)




(defrule to66
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-word ?id2 where)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to66   "  ?id "  - )" crlf))
)
;Where did they go to






;Added by Meena(31.8.09)
;We discussed adding new features to the program . 
;Some people take a lot of time to acclimatize themselves to the new environment .
(defrule to67
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-root ?id2 program|piece|environment) ;piece added by Meena in the list(28.01.10) ;environment added by sheetal
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id meM))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to67   "  ?id "  meM )" crlf))
)




;Added by Meena(9.11.09)
;She awakened to the sound of birds' singing . 
(defrule to68
(declare (salience 1100))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root ?id2 sound)
(kriyA-to_saMbanXI  ?id1 ?id2)
(viSeRya-of_saMbanXI  ?id2 ?id3)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to68   "  ?id "  se )" crlf))
)





;Added by Meena(10.11.09)
;Failure to comply may result in dismissal.
(defrule to69
(declare (salience 2800))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(id-root ?id1 failure)
(saMjFA-to_kqxanwa  ?id1 ?rid);Renamed saMjFA-kqxanwa as saMjFA-to_kqxanwa by Manju (05-02-11)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid));added by sheetal
(assert (id-H_vib_mng ?rid kA))
(assert (id-wsd_root_mng ?id -));meaning is change by sheetal
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp         to69   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to69  "  ?id "  - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to69  "  ?id " kA )" crlf)
)
)

;
(defrule to70
(declare (salience -1200))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid 0))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp  	to70   "  ?rid " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to70  "  ?id "  - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to70  "  ?id " 0 )" crlf)
)
)

;Added by sheetal(18-09-09).
;I thought it is right to resign .It is not a good manner to eat alone .It is not a good idea to drive for hours without a rest . It is hard to absorb so much information. It is important to fix the problem.  
(defrule to71
(declare (salience 2850))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root ?id2 it)
(id-root ?id3 be)
(or (kriyA-subject ?id3 ?id2) (kriyA-dummy_subject ?id3 ?id2))
(to-infinitive ?id ?id1)
(id-cat_coarse ?id1 verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?id1))
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?id1 -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp        to71   " ?id1 " )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng " ?*wsd_dir* "  to.clp        to71   " ?id1 " - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp       to71   "  ?id "  -)" crlf)
)
)


;$$$ Modified by Prachi Rathore;added tea in the list Ex: Uncle, all this applies to Green tea. 
;Uncle, all this applies to Green tea.
;चाचा, सब यह हरियाली चाय पर लागू करता है . 
;Added apply in the list 10-1-14 
;Pressure applied to the wound will stop the bleeding.
;Modified by Meena(28.4.10); added top|station|place in the list and commented (id-root ?id1 heat),so that the rule works with other verbs.
;Added by sheetal(14-01-10).
(defrule to72
(declare (salience 1150))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
;(id-root ?id1 heat)
(or(id-root ?id1 tune|fall|write|apply)(id-root ?id2 temperature|top|place|river|station|tea))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id para))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp    to72   "  ?id "  para )" crlf))
)
;Food must be heated to a high temperature to kill harmful bacteria .




;Added by sheetal(14-03-10)
;Grace may not be possible to fix the problem .
(defrule to73
(declare (salience 4150))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-root =(+ ?id 1) fix)
(to-infinitive  ?id ?rid)
(id-cat_coarse ?rid verb)
(id-root =(- ?id 1) possible|able)
=>
(retract ?mng)
(assert (make_verbal_noun ?rid))
(assert (id-H_vib_mng ?rid -))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp        to73   " ?rid "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to73  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to73  "  ?rid " 0 )" crlf))
)


;"to","Prep","1.ko"
;Ram gave the book to Rama.
;--"2.waka"
;The house has a garden extending to the river bank.
;--"3.kI_ora"
;I went to the garden for jogging.
;--"4.kI"
;She is working as the secretary to the Executive Director.
;--"5.se"
;It takes 30 to 40 minutes to read this.
;--"6.ke_mukAbale_meM"
;The chances are 10 to 1.
;He is richer to her.
;--"7.meM"
;There are 100 paise to one rupee.
;--"8.se_milA_kara"
;He was standing with his ear to the door && listening to th conversation inside the room.
;--"9.ke_prawi"
;Dogs are devoted to their masters.
;Hari is committed to the job.
;--"10.ke_anusAra"
;According to her he will not come.
;The dress may be nice but it is not to her liking.


;@@@ Added by Prachi Rathore[4-12-13].
;This question was finally answered about 50 to 60 years ago.
;इस प्रश्न का लगभग 50 से 60 वर्ष पहले अन्ततः उत्तर दिया गया था . 
(defrule to74
(declare (salience 2000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(saMKyA-saMKyA  ?id1 ?)
(viSeRya-viSeRaNa  ?id1 ?id)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id se))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to74   "  ?id "  se )" crlf))
)

;@@@   ---Added by Prachi Rathore
;Look, we've come to a clump of birch. 
;देखो, हम सनौबर/भोज-वृक्षों  के पेड के  झुरमुट तक आ चुके हैं .  
(defrule to75
(declare (salience 2000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA-to_saMbanXI  ? ?id1)
(id-root ?id1 clump)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id waka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to75   "  ?id "  waka )" crlf))
)

;@@@   Added by Prachi Rathore
;So Sidey went [to] him.[gyan-nidhi]
;इसलिए दुमछल उसके पास गयी।
;So I have come [to] you.[gyan-nidhi]
;मैं इसीलिए आपके पास आई हूँ।
;I must take them[ to] the King, the farmer said [firmly].[GYANNIDHI]
;यही उचित है कि हम उन्हें राजा के पास ले जायें।
(defrule to76
(declare (salience 2000))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI ?id1 ?id2)
(id-word ?id2  ?str&:(and (not (numberp ?str))(gdbm_lookup_p "human.gdbm" ?str)))
(id-root ?id1 go|come|take)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id  ke_pAsa))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to76  "  ?id "  ke_pAsa)" crlf)
)
)


;@@@ Added by Prachi Rathore 3-1-14
;She was alert to the slightest sound.[oald]
;वह हल्की सी आवाज के लिये सतर्क थी . 
(defrule to78
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(viSeRya-to_saMbanXI  ?id1 ?)
(id-root ?id1 alert)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id ke_lie))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to78   "  ?id "  ke_liye )" crlf))
)

;@@@ Added by Prachi Rathore 3-1-14
;Turning [to] her husband, she told him unquestioningly to imitate her actions.[gyan-nidhi]
;उसके पति की ओर मुडते हुए, उसने उसको बिना कुछ पूछे उसकी क्रियाएँ नकल करने के लिये बताया .
(defrule to79
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id preposition)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-root ?id1 turn)
(id-root ?id2 ?str&:(and (not (numberp ?str))(gdbm_lookup_p "human.gdbm" ?str)))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kI_ora))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to79   "  ?id "  ki_Ora )" crlf))
)

;@@@ Added by Prachi Rathore 6-1-14
;In half an hour they had swept all the litter and were about to make a large heap outside the garden. 
(defrule to80
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(saMjFA-to_kqxanwa  ?id1 ?rid)
(id-root ?id1 about)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?rid ne))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to80   "  ?id "  - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to80  "  ?rid "  ne )" crlf))
)

;@@@ Added by Prachi Rathore 6-1-14
;We can't afford to go abroad this summer.[oald]
;हम इस गर्मी विदेश में जाने का खर्च नहीं उठा सकते हैं . 
;She had learnt to bury her feelings.[oald]
;उसने उसकी भावनाओं को छिपाना सीख लिया था
(defrule to81
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-kriyArWa_kriyA  ?id2 ?id1)
(to-infinitive  ?id ?id1)
(id-root ?id1 afford|bury|bubble)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(assert (id-H_vib_mng ?id1 nA))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to81   "  ?id "  - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to81  "  ?id1 "  nA )" crlf)
)
)


;@@@ Added by Prachi Rathore 6-1-14
;He was charged with contempt of court and tried before a full bench of the High' Court on May 5, 1883 and sentenced to imprisonment.[gyannidhi]
;उन पर अदालत का अपमान आशुतोष मुखर्जी करने का आरोप लगाया गया और 5 मई, 1883 को उच्च न्यायालय के पूर्ण पीठ द्वारा मामले पर विचार किए जाने के बाद उन्हें कैद की सज़ा दी गई।
(defrule to82
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-root ?id2 imprisonment)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id kI))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to82   "  ?id "  kI )" crlf)
)
)


;@@@ Added by Prachi Rathore 10-1-14
;He was charged with contempt of court and tried before a full bench of the High' Court on May 5, 1883 and sentenced to imprisonment.[gyannidhi]
;उन पर अदालत का अपमान आशुतोष मुखर्जी करने का आरोप लगाया गया और 5 मई, 1883 को उच्च न्यायालय के पूर्ण पीठ द्वारा मामले पर विचार किए जाने के बाद उन्हें कैद की सज़ा दी गई।
(defrule to83
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?)
(kriyA-kriyA_viSeRaNa  ?id1 ?id2)
(id-root ?id2 apply)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id para))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to83   "  ?id "  para )" crlf)
)
)

;@@@ Added by Prachi Rathore[13-2-14]
;The water in the pan was beginning to bubble.[oald]
;भगोने मे पानी में बुलबुले उठना शुरु हो रहे है.
(defrule to84
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI  ?id1 ?id2)
(id-root ?id1 begin)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id -))
(assert (make_verbal_noun ?id2))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  to.clp 	to84   "  ?id "  - )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp        to84   " ?id2 "  )" crlf)
)
)


;@@@ Added by Prachi Rathore[17-2-14]
;The professor decided to write a book. [verified_sentence]
;प्राध्यापक ने पुस्तक लिखने का फैसला किया . 
(defrule to85
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(to-infinitive  ?id ?id1)
(kriyA-kriyArWa_kriyA  ?id2  ?id1)
(id-root ?id2 decide)
(id-cat_coarse ?id1 verb)
=>
(retract ?mng)
(assert (make_verbal_noun ?id1))
(assert (id-H_vib_mng ?id1 kA))
(assert (id-wsd_root_mng ?id -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-make_verbal_noun " ?*wsd_dir* "  to.clp    to85   "  ?id1 "  )" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to85  "  ?id "  -)" crlf)
(printout wsd_fp "(dir_name-file_name-rule_name-id-H_vib_mng  " ?*wsd_dir* "  to.clp     to85  "  ?id1 "  kA )" crlf)
)
)

;@@@ Added by Prachi Rathore[19-2-14]
;He went to Agra and saw the Tajmahal. [verified]
;वह आगरा गया और ताजजमहल देखा . 
(defrule to86
(declare (salience 2900))
(id-root ?id to)
?mng <-(meaning_to_be_decided ?id)
(kriyA-to_saMbanXI ?id1 ?id2)
(not(id-word ?id2  ?str&:(and (not (numberp ?str))(gdbm_lookup_p "human.gdbm" ?str))))
(id-cat_coarse ?id2 PropN)
(id-root ?id1 go)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id  -))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng  " ?*wsd_dir* "  to.clp     to86  "  ?id " -)" crlf)
)
)
