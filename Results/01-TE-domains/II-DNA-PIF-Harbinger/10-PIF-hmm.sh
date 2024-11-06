for i in PIF-13359 PIF-1609 PIF-4827 PIF
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
