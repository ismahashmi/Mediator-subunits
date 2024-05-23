# library
library(ggplot2)

# Load necessary libraries
library(ggplot2)
library(tidyr)


# Load ggplot2
library(ggplot2)

# Example data
data <- data.frame(
  Sample = rep(c("Input", "MED1", "CDK8"), times = 3),
  Condition = rep(c("Control", "Hemin", "Heat_shock"), each = 3),
  DNA_Concentration = c(15.2, 232, 40.5, 6.77, 2.03, 117, 6.95, 206, 71.6)
)

# Create the plot
ggplot(data, aes(x = Condition, y = DNA_Concentration, fill = Sample)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = DNA_Concentration), vjust = -0.3, position = position_dodge(0.9), size = 3.5) +
  labs(title = "DNA Concentration in differnet samples",
       x = "Condition",
       y = "DNA Concentration_ng/ul") +
  theme_minimal() +
  theme(legend.position = "top")


library(ggplot2)

# Create the data frame
data <- data.frame(
  Name = c("Input Ctrl.", "Input He 1hr", "Input HS 1hr", "MED1 Ctrl.", "MED1 He 1hr", "MED1 HS 1hr", "CDK8 Ctrl.", "CDK8 He 1hr", "CDK8 HS 1hr"),
  Sample_Conc = c(3.04, 1.35, 1.39, 46.4, 0.407, 41.2, 8.10, 23.4, 14.3)
)
# Extract Group and Condition from Name
data$Samples <- sapply(strsplit(as.character(data$Name), " "), function(x) x[1])
data$Condition <- sapply(strsplit(as.character(data$Name), " "), function(x) paste(x[-1], collapse=" "))

# Print the modified data frame to check
print(data)

# Create the grouped bar graph
ggplot(data, aes(x = Samples, y = Sample_Conc, fill = Condition)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(title = 'Sample concentration in nine samples', x = 'Samples', y = 'Sample Concentration_ ug/ml') +
  theme_minimal()
