

```{r}

library(tidyverse)
library(ggplot2)
library(lubridate)

shipment <- read.csv(file = "C:/Users/abhis/Documents/R Studio/DMBA-R-datasets/ApplianceShipments.csv", header = TRUE)
```

Problem one: Shipments of household appliances
```{r}
#a
#There was only one observation per quarter, a geom_point is a better form of visualization

ggplot(data = shipment, mapping = aes(x = Quarter, y = Shipments)) +
  geom_point() +
  geom_smooth(se = FALSE)


#c
Quarter <- c('Q1-1985', 'Q1-1986', 'Q1-1987', 'Q1-1988', 'Q1-1989')
Shipments <- c('4009', '4123', '4493', '4595', '4245')

Q1 <- data.frame(Quarter, Shipments, stringsAsFactors = FALSE)

Quarter <- c('Q2-1985', 'Q2-1986', 'Q2-1987', 'Q2-1988', 'Q2-1989')
Shipments <- c('4321', '4522', '4806', '4799', '4900')

Q2 <- data.frame(Quarter, Shipments, stringsAsFactors = FALSE)

Quarter <- c('Q3-1985', 'Q3-1986', 'Q3-1987', 'Q3-1988', 'Q3-1989')
Shipments <- c('4224', '4657', '4551', '4417', '4585')

Q3 <- data.frame(Quarter, Shipments, stringsAsFactors = FALSE)

Quarter <- c('Q4-1985', 'Q4-1986', 'Q4-1987', 'Q4-1988', 'Q4-1989')
Shipments <- c('3944', '4030', '4485', '4258', '4533')

Q4 <- data.frame(Quarter, Shipments, stringsAsFactors = FALSE)
df<- data.frame(Q1,Q2,Q3,Q4)


ggplot(df, aes(x=Quarter)) +                    
  geom_point(aes(y=Shipments), colour="red") +
  geom_point(aes(y=Shipments.1), colour="green") +
  geom_point(aes(y=Shipments.2), colour="blue") +
  geom_point(aes(y=Shipments.3), colour="yellow")
```

Problem 3: Laptop sales at a London computer chain
```{r}

#a

laptop <- read.csv(file = "C:/Users/abhis/Documents/R Studio/DMBA-R-datasets/LaptopSalesJanuary2008.csv", header = TRUE)

# The lowest Average retail is of the store 'W4 3PH' with the average value being 481.0063
# The highest Average retail is of the store 'N17 6QA' with the average value being 494.6341

laptop%>%group_by(Store.Postcode)%>%
  summarise(Avg_retail = mean(Retail.Price,na.rm = TRUE))%>%
  arrange(Avg_retail)

#b

ggplot(data = laptop, aes(x = Store.Postcode, y = Retail.Price, colour = Store.Postcode)) +
  geom_boxplot()

```

Problem 4: Laptop sales at a London computer chain
```{r}

laptop_sales <- read.csv(file = "C:/Users/abhis/Documents/R Studio/DMBA-R-datasets/LaptopSales.csv", header = TRUE)

#a
#i THe laptops are actually sold at the 'Retail.Price'


#iii
#The prices are the same at different stores. I took 'Processor.Speeds..GHz.' as a reference column and same processor computers cost the same at different stroes which led me to this conclusion

laptop_sales%>%group_by(Processor.Speeds..GHz.)%>%
  summarise(Avg_retail = mean(Retail.Price,na.rm = TRUE))%>%
  arrange(Processor.Speeds..GHz.)

#iv
#The prices do change with the configuration of the computer. Although, as you can see there is no such relation between configuration and retail price

laptop_sales%>%group_by(Configuration)%>%
  summarise(Avg_retail = mean(Retail.Price,na.rm = TRUE))%>%
  arrange(Configuration)


#b
#i The stores and customers are located in differet regions and they are mapped through the postal codes in this dataset

#ii
# The highest Average retail is of the store 'N17 6QA' with the average value being 522.9433
laptop_sales%>%group_by(Store.Postcode)%>%
  summarise(Avg_retail = mean(Retail.Price,na.rm = TRUE))%>%
  arrange(Avg_retail)

#iv
cust_travel <- data.frame(laptop_sales$customer.X,laptop_sales$customer.Y,laptop_sales$store.X, laptop_sales$store.Y)

head(cust_travel)
```