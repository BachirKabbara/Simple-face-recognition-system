    clc 
    clear all 
    close all 
    warning off 
    
    
    % Loads the pre-trained AlexNet model
    g=alexnet; 
    % Extracts the layers of the pre-trained model
    layers=g.Layers; 
    % Replaces the 23rd layer with a new fully connected layer with 6 output neurons
    layers(23)=fullyConnectedLayer(6); 
    % Replaces the 25th layer with a new classification layer
    layers(25)=classificationLayer; 
    
    
    % Creates an imageDatastore from a folder containing subfolders of images with folder names serving as labels
    allImages=imageDatastore('datastorage','IncludeSubfolders',true, 'LabelSource','foldernames'); 
    
    
    % Defines the training options: Stochastic Gradient Descent with Momentum, initial learning rate of 0.001, maximum epochs of 15, mini-batch size of 64, and automatically uses either the CPU or GPU for training
    opts=trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',15,'MiniBatchSize',64, 'ExecutionEnvironment', 'auto'); 
    
    
    % Trains a new network using the imageDatastore, layers, and options defined above
    myNet1=trainNetwork(allImages,layers,opts); 
    
    
    % Saves the final trained model for future use
    save finalModel; 