
// variavel de identificação do jogador
alvo = noone

// metodo para mover o powerup para o jogador
ir_para_jogador = function ()
{
    // se nenhum alvo foi armazenado
    // retorna
    if !alvo 
        return;
    
    x = alvo.x
    y = alvo.y - 40
}

explosao = function ()
{
    // repete 20 vezes
    var _qtd = irandom_range(20, 50)
    repeat (_qtd) 
    {
    	var _partic = instance_create_layer(x, y, "Enfeites", obj_partic_powerup)
        _partic.speed = random_range(3, 4)
        _partic.direction = random(359)
        
        _partic.alvo = alvo
    }
}