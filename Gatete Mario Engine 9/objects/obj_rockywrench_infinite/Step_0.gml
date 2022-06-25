/// @description Generate a new one if the one created was killed

if (ready == 0)
&& (!instance_exists(gen)) {

    ready = 1;
    alarm[0] = 90;
}