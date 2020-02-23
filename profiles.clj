{:user {:plugins [
                  [lein-ancient "0.6.15"]
                  [cider/cider-nrepl "0.24.0"]
                  [org.tcrawley/dynapath "1.1.0"]
                  [lein-cljfmt  "0.6.6"]
                  ]
        :dependencies [[slamhound "1.5.5"]]}
        :repl-options { :init (require 'cljfmt.core)}}
