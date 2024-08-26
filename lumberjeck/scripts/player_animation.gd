extends Sprite2D

@export var anim:AnimationPlayer

func animation_player(dic:Vector2):
	change_side(dic)
	animation_move(dic)

	pass

func change_side(dic):
	if dic.x > 0:
		flip_h = false
	elif dic.x < 0:
		flip_h = true



func animation_move(dic):
	if dic != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")





	pass