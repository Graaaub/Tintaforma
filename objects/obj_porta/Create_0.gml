#region VARIAVEIS

estado = "fechada"

//ps_porta
ps = part_system_create();
part_system_draw_order(ps, true);

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_disk);
part_type_size(ptype1, .2, .4, .08, 0);
part_type_scale(ptype1, 0.1, 0.1);
part_type_speed(ptype1, 0, 0, -1, 0);
part_type_direction(ptype1, 80, 100, 0, 0);
part_type_gravity(ptype1, 0, 263);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $FFFFFF, $FFFFFF, $919191);
part_type_alpha3(ptype1, .6, .6, 0);
part_type_blend(ptype1, false);
part_type_life(ptype1, 30, 40);


#endregion

#region ESTADOS

maquina_estado = function()
{
    switch estado 
    {
    	case "fechada":
        {
            image_blend = c_white
        }
        break
    
        case "abrindo":
        {
            // aplica velocidade negativa (cima) na porta
            vspeed = -.5
            
            // treme a tela
            screenshake(2)
            
            // tre me a porta
            x = xstart + random_range(-1.0, 1.0)
            
            // se a particula não existe
            //if !part_system_exists(ps)
            //{
                //// cria a particula
                //ps = part_system_create(ps_porta)
                //part_system_position(ps, xstart, ystart)
            //}
            
            //criando a minha particula
            var _x = x + (random_range(-sprite_width, sprite_width) / 1.5)
            part_particles_create(ps, _x, ystart - sprite_height, ptype1, 1)
            
            // se a posição y atual é <= a posição y inicial - o tamanho da sprite + 4 pixels
            if y <= ystart - (sprite_height - 4)
            {
                // muda o estado para aberta
                estado = "aberta"      
                
                // inicia o alarm para destruir o particle_system
                alarm[0] = FPS
            }
        }
        break
    
        case "aberta":
        {   
            // tira qualquer velocidade da porta
            vspeed = 0
            
            // volta a porta para o x inicial
            x = xstart
        }
        break
    }
}

#endregion