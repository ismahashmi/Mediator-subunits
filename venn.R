
install.packages("VennDiagram")    #Install VennDiagram package
library("VennDiagram") #Load VennDiagram package

##Example 1
grid.newpage()   #move to new plotting page
draw.single.venn(area = 11666) #Create a single venn diagram

#Example 2
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Create pairwise venn diagram
                   area2 = 13298,
                   cross.area = 3377)

#Example 3
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Change color of venn diagram
                    area2 = 13298,
                    cross.area = 3377,
                   col = "red",
                   fill = "green")

#Example 4
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Different color for each set
                   area2 = 13298,
                   cross.area = 3377,
                   col = "red",
                   fill = c("blue", "orange"))
 
 
#Example 5
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Disable transparency of venn diagram
                   area2 = 13298,
                   cross.area = 3377,
                   col = "red",
                   fill = c("blue", "orange"),
                   alpha = 1)
 
#Example 5                 
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Remove lines from venn diagram
                   area2 = 13298,
                   cross.area = 3377,
                   col = "red",
                   fill = c("blue", "orange"),
                   lty = "blank")

#Example 6
grid.newpage()   #Move to new plotting page
draw.pairwise.venn(area1 = 11666,  # Add name to each set
                   area2 = 13298,
                   cross.area = 3377,
                   col = "red",
                   fill = c("blue", "orange"),
                   lty = "blank",
                   category = c("MED1","CDK8"))
