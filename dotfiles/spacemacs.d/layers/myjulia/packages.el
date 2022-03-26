;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `myjulia-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `myjulia/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `myjulia/pre-init-PACKAGE' and/or
;;   `myjulia/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst myjulia-packages
  '(
    julia-mode
    lsp-julia
    julia-snail
    vterm
    )
  )

;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `myjulia/init-PACKAGE' to load and initialize the package.
(defun myjulia/init-julia-mode ()
  (use-package julia-mode
    :defer t
    )
  )

(defun myjulia/init-lsp-julia ()
  (use-package lsp-julia
    :defer t
    :init
    (with-eval-after-load 'lsp-mode
      (require 'lsp-julia))
    :hook (julia-mode . lsp)
    )
  )

(defun myjulia/init-julia-snail ()
  (use-package julia-snail
    :defer t
    :hook (julia-mode . julia-snail-mode)
    ;; :bind ("C-." . )
    :init
    (setq
     julia-snail-use-emoji-mode-lighter nil
     julia-snail-multimedia-enable t
     )
    ;; (define-key julia-snail-mode-map (kbd "<C-return>") 'julia-snail-send-line)
    (define-key julia-snail-mode-map (kbd "<S-return>") 'julia-snail-send-dwim)
    ;; (spacemacs/set-leader-keys-for-minor-mode 'julia-snail-mode
    ;;   "," 'julia-snail-send-dwim
    ;;   )
    (spacemacs/set-leader-keys-for-major-mode 'julia-mode
      "," 'julia-snail-send-dwim
      "'" 'julia-snail
      )
    )
  )
