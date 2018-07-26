extends Area2D

onready var dinossauro = get_parent().get_node("Dinossauro")
var chao = Vector2(1400, 708)
var velocidade = Vector2(-500, 0)
var tempo_vida = 5

func _ready():
	set_position(chao)
	
	connect("area_entered", dinossauro, "colidiu")
	pass

func _physics_process(delta):
	set_position(position + get_node("/root/Main").velocidade * delta)
	
	tempo_vida = tempo_vida - delta
	
	if tempo_vida <= 0:
		queue_free()