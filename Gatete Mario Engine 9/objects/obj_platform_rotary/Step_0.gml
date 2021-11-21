/// @description Set up the speed of the platform

//Increment speed
if (morespeed == 1)
    image_speed += 0.07;
    
//Decrement speed
else if (morespeed == 0)
    image_speed += -0.07;
    
//Set maximum speed
else if (morespeed == 2)
    image_speed = 1.5;