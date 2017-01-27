# WatsonFacesDetection - v 1.0.0
# Author: Mateusz Mika - IBM 2016

packages <- function(x) {
	x <- as.character(match.call()[[2]])
	if (!require(x,character.only=TRUE)){
		install.packages(pkgs=x,repos="http://cran.r-project.org")
		require(x,character.only=TRUE)
	}
}
packages(httr)

watsonApi <- function(destination,imageURL,apiVersion,apiKey){
	imageURL <- gsub('&','%26',imageURL)
	api_call <- paste0("https://gateway-a.watsonplatform.net/visual-recognition/api/v3/",destination,"?&url=",imageURL
					,"&version=",apiVersion,"&api_key=",apiKey)
	apiResponse <- GET(api_call)
	status <- apiResponse[["status_code"]]
	apiResponse <- content(apiResponse)[["images"]][[1]]
	
	if( status == 400 ) warning("Invalid input. Check for image URLs.")
	else if( status == 401 ) warning("Unauthorized. Check your Api Key.")
	else if( status == 404 ) warning("404")
	else if( status == 401 ) warning("Internal Server Error")
	else if( "error" %in% names(apiResponse)  ) warning(apiResponse[["error"]])
	else return(apiResponse)
	return("error")
}

apiKey <- "%%apiKey%%"
apiVersion <- "%%apiVersion%%"
imageURLs <- modelerData$%%inPhotoURLs%%

outImgSource <- c()
outAgeMax <- c()
outAgeMin <- c()
outAgeScore <- c()
outFaceHeight <- c()
outFaceWidth <- c()
outFaceLeft <- c()
outFaceTop <- c()
outGender <- c()
outGenderScore <- c()
outIdentityName <- c()
outIdentityScore <- c()
outIdentityType <- c()

for(imageURL in imageURLs){
	apiResponse <- watsonApi("detect_faces",imageURL,apiVersion,apiKey)
	if(apiResponse != "error") {
		faces <- apiResponse[["faces"]]
		imageSource <- apiResponse[["source_url"]]
	} else {
		warning(paste0("Above error is for photo from this URL: ",imageURL))
		next
	}
	if( length(faces) > 0 ){
		for(face in faces){
			outImgSource <- c(outImgSource,imageSource)
			age <- face[["age"]]
			if( !is.null(age[["max"]]) ){
				outAgeMax <- c(outAgeMax,age[["max"]])
			} else outAgeMax <- c(outAgeMax,"")
			if( !is.null(age[["min"]]) ){
				outAgeMin <- c(outAgeMin,age[["min"]])
			} else outAgeMin <- c(outAgeMin,"")
			outAgeScore <- c(outAgeScore,age[["score"]])
			loc <- face[["face_location"]]
			outFaceHeight <- c(outFaceHeight,loc[["height"]])
			outFaceWidth <- c(outFaceWidth,loc[["width"]])
			outFaceLeft <- c(outFaceLeft,loc[["left"]])
			outFaceTop <- c(outFaceTop,loc[["top"]])
			gender <- face[["gender"]]
			if( gender[["score"]] != "0" ) {
				outGender <- c(outGender,gender[["gender"]])
			} else outGender <- c(outGender,"")
			outGenderScore <- c(outGenderScore,gender[["score"]])
			if( !is.null(face[["identity"]]) ){
				ident <- face[["identity"]]
				outIdentityName <- c(outIdentityName,ident[["name"]])
				outIdentityScore <- c(outIdentityScore,ident[["score"]])
				if( !is.null(ident[["type_hierarchy"]]) ){
					outIdentityType <- c(outIdentityType,ident[["type_hierarchy"]])
				} else outIdentityType <- c(outIdentityType,"")
			} else {
				outIdentityName <- c(outIdentityName,"")
				outIdentityScore <- c(outIdentityScore,"")
				outIdentityType <- c(outIdentityType,"")
			}
		}
	} else {
		outImgSource <- c(outImgSource,imageSource)
		outAgeMax <- c(outAgeMax,"")
		outAgeMin <- c(outAgeMin,"")
		outAgeScore <- c(outAgeScore,"")
		outFaceHeight <- c(outFaceHeight,"")
		outFaceWidth <- c(outFaceWidth,"")
		outFaceLeft <- c(outFaceLeft,"")
		outFaceTop <- c(outFaceTop,"")
		outGender <- c(outGender,"")
		outGenderScore <- c(outGenderScore,"")
		outIdentityName <- c(outIdentityName,"")
		outIdentityScore <- c(outIdentityScore,"")
		outIdentityType <- c(outIdentityType,"")
	}
}

if( length(imageURLs) > 0 ){
	modelerData <- data.frame(outImgSource,outAgeMax,outAgeMin,outAgeScore,outFaceHeight,outFaceWidth,
		outFaceLeft,outFaceTop,outGender,outGenderScore,outIdentityName,outIdentityScore,outIdentityType)
} else warning("Did not found any URL")

var1 <- c(fieldName="Source", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var2 <- c(fieldName="AgeMax", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var3 <- c(fieldName="AgeMin", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var4 <- c(fieldName="AgeScore", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var5 <- c(fieldName="FaceHeight", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var6 <- c(fieldName="FaceWidth", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var7 <- c(fieldName="FaceLeft", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var8 <- c(fieldName="FaceTop", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var9 <- c(fieldName="Gender", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var10 <- c(fieldName="GenderScore", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var11 <- c(fieldName="IdentityName", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var12 <- c(fieldName="IdentityScore", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var13 <- c(fieldName="IdentityType", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
modelerDataModel <- data.frame(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10,var11,var12,var13)
