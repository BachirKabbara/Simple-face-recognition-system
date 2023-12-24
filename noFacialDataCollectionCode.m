clc               
clear all         
close all         
warning off

% Create a webcam object 
c=webcam;         
% Set x-coordinate of top-left corner of bounding box
x=400;
% Set y-coordinate of top-left corner of bounding box
y=250;            
% Set height of bounding box
height=300;       
% Set width of bounding box
width=300;        
% Combine the above parameters to create a bounding box
bboxes=[x y height width];  


% Set initial value of loop counter
temp=0;           


% Start a loop that will capture 3000 images
while temp<=3000  
    % Capture a snapshot from the webcam
    e=c.snapshot; 
    % Flip the image horizontally
    e = fliplr(c.snapshot);
    % Insert the bounding box into the image
    IFaces = insertObjectAnnotation(e,'rectangle',bboxes,'Processing Area'); 
    % Display the image with the bounding box overlay
    imshow(IFaces); 
    % Create a filename for the current image
    filename=strcat(num2str(temp),'.bmp'); 
    % Crop the image to only show the contents of the bounding box
    es=imcrop(e,bboxes);
    % Resize the cropped image to 227x227 pixels
    es=imresize(es,[227 227]); 
    % Save the cropped and resized image to disk
    imwrite(es,filename); 
    % Increment the loop counter
    temp=temp+1; 
    % Update the display
    drawnow; 
end

clear c;          