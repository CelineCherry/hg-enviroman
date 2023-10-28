extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed = 200

export (PackedScene) var bullet

var cooldown = 0

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	$Node2D.look_at(get_global_mouse_position())
	cooldown -= delta

func _input(event):
   # Mouse in viewport coordinates.
   if event is InputEventMouseButton:
	   fire()

func fire():
	if(cooldown == 0):
		cooldown = 5
		var shot = bullet.instantiate()
		shot.transform = $Muzzle.global_transform
		get_parent().add_child(shot)
		
