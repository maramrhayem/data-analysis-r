####ex1
x <- c(1,2,3,4)
print(x)
y <- c("apple"," banana","cherry","cranberry")
print(y)
x[3] #l'element 3 de vecteur x
##deplacer 3  dans x par 10

length(x)
z <- c(x , y) #concatenation de deux vecteur
print(z)
m <- matrix(data = c(1,2,3,4,5,6,7,8),
              nrow=2,
              ncol=4);m

n<- matrix(data=runif(8),##data=rnorm(8)
           nrow=2,
           ncol=4);n
m[2,] #affichage 2eme ligne de matrice
m[2,] <- c(10,20,30,40)#deplacer 2eme ligne par ce vecteur 
m

dim(m)#dimension de m
transposer_n <- t(n) 
print(transposer_n)

l <-list(x,m,n)
print(l)
 
l[[2]]
l[[2]]<-n
print(l)


df <- data.frame(x,y,m)##creation de data frame
df
df[2,]##affichage de 2eme ligne
df[2,]<- c(10, 20,"banana")
df







####################################################ex2


favorite_movies <- c("f1","f2","f3","f4","f5")
favorite_movies
movie_ratings <- matrix (c (9.5 , 9.0, 8.5, 9.2, 8.8, 9.3,8.9, 9.4, 8.7),
                         nrow=3,
                         ncol=3);movie_ratings #creation de matrice
favorite_books <- list("b1","b2","b3","b4","b5") #creation de liste
favorite_artists <- data.frame(
  nom = c("Art 1", "Art 2", "Art 3", "Art 4", "Art 5"),
  genre = c("G 1", "G 2", "G 3", "G 4", "G 5"),
  annee = c("y 1", "y 2", "y 3", "y 4", "y 5")
)# creation de data frame
favorite_artists

artist_genre <- factor(favorite_artists$genre) # creation de variable d'apres une colonne de data frame 
artist_genre

favorite_movies[2]
movie_ratings[2,3]
favorite_books[3]
colnames (favorite_artists) #affichage des noms de dataframe
summary(artist_genre)

favorite_movies <-c(favorite_movies,"f6")#ajout d'une    valeur au vecteur
favorite_movies

movie_ratings <- cbind(movie_ratings,c(9.0,8.3,8.6))#ajout d'une colonne au matrice
movie_ratings

favorite_books[[6]] <-"b6"####favorite_books <- c(favorite_books,"b6" ))

favorite_books

#ajout de nouveau artiste dans une data frame

favorite_artists <- rbind( favorite_artists,data.frame(nom="Art 6" , genre="g6" , annee="y6"))
favorite_artists

favorite_movies[2] <-"The_Silence_of_the_Lambs"
print(favorite_movies)

movie_ratings[3,2] <- 10 #modification matrice
favorite_books[[3]]<-"Moby_Dick" #modification liste
favorite_artists[1,"genre"]<-"pop"#modification dataframe ligne 1colonne 2

favorite_movies <- sort(favorite_movies, decreasing = TRUE) #trie décroissant pour vecteur
indices_tri <- order(movie_ratings[, 3], decreasing = TRUE) #trie matrice par le 3eme colonne

# Trier par longueur croissante
longueurs <- sapply(favorite_books, nchar)  #La fonction nchar() compte le nombre de caractères dans une chaîne de texte.
favorite_books <- favorite_books[order(longueurs)]


favorite_artists <- favorite_artists[order(favorite_artists$annee), ]







####################################### ex3:
 
age <- c(22, 35, 28, 33, 25)
names <- c("John","Jane","Jim","Jill","Jack")
person_info <- matrix(c(age,names),
                      nrow=5,
                      ncol=2);person_info

person_details <- list("names"=names,"age"=age)
person_details

people <-data.frame(person_details)
people

#ajout d'une colone dans data frame
age_group <- factor(ifelse(age<=25,"yong",
                    ifelse(age<=35,"middle-aged",
                    ifelse(age >35,"old"))))#boucle if

people$age_group <- age_group
people
 
people$gander <- c("male","female","male","male","male")#ajout d'une colonne au data
people

first_three <- people[1:3,] #creation de data frame d'apres  de 1er jusqu'a 3 eme ligne et tout les colonnes
####  === first_three <- head(people, 3)

p <- people[,c(2,4)]
p
 
people <- people[order(people[,2], decreasing = TRUE), ]#tri décroissant de matrice selon 
people

people <- people[order(people[[4]], people[[2]], decreasing = c(FALSE, TRUE),method = "radix"), ]
people







############################## ex4 :

# creation de data frame
sales <- data.frame(
  product_preference = c("toothbrush", "toothpaste", "floss", "mouthwash"),
  price = c(3.99, 2.99, 1.99, 4.99),
  units_sold = c(5000, 6000, 4000, 7000)
)

sales$revenue <- sales$price * sales$units_sold #colonne revenue
sales



summary_stat <- data.frame(
  variable = c("price", "units_sold"),
  mean = c(mean(sales$price), mean(sales$units_sold)),
  median = c(median(sales$price), median(sales$units_sold)),
  sd = c(sd(sales$price), sd(sales$units_sold))
)


barplot(sales$units_sold, 
        names.arg = sales$product_preference,
        main = "Units Sold by Product",
        xlab = "Product",
        ylab = "Units Sold",
        col = "lightblue")

pie(sales$revenue, 
    labels = sales$product_preference,
    main = "Market Share by Revenue",
    col = c("lightblue", "lightgreen", "lightcoral", "lightyellow"))


customer_survey <- data.frame(
  age = c(25, 30, 35, 40, 45, 50, 55, 60, 65, 70),
  gender = c("Male", "Female", "Male", "Female", "Male", 
             "Female", "Male", "Female", "Male", "Female"),
  product_preference = c("toothbrush", "toothpaste", "floss", "mouthwash", 
                         "toothbrush", "toothpaste", "floss", "mouthwash", 
                         "toothbrush", "toothpaste")
)
customer_survey


#fusionner les deux data frame
marketing_data <- merge(sales, customer_survey, by = "product_preference")
marketing_data


marketing_data_subset <- subset(marketing_data, 
                                gender == "Male" & product_preference == "toothbrush")



