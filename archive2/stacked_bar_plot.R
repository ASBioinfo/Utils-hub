library(ggplot2)

cattle_df <- data.frame(Breed = c("Sahiwal", "Red_sindhi", "Kankrej", "Tharparkar", "Gir"),
                        Syntenic = c(563253969, 565678522, 535517359, 503032529, 413340872),
                        Inversion = c(3125028, 5317975, 2298347, 2647949, 2688837),
                        Translocation = c(14915611, 17111694, 35009980, 56227464, 144005419),
                        Duplications = c(1132860, 1360229, 1301825, 1467263, 3826393),
                        Not_aligned = c(44075019, 37917050, 55178141, 69070685, 94807344))

cattle_df$Syntenic <- cattle_df$Syntenic / 10^6 # reducing size of synteny

ggplot(cattle_df, aes(x = Syntenic, y = Breed)) +
  geom_bar(aes(fill = "Syntenic"), stat = "identity") +
  geom_bar(aes(x = Syntenic + Inversion, y = Breed, fill = "Inversion"), stat = "identity", position = "stack") +
  geom_bar(aes(x = Syntenic + Inversion + Translocation, y = Breed, fill = "Translocation"), stat = "identity", position = "stack") +
  geom_bar(aes(x = Syntenic + Inversion + Translocation + Duplications, y = Breed, fill = "Duplications"), stat = "identity", position = "stack") +
  geom_bar(aes(x = Syntenic + Inversion + Translocation + Duplications + Not_aligned, y = Breed, fill = "Not aligned"), stat = "identity", position = "stack") +
  scale_fill_manual(values = c("Syntenic" = "blue", "Inversion" = "red", "Translocation" = "yellow", "Duplications" = "green", "Not aligned" = "gray")) +
  xlab("Number of base pairs (millions)") +
  ylab("Breed") +
  ggtitle("Genome-wide analysis of cattle breeds")
