//Controls
if keyboard_check_pressed(global.keyB) //B
    event_user(8);
if keyboard_check_released(global.keyB) //B
    event_user(9);
if keyboard_check_pressed(global.keyLeft) //Left
    event_user(10);
if keyboard_check_pressed(global.keyUp) //Up
    event_user(11);
if keyboard_check_pressed(global.keyRight) //Right
    event_user(12);
if keyboard_check_pressed(global.keyDown) //Down
    event_user(13);

if global.turn = 1 && global.Pdead > 0 && phase <> 0.15 && reaction = 0
    stance = 14;

if global.turn = 0 && (phase = -1 or phase = -2 or phase = -4)
    phase = 0;

if global.turn = 1 && phase = 0
    phase = 1;

if global.turn = 1 && global.Gdead > 0
    global.turn = 2;

// the greater z is, the higher gustavo is
// make gravity
if zgravityon = 1
    zspeed +=zgravity;
z += zspeed; //Changes the height of the jump (the greater z is, the higher gustavo is)
if z <= 0
{
    zspeed = 0;
    z = 0;
    zgravityon = 0;
    ground = 1 ;
    if moveto = -1 && speed = 0.001
        sprite_index = spr_lhurt;
    if jumpingchoose = 1
    {
        control = 1;
        jumpingchoose = 0;
    }
    if jumpingdodge = 1
    {
        control = 1;
        jumpingdodge = 0;
    }
}

//Areas to move to

//Stance
if moveto = 0 && battleblock <> 2 && obj_pep_battle.battleblock <> 2
    mp_linear_step(stancex,stancey,5,0);

//Jump Attack
if moveto = 1
{
    mp_linear_step(targetx,targety,5,0);
    // makes him jump when half way to the enemy
    if x > (targetx - x/1.5) && ground = 1 && phase = 4 && sprite_index = spr_lonegustavo_walk && targetid.floating = 0
    {
        sprite_index = spr_lonegustavo_jump;
        ground = 0;
        zspeed = 14;
        zgravityon = 1;
        if !audio_is_playing(sfx_jump)
            audio_play_sound(sfx_jump,0,0);
    }
    else if x > (targetx - x/1.5) && ground = 1 && phase = 4 && sprite_index = spr_lonegustavo_walk && targetid.floating = 1
    {
        sprite_index = spr_lonegustavo_jump;
        ground = 0;
        zspeed = 18;
        zgravityon = 1;
        if !audio_is_playing(sfx_jump)
            audio_play_sound(sfx_jump,0,0);
    }
}

//Hammer Attack
if moveto = 2
{
    mp_linear_step(targetx - 26,targety,3,0);

    // initiates hammer animation
    if x = targetx - 26 && y = targety 
    {
        if sprite_index = spr_luigibwalking
        {
            //audio_play_sound(snd_hammerout,0,0);
            image_index = 0;
        }
        if sprite_index = spr_luigibhammerstrikefail
            sprite_index = spr_luigibhammerstrikefail;
        else if image_index > 9 && sprite_index = spr_luigibhammerstrikestart && held = 1
        {
            //audio_play_sound(snd_charge_up,0,0);
            sprite_index = spr_luigibhammerstrike;
        }
        else if sprite_index = spr_luigibhammerstrike
            sprite_index = spr_luigibhammerstrike;
        else if sprite_index = spr_luigibhammerstrikehit
        {
            //audio_stop_sound(snd_charge_up);
            sprite_index = spr_luigibhammerstrikehit;
        }
        else
            sprite_index = spr_luigibhammerstrikestart;
    
        //Hits enemy
        if sprite_index = spr_luigibhammerstrikestart && image_index < 8 && image_index >= 4 && targetid.hurt = 0 && held = 2 //Good Hit
        {
            image_index = 12;
            global.hitrank = 1; //Good Hit
            sprite_index = spr_luigibhammerstrikehit;
            event_user(1);
           /* if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);*/
        }
        else if sprite_index = spr_luigibhammerstrikestart && image_index >= 8 && image_index <= 9 && targetid.hurt = 0 && held = 3 //Great Hit
        {
            image_index = 12;
            global.hitrank = 2; //Great Hit
            sprite_index = spr_luigibhammerstrikehit;
            event_user(1);
            /*if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);*/
        }
        else if sprite_index = spr_luigibhammerstrikehit && image_index > 9 && targetid.hurt = 0 //Excellent Hit
        {
            global.hitrank = 3; //Excellent Hit
            event_user(1);
            /*if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);*/
        }
        else if sprite_index = spr_luigibhammerstrikefail && image_index < 16 && image_index >= 4 && targetid.hurt = 0 //Ok Hit
        {
            global.hitrank = 0; //Ok Hit
            event_user(1);
            //if !audio_is_playing(snd_throw)
            //    audio_play_sound(snd_throw,0,0);
        }
    }
}

//Hand Attack
if moveto = 3
{
    mp_linear_step(targetx - 26,targety,3,0);

    // initiates hand animation
    if x = targetx - 26 && y = targety 
    {
        if sprite_index = spr_luigibwalking
        {
            //audio_play_sound(snd_hammerout,0,0);
			image_index = 0;
            //audio_play_sound(snd_charge_up,0,0);
            sprite_index = spr_luigibhandstrikestart;
        }
        else if image_index > 14 && sprite_index = spr_luigibhandstrikestart && held = 1
        {
            //audio_play_sound(snd_hit,0,0);
            //audio_play_sound(snd_excellenthit,0,0);
            sprite_index = spr_luigibhandstrikehit;
        }
        else if sprite_index = spr_luigibhandstrikehit
        {
            //effect_create_above(ef_smoke,x+18,y-18,0.2,c_aqua);
            //effect_create_above(ef_flare,x+18,y-18,0.45,c_blue);
            sprite_index = spr_luigibhandstrikehit;
        }
    
        //Hits enemy
        if sprite_index = spr_luigibhandstrikestart && targetid.hurt = 0 && held = 2 //Good Hit
        {
            image_index = 12;
            global.hitrank = 1; //Good Hit
            sprite_index = spr_luigibhandstrikehit;
            effect_create_above(ef_explosion,x+18,y-18,0.1,c_aqua);
            effect_create_above(ef_explosion,x+18,y-18,0.1,c_blue);
            event_user(2);
            /*if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);*/
        }
        else if sprite_index = spr_luigibhandstrikestart && targetid.hurt = 0 && held = 3 //Great Hit
        {
            image_index = 12;
            global.hitrank = 2; //Great Hit
            sprite_index = spr_luigibhandstrikehit;
            effect_create_above(ef_explosion,x+18,y-18,0.1,c_aqua);
            effect_create_above(ef_explosion,x+18,y-18,0.1,c_blue);
            event_user(2);
            /*if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);*/
        }
        else if sprite_index = spr_luigibhandstrikestart && held = 4 //Excellent Hit
        {
            global.hitrank = 3; //Excellent Hit
            event_user(2);
            sprite_index = spr_luigibhandstrikehit
            effect_create_above(ef_explosion,x+18,y-18,0.15,c_aqua);
            effect_create_above(ef_explosion,x+18,y-18,0.1,c_blue);
            /*if !audio_is_playing(snd_miss) && targetid.floating = 1
                audio_play_sound(snd_miss,0,0);
            else if !audio_is_playing(snd_strike) && targetid.thunderbrand = 0 && targetid.floating = 0
                audio_play_sound(snd_strike,0,0);
            if !audio_is_playing(snd_luckyhit) && targetid.thunderbrand = 1 && targetid.floating = 0
            {
                global.criticalhit = true;
                audio_play_sound(snd_luckyhit,0,0);
            }*/
        }
        else if sprite_index = spr_luigibhandstrikefail && image_index < 2 && targetid.hurt = 0 //Ok Hit
        {
            effect_create_above(ef_explosion,x+18,y-18,0.15,c_blue);
            global.hitrank = 0; //Ok Hit
            /*if targetid.floating = 0
                audio_play_sound(snd_thunder,0,0);
            else if targetid.floating = 1
                audio_play_sound(snd_miss,0,0);*/
            event_user(2);
        }
    }
}

//Perform Bros Attack
if moveto = 5
    event_user(7);

//Take out Item
if moveto = 6
    sprite_index = spr_lonegustavo_idle;

//Toss Item
if moveto = 7
    sprite_index = spr_luigibthrowup;

//Consume Item
if moveto = 8
    sprite_index = spr_luigibswallow;
    
//Healing from Item
if moveto = 9
    sprite_index = spr_luigibheal;
    
//Toss Item to Mario
if moveto = 10
    sprite_index = spr_luigibthrow;   

//Pick up Mario
if moveto = 11
{
    if battleblock = 2 && global.Pdead = 1 && movechoose = 1 //Run from Battle
    {
        if y = stancey-64
        {
            obj_pep_battle.visible = false;
            sprite_index = spr_gustavopickupmario; //Pick up Mario
        }
        else
        {
            stance = 0;
            sprite_index = spr_gustavochoosejump2;
            depth = y+1;
            mp_linear_step(stancex+12,stancey-64,4,0);
        }
    }
}    
    
if x = stancex && y = stancey && ground = 1
{
    if sprite_index = spr_lonegustavo_walkback
        sprite_index = spr_lonegustavo_idle;
    control = 1;
}

//Run Away
if battleblock = 2 && phase = 0.25 //About to run
{
    if global.Pdead = 0
    {
        phase = -3;
        global.turn = 1;
        sprite_index = spr_lonegustavo_walkback;
        obj_pep_battle.sprite_index = spr_mariobwalkingback;
    }
}
if battleblock = 2 && phase = -3 //Run off screen
{
    if global.Pdead = 0
    {
        stance = 6;
        with obj_pep_battle stance = 6;
        mp_linear_step(stancex-128,stancey,2,0);
        with obj_pep_battle mp_linear_step(stancex-128,stancey,2,0);
    }
    else if global.Pdead = 1
        mp_linear_step(-128,y,2,0);
}

//Changes turn to enemy's turn or Mario's
if phase = 0.5 && x = stancex && y = stancey
{
    instance_create(global.posx,global.posy-16,obj_totaldamage);
    repeataction = 0;
}
if phase = 4 && x = stancex && y = stancey && !instance_exists(obj_totaldamage)
&& global.turn > -1
{
    if global.strike = 0
    {
        global.hitrank = 0;
        turnnext = 0;
        
        if obj_pep_battle.turnnext = 1
        {
            obj_pep_battle.phase = 1;
            global.turn = 0;
        }
        else
        {
            obj_pep_battle.turnnext = 1;
            global.turn = 2;
        }
    }
    else if global.strike > 0
        with obj_battlecontrol event_user(8);
    if instance_exists(targetid)
        if targetid.hurt = -1
            targetid.hurt = 0;
}
if phase = 6 && x = stancex && y = stancey && obj_pep_battle.x = obj_pep_battle.stancex
&& obj_pep_battle.y = obj_pep_battle.stancey && global.turn > -1
{
    if global.strike = 0
    {
        global.hitrank = 0;
        turnnext = 0;
        if obj_pep_battle.turnnext = 1
        {
            obj_pep_battle.phase = 1;
            global.turn = 0;
        }
        else
        {
            obj_pep_battle.turnnext = 1;
            global.turn = 2;
        }
    }
    else if global.strike > 0
        with obj_battlecontrol event_user(8);
}

//Stances
if ground = 1 && hurt = 0
{
    if stance = 0 //No stance
    {}
    if stance = 1 && stancex = x && stancey = y //Idle stance
    {
		image_speed = 0.35;
        sprite_index = spr_lonegustavo_idle;
    }
    if stance = 2 //Idle Battle Block stance
    {
        //image_speed = 0.35;
        global.takedamage = 0;
        //sprite_index = spr_lonegustavo_idle;
    }
    if stance = 3 //Jump guard
    {
        image_speed = 0.35;    
        //sprite_index = spr_lonegustavo_idle;
    }
    if stance = 4 //Hammer guard
    {
        if hammeringdodge = 1 && hammerdodgewait = 1 && hammering = 0 && hammerdodgego = 0 && held = 2 && hurt = 0
        {
            image_speed = 0.4;        
            //mask_index = spr_mask_hammer;
            sprite_index = spr_luigibhammerhit;
        }
        else if control = 1 && hammering = 0
        {
            image_speed = 0.275;
            sprite_index = spr_lstance4;
        }
    }
    if stance = 5 //Ducking
    {
        sprite_index = spr_lstance5;
    }
    if stance = 6 //Running away
    {
        image_speed = 0.35;
        if global.Pdead = 1 && phase = -3
            sprite_index = spr_luigibwalkingbackmario;
        else
            sprite_index = spr_lonegustavo_walkback;
    }
    if stance = 7 //Victory
    {
        control = 0;
        sprite_index = spr_luigibwinspin;
    }
    if stance = 8 //Victory pose jump
    {
        control = 0;
        sprite_index = spr_luigibwinspin_jump;
    }
    if stance = 9 //Victory pose hammer
    {
        control = 0;
        sprite_index = spr_luigibwinspin_hammer;
    }
    if stance = 10 //Victory pose hand
    {
        control = 0;
        sprite_index = spr_luigibwinspin_hand;
    }
    if stance = 11 //Level Up
    {
        control = 0;
        sprite_index = spr_luigibwin;
    }
    if stance = 12 //Level Up Pose
    {
        control = 0;
        sprite_index = spr_luigibwinlevelup;
    }
    if stance = 13 //Level Up Pose
    {
        control = 0;
        if image_index >= 10
            image_single = 10;
        sprite_index = spr_luigibwinlevelup2;
    }
    if stance = 14 && reaction = 0 && obj_pep_battle.sprite_index = spr_mariodead //Panic Pose
    {
        control = 0;
        if phase <> 0.15
        {
            phase = 0.15;
            //audio_play_sound(snd_gustavo_cry_for_mario,0,0);
        }
        sprite_index = spr_gustavopanic;
    }
    if stance = 15 && instance_exists(obj_brosattack) //Green Shells
    {
        if sprite_index = spr_lonegustavo_kick
            stance = 16;
        else if obj_brosattack.phase <> 2
            sprite_index = spr_lonegustavo_idle;
        else if obj_brosattack.phase = 2
            sprite_index = spr_lonegustavo_idle;
    }
    if stance = 16 && instance_exists(obj_brosattack) //Green Shells Idle
    {}
    if stance = 17
        sprite_index = spr_luigibgreenshellfall; //Green Shells Failed
    if stance = 18 //Fire Flowers
    {
        if sprite_index = spr_luigibfireflowerstance
            stance = 19;
        else if obj_brosattack.phase <> 1
            sprite_index = spr_luigibfireflowerstance;
        else if obj_brosattack.phase = 1
            sprite_index = spr_luigibfireflowerstance;
    }
    if stance = 19 && instance_exists(obj_brosattack) //Fire Flowers Idle
    {}
}

if ground = 0 && hurt = 0
{
    if zspeed > 0 && repeataction = 0 && phase = 4
    {
		//image_index = 0
		image_speed = 0.35
        sprite_index = spr_lonegustavo_jump;
        //with obj_battlecontrol event_user(1);
    }
    else if zspeed > 0 && repeataction = 0
	{
        sprite_index = spr_lonegustavo_jump; //these ones actually do the  thing
	}
    else if zspeed > 0 && repeataction = 1  
	{
		//image_index = 0
		image_speed = 0.35
        sprite_index = spr_lonegustavo_jump;
	}
   // else if zspeed <= 15 && repeataction = 0 && phase = 4
    //    sprite_index = spr_lonegustavo_jump
    else if zspeed <= 15 && repeataction = 0
	{
		image_speed = 0.35
        sprite_index = spr_lonegustavo_jump;
	}
    if z < 15
        sprite_index = spr_lonegustavo_idle;
    if moveto = 0 && phase = 4 or phase = 0.5 && global.totaldamage > 0
    {
        glitchfix = true;
        sprite_index = spr_lonegustavo_walkback;
        phase = 0.5;
    }
}

if phase = 1
{
	global.damage = 0;
    global.totaldamage = 0;
    global.luck = 0;
    global.lucky = 0;
    turnnext = 1;
	glitchfix = false
    stance = 2;
}
if phase = 2 && (!moveto = 5.1 && !moveto = 5.2)
    stance = 1;

//Sets what items will appear (you might need to change this if you add more moves or items)
itemdifmax = 0
if global.mushrooms > 0
    itemdifmax += 1;
if global.supermushrooms > 0
    itemdifmax += 1;
if global.ultramushrooms > 0
    itemdifmax += 1;
if global.maxmushrooms > 0
    itemdifmax += 1;
if global.nuts > 0
    itemdifmax += 1;
if global.supernuts > 0
    itemdifmax += 1;
if global.ultranuts > 0
    itemdifmax += 1;
if global.maxnuts > 0
    itemdifmax += 1;
if global.starcandies > 0
    itemdifmax += 1;
if global.syrups > 0
    itemdifmax += 1;
if global.supersyrups > 0
    itemdifmax += 1;
if global.ultrasyrups > 0
    itemdifmax += 1;
if global.maxsyrups > 0
    itemdifmax += 1;
if global.oneups > 0
    itemdifmax += 1;
if global.oneupsupers > 0
    itemdifmax += 1;
if global.herbs > 0
    itemdifmax += 1;
if global.redpeppers > 0
    itemdifmax += 1;
if global.greenpeppers > 0
    itemdifmax += 1;
if global.boobiscuits > 0
    itemdifmax += 1;
if global.retryclocks > 0
    itemdifmax += 1;
    
//Sets what bros attacks are available
brositemdifmax = global.brosattacks;

// Sets a wrap effect
if movechoose <=0
{
    //if battleblock = 0 //Solo
    //    movechoose = solonum;
    if battleblock = 1 //Bros
        movechoose = brosnum;
    if battleblock = 2 //Run
        movechoose = runnum;
}
if battleblock = 0 //Solo
{
    if movechoose > solonum
            movechoose = 1;
}
if battleblock = 1 //Bros
{
    if movechoose > brosnum
        movechoose = 1;
}
if battleblock = 2 //Run
{
    if movechoose > runnum
        movechoose = 1;
}

//Part of jumping to hit the block
if jumpchoosego = 1
    jumpchoosewait = -1;
if jumpchoosewait <= -1
{
    z = 0;
	zspeed = 0;
    jumpchoosego = 0;
    jumpchoosewait = 2;
	if battleblock == 0
		event_user(6)
	else
		phase = 2;
    //Return if no items are currently in your inventory
    if battleblock = 3 && itemdifmax = 0
    {
        //audio_play_sound(snd_incorrect,0,0);
        phase = 1;
        z = 0;
    }
    //Return if the run block is disabled
    else if battleblock = 2 && global.runaway = 0
    {
        //audio_play_sound(snd_incorrect,0,0);
        phase = 1;
        z = 0;
    }
    else
    {
        if battleblock = 3 //Items
        {
            if pagenext = 1 or pagenext = 6 or pagenext = 11 or pagenext = 16
                movechoose = 1;
            else if pagenext = 2 or pagenext = 7 or pagenext = 12 or pagenext = 17
                movechoose = 2;
            else if pagenext = 3 or pagenext = 8 or pagenext = 13 or pagenext = 18
                movechoose = 3;       
            else if pagenext = 4 or pagenext = 9 or pagenext = 14 or pagenext = 19
                movechoose = 4;  
            else if pagenext = 5 or pagenext = 10 or pagenext = 15 or pagenext = 20
                movechoose = 5;
        }
        //audio_play_sound(snd_confirm,0,0);
    }
}

//Jump dodge timing
if jumpdodgego = 1
    jumpdodgewait -= 1;
if jumpdodgewait <= -1
{
    jumpdodgego = 0;
    jumpdodgewait = 0;
}

//Hammer dodge timing
if phase = -2 && hammerdodgewait = 0 && hammering = 0 && hammerdodgego = 1
{
    //if !audio_is_playing(snd_hammer)
    //    audio_play_sound(snd_hammer,0,0);
    hammeringdodge = 1;
    hammerdodgewait = 1;
    hammering = 0;
    hammerdodgego = 0;
}

if phase = 3
{
    if battleblock = 2 //Run
    {}
    else
    {
        if targetchoose = 0
            stance = 2;
        if !targetchoose = 0 && battleblock <> 3 //Choose enemy
        {
            stance = 1 ;
            targetidaboutto = obj_battlecontrol.enemyid[targetchoose];
        }
        if !targetchoose = 0 && battleblock = 3 //Choose brother
        {
            stance = 1 ;
            targetidaboutto = obj_battlecontrol.broid[targetchoose];
        }
    }
}

if global.turn = 0 && phase != 5
    phase = 0;
if phase = 0 && (!moveto = 5.1 && !moveto = 5.2)
    stance = 1;
if global.turn = 2
{
    if stance = 3
        phase = -1; //Jump dodge stance
    if stance = 4
        phase = -2; //Hammer dodge stance
}

//Max HP & BP
if global.GHP > global.maxGHP
    global.GHP = global.maxGHP;
if global.GBP > global.maxGBP
    global.GBP = global.maxGBP;

//Win
if !instance_exists(obj_battlecontrol)
{
    global.stunned = true; //This could be the variable to avoid encountering same enemy in Overworld
    global.outcome = 1;
    global.runaway = 1;
    room = global.roomin;
	with (obj_ow_player)
		active = true
}
    
//Lose
if global.Gdead = -0.25 && x = stancex && y = stancey
    global.Gdead = 0.5;
if global.Gdead = 0.5
{
    //if !audio_is_playing(snd_gustavo_mamamia)
    //    audio_play_sound(snd_gustavo_mamamia,0,0);
    sprite_index = spr_gustavodie;
    with obj_pep_battle phase = 0.25;
}
if global.Gdead = 1 && sprite_index = spr_gustavodie
{
    hurt = 2;
    sprite_index = spr_gustavodead;
}
	