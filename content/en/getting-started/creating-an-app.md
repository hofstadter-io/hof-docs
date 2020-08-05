---
title: "Creating an App"
date: 2019-03-13
draft: false
type: "page"

weight: 5
---

Hofstadter Studios enables you to create and deploy applications with ease.
Your development server is a real-time, cloud-native, hot-reloading, full-stack JS application
based on the [Apollo Universal Starter Kit](https://github.com/sysgears/apollo-universal-starter-kit).

#### Creating an Application

There are a number of starting applications available on GitHub.
A known list is maintained on [Studios Universe - Applications](/universe/applications).

To create a new application from the default, run the following.

Your application name should only contain lower-case letters and `-` hyphens.

```sh
hof app create "app-name"
```

You should see a response that indicates the app was created.

Now change to this directory.

```sh
cd "app-name"
```

##### Pushing, Deploying, and Database

Before you can use your application,
you will also need to push and deploy it.

```sh
hof app push
hof app deploy
```

The first deployment will take about 5 minutes.
You can check the status with:

```sh
hof app status
```

(It will show the below with errors for a few minutes)

Once you see:

```sh
https://app-name.username.live.hofstadter.io
username app-name
Client:   running
Server:   running
System:   running
```

your application is running.


Now create the initial database with:

```sh
hof db reset
```

Once this is complete,
you can follow the link
from `hof app status` above
to use your app.


#### Full Create Command

The create command can work off of a URL supporting git like
GitHub, GitLab, or Bitbucket.

```sh
hof app create "<name>" "<version>" "<template-url>"
```

example:

```sh
hof app create my-app beta "https://github.com/hofstadter-io/hof-starter-app"
```

- `name` is a kebab-style-name
- `version` is a Studios version
- `template-url` is a URL to a git repository

Studios versions can be found by running:

```sh
hof app versions
```

#### Logging into your application

By default, one admin and two users are created.
You can find the passwords in __design/seeds/users.json__
and we recommend changing them from the public defaults.
This way, when you reseed your database, the changed
passwords will be reused.

__Note, this is a different user and login
from your Hofstadter Studios account.
You application has it's own set of
users, modules, types, and pages.__


#### Modifying the initial users

If you want to change the initial users,
you will have to make changes in two places.

First, __design/seeds/users.json__, where the user object is filled in.
Second, __design-vendor/modules/account/seeds/default.json__,
where the profile and account for the default account module are.
You can follow the [process for making seed data in the next section](/getting-started/designing/#adding-seed-data),
copying the same file from the same path under the `design-vendor` directory.

Also note, that if you have imported any modules,
any default or custom seed files may need to be updated.
You can also put all of your seeds into the same file
and adjust the references within the modules’ `module.yaml` file.


#### Custom and Private Repositories

The create command has a longer format enabling the use
any git based repository or the local filesystem.
See the [Studios Universe - Applications documentation](/universe/applications) for more information.

Private repositories are supported for GitHub using
the `GITHUB_TOKEN` environment variable.

