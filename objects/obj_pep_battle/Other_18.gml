if stance = 7
    exit;
else
{
    //Initiate holding
    if sprite_index = spr_mariobjumpdown1 or sprite_index = spr_mariobjumpdown2
    or sprite_index = spr_mariobjumpland1 or sprite_index = spr_mariobjumpland2
	or sprite_index = spr_mariobhammer or spr_mariobhammerstrikestart
    or sprite_index = spr_stance4 or sprite_index = spr_pep_B_punchprep
    or sprite_index = spr_mariobhandstrikestart
    && held = 0
        held = 1;
    
    //Striking with Hammer
    if sprite_index = spr_mariobhammerstrikestart && image_index >= 8 && image_index <= 9
        held = 3;
    if sprite_index = spr_mariobhammerstrikestart && image_index < 8 && image_index >= 4
        held = 2;
        
    //Striking with Hand
    if sprite_index = spr_mariobhandstrikestart && image_index > 14
        held = 4;
    else if sprite_index = spr_mariobhandstrikestart && image_index >= 12 && image_index <= 14
        held = 3;
    else if sprite_index = spr_mariobhandstrikestart && image_index < 12 && image_index >= 9
        held = 2;
    else if sprite_index = spr_mariobhandstrikestart && image_index < 9
    {
        image_index = 0;
        sprite_index = spr_mariobhandstrikefail;
    }

    //Trigger Battle Block Commands
    if phase = 1 && jumpchoosego = 0 && control = 1 //Hit Battle Block
    {
        //sprite_index = spr_mariochoosejump;
        //audio_play_sound(snd_jump,0,0);
        //zspeed = 5;
        jumpchoosewait = 6;
        jumpchoosego = 1;
        control = 0;
        jumpingchoose = 1;
    }
    if phase = 2 && battleblock = 2 //Ready to run
    {
        if movechoose = 1 //Run Away
        {
            if global.Pdead = 0 && global.Gdead = 0
                alarm[4] = 30; //Buffer
            else
                alarm[4] = 15; //Buffer
        }
        if movechoose = 2 //Idle
        {
            global.hitrank = 0;
            turnnext = 0;
            if obj_gustavob.turnnext = 1
            {
                obj_gustavob.phase = 1;
                obj_gustavob.moveto = 0;
                obj_gustavob.phase = 0;   
                battleblock = 0;          
                global.turn = 1;
            }
            else
            {
                if global.Gdead > 0
                    alarm[2] = 15; //Buffer
                global.turn = 2;
            }
        }
    }
    if phase = 2 && battleblock = 1 //Ready to use Bros Attack
    {
	}	
    if phase = 3 && control = 1 && targetchoose != 0 && battleblock <> 2 //Choose Target
    {
        targetid = targetidaboutto;
        targetx = targetid.x;
        targety = targetid.y;
         
        if battleblock = 0 //SoloPunch
        {
                alarm[6] = 20; //Buffer
                phase = 0.25;
                stance = 0; //stance 0 means that he is not in a stance
                control = 0;
            //if movechoose = 1 //Choose Hammer Attack
            //{
            //    alarm[6] = 20; //Buffer
            //    phase = 0.25;
            //    stance = 0; //stance 0 means that he is not in a stance
            //    control = 0;
            //}
            //audio_play_sound(snd_confirm,0,0);
        }
        if battleblock = 1 //Bros
        {
            alarm[8] = 20;
            phase = 0.25;
            zspeed = 0;
            stance = 0; //stance 0 means that he is not in a stance
            control = 0;
            //audio_play_sound(snd_confirm,0,0);
        }
        if battleblock = 3 //Items
        {
            //show_message(string(ds_list_find_value(itemlist,move))); //debug for now
            alarm[8] = 20; //Select item
            phase = 0.25;
            zspeed = 0;
            stance = 0; //stance 0 means that he is not in a stance
            control = 0;
            //audio_play_sound(snd_confirm,0,0);
        }
    }
    if phase = 3 && targetchoose = 0
    {
        //sprite_index = spr_mariochoosejump;
        //zspeed = 5;
        jumpchoosewait = 6;
        jumpchoosego = 1;
        control = 0;
        jumpingchoose = 1;
    }
    if phase = 2 && battleblock <> 3 //Choose an enemy
    {
        if phase = 2 && battleblock = 1 //Bros Attack
        {
            if global.PBP < 4 or global.brosattacks = 0 or brositemdifmax = 0 or global.Gdead > 0
			{
            //    //audio_play_sound(snd_incorrect,0,0);
			}
            else if movechoose = 1 && global.brosattacks >= 1 && global.PBP >= 4
            {
                //Set Bros Attack to Green Shells
                event_user(6);
            }
            else if movechoose = 2 && global.brosattacks >= 2 && global.PBP >= 6
            {
                //Set Bros Attack to Fire Flower
                event_user(6);
            }
            else if movechoose = 3 && global.brosattacks >= 3 && global.PBP >= 10
            {
                //Set Bros Attack to Jump Helmet
                event_user(6);
            }
            else if movechoose = 4 && global.brosattacks >= 4 && global.PBP >= 14
            {
                //Set Bros Attack to Broken Heart
                event_user(6);
            }
            //else
                //audio_play_sound(snd_incorrect,0,0);
        }
		else//Solo Attack
			event_user(6);
    }
    if phase = 2 && battleblock = 3 //Choose a brother and select item
        event_user(4);
        
    //Bros Attacks
    if instance_exists(obj_brosattack)
    {
        //Green Shell
        if moveto = 5.1 && obj_brosattack.phase = 4
            sprite_index = spr_pep_B_kick;
    }
        
    //Dodging
    if control = 1 && ground = 1 && global.Pdead = 0
    {
        if phase = -1 //Jump dodging
        {
            zspeed = 14;
            ground = 0;
            jumpdodgewait = 0;
            audio_play_sound(sfx_jump,0,0);
            jumpdodgego = 1;
            control = 0;
            jumpingdodge = 1;
			zgravityon = 1
        }
        else if phase = -2 && held = 1 //Hammer dodging
        {
            sprite_index = spr_mariobhammerstart;
            hammering = 1;
            hammerdodgewait = 0;
        }
    }
}