if stance = 7
    exit;
else
{
    if sprite_index = spr_lonegustavo_jump or sprite_index = spr_lonegustavo_jumpstart
    or sprite_index = spr_luigibhammerstart or sprite_index = spr_luigibhammer
    or sprite_index = spr_lstance4 or sprite_index = spr_luigibhammerstrikestart
    or sprite_index = spr_luigibhandstrikestart
    && held = 0
        held = 1;
    
    //Striking with Hammer
    if sprite_index = spr_luigibhammerstrikestart && image_index >= 8 && image_index <= 9
        held = 3;
    if sprite_index = spr_luigibhammerstrikestart && image_index < 8 && image_index >= 4
        held = 2;
        
    //Striking with Hand
    if sprite_index = spr_luigibhandstrikestart && image_index > 14
        held = 4;
    else if sprite_index = spr_luigibhandstrikestart && image_index >= 12 && image_index <= 14
        held = 3;
    else if sprite_index = spr_luigibhandstrikestart && image_index < 12 && image_index >= 9
        held = 2;
    else if sprite_index = spr_luigibhandstrikestart && image_index < 9
    {
        image_index = 0;
        sprite_index = spr_luigibhandstrikefail;
    }
    
    //Trigger Battle Block Commands
    if phase = 1 && jumpchoosego = 0 && control = 1 //Hit Battle Block
    {
        //sprite_index = spr_gustavochoosejump; 
        //audio_play_sound(snd_jump,0,0);
        //zspeed = 5;
        jumpchoosewait = 6;
        jumpchoosego = 1;
        control = 0;
        jumpingchoose = 1;
        glitchfix = false; //Reset fix to gustavo walking back after attack glitch
    }
    if phase = 2 && battleblock = 2 //Ready to run
    {
        if movechoose = 1 //Run Away
        {
            if global.Gdead = 1
            {
                //Find a way to pick up other brother when escaping
                with obj_pep_battle mp_linear_step(obj_gustavob.x,obj_gustavob.y,2,0);
            }
            alarm[4] = 30; //Buffer
        }
        if movechoose = 2 //Idle
        {
            global.hitrank = 0;
            turnnext = 0;
            if obj_pep_battle.turnnext = 0
            {
                obj_pep_battle.phase = 1;
                obj_pep_battle.moveto = 0;
                obj_pep_battle.phase = 0;   
                battleblock = 0;          
                global.turn = 2;
            }
            else
            {
                obj_pep_battle.phase = 1;
                obj_pep_battle.moveto = 0;
                obj_pep_battle.phase = 0;   
                battleblock = 0;   
                global.turn = 0;
            }
        }
    }
    if phase = 2 && battleblock = 1 //Ready to use Bros Attack
    {}
    if phase = 3 && control = 1 && targetchoose != 0 && battleblock <> 2 //Choose Target
    {
        targetid = targetidaboutto;
        targetx = targetid.x;
        targety = targetid.y;

        if battleblock = 0 //Solo
        {
            if movechoose = 1 //Choose Jump Attack
            {
                alarm[5] = 20; //Buffer
                phase = 0.25;
                zspeed = 0;
                stance = 0; //stance 0 means that he is not in a stance
                control = 0;
            }
            if movechoose = 2 //Choose Hammer Attack
            {
                alarm[6] = 20; //Buffer
                phase = 0.25;
                stance = 0; //stance 0 means that he is not in a stance
                control = 0;
            }
            if movechoose = 3 //Choose Hand Attack
            {
                alarm[7] = 20; //Buffer
                phase = 0.25;
                stance = 0; //stance 0 means that he is not in a stance
                control = 0;
            }
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
            alarm[8] = 20; //Buffer
            phase = 0.25;
            zspeed = 0;
            stance = 0; //stance 0 means that he is not in a stance
            control = 0;
            //audio_play_sound(snd_confirm,0,0);
        }
    }

    if phase = 3 && targetchoose = 0
    {
        //sprite_index = spr_gustavochoosejump;
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
            if global.GBP < 4 or global.brosattacks = 0 or brositemdifmax = 0 or global.Pdead > 0
			{
            //    audio_play_sound(snd_incorrect,0,0);
			}
            else if movechoose = 1 && global.brosattacks >= 1 && global.GBP >= 4
            {
                //Set Bros Attack to Green Shells
                event_user(6);
            }
            else if movechoose = 2 && global.brosattacks >= 2 && global.GBP >= 6
            {
                //Set Bros Attack to Fire Flower
                event_user(6);
            }
            else if movechoose = 3 && global.brosattacks >= 3 && global.GBP >= 10
            {
                //Set Bros Attack to Jump Helmet
                event_user(6);
            }
            else if movechoose = 4 && global.brosattacks >= 4 && global.GBP >= 14
            {
                //Set Bros Attack to Broken Heart
                event_user(6);
            }
            //else
            //    audio_play_sound(snd_incorrect,0,0);
        }
        else //Solo Attack
            event_user(6);
    }
    if phase = 2 && battleblock = 3 //Choose a brother and select item
        event_user(4);
    
    //Bros Attacks
    if instance_exists(obj_brosattack)
    {
        //Green Shells
        if moveto = 5.1 && obj_brosattack.phase = 2
            sprite_index = spr_lonegustavo_kick
    }

    //Dodging
    if control = 1 && ground = 1 && global.Gdead = 0
    {
        if phase = -1 //Jump dodging
        {
            zspeed = 14;
            ground = 0;
            jumpdodgewait = 16;
            audio_play_sound(sfx_jump,0,0);
            jumpdodgego = 1;
            control = 0;
            jumpingdodge = 1;
			zgravityon = 1
        }
        else if phase = -2 && held = 1 //Hammer dodging
        {
            sprite_index = spr_luigibhammerstart;
            hammering = 1;
            hammerdodgewait = 0;
        }
    }
}

