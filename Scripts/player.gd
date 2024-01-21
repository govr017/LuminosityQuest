extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -125.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func jump_cut():
	if velocity.y < -10:
		velocity.y = -10

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		$PSprite.play("jump")
		$Line2D.visible = true
		velocity.y += gravity * delta
	if is_on_floor() and velocity.x == 0:
		$PSprite.play("idle")
	if is_on_floor():
		$Line2D.set_point_position(1, Vector2(0,0))
		$MHead.visible = false
		$Line2D.visible = false
	if Input.is_action_just_pressed("jump") and (is_on_floor() or !$Timer.is_stopped()):
		$JumpSFX.play()
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump"):
		jump_cut()
	if Input.is_action_just_pressed("click"):
		var mouse_pos = self.get_local_mouse_position()
		#var direction_staff = (self.global_position - mouse_pos).normalized() *  200
		var d_direction_staff = mouse_pos.clamp(Vector2(-15.0, -15.0), Vector2(15.0, 15.0))
		var direction_staff = mouse_pos.clamp(Vector2(-1.0, -1.0), Vector2(1.0, 1.0))
		print(direction_staff)
		$RayCast2D.target_position = d_direction_staff
		$RayCast2D.force_raycast_update()
		if $RayCast2D.is_colliding() and $Timer2.is_stopped():
			$Timer2.start()
			$Line2D.set_point_position(1, d_direction_staff)
			$MHead.visible = true
			$MHead.position = d_direction_staff
			$StaffSFX.play()
			velocity.x = -direction_staff.x * 150
			velocity.y = -direction_staff.y * 150
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if is_on_floor():
			$PSprite.play("walk")
		if direction == 1:
			$PSprite.flip_h = 0
		elif direction == -1:
			$PSprite.flip_h = 1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var was_on_floor = is_on_floor()
	move_and_slide()
	if was_on_floor and !is_on_floor():
		$Timer.start()
