extends Sprite2D
class_name PlayerAnimation
@export var anim:AnimationPlayer
@export var player_ref:CharacterBody2D

var direction_str = "right"

func animation_player(dic:Vector2):
	
	change_side(dic)
	if player_ref.check_inputs():
		animation_move(dic)
	else:
		anim_action()

	pass

func change_side(dic):
	if dic.x > 0:
		flip_h = false
		direction_str = "right"
	elif dic.x < 0:
		flip_h = true
		direction_str = "left"



func animation_move(dic):
	if dic != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")





	pass

func anim_action():
	if player_ref.in_attack:
		anim.play("attack_" + direction_str)





	pass

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	match anim_name:
		"attack_left":
			player_ref.in_attack = false
		"attack_right":
			player_ref.in_attack = false
	pass # Replace with function body.
