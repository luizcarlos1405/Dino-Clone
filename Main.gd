extends Node

var velocidade = Vector2(-500, 0)
var velocidade_inicial = velocidade
var offset_inicial = Vector2()
var comecou = false
var acabou = false
var pontuacao_cacto = 10
var pontos = 0
var record = 0

func _ready():
	get_node("Dinossauro").connect("recomecou", self, "quando_recomecou")
	pass

func _process(delta):
	if not comecou:
		return
		
	velocidade.x -= delta/5

func quando_recomecou():
	velocidade = velocidade_inicial
	$ParallaxBackground.set_scroll_offset(offset_inicial)