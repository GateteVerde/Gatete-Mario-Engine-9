/// @description Wave up and down while flying

if (flying > 0)
&& (flying < 3) {

    yspeed = -yspeed;
    alarm[1] = 24;
}