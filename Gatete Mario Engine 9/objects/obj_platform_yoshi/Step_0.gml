/// @description Yoshi Platform logic

//Set colour (If yoshi exists)
if (global.mount == 1) {

	colour = obj_yoshi.colour;
}

//Set platform position
x = (global.mount == 1) ? xstart : -1000;
y = (global.mount == 1) ? ystart : -1000;