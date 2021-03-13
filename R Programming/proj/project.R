
##################
#PROJECT
##################
library("dplyr")    

#import the data
animals=read.csv("animals4.csv")
head(animals)
dim(animals)
x<-animals[!duplicated(animals$CowId),]
head(x)
dim(x)
y<-animals[!duplicated(animals$herd),]
head(y)
dim(y)
z<-animals[unique(animals$CowId),]
dim(z)
ggg<-animals[unique(animals$herd),]
dim(ggg)
animals$BIRTH_DATE=as.Date(animals$BIRTH_DATE,"%d%b%Y")
#View(x=animals)


lac=read.csv("lactations3.csv")
head(lac)
lac$START_DATE=as.Date(lac$START_DATE,"%d%b%Y")
lac$END_DATE=as.Date(lac$END_DATE,"%d%b%Y")
sum(is.na(lac[,4]))
sum(is.na(lac[,5]))
head(lac)
#############
#library(lubridate)
#lac$SERVICE_DATE <- dmy(lac$SERVICE_DATE)
#lac$END_DATE <- dmy(lac$END_DATE)
#lac$START_DATE <- dmy(lac$START_DATE)
#sum(is.na(lac[,4]))
#sum(is.na(lac[,5]))
#as.Date(lac$START_DATE,"%d%b%Y")

#as.Date(as.character(lac$START_DATE),'%y%m%d')
#head(lac$START_DATE)
#a=as.vector(unlist(lac$START_DATE))
#a
#as.Date(a,"%d%b%Y")

#x=c("01jan1999","02jan1991")
#as.Date(x,"%d%b%Y")

##############
#b=read.csv("bwt5.csv")
#head(b)
#test=read.csv("testdays6.csv")
#head(test)
#########
#TASK 1 merging columns animals and lactations  
#options(max.print = 9999999)
a=merge(animals,lac,by = c("CowId","herd"))
#install.packages("relimp")
#library(relimp, pos=35)
#showData(a, placement='-20+200', font=getRcmdr('logFont'), maxwidth=80,  maxheight=10)
####################################
#### View in a new page fully 
#page(x = a, method = "print")
#View(x = a , title = "My Merge data Animal and Lac")
a<-a[which(a$START_DATE>=a$BIRTH_DATE & a$END_DATE>=a$START_DATE),]
#View(x = a , title = "My Merge data Animal and Lac")
#a<-a[which(a$START_DATE>=a$BIRTH_DATE & a$END_DATE>=a$BIRTH_DATE),]
#View(x = a , title = "My Merge data Animal and Lac")

#######
my_tibble <- as_tibble(a)   
print(my_tibble, n = nrow(my_tibble)) 
##############
#TASK 2 Selecting lactation 1
my_tibble<-my_tibble[which(my_tibble$LACT_NO==1),]
View(x = my_tibble , title = "My 1st Lactation data")
#d=a[which(a$LACT_NO==1),]
#print(d, n = nrow(d)) 
#d
#View(x = d , title = "My 1st Lactation data")
##############
#df <-d[order(d$CowdId),]
#df<-d[sort(d$CowId),]
#View(x = df , title = "My sort data")
#############
#TASK 3  Merge 1st lactation with breed , by cow-herd
breed=read.csv("breedings3.csv")
head(breed)
lacbreed<-merge(my_tibble,breed,by = c("CowId","herd"))
View(x = lacbreed , title = "My Merge 1st lac and breed data")

##############
#TASK 4 Order by cowdid, herd, service date
#attach(lacbreed)
#lacbreed<-data.frame(lacbreed[,c("CowId","herd")])
#lacbreed<-select(lacbreed$CowId,lacbreed$herd,lacbreed$BIRTH_DATE)
names(lacbreed)
lacbreed$SERVICE_DATE=as.Date(lacbreed$SERVICE_DATE,"%d%b%Y")
lacbreed<-lacbreed[,c("CowId","herd","BIRTH_DATE","START_DATE","SERVICE_DATE","END_DATE","LACT_NO","ENTER_HERD_DATE","LEFT_HERD_DATE","LEFT_HERD_CODE","DAY_305_MILK","DAY_305_FAT","DAY_305_PROT","LACT_DATE_YLD_MILK","LACT_DATE_YLD_FAT","LACT_DATE_YLD_PROT","CUMUL_MILK_VALUE","CUMUL_FEED_COST")]
#lacbreed<-lacbreed[,c(lacbreed$CowId,lacbreed$herd,lacbreed$BIRTH_DATE,lacbreed$START_DATE,lacbreed$SERVICE_DATE,lacbreed$END_DATE)]
#lacbreed<-lacbreed[,c(1,2,18,9,8,3:7,10:17)]
#library(lubridate)
#lacbreed$SERVICE_DATE <- dmy(lacbreed$SERVICE_DATE)
#lacbreed$END_DATE <- dmy(lacbreed$END_DATE)
#lacbreed$START_DATE <- dmy(lacbreed$START_DATE)
head(lacbreed)
#class(lacbreed$SERVICE_DATE)
#lacorder=lacbreed[order(lacbreed[,1],lacbreed[,2],lacbreed[,3]),]
View(x = lacbreed , title = "My Order inside lacbreed")
#lacorder<-lacbreed[sort(lacbreed[,1]),]
#View(x = lacorder , title = "My Order inside lacbreed")
lacbreed=lacbreed[order(lacbreed[,1]),]
View(x = lacbreed , title = "My Order inside lacbreed")
#filter((lacorder$SERVICE_DATE>=lacorder$START_DATE) & (lacorder$SERVICE_DATE<=lacorder$END_DATE))
##############

#TASK 5 Select the service date , range between start and end laction date
lacbreed$ENTER_HERD_DATE=as.Date(lacbreed$ENTER_HERD_DATE,"%d%b%Y")
selectlac<-lacbreed[which(lacbreed$SERVICE_DATE>=lacbreed$START_DATE & lacbreed$SERVICE_DATE<=lacbreed$END_DATE &lacbreed$SERVICE_DATE>=lacbreed$BIRTH_DATE & lacbreed$ENTER_HERD_DATE>=lacbreed$BIRTH_DATE),]
View(x = selectlac , title = "My selected lac range date")
##########
#df %>% 
#  group_by(select$CowId) %>% 
#  [which(min(selectlac$SERVICE_DATE) & max(selectlac$SERVICE_DATE))]
#library(data.table)
#x<-setDT(selectlac)[order(selectlac$SERVICE_DATE), head(.SD, 1L), by = selectlac$CowId]
#View(x = x , title = "first date")
#aggregate(selectlac$herd,by=list(selectlac$CowId), FUN=max)
#library(dplyr)
#selectlac %>%
#  group_by(CowId) %>%
#  arrange(SERVICE_DATE) %>%
#  slice(1L)

##############
selectlac<-selectlac %>% 
  group_by(CowId) %>%
  filter(SERVICE_DATE == min(SERVICE_DATE) | SERVICE_DATE == max(SERVICE_DATE))

View(x = selectlac , title = "first date and last date filter")
##############
# TASK 6 DiM days , service date - lactation start date
selectlac$Dim<-selectlac$SERVICE_DATE-selectlac$START_DATE
View(x = selectlac , title = "My selected lac range date")
############
#TASK 7 Plot the histograms for Dim 
selectlac$Dim<-as.numeric(selectlac$Dim)
#data.frame(selectlac$Dim)
#a=as.numeric(selectlac$Dim)
#a
hist(selectlac$Dim)

########
#TASK 8 Plot for each cow 
selectlac<-selectlac %>% 
   group_by(CowId) %>% slice(CowId) %>%
    hist(CowId)

hist(selectlac$CowId,breaks=362)
# Library

ggplot(selectlac, aes(x = CowId)) +
  geom_histogram(aes(color = "black"),
                 position = "identity", alpha = 0.4,bins=362)+scale_color_manual(values = c("#00AFBB", "#E7B800"))
#library(tidyverse)
###############
#TASK 9  Plot for each herd

hist(selectlac$herd)

#############
#TASK 10 Plot with days in milk and each breed with stick and circle
d<-selectlac[1:15,c("CowId","Dim")]
d
e<-as.numeric(d$Dim)
e
# Create data
data <- data.frame(
  x=selectlac$Dim,
  y=selectlac$CowId
)
#data<-data[seq(1, nrow(data), 10), ]    #  every 10th data
data
library(ggplot2)
# plot
#ggplot(data, aes(x=x, y=y)) +
 # geom_segment( aes(x=x, xend=x, y=0, yend=y)) +
#  geom_point( size=5, color="red", fill=alpha("orange", 0.3), alpha=0.7, shape=21, stroke=2)
ggplot(selectlac, aes(x,y)) +
  geom_segment(aes(x = selectlac$Dim, y = 0, xend = selectlac$Dim, yend = selectlac$CowId), color = "grey50") +
  geom_point()+xlab("Days in Milk") +ylab("Breed")

# lollipop chart
ggplot(data, aes(x,y)) +
  geom_segment(aes(x = x, y = 0, xend = x, yend = y), color = "grey50") +
  geom_point()+xlab("Days in Milk") +ylab("Breed")
  


#selectlac$Dim

