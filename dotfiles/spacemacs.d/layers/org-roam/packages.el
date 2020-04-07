(defconst org-roam-packages
  '((org-roam :location
        (recipe :fetcher github :repo "jethrokuan/org-roam" :branch "master"))))

(defun org-roam/init-org-roam ()
    (use-package org-roam
        :hook
        (after-init . org-roam-mode)
        :custom
        (org-roam-directory "~/Dropbox/zettelkasten/")
        :init
        (progn
          (spacemacs/declare-prefix "aoR" "org-roam")
          (spacemacs/set-leader-keys
            "aoRl" 'org-roam
            "aoRt" 'org-roam-today
            "aoRf" 'org-roam-find-file
            "aoRg" 'org-roam-show-graph)

          (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
          (spacemacs/set-leader-keys-for-major-mode 'org-mode
            "rl" 'org-roam
            "rt" 'org-roam-today
            "rb" 'org-roam-switch-to-buffer
            "rf" 'org-roam-find-file
            "ri" 'org-roam-insert
            "rg" 'org-roam-show-graph))))
