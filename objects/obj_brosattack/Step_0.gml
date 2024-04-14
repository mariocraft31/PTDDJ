//Controls
if (ready > 0)
{
if keyboard_check_pressed(global.keyA) //A
    scr_Mbrosattack();
if keyboard_check_pressed(global.keyB) //B
    scr_Lbrosattack();
}
//Make gravity
if zgravityon = 1
    zspeed += zgravity;
z += zspeed; //Changes the height of the jump (the greater z is, the higher Mario is)
if z > 11
    falling = 1;
if z <= 0
{
    if falling = 1
        visible = false;
    zspeed = 0;
    z = 0;
    zgravityon = 0;
    ground = 1;
}
if ground = 0 && obj_pep_battle.moveto = 7 && global.turn = 0
    x -= 1;
if ground = 0 && obj_pep_battle.moveto = 10 && global.turn = 0
{
    x -= 1;
    y += 3;
}
if ground = 0 && obj_gustavob.moveto = 7 && global.turn = 1
    x -= 1;
if ground = 0 && obj_gustavob.moveto = 10 && global.turn = 1
    y -= 3;

//Bros Attacks
switch (attacknum)
{
    case 0: //Green Shells
    {
        switch (phase)
        {
            case 1: //Heads to enemy from Mario
				image_xscale = 1
				sprite_index = spr_lonebrick_roll
                if global.turn = 0 && global.hitrank == 0
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,4,0);
                else if global.turn = 1 && global.hitrank == 0
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,4,0);
                else if global.turn = 0 && global.hitrank == 1
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,6,0);
                else if global.turn = 1 && global.hitrank == 1
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,6,0);
				else if global.turn = 0 && global.hitrank == 2
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,9,0);
                else if global.turn = 1 && global.hitrank == 2
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,9,0);
				else if global.turn = 0 && global.hitrank == 3
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,12,0);
                else if global.turn = 1 && global.hitrank == 3
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,12,0);
            break;
            case 2: //Heads to gustavo from enemy
                if global.hitrank == 0
                    mp_linear_step(obj_gustavob.x-12,obj_gustavob.y+4,4,0);
                else if global.hitrank == 1
                    mp_linear_step(obj_gustavob.x-12,obj_gustavob.y+4,6,0);
                else if global.hitrank == 2
                    mp_linear_step(obj_gustavob.x-12,obj_gustavob.y+4,9,0);
                else if global.hitrank == 3
                    mp_linear_step(obj_gustavob.x-12,obj_gustavob.y+4,12,0);
            break;
            case 3: //Heads to enemy from gustavo
				image_xscale = 1
				sprite_index = spr_lonebrick_roll
                if global.turn = 0 && global.hitrank == 0
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,4,0);
                else if global.turn = 1 && global.hitrank == 0
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,4,0);
                else if global.turn = 0 && global.hitrank == 1
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,6,0);
                else if global.turn = 1 && global.hitrank == 1
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,6,0);
                else if global.turn = 0 && global.hitrank == 2
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,9,0);
                else if global.turn = 1 && global.hitrank == 2
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,9,0);
				 else if global.turn = 0 && global.hitrank == 3
                    mp_linear_step(obj_pep_battle.targetx,obj_pep_battle.targety,12,0);
                else if global.turn = 1 && global.hitrank == 3
                    mp_linear_step(obj_gustavob.targetx,obj_gustavob.targety,12,0);
            break;
            case 4: //Heads to Mario from enemy
            if global.hitrank == 0
                mp_linear_step(obj_pep_battle.x-32,obj_pep_battle.y-4,4,0);
            else if global.hitrank == 1
                mp_linear_step(obj_pep_battle.x-32,obj_pep_battle.y-4,6,0);
            else if global.hitrank == 2
                mp_linear_step(obj_pep_battle.x-32,obj_pep_battle.y-4,9,0);
            else if global.hitrank == 3
                mp_linear_step(obj_pep_battle.x-32,obj_pep_battle.y-4,12,0);
            break;
            case 5: //Head off screen (left)
            if global.hitrank < 2
                mp_linear_step(x-32,y,4,0);
            else if global.hitrank > 1
                mp_linear_step(x-32,y,6,0);
            break;
            case 6: //Head off screen (right)
                if global.turn = 0 && global.hitrank < 2
                    mp_linear_step(obj_pep_battle.targetx + room_width,obj_pep_battle.targety,4,0);
                else if global.turn = 1 && global.hitrank < 2
                    mp_linear_step(obj_gustavob.targetx + room_width,obj_gustavob.targety,4,0);
                else if global.turn = 0 && global.hitrank > 1
                    mp_linear_step(obj_pep_battle.targetx + room_width,obj_pep_battle.targety,6,0);
                else if global.turn = 1 && global.hitrank > 1
                    mp_linear_step(obj_gustavob.targetx + room_width,obj_gustavob.targety,6,0);
            break;
        }
        if x = obj_pep_battle.x-32 && y = obj_pep_battle.y-4
        {
            obj_pep_battle.stance = 17;
            obj_pep_battle.image_index = 0;
            //audio_play_sound(snd_mario_woah,0,0);
            phase = 5;
        }
        if x = obj_gustavob.x-12 && y = obj_gustavob.y+4
        {
            obj_gustavob.stance = 17;
            obj_gustavob.image_index = 0;
            //audio_play_sound(snd_gustavo_auhhh,0,0);
            phase = 5;
        }
        if phase = 1 or phase = 3
        {
            if obj_pep_battle.targetchoose = 0 && global.turn = 0
                phase = 6;
            if obj_gustavob.targetchoose = 0 && global.turn = 1
                phase = 6;
        }        
    }
    break;
    /*case 1: //Fire Flowers
        switch (phase)
        {
            case 1: //Mario's turn
                break;
            case 2: //gustavo's turn
                break;
            case 3: //Both Mario's and gustavo's turn
                break;
        }
        break;*/
}

/* */
/*  */
