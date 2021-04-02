(global-linum-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)
(setq-default indent-tab-mode nil)
(setq c-basic-offset 4)
(setq default-tab-width 4)
(global-hl-line-mode 1)

;;set windows undo and redo  
;;(when (fboundp 'winner-mode)  
(winner-mode 1)  
(global-set-key (kbd "C-x 4 u") 'winner-undo)  
(global-set-key (kbd "C-x 4 r") 'winner-redo)  
;;)  

;;fold
;;(hs-minor-mode t)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c / -") 'hs-hide-all)
(global-set-key (kbd "C-c / =") 'hs-show-all)
(global-set-key (kbd "C-c , -") 'hs-hide-block)
(global-set-key (kbd "C-c , =") 'hs-show-block)

;;(require 'geiser)
(setq geiser-active-implementations '(racket))
(defun geiser-save ()
 (interactive)
 (geiser-repl--write-input-ring))

(defun smooth-scroll (increment)
 (scroll-up increment) (sit-for 0.05)
 (scroll-up increment) (sit-for 0.02)
 (scroll-up increment) (sit-for 0.02)
 (scroll-up increment) (sit-for 0.05)
 (scroll-up increment) (sit-for 0.06)
 (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

(windmove-default-keybindings 'meta)

(setq ring-bell-function 'ignore)

;;set transparent effect  
(global-set-key [(f11)] 'loop-alpha)  
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))  
(defun loop-alpha ()  
 (interactive)  
 (let ((h (car alpha-list)))        ;; head value will set to  
  ((lambda (a ab)  
    (set-frame-parameter (selected-frame) 'alpha (list a ab))  
    (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
    ) (car h) (car (cdr h)))  
  (setq alpha-list (cdr (append alpha-list (list h))))  
  )  
) 

(defun onekey-compile ()
  "Compile current buffer"
 (interactive)
 (let (filename suffix progname compiler)
  (setq filename (file-name-nondirectory buffer-file-name))
  (setq progname (file-name-sans-extension filename))
  (setq suffix (file-name-extension filename))
  (if (string= suffix "c") (setq compiler (concat "gcc -g -o " progname " ")))
 ;;(if (or (string= suffix "cc") (string= suffix "cpp")) (setq compiler (concat "g++ -Wall -Wextra -Wshadow -std=c++11 -g -o " progname " ")))
 (if (or (string= suffix "cc") (string= suffix "cpp")) (setq compiler (concat "g++ -Wl,--stack=256000000 -std=c++11 -g -DLYC -o " progname " ")))
  (if (string= suffix "tex") (setq compiler "latex "))
 (if (string= suffix "java") (setq compiler "javac "))
  (compile (concat compiler filename))))
(global-set-key (kbd "<f5>") 'onekey-compile)

;;(set-face-attribute
;; 'default nil :font "Source Code Pro 10")

;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
 (set-fontset-font (frame-parameter nil 'font)
      charset
      (font-spec :family "Microsoft Yahei" :size 11)))

;;themes' path
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
  (quote
 ("86e90834c45e0cb06b231f66f248504c7abe3bb9c9df8d2fec74fad6cab838da" "dfab391ba4b68e5d3986f179804e2481218cac00ffd832281319b9d757941e93" "07586969d22d7e92f595657cefeaf0fa9eee79bf48bc6935322a782c5d6d25ee" "25ed1d587f51389966b4bbe883b257a2f35289eb2791dcfc74624f8ee7804ad9" default)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(nil nil t)
 '(package-archives
  (quote
 (("melpa" . "http://melpa.org/packages/")
  ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

