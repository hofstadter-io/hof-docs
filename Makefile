CUE_FILES  = $(shell find code/ -type f -name '*.cue' ! -path './code/vendor/*' ! -path '*/cue.mod/*')
HTML_FILES = $(patsubst code/%.cue, code/%.html, $(CUE_FILES))
TAG        = $(shell git rev-parse --short HEAD | tr -d "\n")
PROJECT    = "hof-io--develop"

config.yaml: config.cue
	cue export config.cue --out yaml --outfile config.yaml --force

.PHONY: dev
dev: config.yaml
	@hugo serve --bind 0.0.0.0 --buildDrafts --buildFuture

.PHONY: prd
prd: config.yaml
	@hugo serve --bind 0.0.0.0

.PHONY: all
all: config.yaml highlight hugo docker deploy

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

code/%.html: code/%.cue
	@echo highlight "$<" as "$@"
	@node ci/highlight.js < "$<" > "$@"

.PHONY: hugo
hugo:
	@rm -rf dist
	@hugo --baseURL https://docs.hofstadter.io/ -d dist

.PHONY: docker
docker: image push

.PHONY: image
image:
	@docker build --no-cache -f ci/Dockerfile -t us.gcr.io/$(PROJECT)/docs.hofstadter.io:$(TAG) .

.PHONY: nginx
nginx:
	@docker run --rm -it -p 8080:80 --name hof-docs us.gcr.io/$(PROJECT)/docs.hofstadter.io:$(TAG)

.PHONY: push
push:
	@docker push us.gcr.io/$(PROJECT)/docs.hofstadter.io:$(TAG)

.PHONY: deploy
deploy:
	@cue export ci/cuelm.cue -t version=$(TAG) -e Install | kubectl apply -f -

.PHONY: deploy-view
deploy-view:
	@cue export ci/cuelm.cue -t version=$(TAG) -e Install


.PHONY: verify_code verify_code verify_diff
verify: verify_code highlight verify_diff

verify_diff:
	@git diff --exit-code code/

verify_code:
	make -C code all

fmt: cuefmt gofmt

.PHONY: cuefmt cuefiles
cuefiles_all:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' -print
cuefiles:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -print
cuefmt:
	find code/ -type f -name '*.cue' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -exec cue fmt {} \;

.PHONY: gofmt gofiles
gofiles_all:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' -print
gofiles:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -print
gofmt:
	find code/ -type f -name '*.go' '!' -path '*/cue.mod/*' '!' -path '*/templates/*' '!' -path '*/partials/*' '!' -path '*/.hof/*' -exec gofmt -w {} \;

