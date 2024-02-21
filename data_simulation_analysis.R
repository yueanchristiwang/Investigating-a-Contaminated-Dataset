# Step 1: Generate data from a normal distribution
set.seed(123)  # Set seed for reproducibility
true_mean <- 1  # True mean of the data generating process
true_sd <- 1  # True standard deviation of the data generating process
sample_size <- 1000  # Number of observations in the sample

# Generate data from a normal distribution
data <- rnorm(sample_size, mean = true_mean, sd = true_sd)

# Step 2: Mimic instrument mistake (overwriting last 100 observations with the first 100)
if (sample_size > 900) {
  data[901:1000] <- data[1:100]
} else {
  cat("Sample size is not large enough to mimic instrument mistake.\n")
}

# Step 3: Research assistant's errors
# 3.1. Change half of the negative values to positive
negative_indices <- which(data < 0)  # Indices of negative values
negative_count <- length(negative_indices)

if (negative_count > 0) {
  set.seed(456)  # Set seed for reproducibility
  random_negative_indices <- sample(negative_indices, floor(negative_count / 2))  # Randomly select half of the negative indices
  data[random_negative_indices] <- abs(data[random_negative_indices])  # Change selected negative values to positive
} else {
  cat("No negative values found to apply research assistant's errors.\n")
}

# 3.2. Change decimal place of values between 1 and 1.1
# Find indices of values between 1 and 1.1
decimal_indices <- which(data > 1 & data < 1.1)

if (length(decimal_indices) > 0) {
  for (i in decimal_indices) {
    data[i] <- data[i] / 10  # Change decimal place by dividing by 10
  }
} else {
  cat("No values found between 1 and 1.1 to apply research assistant's errors.\n")
}

# Step 4: Analyze the data
# 4.1. Calculate mean of the dataset
mean_data <- mean(data)

# 4.2. Assess whether the mean is greater than 0
mean_greater_than_zero <- mean_data > 0

# Step 5: Display results
cat("Mean of the dataset:", mean_data, "\n")
cat("Is the mean greater than 0?", mean_greater_than_zero, "\n")
