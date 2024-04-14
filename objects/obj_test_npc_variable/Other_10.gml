scr_speaker(speaker)

if array_length(msginfo) > 2 
	scr_anyface(speaker, msginfo[0], msginfo[2])


switch obj_ow_player.paletteselect
	{
		case 1:
			msgset(msginfo[0],(msginfo[1]))
			break;
		case 2:
			msgset(msginfo1[0],(msginfo1[1]))
			break;
		case 3:
			msgset(msginfo2[0],(msginfo2[1]))
			break;
		case 4:
			msgset(msginfo3[0],(msginfo3[1]))
			break;
		case 5:
			msgset(msginfo4[0],(msginfo4[1]))
			break;
	}

myinteract = 3
global.msc = 0

if typer == -1 {
	global.typer = 5
} else if speaker == "no_name" { global.typer = typer } 

global.portrait = 0
global.interact = 1
mytext = instance_create_depth(0, 0, -10000, obj_dialog_box)
