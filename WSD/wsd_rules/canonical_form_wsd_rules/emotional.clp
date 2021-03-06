;##############################################################################
;#  Copyright (C) 2013-2014 Pramila (pramila3005 @gmail.com)
;#
;#  This program is free software; you can redistribute it and/or
;#  modify it under the terms of the GNU General Public License
;#  as published by the Free Software Foundation; either
;#  version 2 of the License, or (at your option) any later
;#  version.
;#
;#  This program is distributed in the hope that it will be useful,
;#  but WITHOUT ANY WARRANTY; without even the implied warranty of
;#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;#  GNU General Public License for more details.
;#
;#  You should have received a copy of the GNU General Public License
;#  along with this program; if not, write to the Free Software
;#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
;
;##############################################################################

;@@@ Added by Pramila(BU) on 28-01-2014
;He's a very emotional man.    ;cald
;वह बहुत भावुक आदमी है.
(defrule emotional0
(declare (salience 4950))
(id-root ?id emotional)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
(viSeRya-viSeRaNa  ?id1 ?id)
(subject-subject_samAnAXikaraNa  ?id2 ?id1)
(id-root ?id2 ?str&:(and (not (numberp ?str))(gdbm_lookup_p "human.gdbm" ?str)))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id BAvuka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  emotional.clp 	emotional0   "  ?id "  BAvuka )" crlf))
)


;@@@ Added by Pramila(BU) on 28-01-2014
;He became very emotional when I told him I was pregnant.    ;cald
;वह बहुत भावुक हो गया था जब मैंने उसे बताया कि मैं गर्भवती थी.
(defrule emotional1
(declare (salience 4950))
(id-root ?id emotional)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
(subject-subject_samAnAXikaraNa  ?id2 ?id)
(id-root ?id2 ?str&:(and (not (numberp ?str))(gdbm_lookup_p "human.gdbm" ?str)))
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id BAvuka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  emotional.clp 	emotional1   "  ?id "  BAvuka )" crlf))
)

;-------------------------deafult rules----------------------------------------------
;@@@ Added by Pramila(BU) on 28-01-2014
;My doctor said the problem was more emotional than physical       ;cald
;मेरे चिकित्सक ने कहा कि समस्या शारीरिक से ज्यादा भावनात्मक थी.
(defrule emotional2
(declare (salience 4000))
(id-root ?id emotional)
?mng <-(meaning_to_be_decided ?id)
(id-cat_coarse ?id adjective)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id BAvanAwmaka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  emotional.clp 	emotional2   "  ?id "  BAvanAwmaka )" crlf))
)

;@@@ Added by Pramila(BU) on 28-01-2014
(defrule emotional3
(declare (salience 0))
(id-root ?id emotional)
?mng <-(meaning_to_be_decided ?id)
=>
(retract ?mng)
(assert (id-wsd_root_mng ?id BAvanAwmaka))
(if ?*debug_flag* then
(printout wsd_fp "(dir_name-file_name-rule_name-id-wsd_root_mng   " ?*wsd_dir* "  emotional.clp 	emotional3   "  ?id "  BAvanAwmaka )" crlf))
)

