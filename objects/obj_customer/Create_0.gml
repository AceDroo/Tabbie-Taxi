/// @desc Set up the passenger

image_speed = 0
image_index = irandom(image_number);

initial_patience = irandom_range(15, 20);
patience = initial_patience;
station_wait_rate = 1;
travelling_wait_rate = 5;
current_wait_rate = station_wait_rate;

destination_planet = noone;

is_travelling = false
player = noone;

timer = 0;