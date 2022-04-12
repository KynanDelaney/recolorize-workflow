
rm(list = ls())

library(recolorize)
library(patchwork)

id2 <- "Pictures/ID2.jpg"

# lighting variation (Fig. 2C)
direct_k2 <- recolorize(id2, method = "k", 
                       n = 2, color_space = "Lab", plotting = T)
direct_k3 <- recolorize(id2, method = "k", 
                       n = 3, color_space = "Lab", plotting = T)
direct_k4 <- recolorize(id2, method = "k", 
                       n = 4, color_space = "Lab", plotting = T)
direct_k5 <- recolorize(id2, method = "k", 
                        n = 5, color_space = "Lab", plotting = T)
direct_k6 <- recolorize(id2, method = "k", 
                        n = 6, color_space = "Lab", plotting = T)


plot(direct_k2, sizes = T, horiz = F)
plot(direct_k3, sizes = T, horiz = F)
plot(direct_k4, sizes = T, horiz = F)
plot(direct_k5, sizes = T, horiz = F)
plot(direct_k6, sizes = T, horiz = F)
