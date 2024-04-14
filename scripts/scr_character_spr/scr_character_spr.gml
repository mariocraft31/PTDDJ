function scr_character_spr() //scr_characterspr
{
	if (character == "P")
    {
		sprite_jump[DOWN] = spr_peppino_jump_d;
		sprite_jump[LEFT] = spr_peppino_jump_d;
		sprite_jump[RIGHT] = spr_peppino_jump_d;
		sprite_jump[UP] = spr_peppino_jump_d;
		
		sprite_fall[DOWN] = spr_peppino_fall_d;
		sprite_fall[LEFT] = spr_peppino_fall_d;
		sprite_fall[RIGHT] = spr_peppino_fall_d;
		sprite_fall[UP] = spr_peppino_fall_d;

		sprite_move[DOWN] = spr_peppino_d_walk;
		sprite_move[LEFT] = spr_peppino_l_walk;
		sprite_move[RIGHT] = spr_peppino_r_walk;
		sprite_move[UP] = spr_peppino_u_walk;
		
		sprite_dash[DOWN] = spr_peppino_d_dash;
		sprite_dash[LEFT] = spr_peppino_l_dash;
		sprite_dash[RIGHT] = spr_peppino_r_dash;
		sprite_dash[UP] = spr_peppino_u_dash;

		sprite[DOWN] = spr_peppino_d;
		sprite[LEFT] = spr_peppino_l;
		sprite[RIGHT] = spr_peppino_r;
		sprite[UP] = spr_peppino_u;

		sprite_taunt = spr_peppino_taunt;
		
		spr_palette = spr_peppalette;
	}
}