# hof-docs

Documentation website for _Hofstadter.


### Setup

Download a recent version of [Hugo](https://gohugo.io) __extended__.

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
