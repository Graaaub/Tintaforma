// se tem alvo
if alvo
{
    // se não é pra voltar
    if !voltar
    {
        // diminui a velocidade
        speed -= .05
        // se a velocidade descer de 0
        if speed <= 0
        {
            // define para voltar
            voltar = true
        }
    }
    // se tem que voltar
    else 
    {
        // variavel que armazena a posição e a direção da chave até o player
        var _x = alvo.x
        var _y = alvo.y
        var _dir = point_direction(x, y, _x, _y)
    	
        // define a direção
        direction = _dir
        // aumenta a velocidade5
        speed += .1
        
        // se a chave está tocando no jogador
        if place_meeting(x, y, alvo)
        {
            // diminui a transparencia
            image_alpha -= .1
            // se a transparencia for menor que 0
            if image_alpha <= 0
            {
                // treme a tela
                screenshake(5)
                
                // dentro do jogador
                with alvo {
                    // aplica os efeitos
                	efeito_squash(.8, 1.2)
                    aplica_efeito_brilho(c_white, 1)
                }
                
                // destroi a chave
                instance_destroy()
                // adiciona +1 chave ao jogador
                alvo.chaves++
            }
        }
    }
}