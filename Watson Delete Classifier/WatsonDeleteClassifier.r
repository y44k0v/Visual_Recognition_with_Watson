#################################################################################
# 'WatsonDeleteClassifier' v1.0 node for IBM SPSS Modeler      			        #
# Artur Kucia                       						                    #
# IBM 2017                                                      				#
# Description: Use this node to delete previously created custom classifiers    #
#################################################################################

# Install function for packages
packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}

# Required packages
packages(httr)    
packages(RJSONIO)   
packages(RCurl)


watson_delete_custom_classifier <- function(watson_key, classifier_id){               
                # first - checking if classifier exists   
	check_url <- paste('https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classifiers?api_key=',watson_key,'&version=2016-05-20',sep="")	
	received_data <- RJSONIO::fromJSON( getURL(check_url))
	
	if(length(received_data$classifiers) > 0){
		for(i in length(received_data$classifiers)){		
		    if(received_data$classifiers[[i]][[1]]==classifier_id){
			delete_url <- paste("https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classifiers/",classifier_id,"?api_key=",watson_key,'&version=2016-05-17',sep="")
                                                    # deleting classifier
			req <- DELETE(delete_url)
			print(content(req, "text"))
                                                      return( 'OK')
		    }
                                        else  return( 'error')                                        
	                 }
                }
}
# Input
watson_key <- modelerData$%%watson_key%%
classifier_id <- "%%classifier_id%%"

status <-  'not_deleted'
status <- watson_delete_custom_classifier(watson_key,classifier_id)

# Returning data to modeler
var1 <- c(fieldName="Status", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
modelerDataModel <- data.frame(var1)
modelerData <-data.frame(status)