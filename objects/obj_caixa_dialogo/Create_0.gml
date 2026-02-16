#region VARIAVEIS

#endregion
// armazena o texto
texto = noone
// define o estilo como typist
escreve = scribble_typist()
escreve.in(0.5, 2)

// define se pode desenhar
desenha_texto = false

// define se eu devo ou não me destruir
me_destruir = false

image_alpha = 0
#endregion

#region METODOS

inicia_dialogo = function()
{
    if me_destruir exit
    
    image_alpha = lerp(image_alpha, .95, .2)
    image_xscale = lerp(image_xscale, 2.6, .25)
    
    // faz subir suave
    y = lerp(y, ystart - 20, .2)
    
    // se ue y está quase no fim
    if y <= ystart - 19.9
    {
        desenha_texto = true
    }
}

destroi_dialogo = function()
{
    if me_destruir
    {
        // anima suavemente a placa
        image_xscale = lerp(image_xscale, 0, .05)
        image_yscale = lerp(image_yscale, 0, .1)
        image_alpha = lerp(image_alpha, 0, .3)
        
        desenha_texto = false
        
        // se a transparencia for 0 ou abaixo de 0
        if image_alpha <= 0.01
        {
            // destroi
            instance_destroy()
            
            me_destruir = false    
        }
    }
}

#endregion