for i in CMC-EnSpm CMC-Plavaka
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
