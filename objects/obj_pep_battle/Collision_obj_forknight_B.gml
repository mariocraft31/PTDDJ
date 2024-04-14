if moveto = 1 && z <= other.headz && other.dead = 0// && obj_battlecontrol.enemyid[targetchoose] == other
{
    event_user(0);
}
if phase = -1 && other.dead = 0 //Jump counterattack
{
    if z <= other.headz
    {
        //Attacked
        if other.headz - z > 10 && hurt = 0
        {
            sprite_index = spr_mhurt;
            hurt = 1;
            global.takedamage = 1; //Mario takes damage
            instance_create(x+16,y,obj_pointsbattle);
            damage = round(global.PHP * global.Pdef/100 - other.pow); //Mario HP * Mario defense/100 - Enemy's POW
            global.PHP += damage;
            global.damage = -damage; //Damage dealt
            if global.PHP <= 0
                global.Pdead = 0.5;
            audio_play_sound(snd_takedamage,0,0);
        }
        //Counterattack
        else if other.headz - z <= 10
        {
            zspeed = 11;
            zgravityon = 1;
            global.hurt = 1;
            other.hurt = 1;
            instance_create(other.xstart,other.ystart,obj_pointsbattle);
            damage = round(other.hp * other.def/100 - global.Ppow); //Enemy HP * Enemy defense/100 - Mario's POW
            if damage >= 0
                damage = -1;
            other.hp += damage;
            global.damage = -damage; //Damage dealt
            sprite_index = spr_mariobjumpland2; //Nailed hit
            audio_play_sound(snd_hit,0,0);
        }
        other.moveto = 0;
        other.turndone = 1;
    }
}