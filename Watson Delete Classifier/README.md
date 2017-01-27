# Delete your custom image classifier for Watson Visual Recognition service

This extensions enables you to delete your custom classifiers.

<p align="center">
  <img src="default.png"/ width=320px>
</p>

service demo:
https://visual-recognition-demo.mybluemix.net/train

# Example usage

Example stream

<p align="center">
  <img src="Screenshot/stream.PNG"/ width=600px>
</p>


WatsonDeleteClassifier node requires a connected source with your 'api_key' for bluemix services. 

<p align="center">
  <img src="Screenshot/input1.PNG"/ width=600px>
</p>

In the WatsonDeleteClassifier's main window provide the id of the classifier and connect the 'api_key' from the 'user input' node.


<p align="center">
  <img src="Screenshot/input2.PNG"/ width=600px>
</p>
	
	
# Output

The generated output will inform you whether the operation was successful.


<p align="center">
  <img src="Screenshot/output.PNG"/ width=600px>
</p>

You can train new classifiers with ['WatsonCreateClassifier'][2] extension!



# License
- [Apache 2.0][1]

# Contributors
- Artur Kucia

 [1]: http://www.apache.org/licenses/LICENSE-2.0.html
 [2]: https://github.com/SpssModelerExtensions/WatsonCreateClassifier
