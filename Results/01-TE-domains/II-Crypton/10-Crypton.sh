for i in Crypton
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
