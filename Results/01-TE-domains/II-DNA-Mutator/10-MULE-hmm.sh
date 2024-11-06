for i in MULE-00872 MULE-03108 MULE-10551 MULE-Rhiir
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
