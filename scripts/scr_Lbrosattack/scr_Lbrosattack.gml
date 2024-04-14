function scr_Lbrosattack() {
	/*gustavo's Bros Attack

	Additional Bros Attacks can be coded here.

	*/

	if (obj_pep_battle.battleblock = 1 or obj_gustavob.battleblock = 1) && global.turn = 1 && ready = 1
	{
	    //audio_play_sound(snd_confirm,0,0);
	    ready = 2;
	    switch (attacknum)
	    {
	        case 0: //Green Shells
	            phase = 3;
	            event_user(3)
	            break;
	        case 1: //Fire Flowers
	            phase = 2;
	            alarm[1] = 10;
	            break;
	    }
	}
	else
	{
	    switch (attacknum)
	    {
	        case 0: //Green Shells
				obj_gustavob.image_index = 0;
				obj_gustavob.image_speed = 0.35
				obj_gustavob.sprite_index = spr_lonegustavo_kick;
	            break;
	        /*case 1: //Fire Flower
	            if ready = 2 && obj_gustavob.moveto = 5.2
	            {
	                if phase = 2 or phase = 3 //gustavo's turn
	                {
	                    obj_gustavob.sprite_index = spr_luigibfireflowershoot;
	                    audio_play_sound(snd_fireball,0,0);
	                    if instance_exists(obj_fireballl)
	                        obj_fireballl.visible = false;
	                    ready = 3;
	                    alarm[5] = 5;
	                }
	                else if phase = 1 && sprite_index != spr_luigibfireflowershoot2 //Mario's turn
	                {
	                    obj_gustavob.sprite_index = spr_luigibfireflowershoot2;
	                    audio_play_sound(snd_fireball,0,0);
	                    if instance_exists(obj_fireballl)
	                        obj_fireballl.visible = false;
	                }
	            }*/
	            break;
	    }
	}



}
