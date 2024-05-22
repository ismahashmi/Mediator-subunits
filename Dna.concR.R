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

#Name	DNA Conc.
Input Ctrl.	15.2 ng/ul
Input H 1hr	6.77 ng/ul
Input HS 1hr	6.95 ng/ul
MED1 Ctrl	232 ng/ul
MED1 H 1hr	2.03 ng/ul
MED1 HS 1hr	206 ng/ul
CDK8 Ctrl.	40.5 ng/ul
CDK8 H 1hr	117 ng/ul
CDK8 HS 1hr	71.6 ng/ul

library(ggplot2)

# Create the data frame
data <- data.frame(
  Name = c("Input Ctrl.", "Input H 1hr", "Input HS 1hr", "MED1 Ctrl", "MED1 H 1hr", "MED1 HS 1hr", "CDK8 Ctrl.", "CDK8 H 1hr", "CDK8 HS 1hr"),
  DNA_Conc = c(15.2, 6.77, 6.95, 232, 2.03, 206, 40.5, 117, 71.6)
)

# Create the plot
ggplot(data, aes(x = Name, y = DNA_Conc, fill = Name)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = DNA_Conc), vjust = -0.3, position = position_dodge(0.9), size = 3) +
  labs(title = "DNA Concentration by Sample",
       x = "Sample",
       y = "DNA Concentration (ng/ul)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "none")







# Create the data frame
data <- data.frame(
  Sample = c("Input Ctrl.", "Input H 1hr", "Input HS 1hr", "MED1 Ctrl", "MED1 H 1hr", "MED1 HS 1hr", "CDK8 Ctrl.", "CDK8 H 1hr", "CDK8 HS 1hr"),
  DNA_Conc = c(15.2, 6.77, 6.95, 232, 2.03, 206, 40.5, 117, 71.6),
  Sample_Conc = c(3.04, 1.35, 1.39, 46.4, 0.407, 41.2, 8.10, 23.4, 14.3)
)

# Normalize the data
data$DNA_Conc_Scaled <- data$DNA_Conc / max(data$DNA_Conc)
data$Sample_Conc_Scaled <- data$Sample_Conc / max(data$Sample_Conc)

# Convert data to long format for plotting
data_long <- gather(data, key = "Type", value = "Concentration_Scaled", DNA_Conc_Scaled, Sample_Conc_Scaled)
data_long$Type <- factor(data_long$Type, labels = c("DNA Concentration (scaled)", "Sample Concentration (scaled)"))

# Create the plot
ggplot(data_long, aes(x = Sample, y = Concentration_Scaled, fill = Type)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = round(Concentration_Scaled, 2)), vjust = -0.3, position = position_dodge(0.9), size = 3) +
  labs(title = "Scaled Concentration by Sample and Type",
       x = "Sample",
       y = "Scaled Concentration") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "top")

