# Set the correct path to your CSV file
data <- read.csv("D:/College/Semester 7/R/supermarkt_sales.csv")

# View the first few rows of te dataset to confirm it's loaded
head(data)

# Installing Packages
install.packages("ggplot2")

# Preview dataset
View(data)

# Layer 1: Data
ggplot(data = data)

# Layer 2: Aesthetic
ggplot(data, aes(x = Product.line, y = Total))

# Layer 3: Geometric
ggplot(data, aes(x = Product.line, y = Total)) + geom_point()

# Layer 4: Facet
ggplot(data, aes(x = Product.line, y = Total)) + geom_point() + facet_wrap(~Branch)

# Layer 5: Statistic
ggplot(data, aes(x = Product.line, y = Total, color = Branch)) + geom_point() + facet_wrap(~Branch) + geom_smooth(method = "lm" , se = TRUE)

# Geom Boxplot
ggplot(data, aes(x = Product.line, y = Total, color = Branch, fill = Branch)) + geom_boxplot()

# Geom Bar
ggplot(data, aes(x = Payment, fill = Gender)) + 
  geom_bar(position = "dodge") +
  labs(title = "Payment Methods by Gender",
       x = "Payment Method",
       y = "Count") +
  theme_minimal()

# Geom Bar
ggplot(data, aes(x = Product.line, fill = Branch)) + 
  geom_bar(position = "dodge") +
  labs(title = "Gross Margin Percentage",
       x = "Product Line",
       y = "Percentage") +
  theme_minimal()

library(ggplot2)
library(dplyr)

# Assuming 'data' already has a 'Gross.Margin.Percentage' column for each product line
# Calculate the average GMP per Product Line
avg_gmp <- data %>%
  group_by(Product.line) %>%
  summarise(Average_GMP = mean(gross.margin.percentage, na.rm = TRUE))

# Create the bar plot and add the average GMP line
ggplot(data, aes(x = Product.line, fill = Branch)) + 
  geom_bar(position = "dodge") +
  geom_point(data = avg_gmp, aes(x = Product.line, y = Average_GMP), color = "red", size = 3) +
  geom_line(data = avg_gmp, aes(x = Product.line, y = Average_GMP, group = 1), color = "red", linetype = "dashed") +
  labs(title = "Gross Margin Percentage by Product Line",
       x = "Product Line",
       y = "Gross Margin Percentage (%)") +
  theme_minimal()