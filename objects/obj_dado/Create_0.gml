estado = noone
timer = FPS * tempo

troca_estado = function(_estado = estado_seta)
{
    // diminui o timer
    timer--
    
    // se timer for <= 0
    if timer <= 0
    {
        // vai para o estado de transição para o xis
        estado = _estado
        // reseta o timer
        timer = FPS * tempo
    }
}

estado_seta = function()
{
    // para no frame do X
    image_index = 0
    
    // define a mascara de colisão para a do dado
    mask_index = sprite_index
    
    // executa o metodo de mudar de estados após o fim do timer
    troca_estado(estado_seta_xis)
}

estado_seta_xis = function()
{
    if image_index = 8
    {
        //show_message("To indo pro Xis")
        estado = estado_xis
    }
}

estado_xis = function()
{
    // para no fram da Seta
    image_index = 8
    
    // define a mascara de colisão para a do vazio
    mask_index = spr_vazio
    
    // executa o metodo de mudar de estados após o fim do timer
    troca_estado(estado_xis_seta)
}

estado_xis_seta = function()
{
    if image_index <= 1
    {
        //show_message("To indo pra Seta")
        estado = estado_seta
    }
}

estado = estado_seta

if estado_inicial == "estado_xis"
{
    estado = estado_xis
}