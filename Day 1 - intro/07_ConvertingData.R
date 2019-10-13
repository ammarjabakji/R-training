# Converting tabular data to row data

# Load data
?UCBAdmissions
str(UCBAdmissions)
dim(UCBAdmissions)
UCBAdmissions

data(UCBAdmissions)
View(UCBAdmissions)
class(UCBAdmissions)
is.data.frame(UCBAdmissions)


summary(UCBAdmissions)
head(UCBAdmissions)
names(UCBAdmissions)



# The problem
admit.fail <- (UCBAdmissions$Admit)  # Doesn't work
barplot(UCBAdmissions$Admit)  # Doesn't work
plot(UCBAdmissions)  # DOES work but not what we wanted now


UCBAdmissions2 <- as.data.frame(UCBAdmissions)
str(UCBAdmissions2)
(UCBAdmissions2$Admit)
summary(UCBAdmissions2)
head(UCBAdmissions2)
tail(UCBAdmissions2)
UCBAdmissions2[1:10,]
dim(UCBAdmissions2)
