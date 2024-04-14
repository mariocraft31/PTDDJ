if keyboard_check_pressed(global.keyA) //A
    event_user(8);
if keyboard_check_released(global.keyA) //A
    event_user(9);
if keyboard_check_pressed(global.keyLeft) //Left
    event_user(10);
if keyboard_check_pressed(global.keyUp) //Up
    event_user(11);
if keyboard_check_pressed(global.keyRight) //Right
    event_user(12);
if keyboard_check_pressed(global.keyDown) //Down
    event_user(13);

/*if global.turn = 0
{
    //make blocks appear smoothly
    obj_jumpblock.image_alpha = lerp(obj_jumpblock.image_alpha,1,0.1);
    obj_brosblock.image_alpha = lerp(obj_brosblock.image_alpha,1,0.1);
    obj_runblock.image_alpha = lerp(obj_runblock.image_alpha,1,0.1);
    obj_itemblock.image_alpha = lerp(obj_itemblock.image_alpha,1,0.1);
}*/

if global.turn = 0 && global.Gdead > 0 && phase <> 0.15 && reaction = 0
    stance = 14;

if global.turn = 0 && (phase = -1 or phase = -2 or phase = -4)
    phase = 1;

if global.turn = 0 && global.Pdead > 0 && global.turn > -1
    global.turn = 1;

//Make gravity
if zgravityon = 1
    zspeed += zgravity;
z += zspeed; //Changes the height of the jump (the greater z is, the higher Mario is)
if z <= 0
{
    zspeed = 0;
    z = 0;
    zgravityon = 0;
    ground = 1 ;
    if moveto = -1 && speed = 0.001
        sprite_index = spr_mhurt;
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
if moveto = 0 && battleblock <> 2 && obj_gustavob.battleblock <> 2
    mp_linear_step(stancex,stancey,4,0);

//Jump Attack
if moveto = 1
{
    /* Right now I don't know how to code the jump depending on the enemy's height
    if anybody can find a better way to make him jump to the enemy depending
    on the enemy's height, please change the game, highlight the parts you changed,
    and send it to me via email/discord*/
    mp_linear_step(targetx,targety,4,0);
    // makes him jump when half way to the enemy
    if x > (targetx - x/2) && ground = 1 && phase = 4 && sprite_index = spr_pep_B_move && targetid.floating = 0
    {
        sprite_index = spr_mariobjumpstart;
        ground = 0;
        zspeed = 14;
        zgravityon = 1;
        if !audio_is_playing(sfx_jump)
            audio_play_sound(sfx_jump,0,0);
    }
    else if x > (targetx - x/2) && ground = 1 && phase = 4 && sprite_index = spr_pep_B_move && targetid.floating = 1
    {
        sprite_index = spr_mariobjumpstart;
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
    mp_linear_step(targetx - 64,targety,4,0);

    // initiates hammer animation
    if x = targetx - 64 && y = targety 
    {
        if sprite_index = spr_pep_B_move
        {
            //audio_play_sound(snd_hammerout,0,0);
            image_index = 0;
        }
        if sprite_index = spr_mariobhammerstrikefail
            sprite_index = spr_mariobhammerstrikefail;
        else if image_index > 9 && sprite_index = spr_mariobhammerstrikestart && held = 1
        {	
			image_index = 0;
            audio_play_sound(sfx_good,0,0);
            sprite_index = spr_pep_B_punchprep;
			image_speed = 0.35
        }
        else if sprite_index = spr_pep_B_punchprep
		{
            sprite_index = spr_pep_B_punchprep;
			//charge up particle
			var _dir=random(360);
			var _dist=80;
			var _x=x+lengthdir_x(_dist,_dir);
			var _y=y+lengthdir_y(_dist,_dir)-24;
			var _part_dir=point_direction(_x,_y,x,y-24);
			part_type_direction(part,_part_dir,_part_dir,0,0);
			part_particles_create(system,_x,_y,part,1);
		}
        else if sprite_index = spr_pep_B_punch
        {
            sprite_index = spr_pep_B_punch;
        }
        else
            sprite_index = spr_mariobhammerstrikestart;
			image_speed = 0.35;
    
        //Hits enemy
        if sprite_index = spr_mariobhammerstrikestart && image_index < 8 && image_index >= 4 && targetid.hurt = 0 && held = 2 //Good Hit
        {
            image_index = 12;
            global.hitrank = 1; //Good Hit
            sprite_index = spr_pep_B_punch;
            event_user(1);
            //if !audio_is_playing(snd_miss) && targetid.floating = 1
            //    audio_play_sound(snd_miss,0,0);
            //else if !audio_is_playing(snd_strike) && targetid.floating = 0
            //    audio_play_sound(snd_strike,0,0);
        }
        else if sprite_index = spr_mariobhammerstrikestart && image_index >= 8 && image_index <= 9 && targetid.hurt = 0 && held = 3 //Great Hit
        {
            image_index = 12;
            global.hitrank = 2; //Great Hit
            sprite_index = spr_pep_B_punch;
            event_user(1);
            //if !audio_is_playing(snd_miss) && targetid.floating = 1
           //     audio_play_sound(snd_miss,0,0);
            //else if !audio_is_playing(snd_strike) && targetid.floating = 0
             //   audio_play_sound(snd_strike,0,0);
        }
        else if sprite_index = spr_pep_B_punch && image_index > 0 && image_index < 2 && targetid.hurt = 0 //Excellent Hit
        {
            global.hitrank = 3; //Excellent Hit
            event_user(1);
            //if !audio_is_playing(snd_miss) && targetid.floating = 1
            //    audio_play_sound(snd_miss,0,0);
            //else if !audio_is_playing(snd_strike) && targetid.floating = 0
            //    audio_play_sound(snd_strike,0,0);
        }
        else if sprite_index = spr_mariobhammerstrikefail && image_index < 2 && image_index < 4 && targetid.hurt = 0 //Ok Hit
        {
            global.hitrank = 0; //Ok Hit
            event_user(1);
            //if !audio_is_playing(snd_throw)
            //    audio_play_sound(snd_throw,0,0);
        }
    }
}

//Perform Bros Attack
if moveto = 5
    event_user(7);

//Take out Item
if moveto = 6
    sprite_index = spr_pep_B_idle;

//Toss Item
if moveto = 7
    sprite_index = spr_mariobthrowup;

//Consume Item
if moveto = 8
    sprite_index = spr_mariobswallow;
    
//Healing from Item
if moveto = 9
{
    /*IF POISONED
    sprite_index = spr_mariobheal2;
    else*/
    sprite_index = spr_mariobheal;
}
    
//Toss Item to gustavo
if moveto = 10
    sprite_index = spr_mariobthrow;

//Pick up gustavo
if moveto = 11
{
    if battleblock = 2 && global.Gdead = 1 && movechoose = 1 //Run from Battle
    {
        if y = stancey+64
        {
            obj_gustavob.visible = false;
            sprite_index = spr_mariopickupgustavo; //Pick up gustavo
        }
        else
        {
            stance = 0;
            //sprite_index = spr_mariochoosejump;
            depth = -y-1;
            mp_linear_step(stancex-12,stancey+64,4,0);
        }
    }
    else if battleblock <> 2 && global.Gdead = 1 //Ready for enemy attack
    {
        if y = stancey+64
        {
            obj_gustavob.visible = false;
            sprite_index = spr_mariopickupgustavo; //Pick up gustavo
        }
        else
        {
            stance = 0;
            sprite_index = spr_pep_B_idle;
            depth = -y-1;
            mp_linear_step(stancex-12,stancey+64,4,0);
        }
    }
}

//Return to start position
if x = stancex && y = stancey && ground = 1
{
    if sprite_index = spr_pep_B_moveback
        sprite_index = spr_pep_B_idle;
    control = 1;
}

//Run Away
if battleblock = 2 && phase = 0.25 //About to run
{
    if global.Gdead = 0
    {
        phase = -3;
        global.turn = 0;
        sprite_index = spr_pep_B_moveback;
        obj_gustavob.sprite_index = spr_lonegustavo_walkback;
    }
}
if battleblock = 2 && phase = -3 //Run off screen
{
    if global.Gdead = 0
    {
        stance = 6;
        with obj_gustavob stance = 6;
        mp_linear_step(stancex-128,stancey,2,0);
        with obj_gustavob mp_linear_step(stancex-128,stancey,2,0);
    }
    else if global.Gdead = 1
        mp_linear_step(-128,y,2,0);
}

//Changes turn to gustavo's turn or enemy's
if phase = 0.5 && x = stancex && y = stancey
{
    instance_create(global.posx,global.posy-64,obj_totaldamage);
    global.posx = 0;
    global.posy = 0;
    repeataction = 0;
}
if phase = 4 && x = stancex && y = stancey && !instance_exists(obj_totaldamage)
&& global.turn > -1
{
    if global.strike = 0
    {
        global.hitrank = 0;
        turnnext = 0;
        if obj_gustavob.turnnext = 1
        {
            obj_gustavob.phase = 1;
            global.turn = 1;
        }
        else
        {
            obj_gustavob.turnnext = 1;
            if global.Gdead > 0
                moveto = 11;
        }
    }
    else if global.strike > 0
        with obj_battlecontrol event_user(8);
    if instance_exists(targetid)
        if targetid.hurt = -1
            targetid.hurt = 0;
}
if phase = 6 && x = stancex && y = stancey && obj_gustavob.x = obj_gustavob.stancex
&& obj_gustavob.y = obj_gustavob.stancey && global.turn > -1
{
    if global.strike = 0
    {
        global.hitrank = 0;
        turnnext = 0;
        if obj_gustavob.turnnext = 1
        {
            obj_gustavob.phase = 1;
            global.turn = 1;
        }
        else
        {
            obj_gustavob.turnnext = 1;
            if global.Gdead > 0
                moveto = 11;
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
    if stance = 1 && stancex = x && stancey = y//Idle stance
    {
		image_speed = 0.35;
        sprite_index = spr_pep_B_idle;
    }
    if stance = 2 //Idle Battle Block stance
    {
        //image_speed = 0.35;
        global.takedamage = 0;
        //sprite_index = spr_pep_B_idle;
    }
    if stance = 3 //Jump guard
    {
        image_speed = 0.35;
        /*if global.Gdead > 0
            sprite_index = spr_stance3b;
        else*/
            sprite_index = spr_stance3;
    }
    if stance = 4 //Hammer guard
    {
        if hammeringdodge = 1 && hammerdodgewait = 1 && hammering = 0 && hammerdodgego = 0 && held = 2 && hurt = 0
        {
            image_speed = 0.35;
            //mask_index = spr_mask_hammer;
            sprite_index = spr_mariobhammerhit;
        }
        else if control = 1 && hammering = 0
        {
            image_speed = 0.35;
            /*if global.Gdead > 0
                sprite_index = spr_stance4b;
            else*/
                sprite_index = spr_stance4;
        }
    }
    if stance = 5 //Ducking
    {
        image_speed = 0.275;
        sprite_index = spr_stance5;
    }
    if stance = 6 //Running away
    {
        image_speed = 0.275;
        if global.Gdead = 1 && phase = -3
            sprite_index = spr_pep_B_moveback;
        else
            sprite_index = spr_pep_B_moveback;
    }
    if stance = 7 //Victory
    {
        control = 0;
        sprite_index = spr_mariobwinspin;
    }
    if stance = 8 //Victory pose jump
    {
        control = 0;
        sprite_index = spr_mariobwinspin_jump;
    }
    if stance = 9 //Victory pose hammer
    {
        control = 0;
        sprite_index = spr_mariobwinspin_hammer;
    }
    if stance = 10 //Victory pose hand
    {
        control = 0;
        sprite_index = spr_mariobwinspin_hand;
    }
    if stance = 11 //Level Up
    {
        control = 0;
        sprite_index = spr_mariobwin;
    }
    if stance = 12 //Level Up Pose
    {
        control = 0;
        sprite_index = spr_mariobwinlevelup;
    }
    if stance = 13 //Level Up Pose
    {
        control = 0;
        if image_index >= 10
            image_single = 10;
        sprite_index = spr_mariobwinlevelup2;
    }
    if stance = 14 && reaction = 0 && obj_gustavob.sprite_index = spr_luigidead //Panic Pose
    {
        control = 0;
        if phase <> 0.15
        {
            phase = 0.15;
            //audio_play_sound(snd_mario_cry_for_gustavo,0,0);
        }
        sprite_index = spr_mariopanic;
    }
    if stance = 15 && instance_exists(obj_brosattack) //Green Shells
    {
        if sprite_index = spr_pep_B_kick
            stance = 16;
        else if obj_brosattack.phase <> 4
            sprite_index = spr_pep_B_idle;
        else if obj_brosattack.phase = 4
            sprite_index = spr_pep_B_kickstance;
    }
    if stance = 16 && instance_exists(obj_brosattack) //Green Shells Idle
    {
	}
    if stance = 17 //Green Shells Failed
        sprite_index = spr_mariobgreenshellfall;
    if stance = 18 //Fire Flowers
    {
        if sprite_index = spr_mariobfireflowerstance
            stance = 19;
        else if obj_brosattack.phase <> 1
            sprite_index = spr_mariobfireflowerstance;
        else if obj_brosattack.phase = 1
            sprite_index = spr_mariobfireflowerstance;
    }
    if stance = 19 && instance_exists(obj_brosattack) //Fire Flowers Idle
    {}
}

if ground = 0 && hurt = 0
{
    if zspeed > 0 && repeataction = 0 && phase = 4
    {
        sprite_index = spr_mariobjumpup;
        //with obj_battlecontrol event_user(1);
    }
    else if zspeed > 0 && repeataction = 0
        sprite_index = spr_mariobjumpup;//these ones actually do the  thing
    else if zspeed > 0 && repeataction = 1   
        sprite_index = spr_mariobjumpdown1;
   // else if zspeed <= 15 && repeataction = 0 && phase = 4
    //    sprite_index = spr_lonegustavo_jump
    else if zspeed <= 15 && repeataction = 0
        sprite_index = spr_mariobjumpdown1;
    if z < 15
        sprite_index = spr_mariobjumpland2;
    if moveto = 0 && phase = 4 or phase = 0.5 && global.totaldamage > 0
    {
        sprite_index = spr_pep_B_moveback;
        phase = 0.5;
    }
}

if phase = 1
{
    global.damage = 0;
    global.totaldamage = 0;
    global.luck = 0;
    global.lucky = 0;
    turnnext = 0;
    obj_gustavob.glitchfix = false;
    stance = 2;
}
if phase = 2 && (moveto != 5.1 && moveto != 5.2)
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
    
//Sets what bros attacks will appear in the bros attacks menu

if movechoose <= 0
{
    //if battleblock = 0 //Solo
    //    movechoose = 1;
    if battleblock = 1 //Bros
        movechoose = brosnum;
    if battleblock = 2 //Run
        movechoose = runnum;
}
if battleblock = 0 //Solo
{
    //if movechoose > solonum 
        movechoose = 1;
}
if battleblock = 1 && phase = 2 //Bros
{
    if movechoose > drawat
        movechoose = 1;
    else if movechoose < 1
        movechoose = drawat;
}
if battleblock = 2 //Run
{
    if movechoose > runnum
        movechoose = 1;
}

//Part of jumping to hit the block
if jumpchoosego = 1
    jumpchoosewait = -1;
if jumpchoosewait <= -1 && moveto <> 11
{
    z = 0;
	zspeed = 0;
    jumpchoosego = 0;
    jumpchoosewait = 2;
	if battleblock == 0
		event_user(6)
	else
		phase = 2
    //Return if no items are currently in your inventory
    if battleblock = 3 && itemdifmax = 0
    {
        //audio_play_sound(snd_incorrect,0,0);
        phase = 1;
        z = 0;
    }
    //Return if no bros attacks are available
    else if battleblock = 1 && brositemdifmax = 0
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
        if battleblock = 3 && phase = 2 //Items
        {
            //Display List
            ds_list_clear(itemlist);
            ds_list_clear(itemamount);
            if global.mushrooms > 0
            {
                ds_list_add(itemlist, "Mushrooms");
                ds_list_add(itemamount, string(global.mushrooms));
            }
            if global.supermushrooms > 0
            {
                ds_list_add(itemlist, "Super Mushrooms");
                ds_list_add(itemamount, string(global.supermushrooms));
            }
            if global.ultramushrooms > 0
            {
                ds_list_add(itemlist, "Ultra Mushrooms");
                ds_list_add(itemamount, string(global.ultramushrooms));
            }
            if global.maxmushrooms > 0
            {
                ds_list_add(itemlist, "Max Mushrooms");
                ds_list_add(itemamount, string(global.maxmushrooms));
            }
            if global.nuts > 0
            {
                ds_list_add(itemlist, "Nuts");
                ds_list_add(itemamount, string(global.nuts));
            }
            if global.supernuts > 0
            {
                ds_list_add(itemlist, "Super Nuts");
                ds_list_add(itemamount, string(global.supernuts));
            }
            if global.ultranuts > 0
            {
                ds_list_add(itemlist, "Ultra Nuts");
                //ds_list_add(itemamount, string(global.ultranuts));
            }
            if global.maxnuts > 0
            {
                ds_list_add(itemlist, "Max Nuts");
                //ds_list_add(itemamount, string(global.maxnuts));
            }
            if global.starcandies > 0
            {
                ds_list_add(itemlist, "Star Candies");
                //ds_list_add(itemamount, string(global.starcandies));
            }
            if global.syrups > 0
            {
                ds_list_add(itemlist, "Syrups");
                //ds_list_add(itemamount, string(global.syrups));
            }
            if global.supersyrups > 0
            {
                ds_list_add(itemlist, "Super Syrups");
                //ds_list_add(itemamount, string(global.supersyrups));
            }
            if global.ultrasyrups > 0
            {
                ds_list_add(itemlist, "Ultra Syrups");
                //ds_list_add(itemamount, string(global.ultrasyrups));
            }
            if global.maxsyrups > 0
            {
                ds_list_add(itemlist, "Max Syrups");
                //ds_list_add(itemamount, string(global.maxsyrups));
            }
            if global.oneups > 0
            {
                ds_list_add(itemlist, "1-Up Mushrooms");
                //ds_list_add(itemamount, string(global.oneups));
            }
            if global.oneupsupers > 0
            {
                ds_list_add(itemlist, "1-Up Supers");
                //ds_list_add(itemamount, string(global.oneupsupers));
            }
            if global.herbs > 0
            {
                ds_list_add(itemlist, "Refreshing Herbs");
                //ds_list_add(itemamount, string(global.herbs));
            }
            if global.redpeppers > 0
            {
                ds_list_add(itemlist, "Red Peppers");
                //ds_list_add(itemamount, string(global.redpeppers));
            }
            if global.greenpeppers > 0
            {
                ds_list_add(itemlist, "Green Peppers");
                //ds_list_add(itemamount, string(global.greenpeppers));
            }
            if global.boobiscuits > 0
            {
                ds_list_add(itemlist, "Boo Biscuits");
                //ds_list_add(itemamount, string(global.boobiscuits));
            }
            if global.retryclocks > 0
            {
                ds_list_add(itemlist, "Retry Clocks");
                //ds_list_add(itemamount, string(global.retryclocks));
            }
        }
       //audio_play_sound(snd_confirm,0,0);
    }
}

//Jump dodge timing
if jumpdodgego = 1
    jumpdodgewait -= 1;
if jumpdodgewait <= -1
{
    //zspeed = 14;
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

if global.turn = 1 && phase != 5
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
if global.PHP > global.maxPHP
    global.PHP = global.maxPHP;
if global.PBP > global.maxPBP
    global.PBP = global.maxPBP;

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
if global.Pdead = -0.25 && x = stancex && y = stancey
    global.Pdead = 0.5;
if global.Pdead = 0.5
{
    //if !audio_is_playing(snd_mario_mamamia)
    //    audio_play_sound(snd_mario_mamamia,0,0);
    sprite_index = spr_mariodie;
    with obj_gustavob phase = 0.25;
}
if global.Pdead = 1 && sprite_index = spr_mariodie
{
    hurt = 2;
    sprite_index = spr_mariodead;
}

//Game Over
if global.Pdead = 1 && global.Gdead = 1 && hurt = 2 && obj_gustavob.hurt = 2
{
    hurt = 0;
    stance = -1;
    obj_gustavob.stance = -1;
    with obj_battlecontrol event_user(2);
}


/*Move Battle Blocks Smoothly
if battleblock = 0
{
    //Jump Block
    obj_jumpblock.x = lerp(obj_jumpblock.x,x_block[1],lerp_speed);
    obj_jumpblock.originally = lerp(obj_jumpblock.originally,y_block[1],lerp_speed);
    obj_brosblock.x = lerp(obj_brosblock.x,x_block[2],lerp_speed);
    obj_brosblock.originally = lerp(obj_brosblock.originally,y_block[2],lerp_speed);
    obj_runblock.x = lerp(obj_runblock.x,x_block[3],lerp_speed);
    obj_runblock.originally = lerp(obj_runblock.originally,y_block[3],lerp_speed);
    obj_itemblock.x = lerp(obj_itemblock.x,x_block[4],lerp_speed);
    obj_itemblock.originally = lerp(obj_itemblock.originally,y_block[4],lerp_speed);
    obj_itemblock.depth = 0;
    obj_runblock.depth = 2;
    obj_brosblock.depth = 0;
    obj_jumpblock.depth = -1;
}
else if battleblock = 1
{
    //down - 1
    //right - 2
    //up - 3
    //left - 4
    //Bros Block
    obj_jumpblock.x = lerp(obj_jumpblock.x,x_block[4],lerp_speed);
    obj_jumpblock.originally = lerp(obj_jumpblock.originally,y_block[4],lerp_speed);
    obj_brosblock.x = lerp(obj_brosblock.x,x_block[1],lerp_speed);
    obj_brosblock.originally = lerp(obj_brosblock.originally,y_block[1],lerp_speed);
    obj_runblock.x = lerp(obj_runblock.x,x_block[2],lerp_speed);
    obj_runblock.originally = lerp(obj_runblock.originally,y_block[2],lerp_speed);
    obj_itemblock.x = lerp(obj_itemblock.x,x_block[3],lerp_speed);
    obj_itemblock.originally = lerp(obj_itemblock.originally,y_block[3],lerp_speed);
    obj_itemblock.depth = 2;
    obj_runblock.depth = 0;
    obj_brosblock.depth = -1;
    obj_jumpblock.depth = 0;
}
else if battleblock = 2
{
    //down - 1
    //right - 2
    //up - 3
    //left - 4
    //Run Block
    obj_jumpblock.x = lerp(obj_jumpblock.x,x_block[3],lerp_speed);
    obj_jumpblock.originally = lerp(obj_jumpblock.originally,y_block[3],lerp_speed);
    obj_brosblock.x = lerp(obj_brosblock.x,x_block[4],lerp_speed);
    obj_brosblock.originally = lerp(obj_brosblock.originally,y_block[4],lerp_speed);
    obj_runblock.x = lerp(obj_runblock.x,x_block[1],lerp_speed);
    obj_runblock.originally = lerp(obj_runblock.originally,y_block[1],lerp_speed);
    obj_itemblock.x = lerp(obj_itemblock.x,x_block[2],lerp_speed);
    obj_itemblock.originally = lerp(obj_itemblock.originally,y_block[2],lerp_speed);
    obj_itemblock.depth = 0;
    obj_runblock.depth = -1;
    obj_brosblock.depth = 0;
    obj_jumpblock.depth = 2;
}
else if battleblock = 3
{
    //Item Block
    obj_jumpblock.x = lerp(obj_jumpblock.x,x_block[2],lerp_speed);
    obj_jumpblock.originally = lerp(obj_jumpblock.originally,y_block[2],lerp_speed);
    obj_brosblock.x = lerp(obj_brosblock.x,x_block[3],lerp_speed);
    obj_brosblock.originally = lerp(obj_brosblock.originally,y_block[3],lerp_speed);
    obj_runblock.x = lerp(obj_runblock.x,x_block[4],lerp_speed);
    obj_runblock.originally = lerp(obj_runblock.originally,y_block[4],lerp_speed);
    obj_itemblock.x = lerp(obj_itemblock.x,x_block[1],lerp_speed);
    obj_itemblock.originally = lerp(obj_itemblock.originally,y_block[1],lerp_speed);
    obj_itemblock.depth = -1;
    obj_runblock.depth = 0;
    obj_brosblock.depth = 2;
    obj_jumpblock.depth = 0;
}
if global.turn = 1 or phase >= 2
{
    obj_jumpblock.x = lerp(obj_jumpblock.x,x_block[0],lerp_speed);
    obj_jumpblock.originally = lerp(obj_jumpblock.originally,y_block[0],lerp_speed);
    obj_brosblock.x = lerp(obj_brosblock.x,x_block[0],lerp_speed);
    obj_brosblock.originally = lerp(obj_brosblock.originally,y_block[0],lerp_speed);
    obj_runblock.x = lerp(obj_runblock.x,x_block[0],lerp_speed);
    obj_runblock.originally = lerp(obj_runblock.originally,y_block[0],lerp_speed);
    obj_itemblock.x = lerp(obj_itemblock.x,x_block[0],lerp_speed);
    obj_itemblock.originally = lerp(obj_itemblock.originally,y_block[0],lerp_speed);
    obj_mariob.sprite_index = spr_stance1;
    //Make blocks disappear smoothly
    obj_jumpblock.image_alpha = lerp(obj_jumpblock.image_alpha,0,0.1);
    obj_brosblock.image_alpha = lerp(obj_brosblock.image_alpha,0,0.1);
    obj_runblock.image_alpha = lerp(obj_runblock.image_alpha,0,0.1);
    obj_itemblock.image_alpha = lerp(obj_itemblock.image_alpha,0,0.1);
}*/

/* */
/*  */
