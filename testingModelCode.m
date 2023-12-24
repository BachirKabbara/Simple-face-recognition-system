clc 
clear all 
close all 
warning off 

% Loads a pre-trained model called "finalModel"
load finalModel;

% Connects to the default webcam
c=webcam; 
% Creates a face detector object
faceDetector=vision.CascadeObjectDetector; 
% Sets the threshold for merging face detection boxes
faceDetector.MergeThreshold=10; 

% x-coordinate of the top-left corner of the processing area
x=470; 
% y-coordinate of the top-left corner of the processing area
y=250; 
% Height of the processing area
height=300; 
% Width of the processing area
width=300; 

% Continuously captures frames from the webcam
while true 
    % Captures a frame from the webcam
    e=c.snapshot; 
    % Flips the frame horizontally
    e = fliplr(c.snapshot); 
    % Detects faces in the frame
    bboxes =step(faceDetector,e); 
    % Defines the processing area as a rectangle
    bboxess=[x y height width]; 


    % If there are detected faces in the frame
    if(sum(sum(bboxes))~=0) 
        % Crops the frame to the detected face
        es=imcrop(e,bboxes(1,:));
        % Resizes the cropped face image to [227, 227]
        es=imresize(es,[227 227]); 
        % Classifies the face image using the pre-trained model
        label=classify(myNet1,es); 
        % Displays the original frame
        image(e); 
        % Inserts a rectangle and the label for the detected face
        IFaces = insertObjectAnnotation(e,'rectangle',bboxes,label); 
        % Displays the processed frame
        imshow(IFaces); 
        % Forces MATLAB to display the updated figure
        drawnow; 
    else
        % If there are no detected faces in the frame
        % If the processing area is defined
        if(sum(sum(bboxess))~=0) 
            % Crops the frame to the processing area
            es=imcrop(e,bboxess(1,:)); 
            % Resizes the cropped area image to [227, 227]
            es=imresize(es,[227 227]); 
            % Classifies the processing area image using the pre-trained model
            label=classify(myNet1,es); 
            % Displays the original frame
            image(e); 
            % Inserts a rectangle and the label for the processing area
            IFaces = insertObjectAnnotation(e,'rectangle',bboxess,'Prossesing area'); 
            % Displays the processed frame
            imshow(IFaces); 
            % Displays the classification label as the figure title
            title(char(label)); 
            % Forces MATLAB to display the updated figure
            drawnow; 
        end
    end
end