mfoo=$(echo -ne "$*" | sed '/^/ s//  /g')
py=$( cat <<PY
try:
$mfoo
except Exception as e: print('Error: %s' % e)
PY
)
echo "$py" > test.py
echo "$py" | python 2>&1

python -c "$py" 2>&1

