;;; init.el --- Where all the magic begins
;;
;; This file loads Org and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                    "lisp" (expand-file-name
                            "org" (expand-file-name
                                   "src" dotfiles-dir))))
          (org-contrib-dir (expand-file-name
                            "lisp" (expand-file-name
                                    "contrib" (expand-file-name
                                               ".." org-dir))))
          (load-path (append (list org-dir org-contrib-dir)
                             (or load-path nil))))
  ;; load up Org and Org-babel
  (require 'org)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

;;; init.el ends here

;;(org-babel-load-file
;; (expand-file-name
;;  "config.org"
;;  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-msg yasnippet-snippets yaml-mode which-key wgrep web-mode vterm visual-fill-column undo-tree typescript-mode tree-sitter-langs tide spacemacs-theme slime redshank ranger rainbow-delimiters python-pytest prettier-js plantuml-mode page-break-lines origami org-tree-slide org-roam org-present org-modern org-bullets org-alert ob-restclient multiple-cursors mu4e-views mu4e-alert magit lsp-ui lsp-pyright lsp-java lsp-ivy logview log4j-mode kotlin-mode key-chord json-mode js2-mode jinja2-mode jest-test-mode ivy-rich helpful general expand-region exec-path-from-shell evil-collection emms emmet-mode elfeed doom-themes doom-modeline dockerfile-mode dired-single dired-hide-dotfiles diff-hl dashboard dash-at-point csv-mode counsel-projectile company-restclient company-box centaur-tabs buttercup blamer all-the-icons ace-jump-mode))
 '(package-vc-selected-packages
   '((ultra-scroll :vc-backend Git :url "https://github.com/jdtsmith/ultra-scroll"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

