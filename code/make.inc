GIT_ROOT   = $(shell git rev-parse --show-toplevel)
CUE_FILES  = $(shell find . -type f -name '*.cue' ! -path './cue.mod/pkg/*')
HTML_FILES = $(patsubst %.cue, %.html, $(CUE_FILES))

.PHONY: deps gen

deps:
	hof mod vendor cue
gen:
	hof gen ./examples

.PHONY: highlight code
highlight: $(HTML_FILES)
code: highlight

.PHONY: codefiles
codefiles: $(CUE_FILES)
	@for f in $(CUE_FILES); do echo $$f; done

.PHONY: htmlfiles cleanhtml
htmlfiles: $(HTML_FILES)
	@for f in $(HTML_FILES); do echo $$f; done
cleanhtml:
	@for f in $(HTML_FILES); do rm $$f; done

%.html: %.cue
	@echo highlight "$<" as "$@"
	@node $(GIT_ROOT)/ci/highlight.js < "$<" > "$@"
