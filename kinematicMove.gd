
extends KinematicBody

var yaw = 0;
var pitch = 0;
var mouse_sensitivity = 0.3;
var walk_speed = 0.1;

var ismouse_capture = true;
var max_mouse_right;
var max_mouse_down;
var mouse_center_x;
var mouse_center_y;

func _ready():
	if(get_viewport() != null):
		max_mouse_right = get_viewport().get_visible_rect().size.width - 200;
		max_mouse_down = get_viewport().get_visible_rect().size.height - 200;
		mouse_center_x = get_viewport().get_visible_rect().size.width/2;
		mouse_center_y = get_viewport().get_visible_rect().size.height/2;
	
	set_fixed_process(true);
	set_process_input(true);

func _fixed_process(delta):
	var char = get_node(".");
	var gTransform = char.get_global_transform();
	var gTransformBasis = gTransform.basis;

	if(Input.is_action_pressed("key_move_ahead")):
		var moveAheadImpulse = Vector3();
		moveAheadImpulse -= (gTransformBasis[2] * walk_speed);
		move(moveAheadImpulse);
	
	if(Input.is_action_pressed("key_move_back")):
		var moveBackImpulse = Vector3();
		moveBackImpulse += (gTransformBasis[2] * walk_speed);
		move(moveBackImpulse);
	
	if(Input.is_action_pressed("key_move_left")):
		var moveLeftImpulse = Vector3();
		moveLeftImpulse -= (gTransformBasis[0] * walk_speed);
		move(moveLeftImpulse);
	
	if(Input.is_action_pressed("key_move_right")):
		var moveRightImpulse = Vector3();
		moveRightImpulse += (gTransformBasis[0] * walk_speed);
		move(moveRightImpulse);



func _input(event):
	if(event.type == InputEvent.MOUSE_MOTION):
		if(get_viewport().get_mouse_pos().x <= 200 or get_viewport().get_mouse_pos().x >= max_mouse_right):
			ismouse_capture = false;
			get_viewport().warp_mouse(Vector2(mouse_center_x, get_viewport().get_mouse_pos().y));
		elif(get_viewport().get_mouse_pos().y <= 200 or get_viewport().get_mouse_pos().y >= max_mouse_down):
			ismouse_capture = false;
			get_viewport().warp_mouse(Vector2(get_viewport().get_mouse_pos().x, mouse_center_y));
		elif(ismouse_capture == true):
			yaw = fmod(yaw - event.relative_x * mouse_sensitivity, 360);
			pitch = max(min(pitch - event.relative_y * mouse_sensitivity, 90), -90);
			get_node(".").set_rotation_deg(Vector3(0, yaw, 0));
			get_node("Camera").set_rotation_deg(Vector3(pitch, 0, 0));
		else:
			ismouse_capture = true;

func _center_window():
	var screen_size = OS.get_screen_size(0)
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	