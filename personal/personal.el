(prelude-require-packages '(solarized-theme))
(prelude-require-packages '(paredit))
(prelude-require-packages '(neotree))
(prelude-require-package 'key-chord)

(setq mac-option-modifier 'none
      mac-command-modifier 'meta
      mac-right-command-modifier 'super)

(load-theme 'solarized-dark t)

(require 'key-chord)
(key-chord-mode 1)

; Hooks

(add-hook 'clojure-mode-hook 'paredit-mode)

(defun kill-region-or-word ()
  "Call `kill-region' or `backward-kill-word' depending on whether or not a region is selected."
  (interactive)
  (if (and transient-mark-mode mark-active)
    (kill-region (point) (mark))
    (backward-kill-word 1)))

; Key chords

(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

; Keybindings

;; Set Ctrl-w to backward-kill-word as described in Steve Yegge’s post
;; “Effective Emacs”: https://sites.google.com/site/steveyegge2/effective-emacs
;; But bound it to a variant as described in the following post that preserves
;; the original function of this keybinding if a region is selected:
;; http://ruslanspivak.com/2010/09/22/c-w-to-delete-word-backward-in-conkeror/
(global-set-key (kbd "C-w") 'kill-region-or-word)

(global-set-key (kbd "C-+") 'sanityinc/increase-default-font-height)
(global-set-key (kbd "C--") 'sanityinc/decrease-default-font-height)
