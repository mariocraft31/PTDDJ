function scr_Mbrosattack() {
	/*Mario's Bros Attack

	Additional Bros Attacks can be coded here.

	*/

	if (obj_pep_battle.battleblock = 1 or obj_gustavob.battleblock = 1) && global.turn = 0 && ready = 1
	{
	    //audio_play_sound(snd_confirm,0,0);
	    ready = 2;
	    switch (attacknum)
	    {
	        case 0: //Green Shells
				phase = 1
	            event_user(3)
	            break;
	        case 1: //Fire Flowers
	            phase = 1;
	            alarm[1] = 10;
	            break;
	    }
	}
	else
	{
	    switch (attacknum)
	    {
	        case 0: //Green Shells
				obj_pep_battle.image_index = 0;
				obj_pep_battle.image_speed = 0.35;
	            obj_pep_battle.sprite_index = spr_pep_B_kick;
	            break;
	       /* case 1: //Fire Flower
	            if ready = 2 && obj_pep_battle.moveto = 5.2
	            {
	                if phase = 1 or phase = 3 //Mario's turn
	                {
	                    obj_pep_battle.sprite_index = spr_mariobfireflowershoot;
	                    //audio_play_sound(snd_fireball,0,0);
	                    if instance_exists(obj_fireballm)
	                        obj_fireballm.visible = false;
	                    ready = 3;
	                    alarm[5] = 5;
	                }
	                else if phase = 2 && sprite_index != spr_mariobfireflowershoot2  //gustavo's turn
	                {
	                    obj_pep_battle.sprite_index = spr_mariobfireflowershoot2;
	                    audio_play_sound(snd_fireball,0,0);
	                    if instance_exists(obj_fireballm)
	                        obj_fireballm.visible = false;
	                }
	            }*/
	            break;
	    }
	}



}
