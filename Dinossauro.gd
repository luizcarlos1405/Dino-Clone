extends Area2D

var chao = Vector2(110, 659)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -1200
var modificador_gravidade = 2.3

var tempo = 0.0
var intervalo = 3
var intervalo_min = 0.5
var intervalo_max = 3

var cactos = [preload("res://CactoP1.tscn"),
			  preload("res://CactoP2.tscn"),
			  preload("res://CactoP3.tscn"),
			  preload("res://CactoG1.tscn"),
			  preload("res://CactoG2.tscn"),
			  preload("res://CactoG3.tscn")]

func _ready():
	set_position(chao)
	randomize()
	pass

func _physics_process(delta):
	tempo += delta
	
	if tempo >= intervalo:
		tempo = 0
		
		# Decide cacto
		var c = rand_range(0, cactos.size())
		
		get_parent().add_child(cactos[c].instance())
		
		# Decide novo intervalo
		intervalo = rand_range(intervalo_min, intervalo_max)
		print(intervalo)
		
		
		
	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta
	else :
		velocidade.y += gravidade * delta * modificador_gravidade
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
	
	position += velocidade * delta
	
	# Limita a posição até o chão
	if get_position().y > chao.y :
		set_position(chao)
		velocidade = Vector2()

func colidiu(area):
	queue_free()