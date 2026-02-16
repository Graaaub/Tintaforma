
// desenha o jogador
draw_sprite_ext(sprite_index, image_index, x, y, xScale * dir, yScale, image_angle, image_blend, image_alpha)

desenha_efeito_brilho()

if global.debug
{
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
    draw_text(x, y, tocando_plataforma)
}