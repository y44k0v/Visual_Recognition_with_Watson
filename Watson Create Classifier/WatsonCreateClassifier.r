#################################################################################
# 'WatsonCreateClassifier' v1.0 node for IBM SPSS Modeler      			        #
# Artur Kucia                       						                    #
# IBM 2017                                                      				#
# Description: Use this node to created your custom classifier                  #
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


watson_create_custom_classifier <- function(watson_key, classifier_name, positive_name, positive_zip_path, negative_zip_path){
	create_url <- paste("https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classifiers?api_key=",watson_key,'&version=2016-05-17',sep="")
	
	body <- list()
	body[[paste(positive_name,'positive_examples', sep="_")]] <- upload_file(positive_zip_path)
	body[['negative_examples']] <- upload_file(negative_zip_path)
	body[[ "name" ]] <- classifier_name
				
	req <- POST(create_url, body = body, encode = "multipart")
	print(content(req, "text"))
	if(http_status(req)$category == "Success"){
		return(fromJSON(content(req,"text"))$classifier_id)
	}
	else warning(http_status(req))
}

# Input
pos_path <- "%%pos_path%%"
neg_path <- "%%neg_path%%"
watson_key <- modelerData$%%watson_key%%
classifier_name <- "%%classifier_name%%"
class_name <- "%%class_name%%"

new_id <- watson_create_custom_classifier(watson_key, classifier_name,class_name, pos_path, neg_path)

# Return data to modeler
modelerData <- data.frame(classifier_name, new_id, class_name, pos_path)
var1 <- c(fieldName="classifier", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var2 <- c(fieldName="classifier ID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var3 <- c(fieldName="class name", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var4 <- c(fieldName="path to class examples", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
modelerDataModel <- data.frame(var1,var2,var3,var4)