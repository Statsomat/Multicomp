# Continuity cutoff with respect to sample size 
cutoffcont <- function(n){
  
  # Cutoff for continuity f(n)=a*log10(n)+b, f(10)=0.75, f(50)=0.4, f(100)=0.25
  
  b=125
  a=-50
  
  if (n <= 50) {  
    cut <- min(1,round((a*log10(n)+b)/100,2))
  } else {
    
    # 20 unique values for sample sizes greater than 50
    cut <- 20/n
  }
  return(cut)
}

# Variables can be: Pure continuous or continuous with max 3 replications or other discrete distribution which can be approximated by continuous 
continuous <- function(col){
  
  dt <- data.table(col)
  reps <- na.omit(dt[,.N,by=col])
  
  if ( (all(reps[,2]<=3)) || 
       (length(unique(na.omit(col))) / length(na.omit(col)) >= cutoffcont(length(na.omit(col))))   ){
    return(TRUE)
  } else {
    return(FALSE)
  }
}


# Change mcp function to work automatically 
mcp2 <- function(x, interaction_average = FALSE, covariate_average = FALSE) {
  
  linfct <- x
  
  linfct <- lapply(linfct, function(x) {
    if (is.numeric(x) && !is.matrix(x)) {
      return(matrix(x, nrow = 1))
    } else {
      return(x)
    }})
  
  if (is.null(names(linfct)))
    stop(sQuote("linfct"), " doesn't have a ", sQuote("names"), 
         " attribute")
  
  classes <- sapply(linfct, function(x) inherits(x, "matrix") || 
                      inherits(x, "character"))
  
  
  if (length(linfct) == 1) {
    lf <- linfct[[1]][1]
    if (lf == "Means") {
      class(linfct) <- "means"
      return(linfct)
    }   
  }
  
  attr(linfct, "interaction_average") <- interaction_average
  attr(linfct, "covariate_average") <- covariate_average
  
  if (all(classes)) {
    class(linfct) <- "mcp"
    return(linfct)
  }
  
  stop("Arguments don't consist of either matrices or characters")
}

