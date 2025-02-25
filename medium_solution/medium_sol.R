library(data.table)

merge_three_tables<-function(x,y,z,key_col="id",first_merge,second_merge){
  merge_xy<-switch(
    first_merge,
    "inner_merge"=merge(x,y,by=key_col),
    "left_merge"=merge(x,y,by=key_col,all.x=TRUE),
    "right_merge"=merge(x,y,by=key_col,all.y=TRUE),
    "full_merge"=merge(x,y,by=key_col,all=TRUE),
    stop("Invalid first_merge,choose from 'inner_merge','left_merge','right_merge','full_merge'.")
  )
  merge_xyz<-switch(
    second_merge,
    "inner_merge"=merge(merge_xy,z,by=key_col),
    "left_merge"=merge(merge_xy,z,by=key_col,all.x=TRUE),
    "right_merge"=merge(merge_xy,z,by=key_col,all.y=TRUE),
    "full_merge"=merge(merge_xy,z,by=key_col,all=TRUE),
    stop("Invalid second_merge,choose from 'inner_merge','left_merge','right_merge','full_merge'.")
  )
  return(merge_xyz)
}

#--------------Example-------------------------------------------------------------------------------------------------------

load("./data/students_data.rda")
load("./data/scores_data.rda")
load("./data/rollno_data.rda")

result<-merge_three_tables(students,scores,rollno,first_merge = "full_merge",second_merge = "full_merge")
print(result)
