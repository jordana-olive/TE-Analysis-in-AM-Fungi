#!/bin/bash

#TE curation

#repeatmodeler
for i in Acaulospora-colombiana Acaulospora-morrowiae Ambispora-gerdemannii Ambispora-leptoticha Cetraspora-pellucida Claroideoglomus-candidum-CCK Claroideoglomus-lamellosum Dentiscutata-erythropus Dentiscutata-heterogama Diversispora-eburnea Diversispora-epigaea Funneliformis-caledonium Funneliformis-mosseae Geosiphon-pyriformis Gigaspora-margarita-BEG34 Gigaspora-rosea-FL Innospora-majewskii Paraglomus-brasilianum Paraglomus-occultum Racocetra-fulgida Racocetra-persica Rhizophagus-cerebriforme Rhizophagus-clarus Rhizophagus-diaphanus Rhizophagus-irregularis Scutellospora-calospora Septoglomus-turnauae
do
perl RepeatModeler-2.0.3/BuildDatabase -name 01-index-$i ../00-$i-genome.fasta
perl RepeatModeler-2.0.3/RepeatModeler -database 01-index-$i -pa 30 -LTRStruct
done

#combining repeat libraries from repeatmodeler
cat ../01-repeat-modeler/01-index/01-index-*-families.fa > 00-all-AMF-repeats.fa
seqkit seq -m 1000 -g 00-all-AMF-repeats.fa > 01-all-AMF-repeats-1000.fa
seqkit rmdup -s 01-all-AMF-repeats-1000.fa > 02-all-AMF-1000-nodup.fa

#relabeling
awk '{print $1}' 02-all-AMF-1000-nodup.fa | sed 's/#/\t/' | awk '/^>/{print ">AMF_" ++i "#"$2; next}{print}' | sed 's/#/\t/' | awk '{print $1}' > 03-all-AMF-repeatdb.fa
getorf -sequence 03-all-AMF-repeatdb.fa -outseq 05-AMF-repats-ORFs.aa -minsize 150

#HMMER
hmmscan --domtblout 06-domains-hmmer.domtblout --cpu 20 10-curated-domains.hmm 05-AMF-repats-ORFs.aa

grep 'AMF_' 06-domains-hmmer.domtblout | sed -r 's/(.*)_/\1 /' | awk '!x[$4]++' | awk '{OFS="\t"}{print $4, $1}' > 07-TE-domains-best-scores.txt
grep 'AMF_' 06-domains-hmmer.domtblout | sed -r 's/(.*)_/\1 /' | awk '!x[$4]++' | sed 's/#/\t/' | awk '{OFS="\t"}{print $4, $5, $1}' | sort -k2 > 08-TE-domains-best-scores.table
