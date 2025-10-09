| Comando | Sintaxis general | Opciones / Parámetros |
|---------|------------------|----------------------|
| cat | `cat [archivo]` | `-n` (numera líneas), `-A` (muestra caracteres especiales) |
| less | `less [archivo]` | `-N` (muestra números de línea), `+F` (seguir archivo) |
| grep | `grep [opciones] 'patrón' [archivo]` | `-i` (ignora mayúsc/minúsc), `-r` (recursivo), `-n` (muestra número de línea) |
| find | `find [ruta] [condición] [acción]` | `-name` (por nombre), `-type` (tipo), `-size` (tamaño), `-exec` (ejecutar comando) |
| sort | `sort [opciones] [archivo]` | `-r` (orden inverso), `-n` (numérico), `-u` (únicos), `-k` (campo clave) |
| uniq | `uniq [opciones] [archivo]` | `-c` (cuenta duplicados), `-d` (solo duplicados), `-u` (solo únicos) |
| wc | `wc [opciones] [archivo]` | `-l` (líneas), `-w` (palabras), `-c` (bytes), `-m` (caracteres) |
| head | `head [opciones] [archivo]` | `-n` (cantidad de líneas), `-c` (cantidad de bytes) |
| tail | `tail [opciones] [archivo]` | `-n` (cantidad de líneas), `-f` (seguimiento en tiempo real) |
| cut | `cut [opciones] [archivo]` | `-d` (delimitador), `-f` (campos), `-c` (caracteres) |
| awk | `awk [opciones] 'patrón {acción}' [archivo]` | `-F` (delimitador), `-v` (definir variable) |
| sed | `sed [opciones] 'comando' [archivo]` | `-i` (edición en línea), `-e` (múltiples comandos) |
| tr | `tr [opciones] 'conjunto1' 'conjunto2'` | `-d` (borrar caracteres), `-s` (comprimir repeticiones) |
| xargs | `comando1 | xargs [opciones] [comando2]` | `-n` (máx. argumentos), `-I` (reemplazo de cadena) |
| tar | `tar [opciones] [archivo] [archivos]` | `-c` (crear), `-x` (extraer), `-z` (gzip), `-v` (verbose) |
| curl | `curl [opciones] [URL]` | `-o` (guardar como), `-O` (guardar con nombre original), `-L` (seguir redirecciones) |
| jq | `jq [opciones] 'filtro' [archivo]` | `.` (todo), `.[]` (iterar), `select()` (filtrar), `map()` (transformar) |
| date | `date [opciones] [+formato]` | `+%Y-%m-%d` (formato fecha), `-d` (fecha específica) |
| df | `df [opciones]` | `-h` (legible), `-T` (tipo de sistema de archivos) |
| du | `du [opciones] [archivo/directorio]` | `-h` (legible), `-s` (solo total), `--max-depth` (profundidad) |
| ps | `ps [opciones]` | `aux` (todos los procesos), `-ef` (formato extendido) |
| top/htop | `htop [opciones]` | `-p` (monitorear PID), `-u` (filtrar por usuario) |
| chmod | `chmod [opciones] modo archivo` | `-R` (recursivo), `+x` (agregar ejecución) |
| chown | `chown [opciones] usuario:grupo archivo` | `-R` (recursivo), `--reference` (copiar permisos) |
| scp | `scp [opciones] origen destino` | `-r` (recursivo), `-P` (puerto), `-p` (preservar atributos) |
| rsync | `rsync [opciones] origen destino` | `-a` (archivo), `-v` (verbose), `-z` (comprimir), `--delete` (sincronizar eliminaciones) |
| ssh | `ssh [opciones] usuario@host [comando]` | `-p` (puerto), `-i` (clave privada), `-X` (X11 forwarding) |
| history | `history [opciones]` | `-c` (limpiar), `-d` (borrar entrada), `!n` (ejecutar comando n) |
| alias | `alias nombre='comando'` |  |
| export | `export VARIABLE=valor` |  |
| source | `source archivo` o `. archivo` |  |
| read | `read [opciones] [variables]` | `-p` (prompt), `-s` (modo silencioso) |
| test/[ | `test condición` o `[ condición ]` | `-f` (archivo existe), `-d` (directorio existe) |
| if/else | `if comando; then ... fi` |  |
| for | `for var in lista; do ... done` |  |
| while | `while condición; do ... done` |  |
| case | `case $var in patrón) ... ;; esac` |  |
| function | `nombre() { ... }` o `function nombre { ... }` |  |