chmod +x pokescript.sh

if [ "$#" -ne 1 ]; then
    echo "Buscando $0 <nombre del pokemon>"
    exit 1
fi

info=$(curl -s "https://pokeapi.co/api/v2/pokemon/$1" | jq '. | {id: .id, name: .name, weight: .weight, height: .height, order: .order}')

if [ -z "$info" ]; then
    echo "No se pudo obtener información."
    exit 1
fi

Id=$(echo $info | jq '.id')
Nombre=$(echo $info | jq -r '.name')
Peso=$(echo $info | jq '.weight')
Altura=$(echo $info | jq '.height')
Num=$(echo $info | jq '.order')

echo "$Nombre (No. $Num)"
echo "Id = $Id"
echo "Weight = $Peso"
echo "Height = $Altura"
