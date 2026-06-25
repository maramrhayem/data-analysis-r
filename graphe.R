#visualisation  des données avec R:GGPLOTS
library(dplyr)
library(ggplot2)
library(hflights)
data(hflights)
str(hflights)
#representer les compagnies selon le temps de retard moyen a l'arrivé
Temps_Retard <- hflights%>%
  select(UniqueCarrier,ArrDelay)%>%
  group_by(UniqueCarrier)%>%
  summarise(Temps_retard_arrivé_moyen=mean(ArrDelay,na.rm=T)) %>%
  slice_max(Temps_retard_arrivé_moyen,n=6)

#representation graphique (bar polt)
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity')

#changer la couleur des barres(green)
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           fill="pink")

#modifier l  couleur des barres pour chaque compagnie
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity')

#modifier la largeur des barres
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           width=0.8)


#modifier l'intensité de couleur(la transparence ):alpha
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           width=0.8,
           alpha=0.6)+
  theme_classic()

#donner un titre au graphique : Top 6 Compagnies selon temps retards Arrivé :labes
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           width=0.8,
           alpha=0.6)+
  theme_classic()+
  labs(title="Top 6 Compagnies selon temps retards Arrivé ")

#changer les nom des axes : Y=Temps de retard moyen , X="nom de la compagne"
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           width=0.8,
           alpha=0.6)+
  theme_classic()+
  labs(title="Top 6 Compagnies selon temps retards Arrivé ",
       x="nom de la compagne",y="Temps de retard moyen")

#ajouter un soutitre: votre nom ,source(caption); base de donner hflights
Temps_Retard %>%
  ggplot(aes(x=UniqueCarrier,y=Temps_retard_arrivé_moyen,
             fill=UniqueCarrier))+#chnou nhot fi x w chnoua  nhot fil y les axes
  geom_bar(stat='identity',
           width=0.8,
           alpha=0.6)+
  theme_classic()+
  labs(title="Top 6 Compagnies selon temps retards Arrivé ",
       subtitle="maram rhayem",
       caption="base de donner hflightts 2011",
       x="nom de la compagne",y="Temps de retard moyen")

