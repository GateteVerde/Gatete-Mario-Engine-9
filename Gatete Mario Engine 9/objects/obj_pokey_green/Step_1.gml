/// @description Make sure pokey parts do not get lost

if (!instance_exists(mebelow)) {

    var next = mebelow;
    while (next != noone) {
    
        instance_activate_object(next);
        if (instance_exists(next))
            next = next.mebelow;
        else
            next = noone;
    }
}
