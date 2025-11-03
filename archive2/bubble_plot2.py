import matplotlib.pyplot as plt
import numpy as np

# Your data
terms = ['Milk protein percentage', 'Milk fat yield', 'Milk fat percentage', 'Milk yield', 
         'Conception rate', 'Milk kappa-casein percentage', 'Body weight', 
         'Milk unglycosylated kappa-casein percentage', 'Milk protein yield', 'Tenderness score']
numbers = [35, 25, 23, 21, 19, 18, 18, 17, 17, 13]

# Create a bubble plot
plt.figure(figsize=(8, 6))

# Define colormap
cmap = plt.get_cmap('Reds')  # Choose a colormap (Reds in this case)

# Normalize counts to range [0, 1] for colormap
norm = plt.Normalize(min(numbers), max(numbers))

# Plot bubbles with gradient colors
for i, (term, count) in enumerate(zip(terms, numbers)):
    plt.scatter(count, i, s=count**2, color=cmap(norm(count)), alpha=0.6)

# Add labels and title
plt.yticks(range(len(terms)), terms, fontsize=12)  # Increase font size for y-axis labels
plt.xticks(fontsize=12)  # Increase font size for x-axis labels
plt.xlabel('Count', fontsize=14)  # Increase font size for x-axis label
#plt.title('Bubble Plot of Enriched Terms', fontsize=16)  # Increase font size for title

# Invert y-axis
plt.gca().invert_yaxis()

# Hide grid
plt.grid(False)

# Show the plot
plt.tight_layout()
plt.show()
