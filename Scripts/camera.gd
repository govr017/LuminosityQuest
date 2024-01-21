extends Camera2D


func _on_1_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-80)


func _on_0_body_entered(body):
	if body.name == "Player":
		self.position = Vector2(80,80)


func _on_T_body_entered(body):
	if body.name == "Player":
		self.position = Vector2(-80,80)


func _on_2_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-240)


func _on_3_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-400)


func _on_4_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-560)


func _on_5_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-720)


func _on_6_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-880)


func _on_7_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-1040)


func _on_8_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-1200)


func _on_9_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-1360)


func _on_10_body_entered(body):
	if body.name == "Player":
		body.velocity.y += -100
		self.position = Vector2(80,-1520)


func _on_finish_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://win.tscn")
