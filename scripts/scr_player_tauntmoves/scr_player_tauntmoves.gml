function scr_player_tauntmoves() //scr_player_tauntmoves
{
	{
	taunttimer--
    }
if  taunttimer == 0
    {
        movespd = tauntstoredmovespeed
        vsp = tauntstoredvsp
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
    return;
	}
}