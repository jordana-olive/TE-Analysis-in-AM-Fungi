
#!/bin/bash

#TE-domains
#to generate the HMM model:
cat */*.hmm > 10-curated-domains.hmm
hmmpress 10-curated-domains.hmm


