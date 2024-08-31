extends StaticBody2D
class_name TreePysics

@export_category("Objects")
@export var anim:AnimationPlayer

var tree_pack:PackedScene = preload("res://scenes/recurces/spawn_objects/spawn_tree.tscn")
var life:int =  50
var hit:bool = false

func _process(_delta: float) -> void:
	if life > 0 and not hit:
		anim.play("idle")

func update_life(dano):
	life = life - dano
	if life <= 0:
		spawn_tree()
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

func spawn_tree():
	var spawn_number = randi_range(1,5)
	for spawn_amount in spawn_number:
		var tree_init:SpawnProperties = tree_pack.instantiate()
		tree_init.global_position = global_position + Vector2(
			randi_range(-30,30),
			randi_range(30,-30)
		)
		get_tree().root.call_deferred("add_child",tree_init)


		pass


	pass


func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	match anim_name:
		"hit":
			hit = false
	pass # Replace with function body.
