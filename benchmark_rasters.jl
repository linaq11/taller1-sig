using Rasters, ArchGDAL, Statistics

# Leer la ruta del archivo que ya configuraste
path = strip(read("s2_shared_path.txt", String))

t0 = time_ns()
# Abrimos el dataset y procesamos
ArchGDAL.read(path) do ds
    r = Raster(ds)[Band(1)]
    res = r .* 1.5
    m = mean(res)
    t_final = (time_ns() - t0) / 1e9
    
    # Esta línea DEBE estar dentro del bloque 'do' para asegurar que imprima
    println("🟣 Julia Terminal: ", round(t_final, digits=3), " seg | mean = ", m)
end