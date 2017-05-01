## Visualization Code for Optimizing Radiation Problem Formulation
## Bernard Kung
## 04/30/2017




### Small Example Visualization

filepath_in <- c("F:/Media/Google Drive/GitHub/OptimizingRadiation/Input/")
filepath_out <- c("F:/Media/Google Drive/GitHub/OptimizingRadiation/Visualization/")

sm_tumr_raw <- read.table(paste(filepath_in, "small_tumor_raw.txt", sep = ""), header = FALSE)
sm_crit_raw <- read.table(paste(filepath_in, "small_critical_raw.txt", sep = ""), header = FALSE)
sm_beam_raw <- read.table(paste(filepath_in, "small_beam_raw.txt", sep = ""), header = FALSE)

sm_beam_v <- vector("list", 5)
sm_beam <- vector("list", 5)
rotate <- function(x) t(apply(x, 2, rev))

for (i in 1:length(sm_beam)) {
    
    sm_beam_v[[i]] <- do.call("c", sm_beam_raw[(8*i-7):(8*i), 1:8])
    sm_beam[[i]] <- matrix(sm_beam_v[[i]], nrow = 8)
    
    png(filename=paste(filepath_out, "beam",i, ".png", sep = ""))
    image(rotate(sm_beam[[i]]), col = cm.colors(128), axes = FALSE, main = paste("Small Beam", i))
    axis(1, at = seq(0,1, by=1/7), labels = seq(1,8))
    axis(2, at = seq(0,1, by=1/7), labels = seq(1,8), las = 2)
    dev.off()
    
    }

sm_tumr_v <- do.call("c", sm_tumr_raw)
sm_tumr <- matrix(sm_tumr_v, nrow = 8)

sm_crit_v <- do.call("c", sm_crit_raw)
sm_crit <- matrix(sm_crit_v, nrow = 8)

png(filename=paste(filepath_out, "small_tumor", ".png", sep = ""))
image(rotate(sm_tumr), col = cm.colors(128), axes = FALSE, main="Small Tumor Area")
axis(1, at = seq(0,1, by=1/7), labels = seq(1,8))
axis(2, at = seq(0,1, by=1/7), labels = seq(1,8), las = 2)
dev.off()

png(filename=paste(filepath_out, "small_critical", ".png", sep = ""))
image(rotate(sm_crit), col = cm.colors(128), axes = FALSE, main = "Small Critical Area")
axis(1, at = seq(0,1, by=1/7), labels = seq(1,8))
axis(2, at = seq(0,1, by=1/7), labels = seq(1,8), las = 2)
dev.off()


## Actual Example Visualization

filepath_in <- c("F:/Media/Google Drive/GitHub/OptimizingRadiation/Input/")
filepath_out <- c("F:/Media/Google Drive/GitHub/OptimizingRadiation/Visualization/")

ac_tumr_raw <- read.table(paste(filepath_in, "actual_tumor_raw.txt", sep = ""), header = FALSE)
ac_crit_raw <- read.table(paste(filepath_in, "actual_critical_raw.txt", sep = ""), header = FALSE)
ac_beam_raw <- read.table(paste(filepath_in, "actual_beam_raw.txt", sep = ""), header = FALSE)

ac_beam_v <- vector("list", 126)
ac_beam <- vector("list", 126)
rotate <- function(x) t(apply(x, 2, rev))

for (i in 1:length(ac_beam)) {
  
  ac_beam_v[[i]] <- do.call("c", ac_beam_raw[(60*i-59):(60*i), 1:80])
  ac_beam[[i]] <- matrix(ac_beam_v[[i]], nrow = 60)
  
  png(filename=paste(filepath_out, "Actual Beams/actual_beam",i, ".png", sep = ""))
  image(rotate(ac_beam[[i]]), col = cm.colors(128), axes = FALSE, main = paste("Actual Beam", i))
  axis(1, at = seq(0,1, by=1/8), labels = seq(0,80,10))
  axis(2, at = seq(0,1, by=1/6), labels = seq(0,60,10), las = 2)
  dev.off()
  
  }

png(filename=paste(filepath_out, "Actual Beams/actual_beam",1, ".png", sep = ""))
image(rotate(ac_beam[[1]]), col = cm.colors(128), axes = FALSE, main = paste("Actual Beam", 1), col = colors(128)[507])
axis(1, at = seq(0,1, by=1/8), labels = seq(0,80,10))
axis(2, at = seq(0,1, by=1/6), labels = seq(0,60,10), las = 2)
dev.off()


ac_tumr_v <- do.call("c", ac_tumr_raw)
ac_tumr <- matrix(ac_tumr_v, nrow = 60)

ac_crit_v <- do.call("c", ac_crit_raw)
ac_crit <- matrix(ac_crit_v, nrow = 60)

png(filename=paste(filepath_out, "actual_tumor", ".png", sep = ""))
image(rotate(ac_tumr), col = cm.colors(128), axes = FALSE, main="Actual Tumor Area")
axis(1, at = seq(0,1, by=1/8), labels = seq(0,80,10))
axis(2, at = seq(0,1, by=1/6), labels = seq(0,60,10), las = 2)
dev.off()

png(filename=paste(filepath_out, "actual_critical", ".png", sep = ""))
image(rotate(ac_crit), col = cm.colors(128), axes = FALSE, main = "Actual Critical Area")
axis(1, at = seq(0,1, by=1/8), labels = seq(0,80,10))
axis(2, at = seq(0,1, by=1/6), labels = seq(0,60,10), las = 2)
dev.off()

beam_map <- Reduce('+', ac_beam)

png(filename=paste(filepath_out, "actual_beam_map", ".png", sep = ""))
image(rotate(beam_map), col = rainbow(256), axes = FALSE, main="Actual Beams (Overlay)")
axis(1, at = seq(0,1, by=1/8), labels = seq(0,80,10))
axis(2, at = seq(0,1, by=1/6), labels = seq(0,60,10), las = 2)
dev.off()

