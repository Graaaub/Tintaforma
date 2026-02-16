#region variaveis
// variavel que controla o debug
global.debug = false
global.soft_lock = false

// cria uma constante
#macro DEBUG_MODE 0

// em cada configuração
// define se o debug será ativado ou não
// define que no modo debug, o debug pode ser ativar
#macro config_debug:DEBUG_MODE 1
// define que no modo normal, o debug não pode ser ativar
#macro config_normal:DEBUG_MODE 0

// macro que armazena os FPS do jogo
#macro FPS game_get_speed(gamespeed_fps)

#endregion