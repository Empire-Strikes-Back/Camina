#!/bin/bash

repl(){
  clj \
    -X:repl deps-repl.core/process \
    :main-ns mapspace.main \
    :port 7788 \
    :host '"0.0.0.0"' \
    :repl? true \
    :nrepl? false
}

main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -J-Dclojure.compiler.direct-linking=false \
    -M -m mapspace.main
}

uberjar(){
  clj \
    -X:uberjar genie.core/process \
    :uberjar-name out/mapspace.standalone.jar \
    :main-ns mapspace.main
  mkdir -p out/jpackage-input
  mv out/mapspace.standalone.jar out/jpackage-input/
}

"$@"