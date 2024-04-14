depth = -bbox_bottom;

if obj_ow_player.character == "P"
{
	palettes = player_palettes[0];
	paletteselect = 0;
	with obj_ow_player
		{
			if paletteselect > 2
			{
				for (var i = 0; i < array_length(other.palettes); i++)
				{
						var pal = other.palettes[i][2];
						var info = get_pep_palette_info();
						if pal == info.paletteselect && array_length(other.palettes[i]) <= 3
						{
							other.paletteselect = i;
							break;
						}
					}
				}
			}
}