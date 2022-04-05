/// @description Bubble logic

//If the parent does not exist, destroy;
if (!instance_exists(parent)) {

    instance_destroy();
    exit;
}

//Increment angle(speed)
ang += 0.5;

//Increment length
inc += 0.1;

//Increment y position
rise -= a;

//Limit incerement
inc = clamp(inc, 0, 6);

//Set Y position
y = parent.bbox_top + rise;

//Set circle x movement
if (instance_exists(parent))
    x = (parent.x + cos(ang) * inc); //Angle times the length
    
//Destroy
if (y < parent.myball.y+16)
    instance_destroy();
