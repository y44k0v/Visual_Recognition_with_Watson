# Classify images with Watson Visual Recognition

This extension enables you to harness the power of machine learning and automatically analyze the contents of pictures.

<p align="center">
  <img src="Watson Visual Recognition/default.png"/ width=320px>
</p>

service demo:
https://visual-recognition-demo.mybluemix.net/

# Example usage

Example stream

<p align="center">
  <img src="Watson Visual Recognition/Screenshot/stream.PNG"/ width=600px>
</p>

Example images

<p align="center">
  <img src="https://cdn.pixabay.com/photo/2016/04/20/22/32/golden-retriever-1342263_1280.jpg"/ width=200px>  
  <img src="https://upload.wikimedia.org/wikipedia/commons/e/e9/Goldfish3.jpg"/ width=200px>
  <img src="https://cdn.pixabay.com/photo/2016/05/18/20/57/cat-1401557_1280.jpg"/ width=200px>
</p>


WatsonVisualRecognition node requires a connected source. In our example a 'Var. File' node will be used.
The source must contain two columns of variables: one will be your pictures id or names, the other the urls you wish to classify.

<p align="center">
  <img src="Watson Visual Recognition/Screenshot/input1.PNG"/ width=600px>
</p>

	
In the node window you must provide the 'api_key' for your bluemix service and choose appropriate positions in the 'Image URLS' and 'Image IDS' fields.

Optionally you can specify custom classifier or api version. To learn more about custom classifiers check out: 
[WatsonCreateClassifier][9]

<p align="center">
  <img src="Watson Visual Recognition/Screenshot/input2.PNG"/ width=600px>
</p>
	
	
# Output

The generated output is a table that contains the picture ids, picture urls, class names and their respective scores. 
Note that for one image the number of generated table entries depends on the number of classes assigned to picture by the classifier.
	
<p align="center">
  <img src="Watson Visual Recognition/Screenshot/output.PNG"/ width=600px>
</p>

Looking for pictures to classify? Try these extensions: [FacebookPhotoImport][7] and [InstagramPictures][8]
	
# License
- [Apache 2.0][1]

# Contributors
- Artur Kucia
- Mateusz Mika

 [1]: http://www.apache.org/licenses/LICENSE-2.0.html
 [7]: https://github.com/SpssModelerExtensions/FacebookPhotoImport
 [8]: https://github.com/SpssModelerExtensions/InstagramPictures
 [9]: https://github.com/SpssModelerExtensions/WatsonCreateClassifier
