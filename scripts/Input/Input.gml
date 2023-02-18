enum Action {
	LEFT,
	RIGHT,
	UP,
	DOWN
}

enum Axis {
	HOR,
	VER
}

function GetKeyInputs() {
	Inputs[0, Action.LEFT] = keyboard_check(vk_left);
	Inputs[0, Action.RIGHT] = keyboard_check(vk_right);
	Inputs[0, Action.UP] = keyboard_check(vk_up);
	Inputs[0, Action.DOWN] = keyboard_check(vk_down);

	Inputs[1, Action.LEFT] = keyboard_check(ord("A"));
	Inputs[1, Action.RIGHT] = keyboard_check(ord("D"));
	Inputs[1, Action.UP] = keyboard_check(ord("W"));
	Inputs[1, Action.DOWN] = keyboard_check(ord("S"));
}

function GetAxisValue(_player, _axis) {
	if (_axis == Axis.HOR) {
		return Inputs[_player, Action.RIGHT] - Inputs[_player, Action.LEFT];
	} else if (_axis == Axis.VER) {
		return Inputs[_player, Action.DOWN] - Inputs[_player, Action.UP];
	} else {
		show_debug_message("Invalid value given!");
		return 0
	}
}