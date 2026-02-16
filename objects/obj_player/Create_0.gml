#region INICIANDO

// inicia o efeito de squash & stratch
inicia_efeito_squash()
inicia_efeito_brilho()

#endregion

#region variaveis
// variavel que armazena a velocidade horizontal
velh        = 0
max_velh    = 1
velv        = 0
max_velv    = 3.5
gravidade   = 0.18

// armazena a cor do jogador para o brilho
cor_brilho = c_white
alpha_brilho = 0

// variavel que armazena a direção do jogador
dir = 1

// variavel que armazena se o jogador está no chão
tocando_no_chao = false
// variavel que armazena se o jogador está na tinta
tocando_tinta = false

right = false
left  = false
jump  = false
paint = false

// variavel que armazena quantas chaves o jogador tem
chaves = 0


lista_sprites = [spr_player_move_idle, spr_player_idle]
indice_sprite = 0


// lista de colisões
tilemap_tinta = layer_tilemap_get_id("tl_tinta")
var _layer = layer_tilemap_get_id("tl_level")
colisoes = [obj_parede, _layer]

// variavel que armazena meu estado atual
estado = noone

// variavel que armazena os powerups]
powerup_tinta = false

#endregion

#region metodos
// metodo de movimentação
aplica_velocidade = function()
{
    // checa se o jogador está no chão
    checa_chao()
    
    // aplicando os inputs no velh
    velh = (right - left) * max_velh
    
    // aplica gravidade
    if !tocando_no_chao
    {
        velv += gravidade
    }
        else 
    { 
        // "desativa" a gravidade 
        velv = 0
        
        // arrendonda a posição y do jogador,
        // não permitindo que ele entre dentro do chão
        y = round(y)
    }
    
    velv = clamp(velv, -max_velv, max_velv)
    
}

// se estou dentro da parede one_way, removo
remove_colisao_oneway = function()
{
    if instance_place(x ,y, obj_parede_oneway)
    {
        if array_contains(colisoes, obj_parede_oneway)
        var _index array_get_index(colisoes, obj_parede_oneway)
        
        array_delete(colisoes, _index, 1)
    }
}

ajusta_escala = function()
{
    if velh != 0
    {
        dir = sign(velh)
    }
}

movimento = function()
{
        // aplicando a velocidade horizontal no jogador
    move_and_collide(velh, 0, colisoes)
    
    // aplicando a velocidade vertical no jogador
    move_and_collide(0, velv, colisoes, 12)
}

// metodo de pegar os inputs do jogador
mapear_teclas = function()
{
    keyboard_set_map(ord("A"), vk_left);
    keyboard_set_map(ord("D"), vk_right);
    keyboard_set_map(ord("S"), vk_down);
    
    right = keyboard_check(vk_right)
    left = keyboard_check(vk_left)
    down = keyboard_check(vk_down)
    jump = keyboard_check(vk_space)
    paint = keyboard_check_pressed(ord("E"))
}

// metodo para checar se o jogador está tocando no cão
checa_chao = function()
{
    // place_meeting verifica se uma posição está sobre um objeto
    // nesse caso, x, y+1 seria 1px abaixo do pé do jogador
    tocando_no_chao = place_meeting(x, y + 1, colisoes)
    
    // checa se o jogador está tocando na tinta
    tocando_tinta = place_meeting(x, y + 1, tilemap_tinta)
}

// metodo para pular
pular = function()
{
    if tocando_no_chao
    { 
        // define a velocidade que o jogador vai pular
        velv = -max_velv
        
        // cria a particula de pulo
        instance_create_depth(x, y, depth - 1, obj_partic_pular)
         
        // faz o efeito de mola
        efeito_squash(0.8, 1.3 )
    }
}

mudar_animacao = function(_sprite_index = spr_parede)
{
    if sprite_index != _sprite_index
    {
        // define a animação do parado
        sprite_index = _sprite_index
        // volta para o primeiro sprite da animação
        image_index = 0
    }
}

anim_terminou = function(_estado = noone)
{
    // indo para animação do meio
    var _spd = sprite_get_speed(sprite_index) / FPS
    if image_index + _spd >= image_number
    {
        return true
    }
}

// estado do jogador parado
estado_parado = function()
{  
    aplica_velocidade()
    
    // executa o metodo de mudar a animação
    //mudar_animacao(spr_player_idle)
    
    //muda para a animimação da lista de sprites
    mudar_animacao(lista_sprites[indice_sprite])    
    
    // se a animação terminou
    if anim_terminou()
    {
        // armazena o tamanha da array
        var _qtd = array_length(lista_sprites) - 1
        {
            // se o indice é menor que o quantidade de sprites
            if indice_sprite < _qtd 
            {
                // adiciona 1
                indice_sprite++
            }
        }
        
    }
    
    if right xor left
    {
        estado = estado_movendo
    }
    
    if down
    {
        if array_contains(colisoes, obj_parede_oneway)
        {
            var _index = array_get_index(colisoes, obj_parede_oneway)
            array_delete(colisoes, _index, 1)
        }
    }
    
    // se apertar espaço
    if jump
    {
        // executa o metodo de pular
        pular()
        
        // entra no estado de pulo
        estado = estado_pulo
    }
    
    // se o jogador estiver parado, mas não estiver tocando no chão
    if !tocando_no_chao
    {
        // define que o jogador está pulando
        estado = estado_pulo
    }
    
    // se o jogador apertou a telca de paint
    if paint and powerup_tinta and tocando_tinta
    {
        // entra no estado de entra na tinta
        estado = estado_tinta_entrar
        
        // zerando as velocidades
        velh = 0
        velv = 0
    }
}

// estado do jogador movendo
estado_movendo = function()
{
    aplica_velocidade()
    
    // executa o metodo de mudar a animação
    mudar_animacao(spr_player_move)
    
    // se o jogador está parado (velocidade 0)
    if velh == 0
    {
        estado = estado_parado
    }
    
    // se o jogador estiver andando
    // e não estiver no chão
    if !tocando_no_chao
    {
        // muda o estado
        estado = estado_pulo
    }
    
    // se o jogador pular
    if jump
    {
        // executa o metodo de pular
        pular()
        
        // entra no estado de pulo
        estado = estado_pulo
    }
    
    // se o jogador apertar a tecla de paint
    // e tiver tocando no chão
    if paint and powerup_tinta and tocando_tinta 
    {
        // muda o estado
        estado = estado_tinta_entrar   
    }
}

estado_pulo = function()
{
    aplica_velocidade()
    
    // se eu bater em alguma coisa com a cabeça
    var _layer = layer_tilemap_get_id("tl_level")
    var _colisoes = [obj_parede, _layer]
    if place_meeting(x, y + sign(velv), _colisoes)
    {
        velv = 0
    }
    
    // se a velocidade do jogador for negativa (subindo)
    if velv < 0
    {
        // executa o metodo de mudar a animação
        mudar_animacao(spr_player_jump_cima)
        
        // se o objeto parede oneway está dento da array de colisções
        if array_contains(colisoes, obj_parede_oneway)
        {
            var _index = array_get_index(colisoes, obj_parede_oneway)
            array_delete(colisoes, _index, 1)
        }
    }
    // se não, é positiva (caindo)
    else
    {
    	// executa o metodo de mudar a animação
        mudar_animacao(spr_player_jump_baixo)
        
        if !place_meeting(x, y, obj_parede_oneway)
        {
           // se o objeto parede oneway ainda não está na array de colisões
           if !array_contains(colisoes, obj_parede_oneway)
           {
                // se o jogador ainda não tiver caido no tutorial, sai
                if global.soft_lock or room != rm_tutorial1
                {
                    // coloca ele lá dentro
                    array_push(colisoes, obj_parede_oneway)  
                }
               
           }
        }
    }
    
    // se o jogador tocou no chão
    if tocando_no_chao
    {
        // volta para o estado de parado
        estado = estado_parado
        
        // cria a particula de pouso
        instance_create_depth(x, y, depth - 1, obj_partic_cair)
        
        // executa a função que faz o efeito squash
        efeito_squash(1.3, .8)
    }
}

pega_powerup = function()
{
    estado = estado_powerup_inicio
}

estado_powerup_inicio = function()
{   
    // define a animação de pegar o powerup
    mudar_animacao(spr_player_powerup_inicio)
    aplica_velocidade()

    // para o jogador
    velh = 0

    
    // inicia o metodo de trocar a animação quando chegar no fim
    if anim_terminou()
    {
        estado = estado_powerup_meio
    }
}

estado_powerup_meio = function()
{
    // define a animação de pegando o powerup
    mudar_animacao(spr_player_powerup_meio)
    
    // inicia o metodo de trocar a animação quando chegar no fim
    if !instance_exists(obj_partic_powerup)
    {
        estado = estado_powerup_fim
    }
}

estado_powerup_fim = function()
{
    // define a animação de terminar de pegar o powerup
    mudar_animacao(spr_player_powerup_fim)
    
    // inicia o metodo de trocar a animação quando chegar no fim
    if anim_terminou()
    {
        // muda o estado
        estado = estado_parado
        powerup_tinta = true
    }
}

estado_tinta_entrar = function()
{
    mudar_animacao(spr_player_tinta_entrar)
    
    // para o jogador
    velh = 0
    
    // se a partica não foi criada
    if !instance_exists(obj_partic_tinta_entrar)
    {
        // cria a particula
        instance_create_depth(x, y, depth - 1, obj_partic_tinta_entrar)
    }
    
    if anim_terminou()
    {
        // muda o estado
        estado = estado_tinta_loop
    }
}

estado_tinta_loop = function()
{
    mudar_animacao(spr_player_tinta_loop)
    
    // muda a mascara de colisão do jogador
    mask_index = spr_player_tinta_loop
    
    // permite o jogador se mover
    aplica_velocidade()
    
    if 
    {
        
    }
    
    var _parar = !place_meeting(x + (velh * 18), y + 1, tilemap_tinta) 
    if _parar
    {
        velh = 0
    }
    
    // se o jogador apertou a tecla de paint
    if paint and !place_meeting(x, y - 24, colisoes)
    {
        // muda o estado
        estado = estado_tinta_sair 
        
        //zerando as velocidades
        velv = 0
        velh = 0   
    }
}

estado_tinta_sair = function()
{
    mudar_animacao(spr_player_tinta_sair)
    
    // volta a mascara de colisão para o normal
    mask_index = spr_player_idle
    
    // se a partica não foi criada
    if !instance_exists(obj_partic_tinta_sair)
    {
        // cria a particula
        instance_create_depth(x, y, depth - 1, obj_partic_tinta_sair)
        
    }
    
    if anim_terminou()
    {
        // muda o estado
        estado = estado_parado
    }
}

desenhar_icone = function(_spr = spr_icon_chave, _qnt = 1, _x = 20, _y = 20, _tamanho = 1, _espaco)
{
    var _esp = _espaco
    repeat _qnt
    {
        draw_sprite_ext(_spr, 0, _x + _esp, _y + _espaco, _tamanho, _tamanho, 0, c_white, 1)
        _esp += _espaco
    }
}

abre_porta = function()
{
    var _porta = instance_place(x + 1, y, obj_porta)
    
    if _porta && _porta.estado == "fechada"
    {
        if chaves >= 1
        {
            _porta.estado = "abrindo"
            chaves--
        }
    }
}

#endregion

#region DEBUG

view_player = noone

iniciar_debug = function()
{
    // ativa o debug overlay
    show_debug_overlay(1)
    
    view_player = dbg_view("View_player", 1, 60, 80, 300, 250)
    
    // monitorando o velv
    dbg_watch(ref_create(id, "velv"), "velv")
    // permite personalizar o valor de uma variavel dentro do jogo
    dbg_slider(ref_create(id, "max_velv"), 0, 10)
    
    dbg_watch(ref_create(id, "velh"), "velh")
    dbg_slider(ref_create(id, "max_velh"), 0, 10)
    
    
    dbg_slider(ref_create(id, "gravidade"),0, 1)
}

mudar_debug = function()
{
    // se o jogo não estiver no modo debug, sai
    if !DEBUG_MODE return
    
    // se o jogador apertou tab
    if keyboard_check_pressed(vk_tab)
    {
        // inverte a variavel de debug (true = false, false = true...)
        global.debug = !global.debug
        
        // se a variavel debug é verdadeira
        if global.debug
        {
            // inicia o metodo de debug
            iniciar_debug()  
        }
        // se não
        else 
        {
            // fecha o debug overlay
            show_debug_overlay(0)
            
            // se o view_player existe
        	if dbg_view_exists(view_player)
            {
                // apaga
                dbg_view_delete(view_player)
            }
        }
    }
}

mudar_cores = function()
{
    if keyboard_check_pressed(ord("B"))
        cor_brilho = c_white
    
    if keyboard_check_pressed(ord("C"))
        cor_brilho = c_gray
    
    if keyboard_check_pressed(ord("Y"))
        cor_brilho = c_yellow
    
    if keyboard_check_pressed(ord("K"))
    {
        //faz o efeito de squash
        //efeito_squash(1.5, .8)
        
        // muda o brilho
        aplica_efeito_brilho(c_orange, 1)
    }

}

#endregion

// definindo um estado inicial para o jogador
estado = estado_parado