{:user {:plugins [[lein-pprint "1.2.0"]
                  [lein-cljfmt "0.6.4"]
                  [lein-ancient "0.6.15"]
                  [cider/cider-nrepl "0.21.1"]
                  [venantius/ultra "0.6.0"]
                  [org.tcrawley/dynapath "1.0.0"]
                  ]
        :dependencies [[slamhound "1.5.5"]]}
        :repl-options {:init (require 'cljfmt.core)}}
