/// @desc Manage the passenger

// Lose patience over time
timer++;
if (timer >= current_wait_rate * 120) {
	patience--;	
	timer = 0;
}

// Travel with player
if (is_travelling && player != noone) {
	x = player.x;
	y = player.y;
}

// If customer has lost all patience, leave
if (patience <= 0) {
	audio_play_sound(snd_customer_lost, 1, false);
	instance_destroy();
	if (is_travelling && player != noone) {
		player.current_passenger = noone;
	}
	
	obj_game_manager.customers_lost++;
	obj_game_manager.display_failure = true;
	obj_game_manager.alarm[0] = 160;
}