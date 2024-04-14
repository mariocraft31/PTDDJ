if room_persistent = true && !instance_exists(obj_battlecontrol) && encounter = true
{
    global.stunned = true;
    active = false;
    status = "dead";
}