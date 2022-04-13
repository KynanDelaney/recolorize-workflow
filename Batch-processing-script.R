# Clear environment.
rm(list = ls())

# Load in libraries.
library(recolorize)
library(beepr)

setwd("~/Edinburgh/My Data/recolorize-workflow/Pictures")

# List all images. 
images <- dir(pattern = ".jpg", full.names = F)
denom <- length(images)

# Loop for converting labelled images and exporting as .png files. 
# This tests out two levels of clustering and two levels of thresholding.
beep_on_error(
  for (i in 1:length(images)) {
  
  if (i == 1) {
    print("Getting started...")
  } else {
    print(paste0("Working on image ", i," of ", denom,"..."))
  }
  
  # Garbage collection to free up RAM
  gc()
  
  # Get an initial fit with specified clustering.
  K4 <- recolorize(images[i], method = "k", n = 4, 
                   color_space = "Lab")
  
  print(paste0("First fitting of image ", i," done..."))
  
  # Drop small patches.
  refined_K4 <- thresholdRecolor(K4, pct = 0.01)
  
  print(paste0("Second fitting of image ", i," done..."))
  
  # Export refined images for comparison.
  recolorize_to_png(refined_K4, filename = paste0("K4/",images[i]))
  
  if (i == denom) {
    print("Final save and clean-up..."); beep(sound = 3)
    } else {
      print(paste0("Batch ", (i/denom)*100,"% complete..."))
    }
  gc()
  
},
sound = 9)

