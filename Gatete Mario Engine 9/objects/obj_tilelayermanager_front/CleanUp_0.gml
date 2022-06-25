/// @description Free memory

// Free TileSurface
if (surface_exists(TileSurface))
	surface_free(TileSurface);

// Free BufferSurface
if (surface_exists(BufferSurface))
	surface_free(BufferSurface);

// Free FinalSurface
if (surface_exists(FinalSurface))
	surface_free(FinalSurface);

// Free buffer
if (buffer_exists(buff))
	buffer_delete(buff);