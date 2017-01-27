### Meet the Power of Visual Recognition with Watson
<p align="center">
  <img src="Watson Visual Recognition/default.png"/ width=160px>
  <img src="Watson Faces Detection/default.png"/ width=160px>
</p>
<p align="center">
  <img src="Watson Create Classifier/default.png"/ width=160px>
  <img src="Watson Delete Classifier/default.png"/ width=160px>
</p>
* **Watson Visual Recognition**: classifies content of pictures, objects it contains
* **Watson Create Classifier**: creates user-defined classifier for **Watson Visual Recognition**
* **Watson Delete Classifier**: deletes user-defined classifier
* **Watson Faces Detection**: detect where are the faces on picture and specifies gender, age and identity of face owners

### Before you start

1. **[Sign up](https://console.ng.bluemix.net/registration/?target=%2Fdashboard%2Fapps)** or log in to existing **[IBM Bluemix](https://console.ng.bluemix.net/)** acount.
	
2. In bluemix, go to **Catalog** -> **Watson** -> **[Visual Recognition](https://console.eu-gb.bluemix.net/catalog/services/visual-recognition/?taxonomyNavigation=apps)**, select pricing plan and hit "**create**"
	
3. Go to your **Services** -> **Visual Recognition** -> **Service Credentials**, click on "**View credentials**" and look for "**api_key**".

4. SPSS Modeler and R requirements:
	* [SPSS Modeler v18.0](http://www-03.ibm.com/software/products/en/spss-modeler)
	* SPSS Modeler "**[R Essentials](https://github.com/IBMPredictiveAnalytics/R_Essentials_Modeler/releases)**" plugin
	* R packages: 
		- httr
		- RJSONIO
		- RCurl
		
5. Install Visual_Recognition_with_Watson extension from [SPSS Modeler Extension Hub](https://ibmpredictiveanalytics.github.io/) or Visual_Recognition_with_Watson.mpe file.

6. You can check example streams inside folders of nodes you want to use.
