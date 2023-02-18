/// @desc Set up player

// Movement
dir = 0;
acc = 0.1;
max_speed = 6;

//State
is_dead = false;

exhaust_counter = 0;

Inputs = [];

current_passenger = noone;

// Animation
sprite_index = player_number == 0 ? spr_tabbie_taxi_one : spr_tabbie_taxi_two;

image_index = 0;
image_speed = 0;