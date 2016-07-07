(require 'org-page)

(setq op/repository-directory
      (concat (file-name-as-directory (expand-file-name "~")) "blog"))

(setq op/site-main-title "Yao Adzaku")

(setq op/site-sub-title "")

(setq op/theme-root-directory
      (concat (file-name-as-directory (expand-file-name "~")) "blog_themes"))

(setq op/theme 'blagoblag)

(setq op/category-ignore-list '("themes" "assets" "media"))

(setq op/personal-github-link "http://github.com/rpip")

(setq op/category-config-alist
      (cons '("photography" :show-comment nil) op/category-config-alist))

(setq op/category-config-alist
      (cons '("zen" :show-comment nil) op/category-config-alist))

(provide 'org-page-config)
;;; org-page-config.el ends here
