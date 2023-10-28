extends Area2D
export(NodePath) var target 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal trunk_entered

export (int) var speed = 100 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	move_and_slide(position.direction_to(to_global(get_parent().get_child(1).get_child(0).position))*delta*speed)
	position = position + self.position.direction_to(get_node(target).position) * speed *delta
	if(get_overlapping_areas().size() > 0):
		emit_signal("trunk_entered")
			
