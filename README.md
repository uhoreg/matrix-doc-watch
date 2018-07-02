Matrix spec autobuilder
=======================

This image can be used to build the specification documentation for the Matrix
communications protocol, which can be found at
https://github.com/matrix-org/matrix-doc.  It  will watch the tree for file
changes, and automatically rebuild when it detects any changes.  It also
provides a web server, listening on port 8000, to serve the documentation.

Run it as:

```
docker run --rm -v [full-path-to-matrix-doc-dir]:/spec -u [your-userid] -p 8000:8000 uhoreg/matrix-doc-watch
```

See also `uhoreg/matrix-doc-build`.
