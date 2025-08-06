#!/bin/sh
set -eux
## ↓ Choose from https://hub.docker.com/r/coqorg/coq#supported-tags-and-respective-dockerfile-links or https://hub.docker.com/r/rocq/rocq-prover/tags
COQ="8.20-ocaml-4.14-flambda"
BASE="coqorg/coq:$COQ"
## ↓ Choose from https://github.com/math-comp/analysis/tags
ANALYSIS="1.12.0"
TAG="$ANALYSIS-coq-$COQ"
docker build --platform linux/amd64 -t mathcomp-analysis:$TAG \
  --build-arg BASE="$BASE" --build-arg ANALYSIS_VERSION="$ANALYSIS" .
docker tag mathcomp-analysis:$TAG yoshihiro503/mathcomp-analysis:$TAG
echo docker push yoshihiro503/mathcomp-analysis:$TAG

