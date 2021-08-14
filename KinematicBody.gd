extends KinematicBody

export var gravity = Vector3.DOWN * 5
export var speed = 7
export var rot_speed = 0.85
var velocity : Vector3 = Vector3.ZERO



func _physics_process(delta):
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	velocity += gravity*delta
	get_input(delta)
	move_and_slide(velocity,Vector3.UP)

	

func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("ui_right"):
		rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("ui_left"):
		rotate_y(rot_speed * delta)
	velocity.y = vy
	move_and_slide(velocity)

