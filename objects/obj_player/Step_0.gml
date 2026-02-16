// inicia o metodo que mapeia as teclas do jogador
mapear_teclas()
// inicia o metodo de movimento
movimento()
// inicia o metodo de checar se esta tocando o chão
checa_chao()
// inicia o metodo de debug
mudar_debug()

// inicia o metodo que ajusta pra ondo jogador olha
ajusta_escala()

// inicia a função que faz o efeito squash voltar ao padrão
retorna_squash()
retorna_efeito_brilho()

// abre porta
abre_porta()

// 

// inicia o metodo de debug para mudar a cor do jogador
//mudar_cores()

if keyboard_check_pressed(ord("R"))
{
    cria_transicao_inicia(room)
}

if keyboard_check_pressed(vk_f11)
{
    var _full = window_get_fullscreen()
    window_set_fullscreen(!_full)
}

// executa o estado atual do jogador
estado()
