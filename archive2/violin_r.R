library(ggplot2)

# Load the data from the file
data <- read.table("/home/sarwar/abhisek/script/violin_plot.txt")

violin[,3]<-log(data[3])
head (violin)

#df <-as.data.frame()



# Create the violin plot
#ggplot(data, aes(x="length", y= "SV")) +
 # geom_violin()

# Show the plot
#print(ggplot)
:
