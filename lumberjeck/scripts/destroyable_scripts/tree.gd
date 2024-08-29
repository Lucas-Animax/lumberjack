extends StaticBody2D
class_name TreePysics

@export_category("Objects")
@export var anim:AnimationPlayer

var life:int =  50
var hit:bool = false

func _process(_delta: float) -> void:
	if life > 0 and not hit:
		anim.play("idle")

func update_life(dano):
	life = life - dano
	if life <= 0:
		dead_tree()
	else:
		hit_tree()

	pass

func dead_tree():
	anim.play("dead")
	if life < 0:
		queue_free()


	pass

func hit_tree():
	hit = true
	if hit:
		anim.play("hit")




func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	match anim_name:
		"hit":
			hit = false
	pass # Replace with function body.
