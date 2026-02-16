// se o alvo ainda não foi definido
if alvo == noone
{
    // armazena quem tocou
    alvo = other.id
    
    // coloca o jogador no estado de pegar o powerup
    other.pega_powerup()
    
    // chama o metodo de colocar o powerup acima do jogador
    ir_para_jogador()
    
    // chama o metodo das particulas
    explosao()
}