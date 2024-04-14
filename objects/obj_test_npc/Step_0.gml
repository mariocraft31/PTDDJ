scr_depth_3d_z();

if (myinteract == 3)
{
	var dx = obj_ow_player.x - x; // difference in X
	var dy = obj_ow_player.y - y; // difference in Y

	if (abs(dx) > abs(dy)) //if the distance along X is greater than distance along Y
	{
	  if (dx > 0) //to the right
	   {
	        sprite_index = spr_peppino_r;
	    }
	    else // to the left
	   {
	        sprite_index = spr_peppino_l;
	   }
	}
	else // distance along Y is greater (or equal to) distance along X
	{
	    if(dy > 0) //downwards
	    {
	        sprite_index = spr_peppino_d;
	    }
	    else //upwards
	    {
	        sprite_index = spr_peppino_u;
	    }
	}

	if !instance_exists(obj_dialog_box)
    {
        global.interact = 0
		sprite_index = spr_peppino_d;
        myinteract = 0
        with (obj_ow_player)
            onebuffer = 5
    }
}