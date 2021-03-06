# for all functions, you can return values based on the first or random record if there are multiple matches,

# 1.  Write a function to print some information about a pokemon, Print its name, classification, and primary and secondary types


 #'Function for getting data about a single pokemon
 #'@param name description
 #'@examples pokeDex("Litwick")
 #'@return  None
 #'@export

pokeDex<-function(name){
  temp=pokemon[pokemon$Pokemon.Name==name,] #get all the rows with the given names
  print(paste(temp[1, "Pokemon.Name"],temp[1,"Classification"], temp[1,"Primary.Type"],temp[1,"Secondary.Type"]))
#the 1 gets the first row
}

# 2. Write a function that takes in 2 pokemon and determines if the attack stat of the first pokemon is higher than the defense stat of the second.

atkCheck<-function(attacker, defender){
}

# 3. Write a function that returns the result of trying to catch the pokemon at a particular health
# using a modification of the formula found below catchProb=((3 * HPmax - 2 * HPcurrent) * ratemodified / (3 * HPmax))/100
#from here: https://bulbapedia.bulbagarden.net/wiki/Catch_rate#General_capture_method_.28Generation_II_onwards.29
#calculate the percent likelihood then sample c(TRUE,FALSE) with probabilities c(catchProb,1-catchProb) and return the result
#get the HPmax from the data

pokeBall<-function(pokemon, currentHP){

}



# Then
#1.  create a package with the data set and functions
#2.  roxygen notes, generate the documentation,
#3.  install the package
#4.  view your documentaion with ?pokeDex etc
#5.  use your functions


library(R6)
#' R6 Class representing Pokemon
#'
#' A Pokemon includes its name, primary type, secondary type, health points, and awake status
#' @export
Pokemon=R6Class(
  "Pokemon",
  public=list(
    #' @field name Name of the Pokemon
    name=NULL,

    #' @field type1 Primary type of Pokemon
    type1= NULL,

    #' @field type2 Secondary type of Pokemon
    type2=NULL,

    #' @field startHP Starting health points of Pokemon
    startHP=NULL,

    #' @field awake Weather the Pokemon is awake or not
    awake=NULL,

    #' @description
    #' Create a new Pokemon player
    #' @param name Name.
    #' @return New Pokemon object that was created.
    #' @examples Pokemon$new("Litwick") to get information for the pokemon Litwick
    initialize=function(name=NA){
      if (name %in% pokemon$Pokemon.Name){
      pokemondata=pokemon[pokemon$Pokemon.Name==name,]
      self$name<-name
      self$type1<-pokemondata[1, 'Primary.Type']
      self$type2<-pokemondata[1, 'Secondary.Type']
      self$startHP<-pokemondata[1, 'Health.Stat']
      self$awake<-TRUE
      self$show()
      }
    },

    #' @description
    #' This will show you the Pokemon information
    show=function(){
      cat('Name- ' ,self$name,'\nPrimary Type- ', self$type1, ' \nSecondary Type- ', self$type2, '\nHealth Points- ', self$startHP, '\nAwake- ', self$awake)
    },

    #' @description
    #' This will Change the HP of the Pokemon and could change the awake status depending on the Health Points status
    #' @param poke Will change the HP value
    #' @examples poke1$fight(poke2). you call this function technically by the fight function but will then be looked at here as well
    changeHP=function(poke){
      health=self$startHP
      HPnow=health-poke
      self$startHP=HPnow
      if (self$startHP<=0){
        self$awake=FALSE
      }
      #increase or decrease HP depending if its sent a pos or neg number
      #call fight function then it'll be changed
    },

    #' @description
    #' Fight each other
    #' @param poke2 brings in the value to change the health points for battle
    #' @examples poke1$fight(poke2) will make it fight. poke1 is set to one pokemon and poke2 is set to the other pokemon player
    #' @export
    fight=function(poke2){
      if (self$awake==FALSE){
        stop("Your pokemon is not awake, it cannot fight")
      }
      else if (poke2$awake == FALSE){
        stop("Pokemon is not awake, it cannot fight")
      }
      else{
        self$changeHP(20)
        poke2$changeHP(20)
      }
    }
  )
)


#' Data about Pokemon
#'
#' a dataset with data about pokemon from source
#'
#' @format A datafram wit 1076 number of rows/observations and 47 varibles
#' \describe {
#'  \item{Pokemon.Id}{the ID number for this pokemon in this dataset}
#' \item{Pokemon.Name}{The official name of the pokemon}
#' }
#' @examples
#' pokemon
'pokemon'





