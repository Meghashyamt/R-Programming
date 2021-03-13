# shyam is explaining about this concept
# variables   Rules


#This is to print name shruthi
print("Shruthi")

#variables  
x=4  # to store 4 value into the variable x
print(x)

y="Geethika"
print(y)

#rules
syeda=4   #valid
.syeda =8  #valid
sameera_3=  10   #valid
#3dharani =11  # invalid
#.3t=7   #invalid
#_rahul=14  #invalid

var.t=c(1,2,3,4)
print(var.t)
rm(var.t)
print(var.t)
#
#vectors
print("abc")  #character
print(12.5)   # double
print(63)    #int
print(TRUE)  #logical
print(3+2i) #complex

#multiple values vector
v<-5:13
print(v)
g<-6.6:12.6
print(g)
#
s<-c("apple","orange","mango")
print(s)
class(s)
#
s[1]
s[3]


#matrix
n<-matrix(c(3:14),nrow = 3)
n

g<-matrix(c(3:14),nrow = 4,byrow = TRUE)
g

n[1,1]    #accessing the values


#array
a<-array(c("green","yellow"),dim = c(3,1,1))
a

b<-array(c(1,2,3,4),dim = c(3,1,1))
b
#
#dataframes
data1<-data.frame(emp_id=c(1:5),emp_name=c("rick","dan","mickel","ryan","gary"),salary=c(600,200,500,400,300))
data1

summary(data1)

#factors
d<-c("east","west","north","south","south")
d
factor(d)

BMI<-data.frame(gender=c("M","M","F"),height=c(5,6,4),weight=c(55,65,60),age=c(24,35,29))
BMI


v<-c(0,4,6)
t<-c(8,10,30)

print(v+t)

print(v-t)

print(v*t)

print(v/t)

print(v^t)

print(v%%t)

print(v%/%t)


#relational operators
print(v>t)

print(v<t)

print(v==t)

print(v!=t)
#
#logical operators
v
t
print(v&t)

print(v|t)


#miscellanous operators
v<-2:8
v

v1<-8
v2<-12
t<-1:10
t

print(v1 %in% t)
print(v2 %in% t)

M=matrix(c(2,6,5,1,10,4),nrow = 2,byrow = TRUE)
M
write.csv(M,"sample.csv")


W=read.table("http://makemeanalyst.com/wp-content/uploads/2017/05/wine.txt",sep=",", header=TRUE)

t=M %*% t(M)

t(M)
print(t)

var.1=c(0,1,2,3)
var.2<- 15
c(TRUE,1)->var.3

print(var.1)
cat("var.1 is", var.1)
print("var.1 is",+ var.1)
cat("var2 is", var.2)

cat("var3 is", var.3)

x=data.frame(Name="X", Gender="Male",Age=30)
x
v<-1:10

x=read.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv")
x
View(x)

#binary 

save(x,z, file="binary.rda")
t=load("binary.rda")
x


u=list(1,2,3)
s=serialize(u,NULL)
save(s,file="gy.rda")
d=load("gy.rda")
d
s
unserialize(s)
women
saveRDS(women, file="yyy.rds")
women2=readRDS("yyy.rds")
women2
identical(women, women2)



print(seq(32,39))
print(mean(35:87))

new.function=function(q){
  for (i in 1:q) 
    {
    ee=i^2
    print(ee)
    }
}  

new.function(5)


nw1=function(a,b,c)
{
  resultrr=a+b+c
  print(resultrr)
  }


nw1(3,4,5)

nw2=function(a=3,b=3,c=4)
{
  resultrr=a+b+c
  print(resultrr)
}

nw2(8,1,5)

#



dump(c("x","d"),"data.R")
dput(x)
dput(x,"sample.R")
dget("sample.R")

.libPaths()
library()

install.packages("")
library("")


#

emp.data=data.frame(emp_id=c(1:4),emp_name=c("Rick","Michle","ran","sangi"),salary=c(100,200,300,400))
emp.data
str(emp.data)
summary(emp.data)

data.frame(emp.data$emp_name,emp.data$salary)
emp.data[2:3,c(2,3)]
emp.data

#add column
emp.data$dept=c("IT","operators","admin","developer")
emp.data

#add row
emp.d=data.frame(emp_id=5,emp_name="shruti",salary=500,dept="IT")

emp.data=rbind(emp.data,emp.d)
str(emp.data)
emp.data$emp_id<-as.integer(emp.data$emp_id)
str(emp.data)
emp.data$emp_name<-as.character(emp.data$emp_name)
str(emp.data)
emp.data
library(dplyr)
#filter((emp.data$emp_name=="shruti")&(emp.data$salary==500))
emp.data[which(emp.data$emp_name=="shruti"),]
#arrange(desc(emp.data$emp_id))
emp.data[-sort(desc(emp.data$emp_id)),]
####################
subset(emp.data, dept=="IT" & emp_name=="shruti")
subset(emp.data, !is.na(dept))
save.image("yy.RData")
#
ad<-read.csv("newIRIS.csv")
View(ad)
str(ad)
#
f<-c(3,8,4,5)
d<-c(4,11,5,6)

class(f)

f+d
f-d
f*d
f/d
#
#lists
a<-list("Red",c(2,3,4),TRUE,51.15)
print(a)

names(a)<-c("char","numeric","logical","float")
print(a)
#
a[1]
a[2]

a[[2]][1]
a[[2]][3]
#
g<-list(1,2,3,sin)
h<-list("sun","mon","tue")

j<-c(g,h)
print(j)
#
#matrices
M<-matrix(c(3:14),nrow = 4,byrow = FALSE)
print(M)

M[1,1]
M[2,3]
M[4,3]

#
m1<-matrix(c(3,9,-1,4,2,6),nrow=2)
print(m1)
m2<-matrix(c(5,2,0,9,3,4),nrow=2)
print(m2)

m1+m2
m1-m2
m1*m2
m1/m2

#




shyam_t="this is about R"   # valid
print(shyam_t)
.shyam_t   #  valid
shyam.t   # valid

#2shyam_t  # invalid
#_shyam_t   #  invalid
#.2shyam_t   # invalid

# simple print
mystring<- " where are you"
print(mystring)

# sample print and datatype checking
archana =" this is my new R class"
print(archana)
archana
print(class(archana))

# variables , numeric
d<-12
d=12
print(d)
print(class(d))

# numeric
a=34.5
print(a)
print(class(a))


# this command to check the all list of variables
print(ls())  

#removes or deletes the particular  variable
rm(a)
print(a)

#logical
a<- TRUE
print(a)
print(class(a))

# character/string
a<- "TRUE"
print(a)
print(class(a))

# complex
f<-3+2i
print(f)
print(class(f))

# arthematic operators
v=c(2,5,5,6)
t=c(8,3,3,4)
print(v+t)

f=10
d=12
print(f+d)

v=c(3,5.5,6,0)
t=c(8,3,4,3)
print(v-t)

# multiplication
d=c(3,4)
e=c(3,4)
print(d*e)

# division
r=c(5,7)
w=c(5,5)
print(r/w)

#r,w=c(5,7), c(5,5)
print(r^w)

# relational operators
r=c(5,7)
w=c(5,5)
print(r>w)

x=c(2,5.5,6)
y=c(8,2.5,14)
print(x<y)

x=c(2,5.5,6)
y=c(2,2.5,14)
print(x=y)


x=c(2,5.5,6,6)
y=c(2,2.5,14,6)
print(x>=y)

x=c(2,5.5,6,6)
y=c(2,2.5,14,6)
print(x!=y)

#  logical operators
x=c(2,5.5,6,6)    # ( TRUE,TRUE,TRUE,TRUE)
y=c(2,2.5,14,0)   # (TRUE,TRUE,TRUE,FALSE)
print(x&y)   # AND
print(x|y)  #  OR 
print(!x)   # NOT
print(!y)

a=10
a<-10

10 -> a
print(a)

# miscellanous operators

v=2:8
v
t=7
print(t %in% v)





x=c(3,1,TRUE,2+3i)
y=c(4,1,FALSE,2+3i)
print(x&y)
print(x|y)


# creating a list
list_data<- list("Red","green",c(21,32,11), TRUE, 51.23,119.1)
print(list_data)


names(list_data)<- c("Colors","Practise","Numeric","Logical","FLoat")   # names
print(list_data)

#Accessing the values in list
list_data[1]

list_data["Practise"]
print(list_data["Numeric"])

list_data[6]

list_data$Numeric
list_data["Numeric"]




#Adding the new element
list_data[7]<-12
list_data

#Removes the element
list_data[7]<- NULL
list_data


#update the element
list_data[1]<-"Orange"
list_data

list_data<- list(c("jan","feb"),list("blue","green"))   #  multiple list
list_data

list_data[1]
list_data[2]
list_data[[2]][1]
list_data[[2]][2]


#merging list
list1<- list(1,2,3)
list2<- list("sun","mon","tue")

m<-c(list1,list2)
print(m)
m[6]

#MATRICES
d<- matrix(c(3:14),nrow=3)
print(d)

e<- matrix(c(0:11), ncol=2)
print(e)

e<- matrix(c(0:11), ncol=4)
print(e)

f<- matrix(c(0:21), ncol=11)
print(f)

#  Dimension names
rownames =c("row1","row2","row3","row4")
colnames =c("col1",'col2',"col3")

P<-matrix(c(3:14),nrow=4, byrow=TRUE, dimnames = list(rownames,colnames))
print(P)

# Access the values/slicing methods

print(P[1,1])   #  variable[Rows index, columns index]
print(P["row1","col1"])
print(P[1,3])

print(P[2,2])
print(P[3,3])

print(P[4,3])

print(P[1:2,1:2])
print(P[2:3,2:3])
print(P[2:3,2])
print(P[2:3,2:2])

print(P[2,2:3])
print(P[2:2,2:3])



# Marrix Addtion
matrix1<- matrix(c(3,9,-1,4,2,6),nrow=2)
print(matrix1)

matrix2<-matrix(c(5,2,0,9,3,4),nrow=2)
print(matrix2)

#add
result<-matrix1+matrix2
cat("Output for matrix addition")   #string 
print(result)

#subtract
result<-matrix1-matrix2
cat("Output for matrix Subtraction")   #string 
print(result)


#Multiplication
result<-matrix1*matrix2
cat("Output for matrix Multiplication")   #string 
print(result)

#Division
result<-matrix1/matrix2
cat("Output for matrix Division")   #string 
print(result)

# Creating Data Frames
a<-data.frame(emp_id=c(1:5),emp_name=c("Dan","Rick","Mick","Ryan","Gary"),salary=c(600,122,300,400,500))
print(a)

row.names(a)<-6:10
print(a)

str(a)   # getting the structure of the data frame

summary(a) # statistical summary 

result<-data.frame(a$emp_id,a$salary)
print(result)
  # accessing the data frame values row and column
a[1:2,]

a[,1:2]

a[,c(1,3)]

a[c(1,4),c(1,3)]   # custom rows and columns

# Adding column
a$dept<-c("IT","Operations","HR","Finance","BPO")
print(a)

a['new']<-c(45,56,67,78,89)
print(a)

# add row
b<-data.frame(emp_id=6,emp_name="shital",salary=700,dept='IT',new=99)
ab<-rbind(a,b)
print(ab)

# importing the data
print(getwd())
d<-"home/shyam/Documents/"
setwd(d)
print(getwd())

setwd(choose.dir())

data<-read.csv("IRIS.csv")
print(data)
newdata<-head(data)   # To view first 6 values
print(newdata)
tail(data)   # to view the last 6 values
dim(data)    # dimensions of Data
print(ncol(data))   #  to view the number of columns
print(nrow(data))   # to view the number of rows

# write to csv 
write.csv(newdata, "/home/shyam/Documents/Data Science/R Programming/newIRIS.csv",row.names = FALSE)
d<-read.csv("/home/shyam/Documents/Data Science/R Programming/newIRIS.csv")
print(d)
#

#install.packages("tidyverse")



install.packages("readxl")
any(grepl("readxl", installed.packages()))#  to check it whether it is installed
library("readxl")


data<-read_excel("/home/shyam/Documents/Data Science/Data-Science-master/datasets/university.xlsx")


data<-read_xlsx("/home/shyam/Documents/Data Science/Data-Science-master/datasets/university.xlsx")
print(data)

# Reading json files
install.packages("rjson")

library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "new.json")

# Print the result.
print(result)

d<- fromJSON(file="dany.json")
print(d)

#

#Plotting

# Create a data for chart
H<-c(7,12,2,8,3,41)

#to save the file name
png(file="barchat.png")

# To plot barplot
barplot(H)

dev.off()

#bar
H<-c(7,12,2,8,3,41)
M<-c("Mar","Apr","Jun","july","Aug","Sept")

barplot(H,names.arg=M,xlab="Month",ylab="Revenue", col="blue", main="Revenue chart", border="Red")

mtcars
#
input<-mtcars[,c('wt','mpg')]
plot(x=input$wt,y=input$mpg, xlim = c(2.5,5),ylim=c(15,30))


#
values<-matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow=3,ncol=5, byrow=TRUE)
values
values1<-d[,1:4]
values1
d1=data.matrix(values1)


colors=c("green","orange","brown")
months=c("Mar","Apr","Jun","july","Aug")
regions=c("East","West","North")
barplot(values, main="total revenue", names.arg = months,xlab="month",ylab="revenue",col=colors) 
legend("topleft",regions,fill=colors, cex=0.9)
# barplot
colors=c("green","orange","brown","red","violet","blue")
months=c("SL","SW","PL","PW")
barplot(d1, main="total revenue", names.arg=months,xlab="month",ylab="revenue",col=colors)
legend("topright",regions,fill=colors, cex=0.5)
   
#
mtcars
head(mtcars)


#Boxplot
input<- mtcars[,c('mpg','cyl')]
input
boxplot(mpg~cyl, data=mtcars, xlab=" Number of cyclinders",ylab="mpg",main="Mileage data")

# histogram

v<-c(9,13,21,8,36,22,12,41,31,33,8,8,8)
hist(v,xlab="weight",col="yellow", border="red",xlim=c(0,30),ylim=c(0,5))


getwd()

# scaling part
x<- c(21,62,10,53)
labels<-c("London","new york","Singapore","Mumbai")


piepercent=round(100*x/sum(x),3)   


pie(x,labels=piepercent, col=c("green","red","brown","violet"))
legend("topright",c("London","new york","Singapore","Mumbai"),cex=0.8,fill=c("green","red","brown","violet"))
#

input<-mtcars[,c('wt','mpg')]
plot(x=input$wt,y=input$mpg,xlab="weight",ylab="Mileage",xlim=c(2.5,5),ylim=c(15,30),main="weight vs mileage")

pairs(~wt+mpg+disp+cyl,data=mtcars,main="Scatter matrix")


 # line chart
v<-c(7,12,28,3,41) # values    
#plot(v,type="o") # type is markers
lines(v,type = "o")

#
#Using ggplot 
library(ggplot2)

ggplot(midwest)    # reference midwest<-read.csv("http://goo.gl/G1K41K")
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()+ labs(subtitle="MIDWEST", 
                                                                    y="poptotal", 
                                                                    x="area", 
                                                                    title="Scatterplot with overlapping points", 
                                                                    caption="Source: midwest") +xlim(c(0,0.06))+ylim(c(0,50000))

plot(gg)

#

data(mpg, package="ggplot2") # alternate source: "http://goo.gl/uEeRGu")


g <- ggplot(mpg, aes(cty, hwy))
g + geom_point()+
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Scatterplot with overlapping points", 
       caption="Source: midwest")

#
# bar plot using ggplot
data(mpg, package="ggplot2")
g<-ggplot(mpg, aes(cty)) 
g+ geom_bar()
#
# boxplot
g <- ggplot(mpg, aes(class, cty))
g + geom_boxplot()
install.packages("dplyr")
 library("ggpubr")
#
my3cols <- c("#E7B800", "#2E9FDF", "#FC4E07")
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
# 1. Create a box plot (bp)
p <- ggplot(ToothGrowth, aes(x = dose, y = len))
bxp <- p + geom_boxplot(aes(color = dose)) +
  scale_color_manual(values = my3cols)
# 2. Create a dot plot (dp)
#dp <- p + geom_dotplot(aes(color = dose, fill = dose), 
   #                    binaxis='y', stackdir='center') +
 # scale_color_manual(values = my3cols) + 
  #scale_fill_manual(values = my3cols)
# 3. Create a line plot
lp <- ggplot(economics, aes(x = date, y = psavert)) + 
  geom_line(color = "#E46726") 


figure <- grid.arrange(bxp, lp,
                    labels = c("A", "C"),
                    ncol = 2, nrow = 1)
figure

install.packages("devtools")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
#

    # 
library(ggplot2)
df <- iris

# create first plot
p <- ggplot(df, aes(x = Sepal.Length, y = Sepal.Width))
p <- p + geom_point(aes(colour = Species))

p

scatter_plot <- p

# create second plot
p <- ggplot(df, aes(x = Species, y = Petal.Width))
p <- p + geom_boxplot()

p
install.packages("gridExtra")
library(gridExtra)
box_plot <- p

# arrange both plots
grid.arrange(scatter_plot, box_plot)


#
# Box plot (bp)
data("ToothGrowth")
head(ToothGrowth)
bxp <- ggplot(ToothGrowth,aes( x = "dose", y = "len"),
                 color = "dose", palette = "jco")+geom_boxplot()
bxp
# (dp)
dp <- ggplot(ToothGrowth, aes(x = "dose"),
                color = "dose")+geom_bar()
dp
grid.arrange(bxp, dp)

##


data(mtcars)
corr <- round(cor(mtcars), 1)

corr

#

authors<-data.frame(surname=c("tukey","vena","tierney","ripl","mcnil","ghgh","abhi"),nationality=c("USA","Australia","India","UK","Africa","Singapore","South America"))
authors
books<-data.frame(surname=c("tukey","vena","tierney","ripl","mcnil","rip"),title=c("EDA","MAS","STAT","spatical","Stochestic","IDA"))
books
merge(authors,books,by = "surname")   # intersection
merge(authors,books,by = "surname", all.x = TRUE)   # left
merge(authors,books,by = "surname",all.y = TRUE)  #right
merge(authors,books,by = "surname", all = TRUE)  # outer

group_by(books)
#aggregate(authors$surname, by=list(authors$nationality))
#
getwd()
read.csv("animals4.csv")

x<-1:5
x
y<-9:13
y

rbind(x,y)



#
authors
books

library(dplyr)
right_join(authors,books)  # all parts of y, common part between both
left_join(authors,books)   #  all parts of x , common part betwenn them
inner_join(authors,books)
anti_join(authors,books)
semi_join(authors,books)

library(chron)

#install.packages("chron")
animals=read.csv("animals4.csv")
animals<-data.frame(animals, stringsAsFactors =TRUE)
animals$BIRTH_DATE<-as.Date(as.character(animals$BIRTH_DATE),format = "dmy")
a=head(animals)
a
str(a)
format.Date(animals$BIRTH_DATE,format="dmy")
#################
library(lubridate)
animals$newdate <- dmy(animals$BIRTH_DATE)
head(animals)
########################

as.factor(a$BIRTH_DATE)
as.factor(as.Date(as.character(a$BIRTH_DATE),"%d%m%y"))

a$BIRTH_DATE<-as.Date(a$BIRTH_DATE,"%d%m%y")
str(a)
breed=read.csv("breedings3.csv")
head(breed)
lac=read.csv("lactations3.csv")
head(lac)
b=read.csv("bwt5.csv")
head(b)
test=read.csv("testdays6.csv")
head(test)

b[,c(1,3)]

#lac[,lac$cowId=='1',]
#subset(lac)
#lac[(lac$cowId==1 & lac$LACT_NO==1)]

#a=lac[which(lac$CowId==1 & lac$LACT_NO==1),]
#head(a)
options(max.print = 9999999)
d=Reduce(function(x, y) merge(x, y, all=TRUE), list(animals,breed,lac,b,test))
d
d[which(d$CowId==1 & d$LACT_NO==2 & d$HR_24_MILK==23.4),]   #  condition cowdid=1 and lac=2


d$CowId
d$LACT_NO
d[d$CowId==1]

#
#Mean

x<-c(12,7,3,4.2,18,2,54,-21,8,-5)
result<-mean(x)
result
#Trimmed mean
y<-c(12,7,3,4.2,18,2,54,-21,8,-5)
result<-mean(y,trim=0.3)
result

## NA
z<-c(12,7,3,4.2,18,2,54,-21,8,-5,NA)
mean(z)
result<-mean(x,na.rm=TRUE)
result

#Median
d<-c(12,7,3,4.2,18,2,54,-21,8,-5)
result<-median(d)
result
#
sort(d)
names(d)[d==max(d)]

#  Linear Regression
# Values of height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
# Values of weight.
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

print(relation)

print(summary(relation))
# predict
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)
# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",abline(lm(x~y)),,cex = 1,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")


#

print(P[1:2,2:3])
print(P[1,1:3])







# vectors
v= 23.5
print(class(v))

#list values
list1= list(c(1,2,3),23)
list1

#matrix
M <- matrix(c('a','b','c','d'), c(1,4))
print(M)

#dimensions
dim(M)

#arrays
a<- array(c(1,2,3), dim = c(1,3))
print(a)

# Create the data frame.
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

print(ls())   # displaying variable names which you have used

df <- data.frame(new=c(1,2,3,4),new1=c(5,6,7,8),new3=c(9,10,11,12))
df
df[1:3,2:3]

df['new']
df$new


var <-23
var
class(var)
v<-c(1,2,3)
t<-c(4,5,6)
v+t
v-t
v*t
v/t
v%%t
v**t
# range
shyam<-2:7
shyam

# checking the condition using ifelse
x<- c("Truth","animal","boy")
x
if("Truth" %in% x){
  print("Truth found")
}else{
  print("not found")
}  

#function
new.function <- function(a,b,c)
{
  result<-a+b+c
  print(result)
}
new.function(a=1,b=2,c=3)

data<- read.csv("/home/shyam/Documents/Data Science/Data-Science-master/datasets/cars.csv")
data.
data['mpg']
data[1:3,1:3]
dim(data)

#############
v<-c(1:4)
for(i in v)
  {
  print(i)
  
}
############
c<-1
while(c<=3){
  print(c)
  c<-c+1
}


#############
c<-1 
 repeat{
    
    print(c)
    c<-c+1
  if(c>5){
    
    
break  }
    }
