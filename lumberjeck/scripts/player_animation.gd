extends Sprite2D

@export var anim:AnimationPlayer

func animation_player(dic:Vector2):
	change_side(dic)


	pass

func change_side(dic):
	if dic.x > 0:
		flip_h = false
	elif dic.x < 0:
		flip_h = true



func animation_move():





	pass