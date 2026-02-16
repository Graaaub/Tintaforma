// se eu tenho um alvo
if alvo
{
    image_xscale = lerp(image_xscale, speed * 3, .1)
    image_angle = direction
    
    image_alpha = speed / 10
    
    // se a particula ainda não começou a voltar
    if !voltar
    {
        // perde velocidade
        speed -= 0.1
        
        // se a particula chegou em zero ou começou a voltar    
        if speed <= 0 
        { 
            // define a variavel voltar como true 
            voltar = true
        }
    }
    else
    {
        // ganha velocidade
        speed += 0.15
        
        // vai para a direção do jogador
        var _x = alvo.x random_range(-5, 5)
        var _y = alvo.y - 12 + random_range(-6, 6)
        var _dir = point_direction(x, y, _x, _y)
            
        direction = _dir
        
        // se a particula colidiu com o jogador
        var _coli = instance_place(x, y, obj_player)
        
        if _coli
        {
            // roda codigos dentro do jogador 
            with (_coli) 
            {
                // armazena um valor aleatório para o squash
                var _varia = random_range(0.70, 1.30)
            	efeito_squash(_varia, _varia)
                
                // armazena uma força aleatoria para o brilho
                var _forca = random_range(.4, 1.0)
                aplica_efeito_brilho(, _forca)
                
            }
            
            
            screenshake(2)
            // apaga a particula
            instance_destroy()
        }
    }
}