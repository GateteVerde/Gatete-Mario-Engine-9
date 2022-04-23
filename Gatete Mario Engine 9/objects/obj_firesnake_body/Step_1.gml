/// @description Keep parent active

//If the parent does not exist, activate it.
if (!instance_exists(parent)) {

    instance_activate_object(parent);
    with (parent)
        event_perform(ev_step, ev_step_begin);
}
