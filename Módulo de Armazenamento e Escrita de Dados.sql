--################################################################################
--# Big Data Science - Módulo de Armazenamento e escrita de dados                #
--# Desenvolvido por Ewerton Maik                                                #
--# Data: 06/06/2022                                                             #
--# Alterado por: Ewerton Maik                                                   #
--# Ultima Alteração: 06/06/2022                                                 #
--################################################################################


/*
	Armazenamento e escrita de dados (Semana 4):
	• MongoDB:
	• Entendimento de conceitos e arquitetura NoSQL e MongoDB;
	• Instalação de cluster MongoDB através de container e Cloud;
	• Realizar pesquisas no MongoDB com diferentes operadores;
	• Redis:
	• Entendimento de conceitos e arquitetura NoSQL e Redis;
	• Instalação de cluster Redis através de container;
	• Entendimento de diversos tipos de estrutura de dados com Redis-CLI;
	• Kafka:
	• Entendimento de conceitos e arquitetura do Kafka e da Confluent;
	• Instalação de cluster Kafka através de container;
	• Gerenciamento de tópicos;
	• Produção e consumo de dados através do console;
	• Entendimento das guias do Control Center.
	• Elastic:
	• Entendimento de conceitos e arquitetura da Elastic;
	• Instalação de cluster Elastic através de container;
	• Realizar operações de CRUD em índices;
	• Entendimento das guias do Kibana.
*/

-- 06/06/2022 - Primeira Aula Semantix

-- ### - Introdução - NoSQL
NoSQL = Banco de dados não Relacionais
Alto Desenpenho
Arquitetura Distribuida
Schema Não Rigido
Escalabilidade Cluster -
Vertical - Tecnologias
Horizontal - Computadores
Tipos de Banco de Dados - SQL - Relacional e NoSQL

SQL - Relacional
Orientado a Linha - Ex: MySQL / Oracle ...

NoSQL
Orientado a Colunas - Cassandra
Chave-Valor - Redis
Orientado a Grafos - Neo4j
orientado a Documentos - MongoDB

https://db-engines.com/

Base x ACID
Atomicidade - A Transação sera executada totalmente ou não sera executada
Consistência - Garantir visão única dos dados
Isolamento - Garantir que a transação não será interferida por outra concorrente
Durabilidade - Garantir o que está salvo, não será mais perdido.

Bassically Available - Basicamente disponível - Aplicação funciona sempre
Soft-State - Estado leve - Não precisa ser consistente sempre
Eventually Consistent - Eventualmente consistente - Aplicação torna-se consistente em um momento

Teorema CAP
Consistency - Consistência
Availability - Disponibilidade
Partition Tolerance

-- ### - Introdução - MongoDB
Distribuido
NoSQL
Orientado a Documentos
Formato Bson (JSON Binário)
Esquema Flexivel
Criado em 2007 pela 10gen
Primeira versão liberada em 2009
https://www.mongodb.com

MongoDB Communty
Gratuito Open Source
Github : https://github.com.mongodb/mongo/

MongoDB Enterprise
Assinatura MongoDB Entreprise Advanced
Inclui suporte para implantação do MongoDB
Recursos adicionais
LDAP
Kerberos
Criptografia em DISCO
Auditoria

Relacional x MongoDB
Banco de Dados / Banco de Dados
Tabela / Coleção
Registro (Linha) / Documento
Coluna / Atributo
Índice / Índice

v. 3.2 - Validação de Esquema
v. 4.2 - Transações Distribuidas

-- ### Formato Json
JSON Binário e Espandido
JSON
JavaScritp Object Notation
Objetos são baseados em Chave / Valor
String / String, Número, Objetos
Esquema Flexível
Melhor que XMML
Representar Estrutura de Objetos
JavaScript - Linguagem padrão para desenvolvimento Web
Formato Texto - Fácil leitura para humanos

{
"_id":1,
"telefones": [
	{
		"Residencial": 119999999999,
		"Celular": 113939393939
	}
]
}

MongoDB com JSON
Representar Documentos
Formato de Texto
Análise Lenta
Não é eficiente o armazenamento
Limitado a tipo de dados básicos
Mongo criou o Bson
Otimização / Velocidade / Espaço / Flexibilidade
MongoDB armazena os dados no formato Bson

-- ### -- Instalação - Ambiente de Desenvolvimento
Desenvolvimento :
Localmente - MongoDB Community
Container - MongoDB Community Docker container
Suporte pela comunidade do Docker, não pela MongoDB
Cloud - MongoDB Atlas

Produção :
On-Premise
MongoDB Enterprise Server
MongoDB Enterprise Kuberbetes
Cloud - MongoDB Atlas

Ferramentas :
GUI MongoDB
MongoDB Compass
MongoDB Express
Container
MongoDB Shell
MongoDB CLI for Cloud
MongoDB Connector for BI

Instalação Usada para Aula
Container - MongoDB Community Docker container
MongoDB Compass
MongoDB Express

Preparação Ambiente - Desenvolvimento
Instalação Docker e Docker-composse : https://docs.docker.com/get-docker/
Download da Imagem - https://hub.docker.com/ /mongo/
docker pull mongo
docker pull mongo-express

Criar a seguinte estrutura de pasta:
mongodb
docker-compose.yml


-- ### = Opções Docker Compose
Iniciar todos os serviços
$ docker-compose up -d

Parar os serviços
$ docker-compose stop


Iniciar os Serviços
$ docker-compose start

Matar os serviços
$ docker-compose dowm

Apagar todos os volumes sem uso
$ docker volume prune

cat docker-compose.yml

visualizar os containers ativos
$ docker ps
Todos
$ docker ps-a

Executar comandos no container
$ docker exec -it <container><comando>

Visualizar logs
$ docker logs <container>

Enviar arquivos
$ docker cp <diretorio><container>:/<diretorio>

Acessos de ferramentas
MongoDB
$ docker exec -it mongo bash
# mongo

Mongo Express
http://localhost:8081

Iniciar MongoDB
Sintaxe
mongo --host <nameHost> -u <usuarioRoot> -p <senhaRoot> --authenticationDatabase <bdAdmin>

Ex:
mongo --host mongo -u mongoadmin -p root --authenticationDatabase admin
mongo

Visualizar Banco de Dados
show dbs

Exercícios - Instalação

1 - Instalação do docker e docker-compose
	Acesso: https://docs.docker.com/get-docker/ (Links para um site externo.)
	
2 - Baixar as imagens do mongo e mongo-express

Download da Imagem - https://hub.docker.com/_/mongo/
docker pull mongo
docker pull mongo-express
visualizar images
docker imagens

3 - Iniciar o MongoDB através do docker-compose
copiar o arquivo - docker-compose.yml para pasta mongodb
$ docker-compose up -d / para criar criar rede, volume e serviços
$ docker-compose start / para iniciar o container

acessar a sua pasta criada do mongodb
$ docker run mongo

4 - Listas as imagens em execução
visualizar images
docker imagens

5 - Listar os bancos de dados do MongoDB
docker exec -t mongo ls
docker exec -it mongo ls
docker exec -it mongo bash

ls /data/db

mongo
show dbs

6 - Visualizar através do Mongo Express os bancos de dados
	Acesso: http://localhost:8081/

-- ### - Comandos Básicos

Banco de Dados, Collections e Documentos

Criar Banco de Dados
use <nomeBD>

Visualizar Banco de dados conectado
db
Para visualizar o banco de dados é necessario incluir um Documento

Criar Collections
db.createCollection('<nomeCollection>')
show collections

Toda saída de retorno do banco mongodb é um JSON

Excluir Collections
db.<nomeCollection>.drop()

Excluir Banco de Dados
db.dropDatabase()

Renomear Collection
db.<nomeCollection>.renameCollection('<nomeNovaCollection>');
show collections

Adicionar documentos em uma collection
inserir um documento
db.<nomeCollection>.insertOne({<documento>})

inserir N documentos (ARRAY)
db.<nomeCollection>.insertMany(
	[{<documento1>}, {<documento2>}, {<documentoN>} ]
)

Exemplo:
db.cliente.insertOne(
	{
		nome: "Lucas",
		idade : 20,
		conhecimento : "Windows, Linux, Hadoop"
	}
)


db.cliente.inserMany(
[
	{nome: "Ana", idade: 25, conhecimento: "Windows, Linux, NoSQL"},
	{nome: "João"}
]
)

Listar documentos da collection
db.<nomeCollection>.find().prett()
db.cliente.find().pretty()

-- Data TYPE
Objectid
String
Numero - Long, int, Decimal, DOUBLE
BOOLEAN
ARRAY
DATE
NULL
Regex
TIMESTAMP

-- Exemplo Documento com ARRAY
db.cliente.insertOne(
{
	nome : "Lucas",
	idade : 20,
	conhecimento : ["Windows", "Linux", "Hadoop"]
}
)

-- Exemplo de Documentos Alinhado - Embeeded Documentos
db.cliente.insertOne(
{
	nome : "Lucas",
	idade : 20,
	conhecimento : ["Windows","Linux","Hadoop"],
	endereco : {
		rua : "Eusébio Matoso",
		numero : 1375,
		bairro : "Pinheiros",
		Cidade : "São Paulo"
	}
}
)

-- ### - Exercícios - Comandos Básicos
-- Correção - Exercícios de Comandos Básicos

docker ps
docker ps -a
docker-compose up -d
docker exec -it mongo bash
mongo

1. Criar o banco de dados com seu nome.
use ewerton

2. Listar os banco de dados.
show dbs

3. Criar a collection produto no bd com seu nome.
db.createCollection('produto')

4. Listar os banco de dados.
show dbs

5. Listar as collections.
show collections

6. Inserir os seguintes documentos na collection produto:

--_id: 1, "nome": “cpu i5", "qtd": "15“
db.produto.insertOne({_id: 1, "nome": “cpu i5", "qtd": "15“})
db.produto.find()

--_id: 2, nome: “memória ram", qtd: 10, descricao: {armazenamento: “8GB”, tipo:“DDR4“}
db.produto.insertOne({_id: 2, nome: "memória ram", qtd: 10, descricao: {armazenamento: “8GB”, tipo:“DDR4“} })
db.produto.find()

--_id: 3, nome: "mouse", qtd: 50, descricao: {conexao: “USB”, so: [“Windows”, “Mac”, “Linux“]}
db.produto.insertOne({ _id: 3, nome: "mouse", qtd: 50, descricao: {conexao: “USB”, so: [“Windows”, “Mac”, “Linux“]} })
db.produto.find()

--_id: 4, nome: “hd externo", "qtd": 20, descricao: {conexao: “USB”, armazenamento: “500GB”, so: [“Windows 10”, “Windows 8”, “Windows 7”]}
db.produto.insertOne({ _id: 4, nome: "hd externo", "qtd": 20, descricao: {conexao: “USB”, armazenamento: “500GB”, so: [“Windows 10”, “Windows 8”, “Windows 7”]} })
db.produto.find()

7. Mostrar todos os documentos.
db.produto.find()


-- ### - Consultas Básicas em Documentos

db.<nomeCollection>.find( {<criterioConsulta>},{<projecao>} )
--criterio de consulta - operadores aplicados nos atributos
{ <atributo>: {<operador>:<valor>} }

--projeção - Atributos que são visualizados pela consulta
{<atributo>:0} -- Ocultar o Atributo
{<atributo>:1} -- Mostrar o Atributo

--Retorna Todos os Documentos
db.cliente.find({})

--Por um Atributo
db.cliente.find( {nome:"João"} )
db.cliente.find( {"endereco.cidade":"São Paulo"} ) -- Documentos aninhados precisa usar aspas duplas

--Por um atributo com operador
db.cliente.find( {idade: {$lt : 18} } ) -- Operador < = $lt

-- Operadores de Pesquisa
$eq  - Igual a
$ne  - Diferente de -- { <field> : {$ne: 10} }
$gt  - Maior que
$gte - Maior ou Igual
$lt  - Menor que
$lte - Menor ou igual
$in  - Na lista
$nin - Fora da lista
$not - Não


-- projeção na Consulta
--exemplo : Consultar o nome Lucas e não apresentar o atributo conhecimento
db.cliente.find( {nome: "Lucas"}, {conhecimento: 0} )

--exemplo : Consultar o nome Lucas e apresentar o atributo conhecimento
db.cliente.find( {nome: "Lucas"}, {conhecimento: 1} )

--exemplo : Consultar o nome Lucas e não apresentar o atributo _id e conhecimento
db.cliente.find( {nome: "Lucas"}, {_id: 0, conhecimento: 1} )

-- ### - Exercícios - Consultas 1
-- 

1. Mostrar todos os documentos da collection produto
use ewerton
show collections
db.produto.find({})

2. Pesquisar na collection produto, os documentos com os seguintes atributos:

--a) Nome = mouse
db.produto.find({nome: "mouse"})

--b) Quantidade = 20 e apresentar apenas o campo nome
db.produto.find({qtd: 20}, {_id: 0, nome: 1})

--c) Quantidade <= 20 e apresentar apenas os campos nome e qtd
db.produto.find({qtd: {$eq: 20}}, {nome: 1, qtd: 1})
db.produto.find({qtd: {$lte: 20}}, {nome: 1, qtd: 1})

--d) Quantidade entre 10 e 20
db.produto.find({qtd: {$gte: 10, $lte: 20} })

--e) Conexão = USB e não apresentar o campo _id e qtd
db.produto.find({ "descricao.conexao": "USB" }, {_id: 0, qtd: 0})

--f) SO que contenha “Windows” ou “Windows 10”
db.produto.find({ "descricao.so": {$in: ["Windows", "Windows 10"]} })
db.produto.find({ "descricao.so": {$in: ["Windows", "Windows 10"]}}, 1) -- ira retorna apenas uma linha


-- ### - Replica Set
Ambiente de Produção
Redundancia e alta disponibilidade
Tolerancia a falhas
Denominado como Replica Set
Grupo de instâncias mongod (nos) que mantem o mesmo conjunto de dados
nos - 1 - Primario
recebe as solicitações de escrita e leitura
registrar todas as alterações em seus datasets em seu log de operações (oplog)
N Secundarios
Replica do oplog do nó primario
ganhar desempenho na leitura de dados
Distribuir solicitações de leitura nos secundarios

-- Visualizar configurações do Replica Set
rs.config()

-- Verificar o Status do Replica Set
rs.status()

-- Configurar o Replica Set
https://docs.mongodb.com/manual/tutorial/deploy-replica-set/


-- Shard MongoDB
MongoDB fragmenta dados no nível de collection
Distribui os dados entre os Shards no Cluster
Arquitetura
shard - Contêm um subconjunto dos dados fragmentados
Pode ser implementado como um replica set
escalabilidade Horizontal
config server
armazena os metadados
denifições de configuração do CLUSTER
mongos - Interface entre a aplicação cliente e o sharded cluster

-- ### - Introdução e criação de conta no MongoDB Atlas
MongoDB Atlas
banco de dados em nuvem global
DBaas - DataBase as a Service
AWS / GCP - Google Cloud Computing / Azure

Modos de uso do Cluster
Compartilhado - 512 MB de armazenamento (Grátis)
Dedicado
Dedicado com MultiRegiões
Acesso - https://www.mongodb.com/cloud/atlas

-- ### Criação de organização e projeto
cloud.mongodb.com/...
Ambiente Cloud do MongoDB Atlas

-- Criação de Cluster
Mostrado os poassos e opções para criar e configurar o cluster no MongoDB Atlas

-- Criação de usuário e ips de acesso
-- Conexão com o MongoDB Compass

-- ### - Exercícios - MongoDB Atlas
-- 

1. Criar a conexão do cluster MongoDB Atlas através do MongoDB Compass
2.  Criar o banco de dados escola no cluster em Cloud
3. Importe o arquivo “dataset\cursos.csv” para a collection cursos e o arquivo “dataset\alunos.csv” para a collection alunos.
4. Fazer consultas de teste.


-- Certificação MongoDB
MongoDB University - https://university.mongodb.com.br/certification


-- ### -- Introdução - Redis
Banco de Dados - NoSQL
Chave-Valor mais popular do mundo
Valor -> diversas estruturas de dados
Armazenamento em memória
Acesso rápido aos dados
Escrita / Leitura
Possível persistir dados fisicamente
Não é um BD para armazenar todos os dados
Servidor TCP
Modelo Cliente/Servidor
Comandos são atômicos
Aplicação Single-Threaded
um comando por Vez
Comunicação - Aplicação e Redis CLI

História REDIS - Remote Dictionary Server
Criado por Salvatore Sanfilippo
Primeira versão liberada em 2009
Patrocinado pela Pivotal Software e pela VMWare
A partir de 2015 mudou para a Redis Labs
Site Oficial - https://redis.io/

-- ### - Instalação - Containers
Site Oficial - https://redis.io/download
Localmente no Linux

wget http://donwload.redis.io/releases/redis-6.0.6.tar.gz
$ tar xzf redis-6.0.6.tar.gz
$ cd redis-6.0.6
$ make

Docker
Cloud - serviço do Redis Labs
Desenvolvimento
Produção
https://redislabs.com/redis-enterprise-cloud/overview/

Versão REDIS
redis-server
--version

Download da imagem : https:hub.docker.com/_/redis
docker pull redis

Criar a seguinte estrutura de pasta:
redis / docker-compose.yml

Iniciar todos os Serviços
$ docker-compose up -d

Parar os Serviços
$ docker-compose stop

Iniciar os serviços
$ docker-compose start

Termino do Treinamento
Matar os Serviços
$ docker-compose dowm

Apagar todos os volumes sem uso
$ docker volume prune

Visualizar os Container
Ativos - $ docker ps
Todos - $ docker ps -a

Executar comandos no container
$ docker exec -it <container><comando>

Visualizar os logs
$ docker logs <container>

Enviar arquivos
$ docker cp <diretorio><container>:/<diretorio>

Acesso Redis CLI e SERVER
$ docker exec -it redis bash
# redis-cli
# redis-server

Instalação Local
src/redis-server
src/redis-cli

-- ### - Exercícios - Instalação
-- Correção - Exercícios de Instalação-2

1. Instalação do docker e docker-compose

2. Baixar a imagem do redis
acessar a pasta /redis criada
docker pull redis

3. Iniciar o Redis através do docker-compose
docker-compose up -d
docker-compose start

4. Listas as imagens em execução
docker ps -a

5. Verificar a versão do Redis
docker exec -i redis ls /
docker exec -it redis ls /
docker exec -it redis redis-server --version
docker exec -it redis redis-cli --version

6. Acessar o Redis CLI
docker exec -it redis bash (Acessa no Redis)

-- ### - Entendimento Chave-Valor
-- Tipos de Dados
Servidor de estruturas de dados que oferece suporte a diferentes tipos de valores
Não é um armazenamento de chave-valor simples
String-String
Aceita estruturas de dados mais complexas
Strings / Listas / Sets / Sets ordenados / Hash / HyperLogLogs / Streams

As chaves são binary safe
sequência binária
regras
tamanho máximo 512 MB
Não indicado chaves > 1 MB
Gastar memória e largura de banda
Dicas
Instanciar "object-type:id"
"user:1000" ao inves de "u1000"

-- ## Strings
Redis String
Único tipo de dados Memcached
Cache para páginas Web
Chaves também são String
Mapear String para outra String
Definir um valor de string: SET <chave><valor>
Recuperar um valor de string: GET <chave>

Opções para a chave String
NX - Falhar se a chave existir
XX (Default) - Substituir o valor da Chave

Verificar o tamanho do valores
strlen <chave>

-- String como um inteiro
Sintaxe para incrementos e decrementos do valor
incr<chave>
decr<chave>
incrby<chave><incremento>
decrby<chave><decremento>

set contador 10 - 10 OK
incr contador - 11
incrby contador 5 - 16
decr contador - 15
decrbr contador 5 - 10
get contador - 10

Incr Atômico
Exemplo:
Ao mesmo tempo 2 clientes leem a chave 10 e ambos incrementem para 11
O valor final é 12
Não são executados os comandos ao mesmo tempo

-- Definir e recuperar várias chaves em um comando
Reduzir latência

Sintaxe
MSET <chave1><valor><chave2><valor>...<chaveN><valor>
MGET <chave1><chave2>...<chaveN>

mset chave1 10 chave2 20 chave3 30
mget chave1 chave2 chave3

-- Opções Básicas com Chaves

Verificar se a chave existe
exists <chave>

Deletar Chave
del <chave>

Tipo da chave
type <chave>

set minhaChave teste
type minhaChave
exists minhaChave
del minhaChave
exists minhaChave
type minhaChave
get minhaChave

-- Persistência de Chaves
Definir tempo para a chave experir
expire <chave><tempo segundos>
pexpire <chave><tempo milissegundos>
set <chave><valor>ex<tempo segundos>
set <chave><valor>px<tempo milissegundos>

-- Verificar o tempo restante de vida da chave
ttl <chave> (resposta em segundos)
pttl <chave> (resposta em millissegundos)

set minhaChave teste
ttl minhaChave teste -- -1 não tem tempo definido
expire minhaChave 20 -- aplicado chave para 20 s
get minhaChave -- Visualizando valor da chave
ttl minhaChave -- retorna o tempo de chave possui
ttl minhaChave
ttl minhaChave
ttl minhaChave -- -2 é porque o tempo e ela não existe mais
get minhaChave

-- Remover tempo para a chave experir
persist<chave>

set minhaChave teste2 ex 50
ttl minhaChave
ttl minhaChave
persist minhaChave
ttl minhaChave
get minhaChave

-- ### - Exercícios - Strings
-- Correção - Exercícios de Strings

Entrar na pasta /redis/
ls
docker ps
docker ps -a
docker-compose up -d
docker-compose start
docker exec -it redis bash
redis-cli

--1. Criar a chave "usuario:nome" e atribua o valor do seu nome
SET usuario:nome Ewerton

--2. Criar a chave "usuario:sobrenome" e atribua o valor do seu sobrenome
SET usuario:sobrenome Maik

--3. Busque a chave "usuario:nome“
get usuario:nome

--4. Verificar o tamanho da chave "usuario:nome“
strlen usuario:nome

--5. Verificar o tipo da chave "usuario:sobrenome"
type usuario:sobrenome

--6. Criar a chave "views:qtd" e atribua o valor 100
set views:qtd 100

--7. Incremente o valor em 10 da chave "views:qtd"
incrby views:qtd 10

--8. Busque a chave "views:qtd"
get views:qtd

--9. Deletar a chave "usuario:sobrenome"
del usuario:sobrenome

--10. Verificar se a chave "usuario:sobrenome" existe
exists usuario:sobrenome

--11. Definir um tempo de 3600 segundos para a chave "views:qtd" ser removida
expire views:qtd 3600

--12. Verificar quanto tempo falta para a chave "views:qtd" ser removida
ttl views:qtd
ttl views:qtd
ttl views:qtd
ttl views:qtd
ttl views:qtd

--13. Verificar a persistência da chave "usuario:nome"
ttl ttl usuario:nome -- -1 sempre ativa

14. Definir para a chave "views:qtd" ter persistência para sempre
persist views:qtd
ttl views:qtd

-- Mensagens Pub/Sub
Implementar o paradigma de mensagens Publish / Subscribe (Publicar / Assinar)
Mensagens dos remetente (editor) não são enviadas diretamente para um destinatário (assinante)
Mensagens são publicadas atraves de um canal
Sem o editor saber quem são os assinantes

publish <canal> <mensagem>
subscribe <canal1>...<canalN>

Abrindo no Terminal 01
subscribe canal1

Abrindo no Terminal 02
subscribe canal1

Abrindo no Terminal 03
publish canal1 'msg de teste'

-- Pub/Sub Pattern
Assinar canais através de um padrão
psubscribe<padrão1>...<padrãoN>

psubscribe canal*

-- Cancelamento
cancelar assinatura dos canais
Canais especificos
unsubscribe <canal1>...<canalN>

Todos os canais
unsubscribe

Cancelar a assinatura dos canais através de um padrão
punsubscribe <padrao1>...<padraoN>

-- Exercícios - Pub/Sub
-- Correção - Exercícios de Pub/Sub
Atividade feita com 2 terminais aberto
1 para assinar
2 para publicar

1. Criar um assinante para receber as mensagens do canal noticias:sp
-- terminal 1
subscribe noticias:sp

2. Criar um editor para enviar as seguintes mensagens no canal noticias:sp
-- terminal 2

publish noticias:sp 'Msg 1'
publish noticias:sp 'Msg 2'
publish noticias:sp 'Msg 3'


3. Cancelar o assinante do canal noticias:sp
-- Sair do terminal 1 e entrar novamente
unsubscribe

4. Criar um assinante para receber as mensagens dos canais com o padrão noticias:*
-- Terminal 1
psubscribe noticias:*

5. Criar um editor para enviar as seguintes mensagens no canal noticias:rj
-- Terminal 2

publish noticias:rj 'Msg 4'
publish noticias:rj 'Msg 5'
publish noticias:rj 'Msg 6'

-- Revisão
Tutorial Redis Online - http:try.redis.io
Lista completa de comandos Redis - https://redis.io/commands
Documentação Oficial - https:redis.io/documentation



-- ### - Introdução - Kafka
Apache Kafka - Plataforma de Steaming Distribuida
Open Source
Publicar e Assinar streams de Registros
Fluxos de Registros
Processar - Tempo REAL
Armazenar - Tolerante a Falhas

2010 - Originalmente Desenvolvido pelo Linkedin
Necessidade de Integração massiva de dados
Conceito do Kafka surgio com Jay Kreps e sua equipe
2011 - Liberado como projeto open-source
2012 - Apache Kafka


Desenvolvido em Scala e Java
O Kafka é desenvolvido executado como um cluster em um ou mais servidores que podem abranger varios datacenters
O cluster Kafka armazena fluxos de registros em categorias denominados topicos
Cada registro consiste em uma chave, um valor e um registro de data hora
Apache Kafka é um sistema para gerenciamento de fluxos de dados em tempo real, gerados a partir de web, aplicações e sensores.

Producer API - Permite que um aplicativo publique um fluxo de registros em um
ou mais topicos do Kafka.

Consumer API - Permite que um aplicativo assine um ou mais topicos e
processe o fluxo de registros produzidos para eles

Strems API - Permite que um aplicativo transforme os fluxos de entrada em fluxos de saída

Connector API - Permite criar e executar produtores ou consumidores reutilizaveis que
conectam topicos do Kafka a aplicativos e sistemas de banco de dados existentes.

-- Introdução - Confluent
Fundada em 2014 pelos criadores originais do Apache Kafka
Jay Kreps
Plataforma de Streaming
Uso corporativo
Infraestrutura de aplicativos e dados
Fornece uma plataforma única
Eventos Históricos
Tempo REAL

Falicita:
Construção de pipeline de dados
Aplicativos de Streaming em Tempo REAL
Integração de dados de varias fontes e locais

Simplificar :
Conexão e fontes de dados ao Kafaka
Criação de aplicativos com o Kafka
Infraestrutura Kafka
Proteção / Monitoramento / Gerenciamento


-- Licença e Versões
Licença Confluent Enterprise
Gratis - Single Kafka Broker
30 dias gratuitos - Unlimited Kafka Broker

-- Instalação Confluent

Confluente Community - Docker - https://docs.confluent.io/current/quickstart/cos-docker-quickstart.html
Local - https://docs.confluent.io/current/quickstart/cos-quickstart.html

Confluent Enterprise
Docker - https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html
Local - https://docs.confluent.io/current/quickstart/ce-quickstart.html
Cloud - https://www.confluent.io/confluent-cloud


-- Instalação - Docker
-- Imagens Docker
Docker Hub - https://hub.docker.com/u/confluentinc/
Referencia de imagens docker
link - https://docs.confluent.io/current/installation/docker/image-reference.html
Componentes
Nome das Imagens
Licença
Pacotes Incluídos
Repositórios de Github
Total do Cluster - 8GB

-- Criar Pasta e baixar docker-compose.yml
criar pasta /kafka/
e adicionar nela o arquivo docker-compose.yml

Iniciar todos os Serviços
$ docker-compose up -d

Parar os Serviços
$ docker-compose stop

Iniciar os serviços
$ docker-compose start

Termino do Treinamento
Matar os Serviços
$ docker-compose down

Apagar todos os volumes sem uso
$ docker volume prune

Visualizar os Container
Ativos - $ docker ps
Todos - $ docker ps -a

Executar comandos no container
$ docker exec -it <container><comando>

Visualizar os logs
$ docker logs <container>

Enviar arquivos
$ docker cp <diretorio><container>:/<diretorio>

Acesso a Ferramenta Kafka
$ docker exec -it broker bash

Confluent Control Center
http://localhost:9021

Portas
Apache Kafka Broker - 9092
Confluent Control Center - 9021
Kafka Connect REST API - 8083
KSQL Server REST API - 8088
REST Proxy - 8082
Schema Registry REST API - 8081
ZooKeeper - 2181

-- Exercícios - Instalação
-- Correção - Exercícios de Instalação-3

1. Criar a pasta kafka e inserir o arquivo docker-compose.yml da Guia Arquivos do treinamento
/kafka/

2. Instalação do docker e docker-compose

Docker: https://docs.docker.com/get-docker/ (Links para um site externo.)
Docker-compose: https://docs.docker.com/compose/install/ (Links para um site externo.)

3. Inicializar o cluster Kafka através do docker-compose
/kafka/ -- aplicar comando dentro da pasta
-- Ira baixar todas as imagens do Kafka e subir os serviços que estão mapeados no arquivo - docker-compose.yml
docker-compose up -d
docker ps
docker ps -a

4. Listas as imagens em execução
docker images

5. Visualizar o log dos serviços broker e zookeeper
docker logs broker

6. Visualizar a interface do Confluent Control Center

Acesso: http://localhost:9021/

-- Brokers e Tópicos
Arquitetura

Kafka - Broker
Zookeeper - Coordenador
Produtor 1 - Producer
Produtor 2 - Producer
Consumidor 1 - Consumer
Consumidor 2 - Consumer

Todas as informações do Kafka são armazenadas dentro de partições
Topicos
Fluxos de Registros
Similar a uma tabela SQL
Dividido em partições
Local onde as mensagens são gravadas
sequencia ordenada e imutavel de registro
cada registro na partição é atribuido a um id sequencial (offset)
Exclusivamente do registro na partição
Multi-assinantes
0, 1 ou muitos consumidores acessam os dados gravados

Brokers Conceitos
Corretores
Armazenam os tópicos
Cluster Kafka é composto por multiplos corretores - servidores
ambientes de produção ter no minimo 3
corretor é identificado por um id

Replicação dos Tópicos
Boa prática para cada partição
1 corretor líder (Leader)
receber os dados
2 corretores de réplica do líder (ISR - in-sync replica)
sincronizar os dados


-- Producers - Enviar Dados ao Kafka
Publicar dados nos tópicos de sua escolha
Escolher qual registro atribuir a qual partição dentro do tópicos
Balancear a carga
Chave no Registro

Existem 3 tipos de confirmação de escrita (acks) para o produtor
0 - Sem confirmação de escrita
1 - Confirmação de escrita no líder (Padrão)
All - Confirmação de escrita no líder e nas replicas (ISR)


-- Consumers
grupo de consumidores

Receber os Dados
Cada registro publicado em um tópico
Entregue aos consumidores dentro de grupo de consumidores

Se todas as intâncias do consumidor tiverem no mesmo grupo de consumidores
registros serão balanceados por carga
se todas as instância do consumidor tiverem em grupos de consumidores diferentes
cada registro será transmitido para todos os processos

-- Conceitos - Control Center
Interface gráfica para monitoramento e gerenciamento do confluent
monitoramento
Brokers
Tópicos
Grupos de Consumidores
Fluxo de Dados
Gerenciamento
Conectores
CLUSTER
Tópicos
Criação de Alertas
Desenvolvimento em KSQL

Interface Gráfica
http://localhost:9021/

-- Criação de Tópicos
Confluent Community
Kafka CLI
<path-confluent>/bin/kafka-topics --create -bootstrap-server
localhost:9092 --replication-factor 1 --partitions 1 --topic users

Instalar Kafka Connect Datagen
<path-to-confluent>/bin/confluent-hub install\
--no-prompt confluentinc/kafka-connect-datagen:latest

Confluent Plataform - Control Center - http://localhost:9021/

-- Configurações Tópicos
Configurações Simples
Nome / Partição

Outras Configurações
Availability
Cleanup Policy - Política para Limpar / Deletar ou Compactar
Execução - Tempo / Tamanho
Message Size - Tamanho Máximo da Mensagem

disponibilidade
Máxima - Fator de Replicação - 3
Máxima - Mínimo de replicas de Sincronização - 1

equilibrada - Fator de Replicação - 3
equilibrada - Mínimo de Replicas de Sincronização - 2

Moderada - Fator de Replicação - 2
Moderada - Mínimo de Replicas de Sincronização - 1

Baixa (Mão usar em Produção)
Fator de Replicação - 1
Mínimo de Replicas de Sincronização - 1

-- Configuração do Cluster

-- Gerenciar tópicos - Console
Comandos para acessar o Servidor kafka
$ docker exec -it broker bash

kafka-topics --version

-- Comandos Básicos
Listar Tópicos
kafka-topics --bootstrap-server localhost:9092 --list
ou
kafka-topics --zookeeper localhost:2181 --list

Criar Tópicos
kafka-topics --bootstrap-server localhost:9092 --topic <nomeTópico> --create --partitions 3 -- replication-factor 1

Descrever Tópicos
kafka-topics --bootstrap-server localhost:9092 --topic <nomeTópico> --describe

Deletar Tópico
kafka-topics --bootstrap-server localhost:9092 --topic <nomeTópico> --delete

---#######################################
CONTINUAR DAQUI DOCUMENTANDO AS AULAS

-- Consumer - Console

-- Producer - Console

-- Exercícios - Control Center
-- Correção - Exercícios de Control Center

1. Criar um tópico com o nome msg-rapida com 4 partições, 1 replicação e deletar os dados após 5 minutos de uso.

2. Produzir e consumir 2 mensagens para o tópico msg-rapida

3. Qual o nome do cluster?

4. Quantos tópicos existem no cluster?

5. Quantas partições existem o tópico msg-cli?

6. Todas as réplicas estão sincronizadas no tópico msg-cli?

7. Qual a política de limpeza do tópico msg-cli?

8. Alterar a política de limpeza do tópico msg-cli para deletar depois de um ano.

9. Qual o diretório de armazenamento de logs do cluster?

10. Por padrão os dados são mantidos por quantos dias no Kafka?

11. Visualizar os gráficos de produção e consumo de dados do tópico msg-rapida.

-- Conceitos - Kafka Connect

-- Adicionar Conector

-- Kafka Clients

-- Confluent Cloud

-- Estudo Adicional

-- Introdução - Elastic
Problema de Busca
ElasticSearch
Engine de Search e Analystics Altamente Escalável
Banco de Dados
LogStash
Transporte entre a origem e destino
Kibana
GUI - Graphical User Interface - da Elastic
Visualização dos Dados
Gerenciamento do ElasticSearch
Beats
Coletores de Dados
Distribuído
Lado do Cliente
Não Servidor

Banco Relacional | ElasticSearch
Banco de Dados / INDEX
Tabela / TYPE
Schema / Mapping
Registro (Linha) / Documento
Coluna / Atributo


Índice
Shards - Índice é dividido por Shards - Armazenam os Dados
Alias - Link Virtual para um índice real (Apelido)
		associar um alias a mais de um índice (grupos)
Analyzer - Buscar por Full Text e Valores Exatos
Mapping - Definição da Estrutura do seu índice

-- Instalação - Elastic

-- Preparação do Ambiente

-- Configuração dos Containers

-- Exercícios - Instalação
-- Correção - Exercícios de Instalação

1. Baixar a pasta elastic na Guia Arquivos do treinamento

2. Instalação do docker e docker-compose

Docker: https://docs.docker.com/get-docker/ (Links para um site externo.)
Docker-compose: https://docs.docker.com/compose/install/ (Links para um site externo.)
3. Executar os seguintes comandos, para baixar as imagens de Elastic:

docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2
docker pull docker.elastic.co/kibana/kibana:7.9.2
docker pull docker.elastic.co/logstash/logstash:7.9.2
4. Setar na máquina o vm.max_map_count com no mínimo 262144

https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144 (Links para um site externo.)
5. Iniciar o cluster Elastic através do docker-compose

6. Listas as imagens em execução

7. Verificar os logs dos containers em execução

8. Verificar as informações do cluster através do browser:

http://localhost:9200/ (Links para um site externo.)
9. Acessar o Kibana através do browser:

http://localhost:5601/

-- Comunicação com Elasticsearch

-- Operações Básicas

-- Exercícios - CRUD
-- Correção - Exercícios de CRUD

1. Criar o índice produto e inserir os seguintes documentos:

_id: 1, "nome": "mouse", "qtd": 50, "descricao": "com fio USB, compatível com Windows, Mac e Linux"
_id: 2, "nome": "hd", "qtd": 20, "descricao": "Interface USB 2.0, 500GB, Sistema: Windows 10, Windows 8, Windows 7 "
_id: 3, "nome": "memória ram", "qtd": 10, "descricao": "8GB, DDR4"
_id: 4, "nome": "cpu", "qtd": 15, "descricao": "i5, 2.5Ghz"
2. Verificar se existe o documento com  id 3

3. Alterar o valor do atributo qtd para 30 do documento com id 3

4. Buscar o documento com id 1

5. Deletar o documento com id 4

6. Contar quantos documentos tem o índice produto

-- Família de Beats

-- Logstash - Conceitos

-- Menu kibana

-- Bônus

-- Repostas Usadas na Prova - Tentativa 03
-- 1 - Marque as opções VERDADEIRAS sobre o MongoDB Atlas.
Pode ser multi-cloud
É um Database as a Service

-- 2 - Marque as opções VERDADEIRAS sobre os shards no Elastic
Os índices podem possuir mais de um shard
São responsáveis para o armazenamento dos dados

-- 3 - Como funciona a API Rest para a comunicação com o Elasticsearch?
A comunicação é realizada através do protocolo HTTP
A comunicação é realizada através de json

-- 4 - Qual alternativa está incorreta sobre as propriedades BASE em um banco de dados NoSQL
Atomicidade não faz parte do BASE

-- 5 - Qual alternativa está incorreta sobre replica set
Fornece tolerância a falha de um nó

-- 6 - Quais alternativas estão corretas sobre os comandos no Redis ser atômicos?
Faz uso de arquitetura single-thread
Executar uma requisição de cada vez no Servidor

-- 7 - Qual alternativa está incorreta sobre o armazenamento do Redis?
É um servidor de estrutura de dados

-- 8 - A Confluent é uma plataforma para qual tipo de dados?
Stream

-- 9 - Marque os serviços necessários para inicialização da Confluent.
Apache Zookeeper
Apache Kafk

-- 10 - Qual as opções VÁLIDAS sobre Confluent Cloud
Um dos custos é formado pela taxa de transferência de dados
Pode ser multi-cloud
