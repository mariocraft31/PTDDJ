if obj_ow_player.invincible = false && obj_ow_player.z < z + 14 && global.stunned = false
{
    obj_ow_player.alarm[1] = 1;
    obj_ow_player.invincible = true;
    with obj_camera event_user(3);
    if active = true && !instance_exists(obj_battlecontrol)
    {
        global.stunned = false;
        encounter = true;
        active = false;
        //if status = "attacking"
        //    global.strike = 4;
        with obj_ow_player 
			active = false;
        with obj_ow_player image_speed = 0;
        global.battletype = battletype;
        instance_create(x,y,obj_battlestart);
        
        room_persistent = true;
        room_speed = 60;
    }
}