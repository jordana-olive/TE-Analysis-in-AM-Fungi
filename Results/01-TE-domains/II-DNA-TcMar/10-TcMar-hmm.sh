for i in TcMar-03184 TcMar-13358 TcMar-cenpb TcMar
do
mafft $i.aa > $i.align
esl-reformat stockholm $i.align > $i.stockholm
hmmbuild $i.hmm $i.stockholm
done
