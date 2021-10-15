#UGA Digi Data Visualization Series: Intro to ggplot2
#Katie Ireland Kuiper
#9/29/2021

#install and load the packages
#install.packages("packageName")
library(ggplot2)
library(tidyverse)
library(datasets)
ggplot(iris)



### Adding in aesthetic mappings
#Aesthetic mappings are created using the aes() 
#function in ggplot. These are specified after the dataset:
ggplot(iris, aes(x = Species, y = Petal.Length)) 


#add in geoms
#adding geom_point() to map the data values 
#as points onto the graphic
ggplot(iris, aes(x = Species, y = Petal.Length))+ geom_point() 


#create a boxplot using geom_boxplot
#Boxplots are helpful for visualizing the 
#distribution of data values and 
#for comparing across different variables. 
ggplot(iris, aes(x = Species, y = Petal.Length)) +geom_boxplot()



### Line graphs with ggplot using geom_line
#Now we will use a built in dataset in ggplot: 
#economics data. Time series data 
#works especially well with line graphs.

#inspect the data
head(economics)

ggplot(economics, aes(x = date, y = pop)) + geom_line()



### Creating barplots and scatterplots
#Use geom_bar() to create a barplot; 
#note: you must include the argument inside 
#geom_bar(stat = "identity") to tell R 
#to use the y values for the height of the bars. 


#barplots are another useful visualization for comparisons 
#between different groups.
#barplot
ggplot(iris, aes(x = Species, y = Petal.Length)) +geom_bar(stat = "identity") 


#Scatterplots are a great option for visualizing multiple variables.  
#Use geom_point() to create the scatterplot.
ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +geom_point() 




### Colors, shapes, and themes
#Ggplot also includes built in colors and 
#options for creating distinctive visualizations. 
#Themes allow you to control different aspects of 
#distinctive color combinations, fonts, etc.

#now let's use color to refine the visualization further, comparing by species
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() 

#colors can also be set for the whole plot or by variables

ggplot(iris, aes(x= Species, y = Petal.Length))+ geom_point(color = 'blue') 


#now adjust it to color by a specific variable: species
ggplot(iris, aes(x= Species, y = Petal.Length))+ geom_point(aes(color = Species))


#switch out Species for Petal.Length
ggplot(iris, aes(x= Species, y = Petal.Length))+ geom_point(aes(color = Petal.Length))

#what is the difference between the two?
##ggplot is automatically assigning a unique color to each value of the petal.length variable with the same scale of colors for each species
#when color = species, all values for each species are given a specific color


#another option is to use size to highlight a specific variable:
ggplot(iris, aes(x= Species, y = Petal.Length)) + geom_point(aes(size = Petal.Length))


#adjusting transparency of points through the alpha aesthetic
ggplot(iris, aes(x= Species, y = Petal.Length)) + geom_point(aes(alpha = Petal.Length))

#utilize shapes to represent different variables, using the aes shape = VARIABLENAME
ggplot(iris, aes(x= Species, y = Petal.Length)) + geom_point(aes(alpha = Petal.Length, size = Petal.Length))

#combine both
ggplot(iris, aes(x= Species, y = Petal.Length)) + geom_point(aes(alpha = Petal.Length, shape = Species))


#try out different themes, which are added on with the
#function theme_name(). The example below uses theme_classic.
ggplot(iris, aes(x = Species, y = Petal.Length)) +geom_boxplot() + theme_classic()



###Additional options: adding axis labels, titles, and themes.   These are the functions used to add titles and axis labels:
######ggtitle(YourTitleHere) #main title   
######xlab(XaxisLabelHere) #x axis label   
######ylab(XaxisLabelHere) #for the y axis label   
######labs(YourLabelsHere) #for the main title, axis labels and legend titles 
#add in main title
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() + ggtitle("Iris Petal Characteristics across Species") 

#add in main title with a line break
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() + ggtitle("Iris Petal Characteristics \n across Species")

#add axis labels
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() + ggtitle("Iris Petal Characteristics \n across Species") +xlab("Petal Width")

#your turn! add in the y axis label.



#more theme options
ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() + ggtitle("Iris Petal Characteristics across Species") +theme_dark()

ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = Species)) +geom_point() + ggtitle("Iris Petal Characteristics across Species") +theme_grey()


