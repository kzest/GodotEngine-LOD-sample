
extends RigidBody

func _ready():
	get_node("MeshInstance").set_draw_range_begin(0);
	get_node("MeshInstance").set_draw_range_end(15);
	get_node("MeshInstance 1").set_draw_range_begin(15);
	get_node("MeshInstance 1").set_draw_range_end(30);
	get_node("MeshInstance 2").set_draw_range_begin(30);
	get_node("MeshInstance 2").set_draw_range_end(45);
	get_node("MeshInstance 3").set_draw_range_begin(45);
	get_node("MeshInstance 3").set_draw_range_end(100);
	
