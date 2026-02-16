// me desenha
draw_self()

// se não pode desenhar o texto, sai
if !desenha_texto exit

/*
// define as propriedades do texto
draw_set_font(fnt_texto)
draw_set_halign(0)
draw_set_valign(0)*/
// pega metade da sprite
var _margemX = 3
var _margemY = 2
var _larg = (sprite_width * 10) - (_margemY * 20)
var _x = (x - sprite_width / 2) + _margemX
var _y = (y - sprite_height / 2) + _margemY
// desenha o texto
//draw_text_ext_transformed(_x, _y, texto, 60, _larg, .1, .1, 0)
// reseta a font
//draw_set_font(-1 )

// propriedades das animações
scribble_anim_wheel(.5, .1, .1)
scribble_anim_wave(1, 5, .15)
scribble_anim_shake(.5, .5, .2)
var _txt = scribble(texto)

// propriedades do texto
_txt.starting_format("fnt_texto", c_white)
_txt.scale(.1)
_txt.wrap(sprite_width, 50)
_txt.gradient(c_black, .5)
_txt.sdf_outline(c_black, 2)
//_txt.outline(c_black)
_txt.draw(_x, _y, escreve)