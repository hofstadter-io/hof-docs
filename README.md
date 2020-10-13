# hof-docs

Documentation website for _Hofstadter.


### Setup

Download a recent version of [Hugo](https://gohugo.io) __extended__ from https://github.com/gohugoio/hugo/releases. (make sure to get the "hugo_extended_..." version for your system)

```sh
npm install -g postcss-cli
npm install autoprefixer
```

### Running

```sh
hugo server
```

### Building

```
hugo --baseURL https://docs.hofstadter.io -d dist

docker build -t us.gcr.io/$PROJECT/docs.hofstadter.io:tag
docker push us.gcr.io/$PROJECT/docs.hofstadter.io:tag
```
