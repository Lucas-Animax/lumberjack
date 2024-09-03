extends Area2D

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("player"):
		AnimationTrasition.close_trasition = true
		call_deferred("change_world")
		body.velocity = Vector2.ZERO
	pass # Replace with function body.

func change_world():
	Global.from_word = get_parent().name
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/runs/" + name + ".tscn")
