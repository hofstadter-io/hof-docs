// Generator definition
#HofGenerator: gen.#HofGenerator & {
	OnceFiles: [...gen.#File] & [
			{
			TemplatePath: "index.html"
			Filepath:     "\(Outdir)/client/index.html"
		},
	]
}
