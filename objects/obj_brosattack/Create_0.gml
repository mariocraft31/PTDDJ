//Attack to use in battle
switch (global.turn)
{
    case 0:
        switch (obj_pep_battle.movechoose)
        {
            case 1:
                sprite_index = spr_lonebrick_wait
                attacknum = 0;
                break;
            case 2:
                sprite_index = spr_fireflowerb;
                attacknum = 1;
                break;
            case 3:
                sprite_index = spr_jumphelmetb;
                attacknum = 2;
                break;
            case 4:
                sprite_index = spr_brokenheartb;
                attacknum = 3;
                break;
            default:
                sprite_index = spr_lonebrick_roll
                attacknum = 0;
                break;
        }
        break;
    case 1:
        switch (obj_gustavob.movechoose)
        {
            case 1:
                sprite_index = spr_lonebrick_wait;
                attacknum = 0;
                break;
            case 2:
                sprite_index = spr_fireflowerb;
                attacknum = 1;
                break;
            case 3:
                sprite_index = spr_jumphelmetb;
                attacknum = 2;
                break;
            case 4:
                sprite_index = spr_brokenheartb;
                attacknum = 3;
                break;
            default:
                sprite_index = spr_lonebrick_roll;
                attacknum = 0;
                break;
        }
        break;
}

//Grow item
image_xscale = 1;
image_yscale = 1;
event_user(4)
image_speed = .5;
z = 0;
ground = 1;
ready = 1;
zspeed = 0;
zgravity = -1;
zgravityon = 0;
falling = 0;
amount = 0;
ID = 0;
rank = 0; //Rank increments
phase = 0; //Phase of the attack