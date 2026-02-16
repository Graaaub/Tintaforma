// checa se colidiu com o jogador
var _player = place_meeting(x, y, obj_player)

// se colidiu com o jogador
if _player
{
    // checa se o dialogo não existe
    if !instance_exists(meu_dialogo)
    {
        meu_dialogo = instance_create_layer(x, y - 15, "Dialogo", obj_caixa_dialogo) 
        meu_dialogo.image_xscale = .5
        meu_dialogo.texto = texto
    }
}
else 
{
	if instance_exists(meu_dialogo)
    {
        meu_dialogo.me_destruir = true
    }
}
