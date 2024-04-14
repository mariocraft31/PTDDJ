if moveto = 1 && z <= other.headz && other.dead = 0 && obj_battlecontrol.enemyid[targetchoose] = other
    event_user(0);

//Fix glitch with specific enemies lower in the room
if phase = 4 && moveto = 0 && !sprite_index = spr_luigibwalkingback
    stance = 6;

if phase = -1 && other.dead = 0 //Jump counterattack
{
    if z <= other.headz
    {
        //Attacked
        if other.headz - z > 5 && hurt = 0
        {
            sprite_index = spr_lhurt;
            hurt = 1;
            global.takedamage = 1; //Luigi takes damage
            instance_create(x+16,y,obj_pointsbattle);
            damage = round(global.GHP * global.Gdef/100 - other.pow); //Luigi HP * Luigi defense/100 - Enemy's POW
            global.GHP += damage;
            global.damage = -damage; //Damage dealt
            if global.GHP <= 0
                global.Gdead = 0.5;
            audio_play_sound(snd_takedamage,0,0);
        }
        //Counterattack
        else if other.headz - z <= 5
        {
            zspeed = 5;
            zgravityon = 1;
            global.hurt = 1;
            other.hurt = 1;
            instance_create(other.xstart,other.ystart,obj_pointsbattle);
            damage = round(other.hp * other.def/100 - global.Gpow); //Enemy HP * Enemy defense/100 - Luigi's POW
            if damage >= 0
                damage = -1;
            other.hp += damage;
            global.damage = -damage; //Damage dealt
            sprite_index = spr_lonegustavo_jumpstart; //Nailed hit
            audio_play_sound(snd_hit,0,0);
        }
        other.moveto = 0;
        other.turndone = 1;
    }
}
if phase = -2 && other.dead = 0 //Hammer counterattack
{
        //Counterattack
        if sprite_index = spr_luigibhammerhit && image_index > 2 && other.x-12 >= x && other.hurt = 0
        {
            global.hurt = 1;
            other.hurt = 1;
            instance_create(other.xstart,other.ystart,obj_pointsbattle);
            damage = round(other.hp * other.def/100 - global.Gpow); //Enemy HP * Enemy defense/100 - Luigi's POW
            if damage >= 0
                damage = -1;
            other.hp += damage;
            global.damage = -damage; //Damage dealt
            //audio_play_sound(snd_strike,0,0);
        }
        //Attacked
        else if hurt = 0
        {
            sprite_index = spr_lhurt;
            image_speed = 0.275;
            hurt = 1;
            global.takedamage = 1; //Luigi takes damage
            instance_create(x+16,y,obj_pointsbattle);
            damage = round(global.GHP * global.Gdef/100 - other.pow); //Luigi HP * Luigi defense/100 - Enemy's POW
            global.GHP += damage;
            global.damage = -damage; //Damage dealt
            if global.GHP <= 0
                global.Gdead = 0.5;
            audio_play_sound(snd_takedamage,0,0);
        }
        other.moveto = 0;
        other.turndone = 1;
}

