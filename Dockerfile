ARG BASE="coqorg/coq:8.20"
FROM ${BASE}
ARG ANALYSIS_VERSION="1.12.0"
ENV ANALYSIS_VERSION=${ANALYSIS_VERSION}

RUN set -x \
  && eval $(opam env "--switch=${COMPILER}" --set-switch) \
  && opam update -y -u \
  && opam pin add -n -k version coq-mathcomp-analysis ${ANALYSIS_VERSION} \
  && opam install -y coq-hierarchy-builder.1.8.1 \
  && opam install -y coq-mathcomp-analysis \
  && opam clean -a -c -s --logs \
  && chmod -R g=u /home/coq/.opam \
  && opam config list && opam list


