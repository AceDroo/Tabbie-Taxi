function PlayerMovement(_xaxis, _yaxis) {
	if (PlayerIsMoving(_xaxis, _yaxis)) {		
		// Begin moving in direction
		friction = 0;
		motion_add(dir, acc);
		speed = min(speed, max_speed);
		
		// Change animation
		image_index = floor(dir / 45);
	} else {
		friction = acc;	
	}

	// Wrap movement
	move_wrap(true, true, sprite_width / 2);
}

function PlayerIsMoving(_xaxis, _yaxis) {
	return (_xaxis != 0 || _yaxis != 0);
}

function PlayerIsCarryingPassenger() {
	return (current_passenger != noone);
}

function PlayerMeetsCustomer() {
	if (place_meeting(x, y, obj_customer)) {
		// If the player isn't carrying a passenger, pick up the passenger
		if (!PlayerIsCarryingPassenger()) {
			var _passenger = instance_place(x, y, obj_customer);
			if (!_passenger.is_travelling) {
				audio_play_sound(snd_pickup, 1, false);
				
				current_passenger = _passenger;
				_passenger.is_travelling = true;
				_passenger.player = id;
			}
		}
	}	
}

function PlayerMeetsStation() {
	if (place_meeting(x, y, obj_station)) {
		// Exit if player doesn't have a passenger
		if (!PlayerIsCarryingPassenger()) return;
		
		// Check current passenger is at their destination
		var _station = instance_place(x, y, obj_station);
		if (current_passenger.destination_planet == _station.planet) {
			// Player successfully dropped off passenger
			score += current_passenger.patience;
			audio_play_sound(snd_delivery, 1, false);
			instance_destroy(current_passenger);
			current_passenger = noone;
		}
	}	
}

function PlayerMeetsCollision() {
	if (place_meeting(x, y, obj_collision)) {
		// Kill the player
		instance_destroy();
		
		audio_play_sound(snd_explosion, 1, false);
		
		// Kill the passenger
		if (current_passenger != noone) {
			current_passenger.player = noone;
			instance_destroy(current_passenger);
		}
	}		
}