// wTimer by Mors
// http://www.mors-games.com/

/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

#macro __WTIMER_VERSION "2.1.2"

show_debug_message("wTimer v" + __WTIMER_VERSION + " by Mors");

global.__timer_list = ds_list_create();
global.__timer_index = 0;
global.__tick_rate = 1;

// The enum for timer types.
enum timer_type {
    frames,
    milliseconds,
    trigger
}

// A counter used to get the frames that have passed so far during the game. Not affected by the timer tick rate.
// "globalvar" was only used to make it fit GameMaker's internal variable naming convention.
globalvar current_frames;
current_frames = 0;

/// @func timer(callback, duration, repeat[OPTIONAL], arguments...[OPTIONAL])
/// @desc Executes the callback function in the given amount of frames.
/// @param {function} callback The callback function to execute.
/// @param {real} duration Amount of frames it will take for the timer to execute the callback function.
/// @param {bool} repeat[OPTIONAL] If the timer will repeat after being completed or will be destroyed. Optional, and false by default.
/// @param {anything} arguments...[OPTIONAL] Arguments that can be used with the callback function. You can have a maximum of 16. Optional.
/// @returns {real} The ID corresponding to the timer.
function timer(_callback, duration, _repeat = false) {
    var _arguments = undefined;
    if (argument_count > 3) {
        for (var i = 3; i < argument_count; i++) {
            _arguments[i-3] = argument[i]
        }
    }
        
    ds_list_add(global.__timer_list, {
        index: global.__timer_index,
        instance: id,
        callback: _callback,
        initial_duration: duration,
        value: duration,
        rep: _repeat,
        arguments: _arguments,
        extra_time: 0,
        paused: false,
        deactivated: false,
        multiplier: 1,
        type: timer_type.frames
    });
    
    return global.__timer_index++;
}

/// @func timer_ms(callback, duration, repeat[OPTIONAL], arguments...[OPTIONAL])
/// @desc Executes the callback function in the given amount of milliseconds. If you're not making use of delta time you probably might want to use the regular timer function instead.
/// @param {function} callback The callback function to execute.
/// @param {real} duration Amount of milliseconds it will take for the timer to execute the callback function.
/// @param {bool} repeat[OPTIONAL] If the timer will repeat after being completed or will be destroyed. Optional, and false by default.
/// @param {anything} arguments...[OPTIONAL] Arguments that can be used with the callback function. You can have a maximum of 16. Optional.
/// @returns {real} The ID corresponding to the timer.
function timer_ms(_callback, duration, _repeat = false) {
    var _arguments = undefined;
    if (argument_count > 3) {
        for (var i = 3; i < argument_count; i++) {
            _arguments[i-3] = argument[i]
        }
    }
        
    ds_list_add(global.__timer_list, {
        index: global.__timer_index,
        instance: id,
        callback: _callback,
        initial_duration: duration,
        value: current_time,
        rep: _repeat,
        arguments: _arguments,
        extra_time: 0,
        paused: false,
        deactivated: false,
        multiplier: 1,
        type: timer_type.milliseconds
    });
    
    return global.__timer_index++;
}

/// @func timer_trigger(callback, trigger, repeat[OPTIONAL], arguments...[OPTIONAL])
/// @desc Executes the callback function whenever the trigger function returns true.
/// @param {function} callback The callback function to execute.
/// @param {function} trigger The trigger function that will execute the callback function if there's a true return.
/// @param {bool} repeat[OPTIONAL] If the timer will repeat after being completed or will be destroyed. Optional, and false by default.
/// @param {anything} arguments...[OPTIONAL] Arguments that can be used with the callback function. You can have a maximum of 16. Optional.
/// @returns {real} The ID corresponding to the timer.
function timer_trigger(_callback, trigger, _repeat = false) {
    var _arguments = undefined;
    if (argument_count > 3) {
        for (var i = 3; i < argument_count; i++) {
            _arguments[i-3] = argument[i]
        }
    }
        
    ds_list_add(global.__timer_list, {
        index: global.__timer_index,
        instance: id,
        callback: _callback,
        initial_duration: -1,
        value: trigger,
        rep: _repeat,
        arguments: _arguments,
        extra_time: 0,
        paused: false,
        deactivated: false,
        multiplier: 1,
        type: timer_type.trigger
    });
    
    return global.__timer_index++;
}

/// @func timer_destroy(timer)
/// @desc Stops and destroys the given timer. Does not need to be called manually after the timer's time runs out.
/// @param {real} timer The index of the timer to destroy.
/// @returns {bool} Whether if the given timer was successfully destroyed or not.
function timer_destroy(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            delete _result;
            ds_list_delete(global.__timer_list, i);
            return true;
        }
    }
    return false;
}

/// @func timer_destroy_object(id)
/// @desc Stops and destroys all timers that either belong to the given instance or all instances of the given object type.
/// @param {instance_id/object_index} id The instance ID or the object index that the timers are assigned to. You can also use the "all" keyword.
/// @returns {real} Number of timers that have been successfully destroyed.
function timer_destroy_object(_id) {
    var _return = 0;
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if ((_id == _result.instance) || (_id == all)
        || (instance_exists(_result.instance) && _id == _result.instance.object_index)) {
            delete _result;
            ds_list_delete(global.__timer_list, i);
            _return++;
        }
    }
    return _return;
}

/// @func timer_get(timer)
/// @desc Returns either the duration the given timer, or the trigger function if the timer uses that.
/// @param {real} timer The index of the timer to get the remaining duration of.
/// @returns {real or function} Either the duration or the trigger function of the given timer. Returns -1 if the timer doesn't exist.
function timer_get(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            if (_result.type == timer_type.milliseconds) {
                if (_result.paused)
                    return _result.initial_duration + _result.extra_time + _result.value
                else
                    return _result.initial_duration + _result.extra_time - current_time + _result.value
            }
            else {
                return _result.value;
            }
        }
    }
    return -1;
}

/// @func timer_get_time(timer)
/// @desc Returns the initial duration that was set for the given timer in either frames or milliseconds. If you want to get the remaining duration, use timer_get instead. Returns -1 if the timer doesn't exist or if the timer uses triggers.
/// @param {real} timer The index of the timer to get the initial duration of.
/// @returns {real} How much time the given timer had initially, in frames or milliseconds.
function timer_get_time(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            return _result.initial_duration;
        }
    }
    return -1;
}

/// @func timer_get_type(timer)
/// @desc Returns whether if the given timer uses frames, milliseconds, or triggers, as timer_type enum.
/// @param {real} timer The index of the timer to get the type of.
/// @returns {timer_type} Whether if the given timer uses frames, milliseconds, or triggers. Returns -1 if the timer doesn't exist.
function timer_get_type(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            return _result.type;
        }
    }
    return -1;
}

/// @func timer_set_paused(timer, pause[OPTIONAL])
/// @desc Pauses the given timer, preventing it from progressing.
/// @param {real} timer The index of the timer to pause.
/// @param {bool} pause[OPTIONAL] If the timer should be paused or resumed. When not used, the timer just gets toggled. Optional.
/// @returns {bool} Whether if the given timer was successfully paused or not.
function timer_set_paused(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            if (argument_count > 1)
                _result.paused = argument[1];
            else
                _result.paused = !_result.paused;
            if (_result.paused)
                _result.extra_time -= current_time;
            else
                _result.extra_time += current_time;
            return true;
        }
    }
    return false;
}

/// @func timer_set_paused_object(id, pause[OPTIONAL])
/// @desc Pauses all timers that either belong to the given instance or all instances of the given object type.
/// @param {instance_id/object_index} id The instance ID or the object index that the timers are assigned to. You can also use the "all" keyword.
/// @param {bool} pause[OPTIONAL] If the timers should be paused or resumed. When not used, the timers just get toggled. Optional.
/// @returns {real} Number of timers that have been successfully paused.
function timer_set_paused_object(_id) {
    var _return = 0;
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if ((_id == _result.instance) || (_id == all)
        || (instance_exists(_result.instance) && _id == _result.instance.object_index)) {
            if (argument_count > 1)
                _result.paused = argument[1];
            else
                _result.paused = !_result.paused;
            if (_result.paused)
                _result.extra_time -= current_time;
            else
                _result.extra_time += current_time;
            _return++;
        }
    }
    return _return;
}

/// @func timer_get_paused(timer)
/// @desc Returns whether if the given timer is paused or not.
/// @param {real} timer The index of the timer.
/// @returns {bool} Whether if the given timer is paused or not. Returns -1 if the given timer doesn't exist.
function timer_get_paused(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            return _result.paused;
        }
    }
    return -1;
}

/// @func timer_set_multiplier(timer, multiplier)
/// @desc Changes the speed multiplier of the given timer. If not manually changed, it's 1 by default. Has no effect on timers that use triggers.
/// @param {real} timer The index of the timer to change the speed multiplier of.
/// @param {real} multiplier The new speed multiplier for the given timer.
/// @returns {bool} Whether if the given timer's speed multiplier was successfully changed or not.
function timer_set_multiplier(timer, multiplier) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            _result.multiplier = multiplier;
            return true;
        }
    }
    return false;
}

/// @func timer_set_multiplier_object(id, multiplier)
/// @desc Changes the speed multipliers of all timers that either belong to the given instance or all instances of the given object type. If not manually changed, it's 1 by default. Has no effect on timers that use triggers.
/// @param {instance_id/object_index} id The instance ID or the object index that the timers are assigned to. You can also use the "all" keyword.
/// @param {real} multiplier The new speed multiplier for the timers.
/// @returns {real} Number of timers that have their multiplier changed successfully.
function timer_set_multiplier_object(_id, multiplier) {
    var _return = 0;
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if ((_id == _result.instance) || (_id == all)
        || (instance_exists(_result.instance) && _id == _result.instance.object_index)) {
            _result.multiplier = multiplier;
            _return++;
        }
    }
    return _return;
}

/// @func timer_get_multiplier(timer)
/// @desc Returns the speed multiplier of the given timer. If not manually changed, it's 1 by default. Returns -1 if the given timer doesn't exist.
/// @param {real} timer The index of the timer to get the speed multiplier of.
/// @returns {real} The speed multiplier of the given timer.
function timer_get_multiplier(timer) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            return _result.multiplier;
        }
    }
    return -1;
}

/// @func timer_change(timer, duration, change_repeat_time[OPTIONAL])
/// @desc Changes the current remaining duration or the trigger of the given timer.
/// @param {real} timer The index of the timer to pause.
/// @param {real/function} duration The new remaining duration or the trigger function for the given timer.
/// @param {real} change_repeat_time[OPTIONAL] When true, only the time used for the future repeats of the given timer is changed. Optional.
/// @returns {bool} Whether if the given timer's remaining time was successfully changed or not.
function timer_change(timer, duration, change_repeat_time = false) {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.index == timer) {
            if (change_repeat_time)
                _result.initial_duration = duration;
            else
                _result.value = duration;
            return true;
        }
    }
    return false;
}

/// @func timer_system_update()
/// @desc Must be called every single frame for the timers to work.
function timer_system_update() {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (_result.paused)
            continue;
        var _not_destroyed = false;
        try {
            _not_destroyed = _result.instance.id >= 0;
        }
        catch(_) {}
        if (_result.deactivated) {
            if (instance_exists(_result.instance)) {
                _result.deactivated = false;
                _result.extra_time += current_time;
            }
            else {
                if (!_not_destroyed) {
                    delete _result;
                    ds_list_delete(global.__timer_list, i);
                    i--;
                }
                continue;
            }
        }
        else if (!instance_exists(_result.instance) && _not_destroyed) {
            _result.deactivated = true;
            _result.extra_time -= current_time;
            continue;
        }
        if (_result.type == timer_type.milliseconds && _result.multiplier <> 1) {
            _result.extra_time += delta_time / 1000 * (1 - _result.multiplier);
        }
        if ((_result.type == timer_type.frames && _result.value <= 0)
        || (_result.type == timer_type.milliseconds && current_time >= _result.initial_duration + _result.value + _result.extra_time)
        || (_result.type == timer_type.trigger && _result.value())) {
            if (instance_exists(_result.instance)) {
                var _a = _result.arguments;
                var _c = _result.callback;
                var _len = is_array(_a) ? array_length(_a) : -1;
                with (_result.instance) {
                    switch (_len) {
                        case 1:  _c(_a[0]); break;
                        case 2:  _c(_a[0], _a[1]); break;
                        case 3:  _c(_a[0], _a[1], _a[2]); break;
                        case 4:  _c(_a[0], _a[1], _a[2], _a[3]); break;
                        case 5:  _c(_a[0], _a[1], _a[2], _a[3], _a[4]); break;
                        case 6:  _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5]); break;
                        case 7:  _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6]); break;
                        case 8:  _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7]); break;
                        case 9:  _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8]); break;
                        case 10: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9]); break;
                        case 11: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10]); break;
                        case 12: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11]); break;
                        case 13: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12]); break;
                        case 14: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13]); break;
                        case 15: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14]); break;
                        case 16: _c(_a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14], _a[15]); break;
                        default: _c(); break;
                    }
                }
            }
            if (instance_exists(_result.instance) && _result.rep) {
                _result.value = (_result.type == timer_type.milliseconds) ? current_time : _result.initial_duration;
            }
            else {
                delete _result;
                ds_list_delete(global.__timer_list, i);
                i--;
            }
        }
        else if (_result.type == timer_type.frames) {
            _result.value -= global.__tick_rate*_result.multiplier;
        }
    }
    current_frames++;
}

/// @func timer_system_room_end()
/// @desc Must be called at the end of every room.
function timer_system_room_end() {
    for (var i = 0; i < ds_list_size(global.__timer_list); i++) {
        var _result = global.__timer_list[| i];
        if (instance_exists(_result.instance) && !_result.instance.persistent) {
            delete _result;
            ds_list_delete(global.__timer_list, i);
        }
        i--;
    }
}

/// @func timer_system_set_tickrate(tick_rate)
/// @desc Sets the tick rate of the timer system.
/// @param {real} tick_rate The global tick rate for the timers.
function timer_system_set_tickrate(tick_rate) {
    gml_pragma("forceinline");
    global.__tick_rate = tick_rate;
}

/// @func timer_system_get_tickrate()
/// @desc Returns the tick rate of the timer system.
/// @returns {real} The global tick rate for the timers.
function timer_system_get_tickrate() {
    gml_pragma("forceinline");
    return global.__tick_rate;
}

/// @func wait(duration, offset[OPTIONAL])
/// @desc Always returns false for a specified interval, after which will return true for one frame. Repeats endlessly, and ignores the timer tick rate.
/// @param {real} duration The interval between true returns in frames.
/// @param {real} offset[OPTIONAL] Adds an additional offset to the timer in frames. Optional.
/// @returns {bool} True or false depending on the interval.
function wait(duration) {
    gml_pragma("forceinline");
    return ((current_frames + ((argument_count > 1) ? argument[1] : 0)) % duration) < 1;
}