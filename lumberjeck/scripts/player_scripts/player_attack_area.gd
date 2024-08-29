extends Area2D
@export var player_ref:CharacterBody2D


func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("enemy"):
		body.update_life(player_ref.strength)
	pass # Replace with function body.
