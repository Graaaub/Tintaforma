function screenshake(_tremer = 5)
{
	// se o objedo existe
	if instance_exists(obj_screenshake)
	{
		// roda o script dento do objeto descrito
		with obj_screenshake
		{
			// se o valor passado pela função foi maior que o valor atual do shake
			if _tremer > shake
			{
				// muda o valor
				shake = _tremer	
			}
		}
	}
}