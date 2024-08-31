extends CharacterBody2D
class_name Beast
@export_category("Objects")
@export var anim:AnimationPlayer
@export var spr:Sprite2D

@export var meat_scene:PackedScene

var health = 60
var speed = 64
var hit_bool:bool = false

func _ready() -> void:
	moving()

func _physics_process(_delta: float) -> void:
	anim_sheep()
	move_and_slide()
func moving():
	if not hit_bool:
		velocity = Vector2.ZERO
		await get_tree().create_timer(0.5).timeout
	var direction:Vector2 = Vector2(
		randi_range(-1,1),
		randi_range(1,-1)
	)
	var timer_move = randi_range(2,3)
	if direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x,direction.x * speed,0.6)
		velocity.y = lerp(velocity.y,direction.y * speed,0.6)
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		velocity.y = move_toward(velocity.y,0,speed)

	await get_tree().create_timer(timer_move).timeout
	moving()

func anim_sheep():
	change_size()
	if velocity != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")

func change_size():
	if velocity.x > 0:
		spr.flip_h = false
		pass
	elif velocity.x < 0:
		spr.flip_h = true

func update_life(dano):
	health -= dano
	if health <= 0:
		dead()
	else:
		hit_bool = true
		hit()



	pass

func dead():
	var mount_meat = randi_range(1,3)
	for mount_spawn in mount_meat:
		var meat_init:SpawnProperties = meat_scene.instantiate()
		meat_init.global_position = global_position + Vector2(
			randi_range(30,-30),
			randi_range(-30,30)
		)
		get_tree().root.call_deferred("add_child",meat_init)
	queue_free()
	pass

func hit():
	spr.material.set("shader_parameter/active",true)
	speed = 160
	moving()
	await get_tree().create_timer(0.5).timeout
	speed = 64
	spr.material.set("shader_parameter/active",false)
	hit_bool = false
	pass
