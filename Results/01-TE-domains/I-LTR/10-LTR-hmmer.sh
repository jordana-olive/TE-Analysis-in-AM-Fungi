for i in LTR-7727 LTR-78 LTR-Bel LTR-Copia LTR-Gypsy
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
