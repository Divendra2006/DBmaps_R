library(data.table)

load("/home/yadav/Test/data/students_data.rda")
load("/home/yadav/Test/data/scores_data.rda")


#----------------INNER_MERGE---------------------------------
inner_merge <- merge(students,scores,by="id")
print(inner_merge)


#----------------LEFT_MERGE----------------------------------
left_merge <- merge(students,scores,by="id",all.x = TRUE)
print(left_merge)


#----------------RIGHT_MERGE----------------------------------
right_merge <- merge(students,scores,by="id",all.y = TRUE)
print(right_merge)


#----------------FULL_MERGE-----------------------------------
full_merge <- merge(students,scores,by="id",all = TRUE)
print(full_merge)

save(inner_merge,left_merge,right_merge,full_merge,file = "./data/merge_data.rda")
print("merge_data.rda file created sucessfully")

