module github.com/Antitribu/hue_exporter

go 1.20

require (
	github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc
	github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf
	github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973
	github.com/collinux/gohue v0.0.0-20180804205835-ac9bc5f7e4dc
	github.com/golang/protobuf v1.1.0
	github.com/matttproud/golang_protobuf_extensions v1.0.1
	github.com/prometheus/client_golang v0.8.0
	github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910
	github.com/prometheus/common v0.0.0-20180801064454-c7de2306084e
	github.com/prometheus/procfs v0.0.0-20180725123919-05ee40e3a273
	github.com/sirupsen/logrus v1.0.6
	golang.org/x/crypto v0.0.0-20180808211826-de0752318171
	golang.org/x/sys v0.0.0-20180810173357-98c5dad5d1a0
	gopkg.in/alecthomas/kingpin.v2 v2.2.6
	gopkg.in/yaml.v2 v2.2.1
)

replace github.com/collinux/gohue => github.com/mitchellrj/gohue v0.0.0-20180804205835-ac9bc5f7e4dc
