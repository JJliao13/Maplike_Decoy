library(lme4)
library(ggstatsplot)
library(ggplot2)
library(ggthemes)


# The path needs to be changed before running

wkDir <- 'E:/DecoyResults' 
DecoyMD <- read.csv('E:/DecoyResults/Behavioral_Data_Decoy.csv',head=T)


# The model with Euclidean metrics between the options as regressors
Decoy_GLMOptions<-lmer(RT~Distance_AB+Distance_AC+Distance_BC+cos_ABC+(1|subid),data=DecoyMD,control = lmerControl())

# The model with Euclidean metrics between the options and the original point as regressors 
Decoy_GLMPoint<-lmer(RT~+Distance_OA+Distance_OB+Distance_OC+cos_AOB+cos_BOC+(1|subid),data=DecoyMD,control = lmerControl())


# Plotting with ggstatsplot::ggcoefstats:

ggstatsplot::ggcoefstats(x = Decoy_GLMPoint,exclude.intercept = TRUE,
                         xlab='Model Coefficient',ylab='Euclidean Metrics',
                         
                         nrow = 2,ncol = 2,
                         stats.label.args = list(size = 4,direction = "y", min.segment.length = 0),
                         
                         ggtheme=ggstatsplot::theme_ggstatsplot()
)+
theme(text = element_text(size = 18, face="bold"))
