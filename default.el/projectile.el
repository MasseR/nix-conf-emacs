(use-package projectile
	     :config
	     (projectile-global-mode 1)
	     (setq
	      projectile-project-root-files '("rebar.config" "project.clj" "build.boot" "deps.edn" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS" "configure.in" "configure.ac" "cscope.out" "package.yaml" "*.cabal"))
	     )
