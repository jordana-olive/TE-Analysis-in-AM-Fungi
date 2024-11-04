#Rscript
######T TEST / BEFORE VS AFTER ANNOTATION   ##################################
dat <- read.csv("00-before-after.csv", header = TRUE, sep = "\t")
t.test(dat$before, dat$after, paired=TRUE) #t = -8.8947, df = 26, p-value = 2.291e-09
  

  library(ggtree)
  library(ggplot2)
  library(ggstance)
  library(ggtree)
  library(ggplot2)
  library(ggpubr)
  
  tree <- read.tree("/home/joliviei_UOTTAWA/Documents/00-Postdoc/10-all-AMF-TE/FUSION/OrthoFinder/Results_Feb02/AMF-reduced.tree")
  ki <- read.csv("/home/joliviei_UOTTAWA/Documents/00-Postdoc/10-all-AMF-TE/AMF Landscapes/00-TE-annotation-entire-genome-UPDATED.csv", header = TRUE)
  
  p <- ggtree(tree) +
    geom_treescale() + geom_tiplab(align = T, side="right")
  p <- flip(p, 49, 47) %>% flip(21, 20)
  
  ki$category <- factor(ki$category , levels=c("SINE", "LINE", "PLE", "DIRS", "LTR", "Maverick", "Helitron","Crypton","TIRS",  "Other", "Expanded", "Unknown",  "Unmasked"))
  
  p2 <- facet_plot(p, panel = 'genome', data = ki,
                   geom = geom_barh,
                   mapping = aes(x = value, fill = as.factor(category)),
                   stat='identity' )+
    scale_fill_manual(values = c("darkorange2","orange", "gold","greenyellow","springgreen3", "turquoise4", "dodgerblue4", "darkmagenta" ,"mediumvioletred", "black", "gray40","gray70", "gray88"))+
    theme_tree2()
  print(p2)

 ######################   FREQUENCY TE ON GENES
  
  library(ggpubr)
  
  data <- read.csv("03-genes-effect-sp-frequency.csv", header = TRUE)
  data$type <- factor(data$type , levels=c("Other", "SP", "effector"))
  data$species <- factor(data$species , levels=c("Innospora-majewskii",
                                                 "Paraglomus-brasilianum",
                                                 "Paraglomus-occultum",
                                                 "Geosiphon-pyriformis",
                                                 "Ambispora-leptoticha",
                                                 "Ambispora-gerdemannii",
                                                 "Claroideoglomus-candidum-CCK",
                                                 "Rhizophagus-irregularis",
                                                 "Septoglomus-turnauae",
                                                 "Funneliformis-mosseae",
                                                 "Funneliformis-caledonium",
                                                 "Diversispora-eburnea",
                                                 "Diversispora-epigaea",
                                                 "Acaulospora-colombiana",
                                                 "Acaulospora-morrowiae",
                                                 "Scutellospora-calospora",
                                                 "Cetraspora-pellucida",
                                                 "Racocetra-fulgida",
                                                 "Gigaspora-margarita-BEG34",
                                                 "Gigaspora-rosea-FL",
                                                 "Dentiscutata-erythropus",
                                                 "Dentiscutata-heterogama"))
   ggplot(data, aes(y = species, x = freq)) +
    geom_bar(aes(color = type, fill = type), stat = "identity", position = "dodge")+
    scale_x_continuous(labels = scales::percent) +
     scale_color_manual(values = c("#6A4C93", "#4CAF50", "#FFB74D")) +
     scale_fill_manual(values = c("#6A4C93", "#4CAF50", "#FFB74D"))  + theme_light()

#T-test
 dat <- read.csv("03-genes-effect-sp-frequency-test.csv", header = TRUE)
   t.test(dat$other, dat$SP, paired=TRUE) #t = -3.5723, df = 21, p-value = 0.001797
   t.test(dat$other, dat$effector, paired=TRUE) #t = -4.7438, df = 21, p-value = 0.00011
   t.test(dat$SP, dat$effector, paired=TRUE) #t = -4.32, df = 21, p-value = 0.0003023

