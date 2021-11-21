/// @description Pendulum Platform (Platform) logic

//Time it
mytimer += parent.spd;
angle = cos(mytimer * (parent.spd / 10)) * (pi/2);

//Set the position of the block
x = xx - sin(angle) * parent.distance;
y = yy + cos(angle) * parent.distance;