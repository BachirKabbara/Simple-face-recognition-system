# FaceRecogNet

## Project Description
FaceRecogNet is a face recognition system built using MATLAB. It utilizes a modified AlexNet model to distinguish between several known faces and understand non-facial objects. This project includes scripts for data collection, model training, and real-time face recognition testing.

## Features
- Facial data collection from webcam feed.
- Non-facial object data collection for improved differentiation.
- Training of a modified AlexNet model on custom data.
- Real-time face detection and recognition with a webcam.

## Installation
Clone this repository to your local machine using:
git clone https://github.com/BachirKabbara/Simple-face-recognition-system.git

## Usage
To use this face recognition system, follow these steps:

### Data Collection
1. **facialDataCollectionCode.m**: Captures facial images from a webcam feed.
2. **noFacialDataCollectionCode.m**: Captures non-facial images to enhance model differentiation.

Run these scripts individually to collect the necessary data for training the model.

### Model Training
Run `trainingCode.m` to train the model with the collected data. This script will modify the AlexNet architecture and adapt it to the face recognition task.

### Testing
Execute `testingModelCode.m` to start the real-time face recognition. This script will use the trained model to detect and classify faces in the webcam feed.

## Prerequisites
- MATLAB (Version XYZ or later recommended)
- Deep Learning Toolbox
- A webcam compatible with MATLAB
- Adequate lighting for image capture

## Contributions
Contributions are welcome! If you have suggestions or want to improve the project, please feel free to fork the repository and submit a pull request.

## License
This project is open-sourced under the MIT License.

## Contact
For any queries or discussions related to this project, feel free to contact me at bachir.m.kabbara@gmail.com.

## Disclaimer
This project is for educational purposes only. Please ensure all data is used ethically and with permission from all subjects involved in data collection.
