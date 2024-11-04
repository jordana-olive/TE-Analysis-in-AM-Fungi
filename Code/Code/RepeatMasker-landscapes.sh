
#!/bin/bash

#RepeatMasker-landscapes

for i in Acaulospora-colombiana Acaulospora-morrowiae Ambispora-gerdemannii Ambispora-leptoticha Cetraspora-pellucida Claroideoglomus-candidum-CCK Claroideoglomus-lamellosum Dentiscutata-erythropus Dentiscutata-heterogama Diversispora-eburnea Diversispora-epigaea Funneliformis-caledonium Funneliformis-mosseae Geosiphon-pyriformis Gigaspora-margarita-BEG34 Gigaspora-rosea-FL Innospora-majewskii Paraglomus-brasilianum Paraglomus-occultum Racocetra-fulgida Racocetra-persica Rhizophagus-cerebriforme Rhizophagus-clarus Rhizophagus-diaphanus Rhizophagus-irregularis Scutellospora-calospora Septoglomus-turnauae
do
perl RepeatMasker -pa 10 -s -a -dir RM-$i -lib 10-TE-w-domains-curated.fa 00-$i-genome.fasta
perl RepeatMasker/util/calcDivergenceFromAlign.pl -s RM-$i.summary RM-$i/00-$i-genome.fasta.align
done
