for i in DIRS-3714  DIRS-9275  DIRS-Rhiir
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
