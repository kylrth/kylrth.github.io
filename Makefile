SRCFILES = $(shell find assets content layouts static config.toml -type f -name '*')

public: $(SRCFILES)
	hugo --gc --minify

.PHONY: htmltest
htmltest: public .htmltest.yml
	htmltest
