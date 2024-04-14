/// @description Creates an instance of a given object at a given position.
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.
function instance_create(argument0, argument1, argument2) {
	return instance_create_depth( argument0, argument1, 0, argument2 );
}

/// @description audio_loop_sound(sound,sample_begin,sample_end,sample_rate,priority)
/// @param sound
/// @param sample_begin
/// @param sample_end
/// @param sample_rate
/// @param priority
function audio_loop_sound(argument0, argument1, argument2, argument3, argument4) {
	/*By: Mario Silva
	** ===== RECOMMENDATIONS: =====
	** 1. Room Speed: 60.
	** 2. Audio's end with 1 sec of silence (to avoid loop get skipped).
	** 3. Activated region for control instance (obj_audio_loop_sound).
	** 4. Audio sample rate (Hz) for 'argument3'. Recommended to use: 48000
	** 5. You can use Audacity to convert seconds/milliseconds to samples for 'argument1/2'.
	** 6. If necessary: change _transition_delay variable below to improve loop timing.

	In order for this code to work, you must have "Use New Audio Engine" checked under Global Game Settings

	*/
	var _als = instance_create(__view_get(1,0)+16,__view_get(2,0)+16,obj_audio_loop_sound);
	with(_als){

	    _audio = audio_play_sound(argument0,argument4,1);
	    _loop_begin = argument1/argument3;
	    _loop_end = argument2/argument3;
	    _transition_delay = 0.01; //Change to improve loop timing (was 0)
	    _debug = 1;
	};
	return _als._audio;



}
