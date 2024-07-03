(require 'ox-latex)


                                        ;(require 'org-special-blocks)


; (require 'org-latex)
;(require 'org-special-blocks)

(setq org-latex-listings t)
(setq org-latex-prefer-user-labels t)


;(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))


;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))

;; Resout le conflit entre amsmath et wasysym
; (add-to-list 'org-export-latex-packages-alist '("" "amsmath" t))
;(setcar (rassoc '("wasysym" t) org-export-latex-default-packages-alist)	"integrals")

;(setq org-export-allow-BIND t)


;;% Remove option referee for final version

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot

;(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))
(add-to-list 'org-src-lang-modes '("dot" . "graphviz-dot"))

(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)


(setq org-export-allow-BIND t)

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("IEEEtran" "\\documentclass[conference]{IEEEtran}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-to-list 'org-latex-classes
             '("sigconf"
               "\\documentclass[sigconf]{acmart}
             [NO-DEFAULT-PACKAGES]
             [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\myparagraph{%s}" . "\\myparagraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("lncs"
               "\\documentclass[runningheads]{llncs}
             [NO-DEFAULT-PACKAGES]
             [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\myparagraph{%s}" . "\\myparagraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("elsarticle"
               "\\documentclass[preprint,12pt]{elsarticle}
             [NO-DEFAULT-PACKAGES]
             [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\myparagraph{%s}" . "\\myparagraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;;; to remove the \maketitle added by the org to tex compiler
(defun my-org-latex-remove-title (str)
  (replace-regexp-in-string "^\\\\maketitle$" "" str))

(advice-add 'org-latex-template :filter-return 'my-org-latex-remove-title)

; (with-eval-after-load 'ox-latex
;   (add-to-list 'org-latex-classes
;                '("llncs"
;                  "\\documentclass{llncs}
;       [NO-DEFAULT-PACKAGES]
;       [PACKAGES]
;       [EXTRA]"
;                  ("\\section{%s}" . "\\section*{%s}")
;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;(setq org-export-latex-tables-centered nil)
;(setq org-export-latex-table-caption-above nil)
;(setq org-export-with-smart-quotes t)

(setq org-export-latex-use-verb t)
;; espace insecable
;; convert `nbsp' to its LaTeX equivalent

(setq org-entities-user
      '(("space" "~" nil "&nbsp;" " " " " " ")))
