extends Area2D

var switched = false

func _on_body_entered(body):
	if body.name == "Player" and switched == false:
		$MusicT.stop()
		$MusicM.play()
		switched == true
		$CollisionShape2D.queue_free()
