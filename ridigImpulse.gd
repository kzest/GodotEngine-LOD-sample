extends RigidBody

func _ready():
	set_process_input(true);

func _input(event):
	var rigidBody = get_node(".");
	var gTransform = rigidBody.get_global_transform();
	var gTransformBasis = gTransform.basis;
	if(event.type == InputEvent.KEY and event.pressed == true):
		if(Input.is_action_pressed("key_move_ahead")):
			var moveAheadImpulse = Vector3();
			moveAheadImpulse -= gTransformBasis[2];
			apply_impulse(Vector3(), moveAheadImpulse);
		
		if(Input.is_action_pressed("key_move_back")):
			var moveBackImpulse = Vector3();
			moveBackImpulse += gTransformBasis[2];
			apply_impulse(Vector3(), moveBackImpulse);
		
		if(Input.is_action_pressed("key_move_left")):
			var moveLeftImpulse = Vector3();
			moveLeftImpulse -= gTransformBasis[0];
			apply_impulse(Vector3(), moveLeftImpulse);
		
		if(Input.is_action_pressed("key_move_right")):
			var moveRightImpulse = Vector3();
			moveRightImpulse += gTransformBasis[0];
			apply_impulse(Vector3(), moveRightImpulse);