function inicia_efeito_squash()
{
	xScale = 1
	yScale = 1
}

function efeito_squash(_xScale = 1, _yScale = 0.6)
{
	xScale = _xScale	
	yScale = _yScale
}

function retorna_squash(_qtd = .1)
{
	xScale = lerp(xScale, 1, _qtd)	
	yScale = lerp(yScale, 1 ,_qtd)	
}

function desenha_efeito_squash()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xScale, yScale, image_angle, image_blend, image_alpha)	
}
