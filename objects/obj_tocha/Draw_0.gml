// me desenhando
//draw_self()

// variavel para a variação do tamanho do brilho
var _variacao = random(.02)

// muda o processamento
gpu_set_blendmode(bm_add)
// desenha o brilho da tocha
draw_sprite_ext(spr_brilho_tocha, 0, x, y, .5 + _variacao, .5 + _variacao, _variacao * 100, c_white, 0.3)
// reseta o processamento para o padrão
gpu_set_blendmode(bm_normal)