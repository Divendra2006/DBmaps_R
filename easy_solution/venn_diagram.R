library(VennDiagram)
library(grid)

# Load data
load("/home/yadav/Test/data/students_data.rda")
load("/home/yadav/Test/data/scores_data.rda")

# Extract unique IDs from both tables
students_ids <- students$id
scores_ids <- scores$id

# Compute counts correctly
area1 <- length(unique(students_ids))  # Total unique students
area2 <- length(unique(scores_ids))  # Total unique scores
cross_area <- length(intersect(students_ids, scores_ids))  # Common elements

# Create Venn Diagram
venn.plot <- draw.pairwise.venn(
  area1 = area1,
  area2 = area2,
  cross.area = cross_area,
  category = c("Students", "Scores"),
  fill = c("blue", "red"),
  alpha = 0.5,
  lty = "solid",
  cex = 2,
  cat.cex = 1.5,
  main = "Venn Diagram: Students & Scores",
  main.cex = 2,
  fontface = "bold"
)

# Draw the Venn Diagram
grid.newpage()
grid.draw(venn.plot)

# Add labels for each ID in the correct position
grid.text("A", x = 0.1, y = 0.6, gp = gpar(fontsize = 15, col = "blue"))  # Only in Students
grid.text("B", x = 0.5, y = 0.6, gp = gpar(fontsize = 15, col = "black"))  # Common
grid.text("C", x = 0.55, y = 0.6, gp = gpar(fontsize = 15, col = "black"))  # Common
grid.text("D", x = 0.2, y = 0.6, gp = gpar(fontsize = 15, col = "blue"))  # Only in Students
grid.text("E", x = 0.9, y = 0.6, gp = gpar(fontsize = 15, col = "red"))  # Only in Scores
