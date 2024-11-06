for i in Kolobok-0270 Kolobok-176648 Kolobok-Rhiir Kolobok
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
