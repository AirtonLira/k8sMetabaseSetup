# Loop para garantir execução do SETUP somente quando container do Metabase estiver online.
until curl -X GET -H "Content-Type: application/json" http://metabase:3000/api/session/properties  | grep 'token'; do
    echo "[AGUARDANDO METABASE]"
    sleep 50
done 


echo "[API/REST METABASE DISPONIVEL]"

# Realiza chamada para obter o token de setup.
token_setup=$(curl -X GET -H "Content-Type: application/json" http://metabase:3000/api/session/properties | grep -Po '"setup-token": *\K"[^"]*"')
echo $token_setup

# Variavel com corpo de requisição para criar o usuário de administrador.
body_json='{"token": '$token_setup',"prefs":{"site_name":"airton","site_locale":"pt","allow_tracking":"true"},"database":"null","user":{"first_name":"Airton","last_name":"Airton","email":"airton.junior@gmail.com.br","password":"12345678","site_name":"Airton"}}'
echo $body_json

# Realiza requisição da criação do usuário de administrador.
curl -g -X POST -H "Content-Type: application/json" -d '{"token": '$token_setup',"prefs":{"site_name":"airton","site_locale":"pt","allow_tracking":"true"},"database":"null","user":{"first_name":"Airton","last_name":"Airton","email":"airton.junior@gmail.com.br","password":"12345678","site_name":"Airton"}}' http://metabase:3000/api/setup  | grep -Po '"id": *\K"[^"]*"' 

# Obtem token da sessão atual.
token_session=$(curl -X POST -H "Content-Type: application/json" -d '{"username":"airton.junior@gmail.com.br","password":"12345678"}'  http://metabase:3000/api/session | grep -Po '"id": *\K"[^"]*"' )
          
echo 'token - session: '$token_session

# Realiza cadastro do banco de dados com base no token de sessão do usuário de administrador.
curl -g -X POST -H "Content-Type: application/json"  -H 'Cookie: metabase.SESSION='$token_session'' -d '{"engine":"sqlserver","name":"myservidor","details":{"host":"0.0.0.0","port":1433,"db":"mydatabase","instance":"mydatabase","user":"admin","password":"123456","ssl":false,"additional-options":null,"tunnel-enabled":false},"auto_run_queries":true,"is_full_sync":true,"schedules":{}}' http://metabase:3000/api/database
