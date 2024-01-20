extends Camera2D


func _on_1_body_entered(body):
	if body.name == "Player":
		self.position = Vector2(80,-80)


func _on_0_body_entered(body):
	if body.name == "Player":
		self.position = Vector2(80,80)
