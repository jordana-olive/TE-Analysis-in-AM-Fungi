for i in Maverick-Rhiir Maverick-end-7-2945 Maverick-parvo-0893 Maverick-pol-2-3175
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
