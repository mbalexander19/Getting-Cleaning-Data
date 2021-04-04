# Getting-Cleaning-Data

The run_analysis.R script accomplishes the following:

1. Downloads the dataset and extracts from zipfile.
2. Reads in training and test datasets and merges them.
3. Reads in activity and features key and extracts only columns for mean and standard deviation (StDev) from training and test datasets.
4. Modifies column names to be descriptive (removes ()-, changes -mean and -std to Mean and StDev respectively).
5. Merges all data into a single table, separates individual subjects and activities as factors.
6. Creates tidy dataset displaying means of each measurement for all combinations of subjects and activities.
7. Write tidy dataset to .txt file.
