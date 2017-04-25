{:user {:plugins [[lein-pprint "1.1.1"]
                  [lein-cljfmt "0.5.6"]
                  [cider/cider-nrepl "0.14.0"]
                  [venantius/ultra "0.5.1"]]
        :dependencies [[slamhound "1.3.1"]]}
        :repl-options {:init (require 'cljfmt.core)}}
