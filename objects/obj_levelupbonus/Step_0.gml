if keyboard_check_pressed(global.keyY) //for now (to escape softlock when leveling up)
{
    //audio_play_sound(snd_incorrect,0,0); //fail safe
    if instance_number(obj_pep_battle) > 0 and instance_number(obj_gustavob) > 0
    {
        with obj_pep_battle
			instance_destroy();
        with obj_gustavob
			instance_destroy();
    }
}

if keyboard_check_pressed(global.keyA) //A
{
    if global.turn = -1.25 && moveto = 2 //Determine roulette chances for Mario's next level up
    {
        if global.Plastbonus = -1
            global.Plastbonus = 6;
        else if global.Plastbonus = 6
        {
            if movechoose = 52 //HP bonus
                global.Plastbonus = 0;
            if movechoose = 76 //BP bonus
                global.Plastbonus = 1;
            if movechoose = 100 //POW bonus
                global.Plastbonus = 2;
            if movechoose = 124 //DEF bonus
                global.Plastbonus = 3;
            if movechoose = 148 //SPEED bonus
                global.Plastbonus = 4;
            if movechoose = 172 //STACHE bonus
                global.Plastbonus = 5;
        }
        else
        {
            if movechoose = 52 && global.Plastbonus = 0 //HP bonus
                global.Plastbonus = 0;
            else if movechoose = 76 && global.Plastbonus = 1 //BP bonus
                global.Plastbonus = 1;
            else if movechoose = 100 && global.Plastbonus = 2 //POW bonus
                global.Plastbonus = 2;
            else if movechoose = 124 && global.Plastbonus = 3 //DEF bonus
                global.Plastbonus = 3;
            else if movechoose = 148 && global.Plastbonus = 4 //SPEED bonus
                global.Plastbonus = 4;
            else if movechoose = 172 && global.Plastbonus = 5 //STACHE bonus
                global.Plastbonus = 5;
            else
                global.Plastbonus = -1;
        }
        value = value;
        moveto = 1.5;
        //audio_stop_sound(snd_roulette);
        //audio_play_sound(snd_equip,0,0);
        alarm[1] = 20; //Add bonus
    }
    if global.turn = -1.75 && moveto = 2 //Determine roulette chances for gustavo's next level up
    {
        if global.Glastbonus = -1
            global.Glastbonus = 6;
        else if global.Glastbonus = 6
        {
            if movechoose = 52 //HP bonus
                global.Glastbonus = 0;
            if movechoose = 76 //BP bonus
                global.Glastbonus = 1;
            if movechoose = 100 //POW bonus
                global.Glastbonus = 2;
            if movechoose = 124 //DEF bonus
                global.Glastbonus = 3;
            if movechoose = 148 //SPEED bonus
                global.Glastbonus = 4;
            if movechoose = 172 //STACHE bonus
                global.Glastbonus = 5;
        }
        else
        {
            if movechoose = 52 && global.Glastbonus = 0 //HP bonus
                global.Glastbonus = 0;
            else if movechoose = 76 && global.Glastbonus = 1 //BP bonus
                global.Glastbonus = 1;
            else if movechoose = 100 && global.Glastbonus = 2 //POW bonus
                global.Glastbonus = 2;
            else if movechoose = 124 && global.Glastbonus = 3 //DEF bonus
                global.Glastbonus = 3;
            else if movechoose = 148 && global.Glastbonus = 4 //SPEED bonus
                global.Glastbonus = 4;
            else if movechoose = 172 && global.Glastbonus = 5 //STACHE bonus
                global.Glastbonus = 5;
            else
                global.Glastbonus = -1;
        }
        value = value;
        moveto = 1.5;
        //audio_stop_sound(snd_roulette);
        //audio_play_sound(snd_equip,0,0);
        alarm[1] = 20; //Add bonus
    }
    if moveto = 5
    {
        if (global.turn = -1.25 && global.Pexpleft > 0)
        or (global.turn = -1.75 && global.Gexpleft > 0)
        {
            moveto = 6;
            __background_set_colour( c_black );
            global.turn = -1.5;
            //audio_stop_sound(mus_Fanfare);
            //audio_play_sound(snd_confirm,0,0);
            alarm[4] = 1; //Fade out background
        }
    }
}
if keyboard_check_pressed(global.keyUp) //Up
{
    if x = 368 && y = 24 && moveto = 0
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += -24;
    }
}
if keyboard_check_pressed(global.keyDown) //Down
{
    if x = 368 && y = 24 && moveto = 0
    {
        //audio_play_sound(snd_select,0,0);
        movechoose += 24;
    }
}

if movechoose > 172
    movechoose = 52;
if movechoose < 52
    movechoose = 172;
if x = 368 && y = 24 && moveto = 1
    moveto = 0;
else if moveto > 2
    mp_linear_step(432,24,1,0);
else
    mp_linear_step(368,24,1,0);

