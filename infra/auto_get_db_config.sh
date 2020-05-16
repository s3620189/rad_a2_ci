#!/bin/bash
result="\"DbUser\"="\"$(terraform output db_user)\"
result1="\"DbUser\""
result2="="
result3=\"$(terraform output db_user)\"
sed -i "1c\\$result1 \\$result2 \\$result3" dist/conf.toml
echo $result
result="\"DbPassword\"="\"$(terraform output db_pass)\"
result1="\"DbPassword\""
result2="="
result3=\"$(terraform output db_pass)\"
sed -i "2c\\$result1 \\$result2 \\$result3" dist/conf.toml
echo $result
result="\"DbName\"="\"$(terraform output db_name)\"
result1="\"DbName\""
result2="="
result3=\"$(terraform output db_name)\"
sed -i "3c\\$result1 \\$result2 \\$result3" dist/conf.toml
echo $result
result="\"DbPort\"="\"$(terraform output db_port)\"
result1="\"DbPort\""
result2="="
result3=\"$(terraform output db_port)\"
sed -i "4c\\$result1 \\$result2 \\$result3" dist/conf.toml
echo $result
result="\"DbHost\"="\"$(terraform output db_address)\"
result1="\"DbHost\""
result2="="
result3=\"$(terraform output db_address)\"
sed -i "5c\\$result1 \\$result2 \\$result3" dist/conf.toml
echo $result

