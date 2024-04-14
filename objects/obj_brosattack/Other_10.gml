//Green Shells
switch (phase)
{
    case 1:
        with obj_pep_battle event_user(5); //Determine luck
        global.damage = round(global.Ppow/2 - other.def/100); //Takes Mario's pow for damage
        break;
    case 3:
        with obj_gustavob event_user(5); //Determine Luck
        global.damage = round(global.Gpow/2 - other.def/100); //Takes gustavo's pow for damage
        break;
}

if global.luckyhit = true //Lucky Hit
{
	audio_sound_gain(sfx_lucky,0.6,0)
    audio_play_sound(sfx_lucky,0,0);
    other.hurt = 1;
    switch (phase)
    {
        case 1:
            global.damage+= global.Plvl; //Adds certain damage based on what level Mario is
            break;
        case 3:
            global.damage+= global.Glvl; //Adds certain damage based on what level gustavo is
            break;
    }
    other.hp += -global.damage;
    instance_create(x,y,obj_pointsbattle);
	
}
else
    other.hp += -global.damage; //Deals the damage based on Mario's pow
if !instance_exists(obj_rankbattle)
{
    rank += 0.5;
    if rank == 3
    {
		event_user(1)
        global.hitrank = 3;
        audio_play_sound(sfx_excellent,0,0);
    }
    else if rank = 2.5
    {
        audio_play_sound(sfx_great,0,0);
    }
    else if rank = 2
    {
        audio_play_sound(sfx_great,0,0);
        global.hitrank = 2;
    }
    else if rank = 1.5
    {
		global.hitrank = 2;
        audio_play_sound(sfx_great,0,0);
    }
    else if rank = 1
    {
        global.hitrank = 1;
        audio_play_sound(sfx_good,0,0);
    }
    else if rank = 0.5
    {
		global.hitrank = 1;
        audio_play_sound(sfx_good,0,0);
    }
    else if rank = 0
    {
        global.hitrank = 0;
    }
    
    if rank > 0
    {
        instance_create(x,y,obj_rankbattle);
        obj_rankbattle.image_single = global.hitrank;
    }
}
if !instance_exists(obj_pointsbattle)
{
    instance_create(x,y,obj_pointsbattle);
    global.totaldamage+= global.damage;
}
if other.hurt = 1
{
    switch (phase)
    {
        case 1:
            phase = 2;
            obj_pep_battle.sprite_index = spr_pep_B_idle;
            obj_gustavob.sprite_index = spr_lonegustavo_idle;                
            break;
        case 3:
            phase = 4;
            obj_pep_battle.sprite_index = spr_pep_B_kickstance;
            obj_gustavob.sprite_index = spr_lonegustavo_idle;     
            break;       
    }
    alarm[4] = 20;
}

