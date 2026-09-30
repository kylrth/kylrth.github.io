SRCFILES = $(shell find assets content layouts static config.toml -type f -name '*')

public: $(SRCFILES)
	hugo --gc --minify

.PHONY: dev-server
dev-server:
	hugo server -D

.PHONY: lint
lint: public .htmltest.yml
	htmltest --skip-external
