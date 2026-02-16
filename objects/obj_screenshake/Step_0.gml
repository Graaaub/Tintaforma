
// Tremer a tela
// altera a posição X e Y do viewport com base no valor do shake
if shake != 0
{
	var _x = random_range(-shake, shake)
	var _y = random_range(-shake, shake)
	// muda o x do viewport
	view_set_xport(view_current, _x)
	view_set_yport(view_current, _y)
}
// se a variavel shake for 0
else
{
	// volta o viewport para o meio
	view_set_xport(view_current, 0)
	view_set_yport(view_current, 0)
}

// faz o shake diminuir aos poucos
shake = lerp(shake, 0, .05)