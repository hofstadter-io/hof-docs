---
title: "Designing"
date: 2019-04-01
draft: false
type: "page"

weight: 6
---

Designs are a central concept in the __Hofstatder Studios__ system,
and represent the _source-of-truth_ to your application.
Apps are groups of modules, modules are groups of types,
and all have pages, components and customization.
As you modify your designs, you push your application,
and your live server will update to reflect the changes.

The next few _Getting Started_ steps will walk you through
some of the __Hofstadter Studios__ concepts.
We will use a note taking application as an example.
Most sections are explanitory.
Those starting with "Note Taking Example - ..."
are the sections containing
files to create or update,
as well as the __hof__ commands to run.

- [Application Folder](#application-folder)
- [Design Folder](#design-folder)
- [Note Taking Example - First Changes](#note-taking-example-first-changes)
- [Creating New Functionality](#creating-new-functionality)
  - [Creating a Module](#creating-a-module)
  - [Creating a Type](#creating-a-type)
  - [Pages and Components](#pages-and-components)
- [Note Taking Example - Create](#note-taking-example-create)
- [Content, Data, and Mutations](#content-data-and-mutations)
  - [Content JSX and SCSS](#content-jsx-and-scss)
  - [Layout and Styling Libraries](#layout-and-styling-libraries)
  - [Using Data and Mutations](#using-data-and-mutations)
- [Note Taking Example - Content](#note-taking-example-content)
- [Note Taking Example - Checkpoint](#note-taking-example-checkpoint)
- [Custom Logic and Events](#custom-logic-and-events)
- [Custom and Private Repositories](#custom-and-private-repositories)

### Application Folder

At the root of your application,
you will see an important
directory named `design`.
This is the "design" of your application.
You will see a number of files here,
for configuring the app features,
as well as a `modules` directory,
where your modules will go.

The application directory overview:

```
<app-name>/  # your application directory
│
│   # Main application design
├── design/            # your design
├── design-vendor/     # imported modules
│
│   # secrets are not uploaded with a push
│   # these are handled differently
├── secrets/     # for application secrets
│
│   # coming soon
└── funcs/       # serverless functions
```


### Design Folder

Design represent the state you wish your application to be in.
They are data files written in specific formats, called DSLs.
While the examples are in yaml, you can intermix json, xml, toml, and hof-lang as well.
[Documentation for Designs](/reference/designs) are found in the reference section.

The design directory overview: (also design-vendor)

```
design
│
│   # Application Design
├── app.yaml
├── meta.yaml
├── config.yaml
├── users.yaml
├── auth.yaml
│
├── layout.yaml
├── pages.yaml
├── components.yaml
│
├── imports.yaml  # NPM imports
├── modules.yaml  # list of modules to enable
│
│   # Application non-design files
├── pages/             # for page content and layouts
├── components/        # for component content and layouts
├── translations/      # and multilingual assets
├── seeds/             # application seed data
│
│
│   # Module and Type Files
└── modules/
   └─<module-name>
       │   # Module Design
       ├── module.yaml
       │
       │   # Type Design
       ├── <type-name-1>.yaml
       ├── <type-name-2>.yaml
       ├── ...
       │
       │   # Content and other files
       ├── pages/
       ├── components/
       ├── locales
       └── seeds/

```

We’ll get to know the various directories and files
as we go through this page.
More detailed information is available
in the other major sections.


### Note Taking Example First Changes

We will start by updating the title and homepage,
and then pushing the code to see the changes.

#### Changing the Title

We will start by making our own updates to the app, modules, types, pages, and components.

The first thing you may want to do is
change the Title of your application.
You can do this by editing:

__design/app.yaml__ and changing the "title" field.

```yaml
app:
  name: my-app
  title: "My Studios App"
```

#### Customizing the Home Page

Let's change the home page to
greet the user if logged in.

##### Update the design

First, we need to inject the
current user data into the page context.

You can find the design in __design/pages.yaml__:

```yaml
app:
  name: my-app

  pages:

    - name: home
      route: "/"
      style:
        - "design/pages/home/home.scss"
      content:
        - "design/pages/home/home.html"
      translations:
        - name: en
          file: design/pages/home/locales/en.json
        - name: es
          file: design/pages/home/locales/es.json


      # Add the following
      current-user: true
```

##### Update the content

Then, we can add JSX code
to render the user's username.

Change the content in __design/pages/home/home.html__ to:

```jsx
<div id="home-content">

<h1>{ t('messages.hello') }, { props.currentUser ? props.currentUser.username : "anonymous" }</h1>

<p>Welcome to my first Studios app!</p>

</div>
```

##### Update the application

Now we can update the application
to see the changes.

Run:

```sh
hof app push
```

and you will see your application update.

##### What we did

In a few lines,
we injected the current user into
the home page and created a personalize geeting.
You can also inject other data related to the user
or create reusable components the same way.

What we didn't do was create a user,
setup an auth system or database,
or link it to the front end.
__Hofstadter Studios__ handles all that for you.

You can focus on your application.
Start with modules and types,
create pages and components,
declare the data and rules,
design the layout and styling.


### Creating New Functionality

There are several objects in __Hofstadter Studios__
with which you can extend and customize your application:

- __modules__ - collections of types, pages, and components.
- __types__ - the data objects in your system.
- __pages__ - for apps, modules, and types.
- __components__ - for apps, modules, and types.
- __functions__ - serverless hooks and events.

After creating the application, you will:

- organize and shape the data with modules and types.
- display and style with pages and componets.

The full new command options are in
[Studios Universe - Templates documentation](/universe/templates).

#### Creating a Module

__Modules__ group types and can include
pages, components, translations, and other files.
You can create a module by running:

##### hof new module

```sh
hof new module "design/modules/<module-name>"
```

##### module directory layout

This will create a skeleton of
directories, designs, and other files:

```
design/modules/
└── <module-name>
    ├── module.yaml
    ├── pages/
    │   └── <page-name>/
    │       ├── content.jsx
    │       └── style.scss
    ├── components/
    │   └── <component-name>/
    │       ├── content.jsx
    │       └── style.scss
    ├── locales
    │   ├── en.json
    │   └── es.json
    └── seeds/
        └── default.json
```

##### module design file

```yaml
module:
  name: ...

  types:
    - type-name-a
    - type-name-b

  pages: ...
  components: ...
  translations: ...
  seeds: ...
  files: ...
  ...
  # and more
```


#### Creating a Type

__Types__ represent your application’s
data or models, the fields, ownership, visibility,
the relationships, permissions, rules, hooks, events, and more.

##### hof new type

```sh
hof new type "design/modules/<module-name>/<type-name>"
```

##### type directory layout

The new type command only creates a single file.

```
design/modules/
└── <module-name>
    │
    │   # The new file
    └── <type-name>.yaml
```

##### type design file

```yaml
type:
  name: "<type-name>"

  fields: ...
    - name: ...
      type: ...
      ...

  relations: ...
    - name: ...
      type: type.modules.module-name.type-name
      relation: "one-to-one|one-to-many|many-to-many|..."

  owned:
    name: .. (optional)
    type: "has-one|has-many"
    ...

  lookup: ...
  visibility: ...

  auth:
    view: ...
    create: ...
    ...

  pages: ...
  components: ...
  translations: ...
  seeds: ...
  files: ...
  ...
  # and more
```

#### Pages and Components

New pages and components can appear
at the app, module, or type level.
You can substitue “component” for “page”
in the subsections that follow.

##### hof new page

New Pages can appear under

```sh
# App page:
hof new page "design/<page-name>"

# Module page:
hof new page "design/modules/<module-name>/<page-name>"

# Type page:
hof new page "design/modules/<module-name>/<type-name>/<page-name>"
```

##### page directory layout

```
design/modules/
├── <module-name>
│   ├── <type-name>.yaml
│   │   │
│   │   │   # New Page Layout
└───└───└── page-<page-name>.yaml
            └── pages
                └── <page-name>
                    ├── content.html
                    └── style.scss

```

##### page content design


The design file layout for pages and components:

```yaml
app/module/type:
  name: ...

  pages:
    - name: <page-name>
      route: "/route/path"
      style:
        - design/path/to/style.scss
      content:
        - design/path/to/content.html

      imports: ...       # custom imports, pages only
      components: ...    # custom components
      translations: ...  # internationalization files

      # Inject data into the page or component
      #   the current user in the page data
      current-user: boolean
      data: ...
```

You can find the full format starting with the
[page snippet in the reference section](/reference/designs/common/helpers/#pages-snippet)


##### page data design

The current user and type data can be injected into pages and components.
You can combine data from any type, local or across modules.

```
pages/components:
  - name: ...
    ...

    # Include the current, authenticated user information
    current-user: true

    # A list of type data to inject
    data:

        # The name will be accessigble from “props.name”
      - name: name-in-props

        # the dotpath to the type
        type: "type.modules.<module-name>.<type-name>"

        # Load data configuration
        query:
          # single object or a list
          type: "view" or "list"

          # whether the data should be real-time updated
          sync: true/false

          # ways to limit what data is sub selected or looked up
          filters: ...
          variables: ...

        # mutation functions accessible from "props.createTypeName”
        mutations:
          - create
          - update
          - delete

```

[Full Reference](/reference/designs/common/helpers/#data-snippet)


### Note Taking Example Module

Let’s now create a notes module, type, and page.
We’ll fill them in after learning how.

##### New module, type, and page

```sh
# create the module
hof new module design/modules/notes

# create the type
hof new type design/modules/notes/note

# create the page
hof new page design/modules/notes/board
```

##### Output folder layout

```sh
design/modules/notes/
│
├── module.yaml
├── note.yaml
│
├── pages
│   ├── board.yaml
│   └── board
│       ├── content.jsx
│       └── style.scss
├── components
│
├── locales
│   ├── en.json
│   └── es.json
└── seeds
    └── default.json
```

##### Wiring the app, modules, and types together

First add the name of the module to the application.

`design/modules.yaml`

```yaml
app:
  name: ...

  modules:
    - account
    - notes
```


Then, in the module design,
add the name and type location.

`design/modules/notes/module.yaml`

```yaml
module:
  name: notes

  types:
    - name: note
      type: type.modules.notes.note
```

##### What we did

We started to scaffold out our
new "notes" module and "note" type.
We first created the files
with the __hof__ tool and then wired
the type to the module
and
the module ot the app.

Before we push any changes,
we need to learn about
filling in this new
module and type with content.


### Content, Data, and Mutations

Content is rendered from React Components.
You can set the content and add styling.
Both design configurations accept ordered lists
so you can break your React code into multiple files.

#### Content JSX and SCSS

##### Page Content

The JSX returned from a React Component `render()`,
make sure to have a single matching tag and to close all tags.

```jsx
<div>
  ...
  // use data and mutations from the “props” object.
</div>
```

##### Component Content

Any new functions you want, you are in a React Component Class with ES6.
Note, React component life cycle functions require calling the previous declaration.

Component is in a React Component Class:

```jsx
// create functions here
...

render() {
  console.log(this.props)

  return (
    <div>
      ...
      // use data, mutations, and any functions
    </div>
  )
}
```

There are also ways to support full custom components,
please see the other major sections of the documentation.

#### Layout and Styling Libraries

##### SCSS files

You can use SASS for styling.

https://sass-lang.com/

The files specified in the design list are injected in-order.

##### Bootstrap Framework

You can use anything from the Bootstrap Framework.

https://getbootstrap.com/docs/4.3/components/alerts/

__Note, you have to substitute__ `className` when you see `class`
because the content is JSX.

https://reactjs.org/docs/introducing-jsx.html


##### Custom Library Imports

You can import libraries from NPM to include in your application,
please see the other major sections of the documentation.


#### Using Data and Mutations

The data and mutations you specifiy in your design
will be attached to the props object in your content.

##### current-user

`current-user` is attached to the props object.
You can find the included data using the following code.

```
<div>
  <h1>Current User: { props.currentUser.username }</h1>
  <pre>{ JSON.stringify(props.currentUser, '', '    ') }</pre>
</div>
```

##### data and loading

The data is attached by `name` to the props object as well.
It also includes a loading property. The formats are
`dataName` and `loadingDataName`, where `data-name`
is the name you gave to the content data in the designs.

```
<div>
  { loadingNote ?
  <pre>loading...</pre>
  :
  <pre>{ JSON.stringify(props.note, '', '    ') }</pre>
  }
</div>
```

##### calling mutation functions

The data is attached by name to the props object as well.
The format is `mutationTypeName`.

```
<div>
  <button className=”btn btn-danger” onClick={ () => props.deleteNote(props.note.id) }>delete</button>
  <hr />
  { loadingNote ?
  <pre>loading...</pre>
  :
  <pre>{ JSON.stringify(props.note, '', '    ') }</pre>
  }
</div>
```


### Note Taking Example Content

We can now design our module, type, and page.

##### Design the Module

You shouldn’t have to actually do anything at this point.

__design/modules/notes/module.yaml__

```yaml
module:

  name: notes

  types:
    - name: note
      type: type.modules.notes.note

  components: []
  pages: []
  files: []

  translations:
  - name: en
    file: design/modules/notes/locales/en.json
  - name: es
    file: design/modules/notes/locales/es.json

  seeds:
    file: design/modules/notes/seeds/default.json
    types:
     - name: note
       data: notes
       type: type.modules.notes.note

```

##### Design the Type

This is what the file should look like.
We are setting the owned type and adding a content field.

__design/modules/notes/note.yaml__

```yaml
type:
  name: note

  owned:
    type: has-many

  visibility:
    enable: true
    default: false

  auth:
    default: true

  components:
    default: true

  pages:
    default: true

  fields:
  - name: name
    type: string
    length: 64
  - name: content
    type: text

  relations: []

  # forms: []
  files: []
```

##### Design the Page

This is what the file should look like.
We are setting the route to "/board",
adding the current user, and
injecting the users note data.

__design/modules/notes/page-board.yaml__

```yaml
module:
  name: notes

  pages:
    - name: board
      route: "/board"


      style:
        - "design/modules/notes/pages/board/style.scss"

      content:
        - "design/modules/notes/pages/board/content.html"

      components: []

      current-user: true

      data:
        - name: notes
          type: type.modules.notes.note
          query:
            type: list
            sync: true

```

We’ll make this a nice card base layout.

__design/modules/notes/pages/board/content.html__

```
<div className="container">
  <h1 className="row">{ props.currentUser.username }’s Notes</h1>
  <div className="row">
    <div className="col">
     { props.loadingNotes ? <pre>loading...</pre>
     : (props.notes && props.notes.edges && props.notes.edges.length > 0 ?
     props.notes.edges.map( (edge) => {
         let note = edge.node;

         return (
          <div key={ note.id } className="card" style={ { width: "18rem" } }>
            <div className="card-body">
              <h5 className="card-title">{ note.name }</h5>
              <p className="card-text">{ note.content }</p>
              <Link className="btn btn-primary" to={ "/note/edit/" + note.id }>
                edit
              </Link>
            </div>
          </div>
         )

       } )
       : <p>no notes</p> )
     }
    </div>
  </div>
</div>
```

##### Navbar menu items

We'll want to provide a way for users to navigate
to our new module.

__design/layout.yaml__

```yaml
app:
  name: ...
  
  ...

  layout:
    ...

    navbar:
      ...

      leftItems:
        - name: board
          href: "/board"
          roles:
            - user
            - admin
        - name: notes
          href: "/note/list"
          roles:
            - user
            - admin
        ...
      ...
    ...
  ...
```

##### Adding seed data

You can create example notes
so that when the database updated,
there is existing data.

In the file __design/modules/notes/seeds/default.json__,
set the contents to:

```json
{
  "notes": [
    {
      "owner": "admin",
      "name": "my note",
      "content": "test content"
    },
    {
      "owner": "bob",
      "name": "some note",
      "content": "eh?"
    },
    {
      "owner": "alice",
      "name": "a list",
      "content": "item1, item2, item3"
    }
  ]
}
```

##### Adding translation data

In order to support multi-linual applications,
we need to supply translation files.
These are JSON documents with key to word mappings.
We will only be setting the english mapping for now.
You can learn more about translations and internationalization
in other sections of the documentation.

In the file __design/modules/notes/locales/en.json__,
set the contents to:

```json
{
  "note": {
    "field": {
      "name": "Name",
      "content": "Content",
      "isPublic": "Public"
    },
    "btn": {
      "submit": "Submit"
    }
  }

}
```

##### Development updates

As you change your designs and files,
you can update your live application.

When you:

- create a new type or module
- change the seed data
- change a type's field, ownership, or visibility

There is a two step process for updating the application:

```
hof app push
hof db reset
```

This will:

1. push the code, updating the client and server
2. reset, migrate, and seed the database

Once the database is reset, you can
create, update, delete, and view your notes.
You can continue doing this until
you are happy with your application
and are ready to checkpoint the changes.



### Note Taking Example Checkpoint

To make a lasting checkpoint to your
application, we need to create a migration.
This 

Ensure that the latest code has been pushed to the server
and you have run the database reset
so that the schema is up-do-date.

To make a checkpoint, run:

```sh
hof db checkpoint
```

This will run the checkpointing process
and ensure your database never regresses
before this point in time.
You can now make new changes
and repeat the push / reset
development workflow.


### Custom Logic and Events

Serverless functions as well as built-in hooks, handlers and, integrations.

```sh
hof new func "<name>" "<template>"
hof func create "<name>" "<runtime>"
hof func "<command>" "<name>"
```

coming soon!




### Custom and Private Repositories

The new command has a longer format enabling the use
any git based repository or the local filesystem.
See the [Studios Universe - Templates documentation](/universe/templates) for more information.

Private repositories are supported for GitHub using
the `GITHUB_TOKEN` environment variable.


