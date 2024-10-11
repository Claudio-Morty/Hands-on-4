#!/bin/bash

while true; do
echo "-------------------------------------------------------------------"
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso del comando 'awk'"
    echo "5. Mostrar uso del comando 'grep'"
    echo "6. Salir"
    
    read -p "Ingrese una opción: " opcion
echo "-------------------------------------------------------------------"

    case $opcion in
        1)
            # Listar contenido de una carpeta
            read -p "Introduzca la ruta absoluta del fichero o carpeta: " ruta
            if [ -d "$ruta" ]; then
                echo "El contenido de la carpeta es el siguiente:"
                ls "$ruta"
            elif [ -f "$ruta" ]; then
                echo "Contenido del archivo:"
                cat "$ruta"
            else
                echo "Ruta no válida."
            fi
            ;;
        2)
            # Crear un archivo de texto con una línea de texto
            read -p "Ingrese la ruta y nombre del archivo por crear: " archivo
            read -p "Ingrese la línea de texto a escribir en el archivo: " texto
            echo "$texto" > "$archivo"
            echo "Archivo creado y texto guardado."
            ;;
        3)
            # Comparar dos archivos de texto
            read -p "Ingrese la ruta del primer archivo: " archivo1
            read -p "Ingrese la ruta del segundo archivo: " archivo2
            if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
                diff "$archivo1" "$archivo2"
                if [ $? -eq 0 ]; then
                    echo "Los archivos son IGUALES."
                else
                    echo "Los archivos son DIFERENTES."
                fi
            else
                echo "Uno o ambos archivos no existen."
            fi
            ;;
        4)
            # Uso del comando 'awk'
            read -p "Ingrese la ruta del archivo para aplicar 'awk': " archivo_awk
            if [ -f "$archivo_awk" ]; then
                echo "Mostrar la primera columna usando awk:"
                awk '{print $1}' "$archivo_awk"
            else
                echo "Archivo no encontrado."
            fi
            ;;
        5)
            # Uso del comando 'grep'
            read -p "Ingrese la ruta del archivo para aplicar 'grep': " archivo_grep
            read -p "Ingrese la palabras para buscar con 'grep': " cadena
            if [ -f "$archivo_grep" ]; then
                grep "$cadena" "$archivo_grep"
            else
                echo "Archivo no encontrado."
            fi
            ;;
        6)
            # Salir del script
            echo "Saliendo del menú...."
            break
            ;;
        *)
            echo "Opción no válida. Intente de nuevo."
            ;;
    esac
done
