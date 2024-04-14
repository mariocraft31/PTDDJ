instance_create_depth(0, 0, -999, obj_msg_fader)
myinteract = 3
global.interact = 1
if !instance_exists(obj_portrait)
	instance_create_depth(0, 0, -10000, obj_portrait)
if !instance_exists(obj_portrait2)
	instance_create_depth(0, 0, -10000, obj_portrait2)

scr_speaker(msginfo[2])

scr_anyface(msginfo[2],msginfo[0],msginfo[1])

msgset(msginfo[0], msginfo[1])

for (var i = 0; i < array_length(msgnextinfo); i++) {
	
	if array_length(msgnextinfo[i]) > 1
		scr_anyface_next(msgnextinfo[i][1], (array_length(msgnextinfo[i]) > 2 ? msgnextinfo[i][2] : 0))

	msgnext(msgnextinfo[i][0])
	scr_speaker(msgnextinfo[i][1])
}

global.msc = 0

if typer == -1 {
	global.typer = 5
} else if msginfo[2] == "no_name" { global.typer = typer } 

mytext = instance_create_depth(0, 0, -10000, obj_dialog_box)
with (mytext)
	side = 0