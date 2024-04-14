switch(attacknum)
{
    //Begin Green Shell Attack
    case 0:
        //obj_pep_battle.sprite_index = spr_pep_B_kickstance;
        //obj_gustavob.sprite_index = spr_lonegustavo_idle;  
        if !audio_is_playing(snd_hit_fix)
			audio_play_sound(snd_hit_fix,0,0);
        z = 0;
        //Green Shell Attack Phases
        //1 for shell heads to enemy from Mario
        //2 for shell heads to gustavo from enemy
        //3 for shell heads to enemy from gustavo
        //4 for shell heads to Mario from enemy
        obj_pep_battle.moveto = 5.1;
        obj_gustavob.moveto = 5.1;
        obj_pep_battle.stance = 15;
        obj_gustavob.stance = 15;
    break;
    //Begin Fire Flower Attack
    /*case 1:
        obj_pep_battle.moveto = 5.2;
        obj_gustavob.moveto = 5.2;
        obj_pep_battle.stance = 0;
        obj_gustavob.stance = 0;
        //Fire Flower Attack Phases
        //1 for Mario's firing turn
        //2 for gustavo's firing turn
        //3 for both firing
        with obj_pep_battle image_index = 0;
        with obj_pep_battle image_speed = 0.275;
        with obj_pep_battle sprite_index = spr_mariobfireflowertransform;
        with obj_gustavob image_index = 0;
        with obj_gustavob image_speed = 0.275;
        with obj_gustavob sprite_index = spr_luigibfireflowertransform;
        //audio_play_sound(snd_powerup,0,0);
    break;*/
}

