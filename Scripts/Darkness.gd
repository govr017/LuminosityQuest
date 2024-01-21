extends Area2D

var active = false
func _process(delta):
	if active == true:
		self.position.y += -0.1


func _on_sd_body_entered(body):
	if body.name == "Player":
		active = true
		$SD.queue_free()


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://lost.tscn")
