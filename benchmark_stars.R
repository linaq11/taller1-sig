library(terra)
s2_path <- readLines("s2_shared_path.txt")
t0 <- Sys.time()
r <- rast(s2_path)
res <- r[[1]] * 1.5
m <- global(res, "mean", na.rm = TRUE)[1, 1]
t_final <- as.numeric(Sys.time() - t0, units = "secs")
cat(paste0("🟤 Terra: ", round(t_final, 3), " seg | mean = ", round(m, 6), "\n"))
