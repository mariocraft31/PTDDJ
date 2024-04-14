scr_speaker(speaker)

if array_length(msginfo) > 2 
	scr_anyface(speaker, msginfo[0], msginfo[2])

msgset(msginfo[0], msginfo[1])

for (var i = 0; i < array_length(msgnextinfo); i++) {
	
	if array_length(msgnextinfo[i]) > 1
		scr_anyface_next(msgnextinfo[i][1], (array_length(msgnextinfo[i]) > 2 ? msgnextinfo[i][2] : 0))
	
	msgnext(msgnextinfo[i][0])
}

myinteract = 3
global.msc = 0

if typer == -1 {
	global.typer = 5
} else if speaker == "no_name" { global.typer = typer } 

global.portrait = 0
global.interact = 1
mytext = instance_create_depth(0, 0, -10000, obj_dialog_box)
