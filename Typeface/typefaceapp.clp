;;;======================================================
;;;   Typeface Expert System
;;;
;;;     This expert system helps decide
;;;     which font will be most suitable.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Type Face App
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display welcome-message)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-project-type ""
   (logical (start))
   =>
   (assert (UI-state (display start-message)
                     (relation-asserted project-type)
                     (response book)
                     (valid-answers book info news logo invi))))

;;; BOOK
(defrule determine-book-doubt ""
   (logical (project-type book))
   =>
   (assert (UI-state (display book-doubt)
                     (relation-asserted book-doubt-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-usability ""
   (logical (book-doubt-ans No))
   =>
   (assert (UI-state (display book-usability)
                     (relation-asserted book-usability-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-garamond-love ""
   (logical (book-usability-ans No))
   =>
   (assert (UI-state (display book-garamond-love)
                     (relation-asserted book-garamond-love-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-larger-eye ""
   (logical (book-garamond-love-ans Yes))
   =>
   (assert (UI-state (display book-larger-eye)
                     (relation-asserted book-larger-eye-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-sans-serif ""
   (logical (book-garamond-love-ans No))
   =>
   (assert (UI-state (display book-sans-serif)
                     (relation-asserted book-sans-serif-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-eric-gill ""
   (logical (book-sans-serif-ans No))
   =>
   (assert (UI-state (display book-eric-gill)
                     (relation-asserted book-eric-gill-ans)
                     (response good)
                     (valid-answers good bad))))

(defrule determine-book-humanistic ""
   (logical (book-eric-gill-ans bad))
   =>
   (assert (UI-state (display book-humanistic)
                     (relation-asserted book-humanistic-ans)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-book-food ""
   (logical (book-humanistic-ans Yes))
   =>
   (assert (UI-state (display book-food)
                     (relation-asserted book-food-ans)
                     (response gouda)
                     (valid-answers gouda emmental))))

;;; INFO
(defrule determine-info-condesed ""
   (logical (project-type info))
   =>
   (assert (UI-state (display info-condesed)
                     (relation-asserted info-condesed-ans)
                     (response Yes)
                     (valid-answers Yes No))))

;;; NEWS
(defrule determine-news-type ""
   (logical (project-type news))
   =>
   (assert (UI-state (display news-type)
                     (relation-asserted news-type-ans)
                     (response text-face)
                     (valid-answers text-face combination display))))

;;; LOGO
(defrule determine-logo-serif ""
   (logical (project-type logo))
   =>
   (assert (UI-state (display logo-serif)
                     (relation-asserted logo-serif-ans)
                     (response sans-serif)
                     (valid-answers sans-serif serif))))

;;; INVI
(defrule determine-invi-handwritten ""
   (logical (project-type invi))
   =>
   (assert (UI-state (display invi-handwritten)
                     (relation-asserted invi-handwritten-ans)
                     (response Yes)
                     (valid-answers Yes No))))

;;;****************
;;;* DECISION RULES *
;;;****************

(defrule akzidenz-grotesk-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display akzidenz-grotesk) (state final))))

(defrule arnhem-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display arnhem) (state final))))

(defrule baskerville-conclusions ""
   (logical (book-humanistic-ans No))
   => (assert (UI-state (display baskerville) (state final))))

(defrule bodani-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display bodani) (state final))))

(defrule caslon-conclusions ""
   (logical (book-doubt-ans Yes))
   => (assert (UI-state (display caslon) (state final))))

(defrule comic-sans-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display comic-sans) (state final))))

(defrule didot-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display didot) (state final))))

(defrule eurostile-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display eurostile) (state final))))

(defrule fedra-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display fedra) (state final))))

(defrule ff-din-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display ff-din) (state final))))

(defrule ff-enkrighthand-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display ff-enkrighthand) (state final))))

(defrule ff-meta-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display ff-meta) (state final))))

(defrule ff-scala-conclusions ""
   (logical (book-food-ans gouda))
   => (assert (UI-state (display ff-scala) (state final))))

(defrule franklin-gothic-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display franklin-gothic) (state final))))

(defrule frutiger-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display frutiger) (state final))))

(defrule futura-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display futura) (state final))))

(defrule garamond-conclusions ""
   (logical (book-larger-eye-ans No))
   => (assert (UI-state (display garamond) (state final))))

(defrule gotham-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display gotham) (state final))))

(defrule helvetica-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display helvetica) (state final))))

(defrule interstate-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display interstate) (state final))))

(defrule joanna-conclusions ""
   (logical (book-eric-gill-ans good))
   => (assert (UI-state (display joanna) (state final))))

(defrule letter-gothic-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display letter-gothic) (state final))))

(defrule lexicon-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display lexicon) (state final))))

(defrule metro-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display metro) (state final))))

(defrule miller-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display miller) (state final))))

(defrule minion-conclusions ""
   (logical (book-usability-ans Yes))
   => (assert (UI-state (display minion) (state final))))

(defrule myriad-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display myriad) (state final))))

(defrule ocr-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display ocr) (state final))))

(defrule optima-conclusions ""
   (logical (book-sans-serif-ans Yes))
   => (assert (UI-state (display optima) (state final))))

(defrule palatino-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display palatino) (state final))))

(defrule peignot-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display peignot) (state final))))

(defrule proforma-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display proforma) (state final))))

(defrule rotis-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display rotis) (state final))))

(defrule sabon-conclusions ""
   (logical (book-larger-eye-ans Yes))
   => (assert (UI-state (display sabon) (state final))))

(defrule swift-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display swift) (state final))))

(defrule syntax-conclusions ""
   (logical (book-food-ans emmental))
   => (assert (UI-state (display syntax) (state final))))

(defrule times-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display times) (state final))))

(defrule univers-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display univers) (state final))))

(defrule walbaum-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display walbaum) (state final))))

(defrule zapfino-conclusions ""
   (logical (XXX XXX))
   => (assert (UI-state (display zapfino) (state final))))

(defrule no-font ""
   (declare (salience -10))
   (logical (UI-state (id ?id)))
   (state-list (current ?id))
   => (assert (UI-state (display no-font) (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question
   (declare (salience 5))
   (UI-state (id ?id))
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
   =>
   (modify ?f (current ?id)
              (sequence ?id ?s))
   (halt))

(defrule handle-next-no-change-none-middle-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id)
   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
   =>
   (retract ?f1)
   (modify ?f2 (current ?nid))
   (halt))

(defrule handle-next-response-none-end-of-chain
   (declare (salience 10))
   ?f <- (next ?id)
   (state-list (sequence ?id $?))
   (UI-state (id ?id)
             (relation-asserted ?relation))
   =>
   (retract ?f)
   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id ?response)
   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
   (UI-state (id ?id) (response ?response))
   =>
   (retract ?f1)
   (modify ?f2 (current ?nid))
   (halt))

(defrule handle-next-change-middle-of-chain
   (declare (salience 10))
   (next ?id ?response)
   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
   (UI-state (id ?id) (response ~?response))
   ?f2 <- (UI-state (id ?nid))
   =>
   (modify ?f1 (sequence ?b ?id ?e))
   (retract ?f2))

(defrule handle-next-response-end-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id ?response)
   (state-list (sequence ?id $?))
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
   =>
   (retract ?f1)
   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
   (assert (add-response ?id ?response)))   

(defrule handle-add-response
   (declare (salience 10))
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   ?f1 <- (add-response ?id ?response)
   =>
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   (retract ?f1))   

(defrule handle-add-response-none
   (declare (salience 10))
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   ?f1 <- (add-response ?id)
   =>
   (str-assert (str-cat "(" ?relation ")"))
   (retract ?f1))   

(defrule handle-prev
   (declare (salience 10))
   ?f1 <- (prev ?id)
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
   =>
   (retract ?f1)
   (modify ?f2 (current ?p))
   (halt))
