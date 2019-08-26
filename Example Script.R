library(ggthemes)
library(tidyverse)

#read in the data
forbes<-read_csv('Forbes2000.csv')

#calculate total cost (sales-profits)
forbes <- forbes %>% mutate(total_cost = sales - profits)

# Graph Market value vs. Total Cost 
ggplot(forbes)+
  geom_point(aes(x=marketvalue,y=total_cost, col=category))+
  xlab('Market Value')+ ylab('Total Cost')+
  theme_economist()

#Compare multiple companies
companies_of_interest <- forbes %>% filter(name %in% c('IBM', 'Dell', 'Apple Computer'))
companies_of_interest %>% 
  ggplot()+geom_bar(aes(x=name, y=market_value, fill=name), stat='identity')+
  theme_economist()
