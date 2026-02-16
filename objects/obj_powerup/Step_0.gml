//chama o metodo de ir para o jogador
ir_para_jogador()

if alvo
{
    // vai ficando transparente com o tempo
    image_alpha -= .02

    // se ele tiver transparente
    if image_alpha <= 0
    {
        // destroi o powerup
        instance_destroy()
    }
}