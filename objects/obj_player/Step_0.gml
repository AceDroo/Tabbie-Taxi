/// @desc Control player

// Get Input
GetKeyInputs();

// Get direction
var _xaxis = GetAxisValue(player_number, Axis.HOR);
var _yaxis = GetAxisValue(player_number, Axis.VER);

dir = point_direction(0, 0, _xaxis, _yaxis);

// Apply Movement
PlayerMovement(_xaxis, _yaxis);

// Generate particles 
if (PlayerIsMoving(_xaxis, _yaxis)) {
	exhaust_counter++;
	if (exhaust_counter >= 4) {
		exhaust_counter = 0;
		var _len = sprite_width * 0.4;
		var _xx = x;
		var _yy = y;
		part_particles_create(obj_game_manager.particles, _xx, _yy, obj_game_manager.part_type_exhaust, 1);
	}
}


// Collisions
PlayerMeetsCustomer();
PlayerMeetsStation();
PlayerMeetsCollision();