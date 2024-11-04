
#!/bin/bash

#SignalP

for i in Acaulospora-colombiana Acaulospora-morrowiae Ambispora-gerdemannii Ambispora-leptoticha Cetraspora-pellucida Claroideoglomus-candidum-CCK Claroideoglomus-lamellosum Dentiscutata-erythropus Dentiscutata-heterogama Diversispora-eburnea Diversispora-epigaea Funneliformis-caledonium Funneliformis-mosseae Geosiphon-pyriformis Gigaspora-margarita-BEG34 Gigaspora-rosea-FL Innospora-majewskii Paraglomus-brasilianum Paraglomus-occultum Racocetra-fulgida Racocetra-persica Rhizophagus-cerebriforme Rhizophagus-clarus Rhizophagus-diaphanus Rhizophagus-irregularis Scutellospora-calospora Septoglomus-turnauae
do
signalp6 --fastafile ../$i-protein.fa --organism eukarya --output_dir $i --format txt --mode fast
done
