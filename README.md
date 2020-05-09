# Common Lisp on Heroku -- Example Project

This project is an example of how to deploy a common lisp server to
heroku using docker.

## Instructions:

[Fork](/fstamour/heroku-cl-example/fork_select) or clone this project
(and optionally modify it with your own content).

Get yourself set up with a [Heroku account and
tools](http://devcenter.heroku.com/articles/quickstart).

Install heroku's command line interface.

Make sure you're logged in with heroku:
```shell
$ heroku login
```

Then log into heroku's docker registry:
```shell
$ heroku container:login
```

Create your own Heroku application:
```shell
$ heroku create
```

Then you can push the docker image to heroku's repository (the docker image
will be built locally):
```shell
$ heroku container:push --recursive
```

You can then release the docker image:
```shell
$ heroku container:release web
```

Finally, you call open the application:
```shell
$ heroku app:open
```

That's it!

## More details:

The docker image is based on ubuntu (latest), it has multiple stages
to try to shorten the build time.
1. Stage `basepackages` contains the OS and a few packages (like sbcl)
   needed at build- and run-time.
1. Stage `quicklisp` install and configure quicklisp. Notably, it also
   installs ironclad because it's a package that takes a while to
   compile.
1. Stage `dependencies` is the first stage that depends on the
   application's code. It uses only 2 files from the context (the
   directory from which docker copies the files). It uses the file
   `example.asd` to know what are the (quicklisp) dependencies of the
   application. And it uses `compile-dependencies.lisp` to build an
   image (`dependencies.core`) that contains all the application's
   dependencies.
1. Stage `build` copies all the source files, load `dependencies.core`
   and load the (common lisp) system `example` and create an
   executable called `lispapp`. The entry-point of the executable is
   the function `example:start`.

> It would be possible to improve the size of the docker image by
> including only the `lispapp` executable in an extra stage at the
> end.
