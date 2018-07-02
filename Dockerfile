# Docker image to watch a Matrix spec tree and automatically rebuild on changes
# run as:
# docker run --rm -v [full-path-to-spec-dir]:/spec -u [your-userid] -p 8000:8000 matrix-doc-watch

FROM uhoreg/matrix-doc-build

RUN apt-get update \
 && apt-get install -y golang golang-github-fsnotify-fsnotify-dev \
 && ([ -d /usr/share/gocode/src/gopkg.in/fsnotify ] || mkdir /usr/share/gocode/src/gopkg.in/fsnotify) \
 && ([ -e /usr/share/gocode/src/gopkg.in/fsnotify/fsnotify.v1 ] || ln -s ../../github.com/fsnotify/fsnotify /usr/share/gocode/src/gopkg.in/fsnotify/fsnotify.v1)

ENV GOPATH=/usr/share/gocode

CMD ["/bin/bash", "-c", "source /env/bin/activate && go run scripts/continuserv/main.go"]
