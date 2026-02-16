// inicia todas as variaveis necessarias para o efeito brilho
function inicia_efeito_brilho()
{
    
    xScale = 1
    yScale = 1
    
    alpha_brilho = 0
    cor_brilho = c_white
}

// aplica o efeito no objeto desejado
// _cor = cor do brilho
// _intens = intensidade do brilho
function aplica_efeito_brilho(_cor = c_white, _intens = 1)
{
    cor_brilho = _cor
    alpha_brilho = _intens
}

// retorna o efeito de brilho suavemente para 0
// _intens = intensidade na qual o brilho desaparece
function retorna_efeito_brilho(_intens = .1)
{
    alpha_brilho = lerp(alpha_brilho, 0, _intens)
}

// desenha o jogador pronto para o efeito de brilho funcionar
function desenha_efeito_brilho()
{
    // se o alpha_brilho for < que 0.1, sai
    if alpha_brilho <= 0.01 exit
    
    // desenha o efeito de brilho
    shader_set(sh_brilho)
    draw_sprite_ext(sprite_index, image_index, x, y, xScale * dir, yScale, image_angle, cor_brilho, alpha_brilho)
    shader_reset()
}