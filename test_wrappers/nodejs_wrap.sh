js=$(cat <<JS
try {
$*
} catch(err) {
	console.log("Error: %s", err); 
}
JS
)
echo "$js" > test.js

echo "$js" | node




