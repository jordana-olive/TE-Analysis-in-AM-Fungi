for i in Ginger-1 Ginger-2
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
