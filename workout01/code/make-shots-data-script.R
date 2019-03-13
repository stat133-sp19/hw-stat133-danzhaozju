################################
## title: make shots data
## description: use five data sets to make shots data
## inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, 
##        klay-thompson.csv, stephen-curry.csv
## outputs: andre-iguodala-summary.txt,draymond-green-summary.txt,
##          kevin-durant-summary.txt,klay-thompson-summary.txt,
##          stephen-curry-summary.txt,shots-data.csv,shots-data-summary.txt
################################

setwd("~/Desktop/STAT133CompWithData/workout/workout01/")

# Read in the five data sets, using relative file paths; the decision of 
#the data types for each column is up to you.
ai <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
dg <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
kd <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
kt <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
sc <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)

# Add a column name to each imported data frame, that contains the name of 
#the corresponding player
ai['name'] = 'Andre Iguodala'
dg['name'] = 'Draymond Green'
kd['name'] = 'Kevin Durant'
kt['name'] = 'Klay Thompson'
sc['name'] = 'Stephen Curry'

# Change the original values of shot_made_flag to more descriptive values: 
#replace "n" with "shot_no", and "y" with "shot_yes". Hint: you can use 
#logical subsetting for this operation (no need to use programming structures
#that we haven’t covered yet).
ai$shot_made_flag[ai$shot_made_flag == "n"] = "shot_no"
ai$shot_made_flag[ai$shot_made_flag == "y"] = "shot_yes"

dg$shot_made_flag[dg$shot_made_flag == "n"] = "shot_no"
dg$shot_made_flag[dg$shot_made_flag == "y"] = "shot_yes"

kd$shot_made_flag[kd$shot_made_flag == "n"] = "shot_no"
kd$shot_made_flag[kd$shot_made_flag == "y"] = "shot_yes"

kt$shot_made_flag[kt$shot_made_flag == "n"] = "shot_no"
kt$shot_made_flag[kt$shot_made_flag == "y"] = "shot_yes"

sc$shot_made_flag[sc$shot_made_flag == "n"] = "shot_no"
sc$shot_made_flag[sc$shot_made_flag == "y"] = "shot_yes"

# Add a column minute that contains the minute number where a shot occurred. For instance, if 
#a shot took place during period = 1 and minutes_remaining = 8, then this should correspond to
#a value minute = 4. Likewise, if a shot took place during period = 4 and minutes_remaining = 2 
#then this should correspond to a value minute = 46. Hint: you can use logical subsetting for 
#these operations (no need to use programming structures that we haven’t covered yet).
ai['minute'] = ai$period*12 - ai$minutes_remaining
dg['minute'] = dg$period*12 - dg$minutes_remaining
kd['minute'] = kd$period*12 - kd$minutes_remaining
kt['minute'] = kt$period*12 - kt$minutes_remaining
sc['minute'] = sc$period*12 - sc$minutes_remaining

# Use sink() to send the summary() output of each imported data frame into individuals
#text files: andre-iguodala-summary.txt, draymond-green-summary.txt, etc. During
#each sinking operation, the produced summaries should be sent to the output/folder 
#using relative paths.
sink(file = "output/andre-iguodala-summary.txt")
summary(ai)
sink()

sink(file = "output/draymond-green-summary.txt")
summary(dg)
sink()

sink(file = "output/kevin-durant-summary.txt")
summary(kd)
sink()

sink(file = "output/klay-thompson-summary.txt")
summary(kt)
sink()

sink(file = "output/stephen-curry-summary.txt")
summary(sc)
sink()

# Use the row binding function rbind() to stack the tables into one single data frame
#(or tibble object).
shots_data = rbind(ai,dg,kd,kt,sc)

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder
# data/. Use a relative path for this operation.
write.csv(shots_data, file="data/shots-data.csv")

# Use sink() to send the summary() output of the assembled table. Send this output to
# a text file named shots-data-summary.txt inside the output/ folder. Use a relative
# path when exporting the R output.
sink(file="output/shots-data-summary.txt")
summary(shots_data)
sink()
