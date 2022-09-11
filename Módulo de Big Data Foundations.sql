--################################################################################
--# Big Data Science - Módulo de Big Data Foundations                            #
--# Desenvolvido por Ewerton Maik                                                #
--# Data: 16/05/2022                                                             #
--# Alterado por: Ewerton Maik                                                   #
--# Ultima Alteração: 06/06/2022                                                 #
--################################################################################



/*  Concluído de 16/05/2022 á 06/06/2022 - Nota Prova = 8
16/05/2022 - Primeira Aula Semantix

Conteúdo programático
Big Data Foundations (Semana 1, 2 e 3):
	• Conhecimento de ferramentas atuais no mercado de Big Data;
	• Criação e funcionamento de um cluster Hadoop para Big Data em Docker;
	• Manipulação de dados com HDFS;  
	• Manipulação de dados com uso do Hive;
	• Otimização de consultas em grandes volumes de dados estruturados e semiestruturados com uso de Hive;
	• Ingestão de dados relacionais para o HDFS/Hive, com uso do Sqoop;
	• Otimização de importação no Sqoop;
	• Exportação de dados do HDFS para o SGBD, com uso do Sqoop;
	• Manipulação de dados com HBase;
	• Operações com Dataframe em Spark para processamento de dados em batch;
	• Uso do Spark SQL Queries para consultas de dados estruturados e semiestruturados.
*/


sql / python / r / scala / linux

Cloudera - Hortonworks Sandbox HDP 3.0 - https://www.cloudera.com/downloads/hortonworks-sandbox/hdp.html
Cloudera QuickStart VM CDH 5.13 - https://www.cloudera.com/downloads/
Semantix - https://semantix.com.br/opengalaxy/
Containers - https://hub.docker.com/
Instalação :
Docker - https://docs.docker.com/get-docker/
Docker Compose - https://docs.docker.com/compose/install


WLS 2
Executar com PowerShell (Administrador)
Definir o WLS 2 como padrão ao instalar uma nova distribuição do Linux
wsl --set-default-version 2

Definir o WSL 2 para uma distribuição já existente
wsl --set-version <distribution name> 2

Acessar WSL via Explorer - \\wsl$

Consultar o que esta rodando
wsl -l -v

-- ### - Via Power Shell
Visualizando o Serviço do Docker
Get-Service com.docker.service

Parando Serviço do Docker
Stop-Service com.docker.service

Iniciando Serviço do Docker
Start-Service com.docker.service

Reiniciando Serviço do Docker
Restart-Service com.docker.service



-- ### - Aula - Instalação Cluster Big Data - Anotações Comandos
-- Antes, instalar e configurar seu Git Hub / Bash

1 - Baixar conteudo do Cluster
$ git clone https://github.com/rodrigo-reboucas/docker-bigdata.git

Acessar a pasta apos baixar o repositorio
cd docker-bigdata/

2 - Baixar as imagens
docker-compose pull

3 - Listar as imagens
docker images

4 - Executar os containers
docker-compose up -d

5 - Listar os containers
docker container ls

6 - Iniciar todos os serviços em background (-d)
$ docker-compose up -d

7 - Parar os Serviços
$ docker-compose stop

8 - Iniciar os Serviços
$ docker-compose start

9 - Matar os Serviços
$ docker-compose dowm

10 - Apagar todos os volumes sem uso
$ docker volume prune

11 - apagar tudo (image, volume, network)
$ docker system prune --all

12 - Visualizar os Containers
Ativos - $ docker ps
Todos  - $ docker ps -a

13 - Executar comandos no container
$ docker exec -it <container> <comando>

14 - Visualizar os Logs
$ docker logs <container>
$ docker-compose logs

15 - Enviar arquivos
$ docker cp <diretorio><container>:/<diretorio>

16 - Acesso o container namenode
docker exec -it namenode bash

17 - Acesso o container do hive
docker exec -it hive-server bash

-- ### - Deletar o Cluster

cd ../script/
docker images ls

cat remove_containers.sh
(
	docker rm -f echo $(docker ps -a -q)
	docker volume prune
	docker network prune
)
./remove_containers.sh -- Irá executar as linhas do Script

cat kill_all_process.sh
(
	docker kill echo $(docker ps -a -q)
)

cat clean_all.sh
(
	docker system prune --all
)


-- ### - Aula - Sistema HDFS e diretórios

hadoop fs -<comando> [argumentos] (HDFS, local FS, WebHDFS, S3 FS e outros)
sudo git clone https://github.com/rodrigo-reboucas/exercises-data.git
hdfs dfs-<comando>[argumentos] (Sistema HDFS)

Comandos Help
$ hadoop fs -help
$ hdfs dfs -help
$ hdfs dfs -help ls

Criar Diretório
mkdir <diretorio>

Criar estrutura de diretórios
mkdir -p <diretorio>/<diretorio>/<diretorio>
mkdir -p user/aluno/ewerton/data/recover/delete
hdfs dfs -mkdir -p user/aluno/ewerton/data/recover/delete

Listar Diretório
ls <diretorio>
Recursivo: -R
rm user/ -r
hdfs dfs -ls -R /user/aluno

Remoção arquivos e diretórios
rm <src>
Argumentos
-r : Deletar Diretório
-skipTrash: Remover Permanentemente

$ hdfs dfs -ls /
hdfs dfs -ls /user/


-- ### - Aula Manipulação de Dados

Comandos Enviar Dados
put <src><dst> (mais usado)
argumentos
-f : Sobrescreve o destino, se já existir
-l : Força um fator de replicacao de

hdfs dfs -put /input/exercises-data/escola/ /user/aluno/ewerton/data
hdfs dfs -put /input/exercises-data/entrada.txt /user/aluno/ewerton/data

copyFromLocal <src><dst>

Move arquivo ou diretorio
Put que deleta do local
moveFromLocal <src><dst>

Receber Dados Arquivo ou Diretorio
get <src><dst>
argumento -f

Cria um único arquivo mesclado
getmerge <src><dst>

Mover para o Local
get que deleta a copia do HDFS
moveToLocal <src><localdst>

Copiar e Mover Dados - Arquivo ou Diretorio
cp <src><dst>
Argumento -f

Mover arquivo ou diretório
mv <src><dst>
mv <arquivo1><arquivo2><arquivo3><dst>


-- ### - Aula Comandos Informações

Mostrar o uso do disco
du -h <diretorio>
du -h user/

Exibir o espaço livre
df -h <diretorio>
df -h user/

Mostrar as informações do diretórios
stat <diretorio>
stat user/

hdfs dfs -stat %r name.txt #fator de replicacao
hdfs dfs -stat %o name.txt #tamanho do bloco

Contar o número de diretórios, números de arquivos e tamanho do arquivo especifico
count -h <diretorio>

Esvaziar a lixeira
exounge

Ver conteudo do arquivo
cat <arquivo>

Alterar o fator de replicacao do arquivo
setrep <nº repetições> <arquivo>

Criar um arquivo de registro com data e hora
touchz <diretorio>

Retornar as informações da soma de verificação de um arquivo
checksum <arquivo>

Mostrar o último 1KB do arquivo no console:
tail [-f] <arquivo>
hdfs dfs -tail name.txt
hdfs dfs -cat name.txt | head -n 1

Localiza todos os arquivos que correspondem a expressao
find <caminho><procura> -print
hdfs dfs -find / -name data

hdfs dfs -find / -iname Data -print
				/user/semantix/input/data
				
hdfs dfs -find input/ -name \*.txt -print
				input/teste1.txt, input/teste.txt


-- ### - Correção - Exercícios de Comandos HDFS
# iniciando o docker em background
docker-compose up -d

# baixar os dados do exercicios do treinamento
cd input/
sudo git clone https://github.com/rodrigo-reboucas/exercises-data.git

# acessar container do namenode
docker exec -it namenode bash

# Criar a estrutura de pastas
hdfs dfs -ls -R /
hdfs dfs -ls -R /user

hdfs dfs -mkdir -p /user/aluno/ewerton/data
hdfs dfs -mkdir /user/aluno/ewerton/recover
hdfs dfs -mkdir /user/aluno/ewerton/delete

# Enviar arquivos para outro diretorio
hdfs dfs -put /input/exercises-data/escola/ /user/aluno/ewerton/data
hdfs dfs -ls -R /user/aluno/ewerton/data

hdfs dfs -put /input/exercises-data/entrada1.txt /user/aluno/ewerton/data
hdfs dfs -ls /user/aluno/ewerton/data

# Mover Arquivos
hdfs dfs -mv /user/aluno/ewerton/data/entrada1.txt /user/aluno/ewerton/recover
hdfs dfs -ls /user/aluno/ewerton/recover
hdfs dfs -ls /user/aluno/ewerton/data

# Deletar pasta
hdfs dfs -rm -R /user/aluno/ewerton/recover
hdfs dfs -rm -skipTrash -R /user/aluno/ewerton/delete (Remove Permanentemente)

# Procurar arquivo
hdfs dfs -find /user -name alunos.csv

# Mostrar Ultimo 1 KB de Arquivo
hdfs dfs -tail alunos.csv
hdfs dfs -tail /user/aluno/rodrigo/data/escola/alunos.csv

# Exibir HEAD - cabeça do arquivo
hdfs dfs -cat /user/aluno/ewerton/data/escola/alunos.csv
hdfs dfs -cat /user/aluno/ewerton/data/escola/alunos.csv | head - 2

# Verificar soma de informações - CHECKSUM
hdfs dfs -checksum /user/aluno/ewerton/data/escola/alunos.csv

# Criar arquivo em branco
hdfs dfs -touchz /user/aluno/ewerton/data/test
hdfs dfs -ls /user/aluno/ewerton/data/

# Alterar o Fator de Replicacao para 2
hdfs dfs -setrep /user/aluno/ewerton/data/test
hdfs dfs -ls /user/aluno/ewerton/data

# Ver informações do arquivo
hdfs dfs -help stat
hdfs dfs -stat %r /user/aluno/ewerton/data/escola/alunos.csv
hdfs dfs -stat %o /user/aluno/ewerton/data/escola/alunos.csv

# Exibir espaço livre em Disco
hdfs dfs -df /user/aluno/ewerton/data/
hdfs dfs -df -h /user/aluno/ewerton/data/
hdfs dfs -du -h /user/aluno/ewerton/data/
hdfs dfs -du -h /

docker-compose stop


-- ### - Introdução - Hive
-- HIVE / SPARK SQL / PRESTO / IMPALA - Todas usam SQL
Consultar os dados do HDFS

Listar todos os BD
show database;

Estrutura sobre o BD
desc database <nomeBD>

Listar Tabelas
show tables;

Estrutura da Tabela
desc <nomeTabela>;
desc formatted <nomeTabela>;
desc extended <nomeTabela>;

Criar BD
create database <nomeBanco>;

Local diferente do config. Hive
create database <nomeBanco> location "/diretorio";

Adicionar Comentario
create database <nomeBanco> comment "descricao";

Ex:
create database test location "/user/hive/warehouse/test"
comment "banco de dados para treinamento"
default
/user/hive/warehouse/test.db

Tabela Interna
create table user(cod int, name string);
drop table - apaga os dados e metadados

Tabela Externa
create external table e_user (cod int, name string)
location '/user/semantix/data_users';
drop table

tipos - int, smallint, tinyint, bigint, boolean, fload, double, decimal, string, varchar, char
array, map, struct, union

Tabela Externa
create external table user (
	id 	int,
	name 	string,
	age 	int
)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as textfile
location '/user/cloudera/data/client';


-- ### - Acessar o Cliente Hive
/treinamentos/docker-bigdata

docker-compose up -d
docker ps

docker exec -it hive-server bash

beeline --help
beeline -u jdbc:hive2://localhost:10000

show databases;

exit
docker-compose stop


-- ### - Hive - Criação de Tabela Raw

Acessando o NameNode
docker exec -it namenode bash

Visualizando arquivos do Diretorio
ls /input/exercises-data/populacaoLA/

Criando diretorio Populacao
hdfs dfs -mkdir /user/aluno/ewerton/data/populacao

Enviar o arquivo local “/input/exercises-data/populacaoLA/populacaoLA.csv” para o diretório no HDFS “/user/aluno/<nome>/data/populacao”
hdfs dfs -put /input/exercises-data/populacaoLA/populacaoLA.csv  /user/aluno/ewerton/data/populacao 

hdfs dfs -ls /user/aluno/ewerton/data/populacao

hdfs dfs -cat /user/aluno/ewerton/data/populacao/populacaoLA.csv | head -n 3

2. Listar os bancos de dados no Hive
Acessando o Hive
docker exec -it hive-server bash
beeline --help
beeline -u jdbc:hive2://localhost:10000
show databases;

3. Criar o banco de dados <nome>
create database aula_hive;
show databases;

4. Criar a Tabela Hive no BD <nome>
use aula_hive;

create table pop(
	zip_code 		int,
	total_population 	int,
	median_age 		float,
	total_males 		int,
	total_females 		int,
	total_households 	int,
	average_household_size 	float
)
row 	format delimited fields terminated by ','
	lines terminated by '\n'
	stored as textfile
	tblproperties("skip.header.line.count"="1");

Tabela interna: pop
Campos:
zip_code	 - int
total_population - int
median_age	 - float
total_males	 - int
total_females	 - int
total_households - int
average_household_size - float
Propriedades
Delimitadores: Campo ‘,’ | Linha ‘\n’
Sem Partição
Tipo do arquivo: Texto
tblproperties("skip.header.line.count"="1")’

5. Visualizar a descrição da tabela pop
desc pop;
desc formatted pop;


-- ### - Inserir e Carregar Dados

insert into table <nomeTabela> partition(<partition>='<value>') values(<campo>,<value>), (<campo>,<value>), (<campo>,<value>);

insert into users values(10, 'Rodrigo'), (11, 'Augusto');
insert into users partition(data=now()) values (10, 'Rodrigo'), (11, 'Augusto');
insert into users select * from cliente;

Carregar dados no sistema de arquivos local
hive> load data inpath <diretorio> into table <nomeTabela>;

load data local inpath '/home/cloudera/data/test' into table alunos
load data inpath '/user/cloudera/data/test' overwrite into table alunos partition(id)



-- ### - Seleção de Dados

select * from <nometable>
<where ...>
<group by...>
<having ...>
<order by ...>
<limit n>;

hive> select * from client where state = sp
group by city having population > 100
order by client limit 10;

Aceita apenas ANSI JOINS
inner join, left outer, rigth outer, full outer

select * from a join b on a.valor = b.valor
select * from a,b where a.valor =b.valor - ERRO

salvar consultas
create view <nomeView> as select * from nome_table;


-- ### - Exercícios - Inserir Dados na Tabela Raw

Acessando o Hive
docker exec -it hive-server bash
beeline --help
beeline -u jdbc:hive2://localhost:10000
show databases;
use aula_hive;
show tables;


1.Visualizar a descrição da tabela pop do banco de dados <nome>
desc pop;
desc formatted pop;

2.Selecionar os 10 primeiros registros da tabela pop
select * from pop limit 10;

3.Carregar o arquivo do HDFS “/user/aluno/<nome>/data/população/populacaoLA.csv” para a tabela Hive pop
load data inpath '/user/aluno/ewerton/data/populacao/populacaoLA.csv' overwrite into table pop;

4.Selecionar os 10 primeiros registros da tabela pop
select * from pop limit 10;

5.Contar a quantidade de registros da tabela pop
select count(*) from pop;

closing
exit
docker-compose stop


-- ### - Particionamento - Conceitos
Todas as consultas do Hive sao MapReduce

Particao
partitioned By(<campo> <type>)

Buket
clustered by(<campo>) into <qtd> buckets

create table user(
	id 	int,
	name	String,
	age 	int
)
partioned by (data String)
clustered by (id) into 4 buckets;

hive> alter table <nomeTabela> add partition(<particao>='<valor>');

hive> alter table logs add partition(data='2019-21-02');

hive> insert overwrite table user_cidade partition (cidade) select * from user;

SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;

hive> show partitions user;

hive> alter table user drop partition (city='SP');

hive> alter table user partition city rename to partition state;


-- ### - Reparar tabela

msck repair table <nomeTabela>

docker exec -it namenode ls /
docker exec -it namenode hdfs dfs -ls /

Exercícios - Criação de Tabela Particionada Hive
1. Criar o diretório “/user/aluno/<nome>/data/nascimento” no HDFS
docker exec -it namenode hdfs dfs -mkdir /user/aluno/ewerton/data/nascimento
docker exec -it namenode hdfs dfs -ls /user/aluno/ewerton/data

2. Criar e usar o Banco de dados <nome>
docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
show databases;
use aula_hive;
show tables;

3. Criar uma tabela externa no Hive com os parâmetros:

create external table nascimento(
	nome 		string,
	sexo 		string,
	frequencia 	int
)
	partitioned by (ano int)
	row format delimited
	fields terminated by ','
	lines terminated by '\n'
	stored as textfile
	location '/user/aluno/ewerton/data/nascimento';
	location 'hdfs://namenode:8020/user/aluno/ewerton/data/nascimento';

show tables;

4.Adicionar partição ano=2015
alter table nascimento add partition(ano=2015);

5.Enviar o arquivo local “input/exercises-data/names/yob2015.txt” para o HDFS no diretório /user/aluno/<nome>/data/nascimento/ano=2015
docker exec -it namenode bash
hdfs dfs -ls /user/aluno/ewerton/data/nascimento
ls /input/exercises-data/names
hdfs dfs -put /input/exercises-data/names/yob2015.txt  /user/aluno/ewerton/data/nascimento/ano=2015


6.Selecionar os 10 primeiros registros da tabela nascimento no Hive
docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
select * from nascimento limit 10;
show databases;
use aula_hive;
show tables;

7.Repita o processo do 4 ao 6 para os anos de 2016 e 2017.
use aula_hive;
alter table nascimento add partition(ano=2016);
alter table nascimento add partition(ano=2017);

docker exec -it namenode bash
hdfs dfs -put /input/exercises-data/names/yob2016.txt  /user/aluno/ewerton/data/nascimento/ano=2016
hdfs dfs -put /input/exercises-data/names/yob2017.txt  /user/aluno/ewerton/data/nascimento/ano=2017
hdfs dfs -ls /user/aluno/ewerton/data/nascimento

docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
select * from nascimento where ano = 2015 limit 10;
select * from nascimento where ano = 2016 limit 10;
select * from nascimento where ano = 2017 limit 10;



-- ### - Exercícios - Seleção de Tabelas Hive
-- ### - Correção - Exercícios de Seleção de Tabelas Hive

docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
use aula_hive;
show tables;

1. Selecionar os 10 primeiros registros da tabela nascimento pelo ano de 2016
select * from nascimento where ano = 2015 limit 10;
select * from nascimento where ano = 2016 limit 10;
select * from nascimento where ano = 2017 limit 10;

2. Contar a quantidade de nomes de crianças nascidas em 2017
select count(nome) qtd_nomes from nascimento where ano = 2017;

3. Contar a quantidade de crianças nascidas em 2017
select sum(frequencia) qtd from nascimento where ano = 2017;

4. Contar a quantidade de crianças nascidas por sexo no ano de 2015
select sexo, sum(frequencia) as qtd from nascimento where ano = 2015 group by sexo;

5. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo
select ano, sexo, sum(frequencia) as qtd from nascimento group by ano, sexo order by ano desc;

6. Mostrar por ordem de ano decrescente a quantidade de crianças nascidas por sexo com o nome iniciado com ‘A’;
select ano, sexo, sum(frequencia) as qtd from nascimento where nome like 'A%' group by ano, sexo order by ano desc;

7. Qual nome e quantidade das 5 crianças mais nascidas em 2016
select nome, max(frequencia) as qtd from nascimento where ano = 2016 group by nome order by qtd desc limit 5;

8. Qual nome e quantidade das 5 crianças mais nascidas em 2016 do sexo masculino e feminino
select nome, max(frequencia) as qtd, sexo from nascimento where ano = 2016 group by nome, sexo order by qtd desc limit 5;


-- ### - Conceitos - Formato e Compressão

Formatos de Arquivos
Text File / Sequence File / RC File / ORC File / Avro / Parquet

stored as <formatoArquivo>
TEXTFILE (Padrão)
Sequence File / RC File / ORC File / ORC (Hortonworks) / Avro / Parquet (Cloudera) / JSONFILE

arquivo - mapred-site.xml
Compressao
hive> SET hive.exec.compress.output = true;
hive> SET mapred.output.compression.codec = codec;
hive> SET mapred.output.compression.type = BLOCK;

Codec
gzip: 	 org.apache.hadoop.io.compress.GzipCodec
bzip2: 	 org.apache.hadoop.io.compress.BZip2Codec
LZO: 	 com.hadoop.compression.Lzo.LzopCodec
Snappy:  org.apache.hadoop.io.compress.SnappyCodec
Deflate: org.apache.hadoop.io.compress.DeflateCodec

stored as <formatoArquivo> tblproperties('formatoArquivo.compress'='<CompressaoArquivo>')
GZIP / BZIP2 / LZO / SNAPPY / DEFLATE

create table user (
	id 	int,
	name 	String,
	age 	int
)
	partitioned by (data String)
	clustered by (id) into 256 buckets
	stored as parquet tblproperties('parquet.compress'='SNAPPY');


-- ### - Exercícios - Criação de Tabelas Otimizadas
-- ### - Correção - Exercícios de Criação de Tabelas Otimizadas

1. Usar o banco de dados <nome>
docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
use aula_hive;
show tables;

2. Selecionar os 10 primeiros registros da tabela pop
select * from pop limit 10;

3. Criar a tabela pop_parquet no formato parquet para ler os dados da tabela pop

create table pop_parquet(
	zip_code 		int,
	total_population 	int,
	median_age 		float,
	total_males 		int,
	total_females 		int,
	total_households 	int,
	average_household_size 	float
)
stored as parquet;

4. Inserir os dados da tabela pop na pop_parquet
insert into pop_parquet select * from pop;

5. Contar os registros da tabela pop_parquet
select count(*) total from pop;
select count(*) total from pop_parquet;

6. Selecionar os 10 primeiros registros da tabela pop_parquet;
select * from pop_parquet limit 10;

7. Criar a tabela pop_parquet_snappy no formato parquet com compressão Snappy para ler os dados da tabela pop
create table pop_parquet_snappy (
	zip_code 		int,
	total_population 	int,
	median_age 		float,
	total_males 		int,
	total_females 		int,
	total_households 	int,
	average_household_size 	float
)
	stored as parquet
	tblproperties('parquet.compress'='SNAPPY');

desc formatted pop_parquet_snappy;

8. Inserir os dados da tabela pop na pop_parquet_snappy
insert into pop_parquet_snappy select * from pop;

9. Contar os registros da tabela pop_parquet_snappy
select count(*) total from pop_parquet_snappy;

10. Selecionar os 10 primeiros registros da tabela pop_parquet_snappy
select * from pop_parquet_snappy limit 10;


11. Comparar as tabelas pop, pop_parquet e pop_parquet_snappy no HDFS.
acessando
docker exec -it namenode bash

hdfs dfs -ls /user/hive/warehouse
hdfs dfs -ls /user/hive/warehouse/aula_hive.db
hdfs dfs -ls -R /user/hive/warehouse/aula_hive.db
hdfs dfs -ls -R -h /user/hive/warehouse/aula_hive.db
hdfs dfs -ls -du -h /user/hive/warehouse/aula_hive.db


-- ### - Introdução - Sqoop

Enviar / receber dados
Data Lake
via Batch - Sqoop
Stream - Flume ou Kafka

Sqoop = SQL to Hadoop
Importar do MySQL, SQL Server, ORacle
Para HDFS, Hiv ou HBase
Execução em paralelo
Tolerância a Falhas

-- ### - Preparar Banco de Dados
-- ### - Copiar os dados local para o container database

docker cp input/exercises-data/db-sql/ database:/

acessar contêiner database
docker exec -it database bash

Instalar Banco de Dados de Testes
Diretório /db-sql - BD employees (Já Existe)
cd /db-sql
mysql -psecret <employees.sql

Diretório /db-sql/sakila - BD sakila
cd /db-sql/sakila/
mysql -psecret <sakila-mv-schema.sql
mysql -psecret <sakila-mv-data.sql


-- ### - Exercícios MySQL - Preparação do Banco de Dados de Testes
-- ### - Correção - Exercícios de Preparação do Banco de Dados de Testes

Precisa esta fora de qualquer container, na reaiz para copiar
1. Copiar os dados do local para o contêiner database

ls input/exercises-data/db-sql/
$ docker cp input/exercises-data/db-sql/ database:/

2. Acessar o contêiner database

$ docker exec -it database bash
ls /db-sql/

3. Instalar Banco de Dados de testes

Diretório /db-sql - BD employees (Já existe)
  $ cd /db-sql  

Comando para executar sql e criar banco Employees
$ mysql -psecret < employees.sql

Acessar o Banco MySQL
mysql -h localhost -u root -psecret
mysql -h -psecret
show databases;

-- drop database employees;

Diretório /db-sql/sakila - BD sakila
$ cd /db-sql/sakila/

Comandos para criar Banco de dados SAKILA e SCHEMA
$ mysql -psecret < sakila-mv-schema.sql
$ mysql -psecret < sakila-mv-data.sql
mysql -h localhost -u root -psecret
show databases;
use employees;
show tables;
select * from employees limit 10;

-- ### - Comandos Basicos do Sqoop

help - sqoop help / sqoop help import
version - sqoop version
import
import-all-tables - sqoop import-all-tables
export
validation
job
metastore
merge
codegen
create-hive-table
eval
list-databases
list-tables


-- ### - Acessar Sqoop

O Sqoop fica no NAMENODE
docker exec -it namenode bash
sqoop version
sqoop help
sqoop help import

Conesão são todas via JDBC

Listar banco de Dados
sqoop list-databases \
--connect jdbc:mysql://database \
--username usuario \
--password senha

Listar Tabelas
sqoop list-tables \
--connect jdbc:mysql://database/employees \
--username usuario \
--password senha

--### Consultar Tabelas
-- Usar o Sqoop para fazer consultar a um banco de dados remoto
-- Consultar dados antes de fazer uma importação
-- Exemplos tabelas de LOG
-- Execução de tarefas do Sqoop

Comando
eval
exemplo:
sqoop eval \
--connect jdbc:mysql://database/employees \
--username=root \
--password=secret \
--query "SELECT * FROM employees limit 15"

Criar uma Tabela:
$ sqoop eval --connect ... --query "create table setor(cod int(2), name varchar(30))"
$ sqoop eval --connect ... --query "describe setor"

Inserir linhas na tabela:
$ sqoop eval --connect ... --query "insert into setor values(1, 'vendas')"

Consultar Tabelas:
$ sqoop eval --connect ... --query "select * from setor"
$ sqoop eval --connect ... --query "select * from employees where first_name like 'A'"



-- ### - Exercícios - Pesquisa e Criação de Tabelas
-- ### - Correção - Exercícios de Pesquisa e Criação de Tabelas

1. Mostrar todos os databases
docker exec -it namenode bash
sqoop list-databases --connect jdbc:mysql://database --username root --password secret

2. Mostrar todas as tabelas do bd employees
sqoop list-tables --connect jdbc:mysql://database/employees --username root --password secret

3. Inserir os valores ('d010', 'BI') na tabela departments do bd employees
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments"
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into departments values ('d010','BI')"

4. Pesquisar todos os registros da tabela departments
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments"

5. Criar a tabela benefits(cod int(2)  AUTO_INCREMENT PRIMARY KEY, name varchar(30)) no bd employees
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "create table benefits(cod int(2) AUTO_INCREMENT PRIMARY KEY, name varchar(30))"
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from benefits"

6. Inserir os valores (null,'food vale') na tabela benefits
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into benefits values (null,'food vale')"

7. Pesquisar todos os registros da tabela benefits
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from benefits"


-- ### - Importar Dados

$ sqoop import --connect jdbc:mysql://database \ --username root --password secret

--table : Importar de apenas uma tabela
$ sqoop import --table employees \
--connect jdbc:mysql://database/employees \
--username root \
--password secret

--columns : Importar colunas especificas
$ sqoop importar ... --columns "id, last_name"

--where: Importar linhas correspondentes
$ sqoop importar ... --where "state='SP'"

Sqoop vai sempre armazenar os dados importados no diretório
Home do HDFS,
ex. /user/<username>/<tablename>

porém podemos passar um outro caminho.

--target-dir: Armazenar em um diretório especifico
$ sqoop import ... --target-dir /user/root/db

--warehouse-dir: Armazenar em um diretório base
$ sqoop import ... --warehouse-dir /user/root/db

Importar tabela departments
--target-dir /data = /data
--warehouse-dir /data = /data/departments

--delete-target-dir : Sobrescrever o diretório
$ sqoop import ... --warehouse-dir /user/clousera/db -delete-target-dir

--append : Anexar os dados no diretório existente
$ sqoop import ... --warehouse-dir /user/clousera/db -append


-- ### - Importar Dados - Delimitadores
Por padrão, o Sqoop gerar arquivos de texto
Campos delimitados por vírgula
Linhas terminadas por quebra de linha \n

Comandos
--fields-terminated-by<delimitador>
--lines-terminated-by<delimitador>

Especificar o delimitador
'qualquer coisa', \b (backspace), \n (newline), \t (tab), \0 (NULL)

Exe:
$ sqoop import ...--fields-terminated-by '\t' --lines-terminated-by '&'


-- ### - Exercícios - Sqoop – Importação BD Employees
-- ### - Correção - Exercícios de Importação BD Employees

1. Pesquisar os 10 primeiros registros da tabela employees do banco de dados employees
docker exec -it namenode bash
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from employees limit 10"

2. Realizar as importações referentes a tabela employees e para validar cada questão,  é necessário visualizar no HDFS*

Importar a tabela employees, no warehouse  /user/hive/warehouse/db_test_a
sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/hive/warehouse/db_test_a

hdfs dfs -ls /user/hive/warehouse/db_test_a
hdfs dfs -ls /user/hive/warehouse/db_test_a/employees
hdfs dfs -ls -h /user/hive/warehouse/db_test_a/employees
hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00000 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00001 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00002 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_a/employees/part-m-00003 | head -n 3

Importar todos os funcionários do gênero masculino, no warehouse  /user/hive/warehouse/db_test_b
sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --where "gender='M'" --warehouse-dir /user/hive/warehouse/db_test_b

hdfs dfs -ls /user/hive/warehouse/db_test_b/employees
hdfs dfs -ls -h /user/hive/warehouse/db_test_b/employees
hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00000 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00001 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00002 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_b/employees/part-m-00003 | head -n 3

importar o primeiro e o último nome dos funcionários com os campos separados por tabulação, no warehouse  /user/hive/warehouse/db_test_c
sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name, last_name" --fields-terminated-by '\t' --warehouse-dir /user/hive/warehouse/db_test_c

hdfs dfs -ls /user/hive/warehouse/db_test_c/employees
hdfs dfs -ls -h /user/hive/warehouse/db_test_c/employees
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00000 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00001 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00002 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00003 | head -n 3

Importar o primeiro e o último nome dos funcionários com as linhas separadas por “ : ” e salvar no mesmo diretório da questão 2.C
* Dica para visualizar no HDFS:

sqoop import --table employees --connect jdbc:mysql://database/employees --username root --password secret --columns "first_name, last_name" --lines-terminated-by ':' --warehouse-dir /user/hive/warehouse/db_test_c -delete-target-dir
hdfs dfs -ls /user/hive/warehouse/db_test_c/employees
hdfs dfs -ls -h /user/hive/warehouse/db_test_c/employees
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00000 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00001 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00002 | head -n 3
hdfs dfs -cat /user/hive/warehouse/db_test_c/employees/part-m-00003 | head -n 3

$ hdfs dfs -cat /.../db_test/nomeTabela/part-m-00000 | head -n 5


-- ### - Paralelismo

Por padrao o numero de mapeadores e 4
-m, ou -num-mappers: quantidade de mapeadores
$ sqoop import ... -m 2
Divisao aplicada a coluna com chave primaria
se existir
-num-mappers 8
se nao existir
-num-mappers 1
-auto-reset-to-one-mapper
manipular tabelas automaticamente
-num-mappers > 1 = erro
solucao SPLIT

-split-by: dividir mapeadores em uma coluna sem chave
$ sqoop import ... --split-by:id

valores nulos na colunasregistros correspondentes da tabela serao ignorados
dados na coluna de divisao nao precisam ser excluidos
pode haver uma distorcao nos dados durante a importacao

-- ### - Valores Nulos
-- ### - Valor escrito para um campo nulo de numero

--null-non-string<valor nulo>
$ sqoop import ... --null-non-string '-1'

-- Valor escrito para um campo nulo de string
--null-string <valor nulo>
$ sqoop import ... --null-string 'NA'


$ sqoop import ... --null-non-string '\\N' --null-strinng '\\N'
importacao compativel com Hive e Impala


-- ### - Formato e Compressão de Dados

Por padrao e o formato de texto
Formato de arquivo de texto (Default)
$ sqoop import ...--as-textfile

Formato de arquivo de Parquet
$ sqoop import ...--as-parquetfile

Formato de arquivo Avro
$ sqoop import ...--as-avrodatafile

Formato de arquivo de Sequencia
$ sqoop import ...--as-sequencefile

Codec de compactacao
Gzip  - org.apache.hadoop.io.compress.GzipCodec
Bzip2 - org.apache.hadoop.io.compress.Bzip2Codec
Snappy - org.apache.hadoop.io.compress.SnappyCodec
Others (deflate, Iz4, ...)

Codecs suportados
/etc/hadoop/conf/core-site.XML

Comandos
Habilitar compressao: --compress
Escolher compressao: --compression-codec <codec>

$ sqoop import ...--compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec


-- ### - Exercícios - Sqoop – Importação BD Employees - Otimização
-- ### - Correção - Exercícios de Importação BD Employees - Otimização

Realizar com uso do MySQL

docker exec -it database bash
mysql -psecret

1. Criar a tabela cp_titles_date, contendo a cópia da tabela titles com os campos title e to_date
use employees
show tables;
select * from titles limit 10;
create table cp_titles_date select title, to_date from titles;

2. Pesquisar os 15 primeiros registros da tabela cp_titles_date
select * from cp_titles_date limit 15;

3. Alterar os registros do campo to_date para null da tabela cp_titles_date, quando o título for igual a Staff
update cp_titles_date set to_date = null where title = 'Staff';

Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test_<numero_questao> e visualizar no HDFS
docker exec -it namenode bash

4. Importar a tabela titles com 8 mapeadores no formato parquet
sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_4
hdfs dfs -ls -h /user/hive/warehouse/db_test2_4/
hdfs dfs -ls -h /user/hive/warehouse/db_test2_4/titles
hdfs dfs -tail /user/hive/warehouse/db_test2_4/titles/06558298-f833-4a99-9880-642b41e39d68.parquet

5. Importar a tabela titles com 8 mapeadores no formato parquet e compressão snappy
sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 8 --as-parquetfile --warehouse-dir /user/hive/warehouse/db_test2_5 --compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec
hdfs dfs -ls -h /user/hive/warehouse/db_test2_5/
hdfs dfs -ls -h /user/hive/warehouse/db_test2_5/titles


6. Importar a tabela cp_titles_date com 4 mapeadores (erro)
sqoop import --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_6 --compress --compression-codec org.apache.hadoop.io.compress.SnappyCodec //--as-parquetfile

Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo título no warehouse /user/hive/warehouse/db_test2_title
sqoop import  -Dorg.apache.sqoop.splitter.allow_text_splitter=true --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_title --split-by title


Importar a tabela cp_titles_date com 4 mapeadores divididos pelo campo data no warehouse /user/hive/warehouse/db_test2_date
sqoop import  -Dorg.apache.sqoop.splitter.allow_text_splitter=true --table cp_titles_date --connect jdbc:mysql://database/employees --username root --password secret -m 4 --warehouse-dir /user/hive/warehouse/db_test2_date --split-by to_date

Qual a diferença dos registros nulos entre as duas importações?
hdfs dfs -count -h /user/hive/warehouse/db_test2_date
hdfs dfs -ls -h -R /user/hive/warehouse/db_test2_date

hdfs dfs -count -h /user/hive/warehouse/db_test2_title
hdfs dfs -ls -h -R /user/hive/warehouse/db_test2_title

hdfs dfs -cat /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00000 | head -n 10
hdfs dfs -cat /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00001 | head -n 10
hdfs dfs -cat /user/hive/warehouse/db_test2_date/cp_titles_date/part-m-00002 | head -n 10

hdfs dfs -cat /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00001 | head -n 10
hdfs dfs -cat /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00002 | head -n 10
hdfs dfs -cat /user/hive/warehouse/db_test2_title/cp_titles_date/part-m-00003 | head -n 10

Spark lê arquivo .parquet sem problemas

-- ### - Sqoop jobs
-- ### - Otimização de Tarefas - Rotinas - Automatização

Importação ou Exportação - Incremental
Comando
$ sqoop job --<atributo>

--create <job-id>: Criar Job
$ sqoop job --create myjob --import --connect jdbc:mysql://database/db \
--username root --password secret --table employee --m 1

--list: Verificar Jobs Salvos
$ sqoop job --list

--show <job-id>: Ver detalhes do Job
$ sqoop job --show myjob

--exe <job-id>: Executar Job
$ sqoop job --exec myjob

--delete <job-id>: Deletar Job
$ sqoop job --delete myjob

-- Carga Incremental - Append
Anexar dados em um conjunto de dados existentes do HDFS
Anexaar todos os dados
$ sqoop import ... --append --where 'id_venda > 10'

Anexar apenas os novos dados (Incremental)
Sem sobrescrever os dados, em relação a uma coluna e um valor exclusivo crescente
$ sqoop import ... --incremental append \
--check-column id_venda \
--last-value 50

Inserir dados em um  conjunto de dados existentes no HDFS
Atualizar apenas os novo dados (Incremental)
Sobrescreveros dados, em relação a uma coluna e um valor de dada e hora
adicionar o atributo -merge-KEY
coluna e um valor exclusivo crescente
$ sqoop import ... --incremental lastmodified \
--merge-key data_id \
--check-column data_venda \
--last-value '2021-01-18'


-- ### - Exercícios - Sqoop –Importação BD Sakila – Carga Incremental
-- ### - Correção - Exercícios de Importação BD Sakila – Carga Incremental

Realizar com uso do MySQL
docker exec -it database bash
mysql -psecret
show databases;
use sakila;
show tables;
select * from rental limit 5;

1. Criar a tabela cp_rental_append, contendo a cópia da tabela rental com os campos rental_id e rental_date
create table cp_rental_append select rental_id, rental_date from rental;
select * from cp_rental_append limit 5;

2 .Criar a tabela cp_rental_id e cp_rental_date, contendo a cópia da tabela cp_rental_append
create table cp_rental_id   select * from cp_rental_append;
create table cp_rental_date select * from cp_rental_append;

select * from cp_rental_id limit 5;
select * from cp_rental_date limit 5;
 
Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS
docker exec -it namenode bash

3. Importar as tabelas cp_rental_append, cp_rental_id e cp_rental_date com 1 mapeador
sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_append
sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_id
sqoop import --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --table cp_rental_date

hdfs dfs -ls -R /user/hive/warehouse/db_test3
hdfs dfs -ls - h -R /user/hive/warehouse/db_test3
hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_append/part-m-00000
hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_date/part-m-00000
hdfs dfs -tail /user/hive/warehouse/db_test3/cp_rental_id/part-m-00000

Realizar com uso do MySQL
docker exec -it database bash

4. Executar o sql /db-sql/sakila/insert_rental.sql no container do database

apt-get update
apt-get install apt-file
apt-get update
apt-get install vim
vi insert_rental.sql

cd /db-sql/sakila/ 
cat insert_rental.sql
mysql -psecret < insert_rental.sql

--alterar as duas ultimas linhas do arquivo para
select * from cp_rental_date order by rental_date desc limit 10;
select * from cp_rental_id order by rental_id desc limit 10;
-- salvar :wq

mysql -psecret < insert_rental.sql

$ docker exec -it database bash
$ cd /db-sql/sakila
$ mysql -psecret < insert_rental.sql



Realizar com uso do Sqoop - Importações no warehouse /user/hive/warehouse/db_test3 e visualizar no HDFS
docker exec -it namenode bash

5. Atualizar a tabela cp_rental_append no HDFS anexando os novos arquivos
sqoop import --table cp_rental_append --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --append

6. Atualizar a tabela cp_rental_id no HDFS de acordo com o último registro de rental_id, adicionando apenas os novos dados.
sqoop eval --connect jdbc:mysql://database/sakila --username root --password secret --query "select * from cp_rental_append order by rental_id desc limit 5"
sqoop import --table cp_rental_id --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --incremental append --check-column rental_id --last-value 16049

7. Atualizar a tabela cp_rental_date no HDFS de acordo com o último registro de rental_date, atualizando os registros a partir desta data.
sqoop import --table cp_rental_date --connect jdbc:mysql://database/sakila --username root --password secret --warehouse-dir /user/hive/warehouse/db_test3 -m 1 --incremental lastmodified --merge-key rental_id --check-column rental_date --last-value '2005-08-23 22:50:12.0'

hdfs dfs -ls -h -R /user/hive/warehouse/db_test3
hdfs dfs -cat /user/hive/warehouse/db_test3/cp_rental_id/part-m-00001

-- ### - Importar Dados no Hive

Caminho padrao das tabelas hive
/user/hive/warehouse/aula_hive/

Bom desenpenho
Formato Parquet
Compressao Snappy

Tipo Coluna
Sqoop e pre configurado para mapear a maioria dos tipos SQL para Java ou HIVE
--map-column-java: Mapeamento para java
$ sqoop import ... --map-column-java id=String, value=Integer

--map-column-hive: Mapeamento para hive
$ sqoop import ... --map-column-hive id=String, value=Integer

--hive-import - importar tabela para o hive
--hive-overwrite - sobrescrever os dados se a tabela hive exister
--create-hive-table - o job ira  falhar se uma tabela hive existir
--hive-table - especificar o nome da tabela hive
--hive-table <db_name>.<table_name>

Exemplo de Importação -
sqoop import --table employees \
--connect jdbc:mysql://database/employees \
--username = root \
--password = secret \
--warehouse-dir = /user/hive/warehouse/teste.db \

--hive-import \
--create-hive-table \
--hive-table teste.user


-- ### - Exportar Dados
Exportar dados do HDFS para o RDBMS

$ sqoop export --connect jdbc:mysql://database/log \ --username root --password secret ...

Definir o diretorio de leitura no HDFS
--export-dir <diretorio>

Definir o nome da tabela no SGBD
--table <nome_tabela>

Opcao de Atualizacao
--update-mode
updateonly (default)
acrescenta novas linhas na tabela
cada registro de entrada e transformado em um insert

allowinsert
atualiza as linhas existirem na tabela
inserir linhas se nao existir na tabela

A tabela precisa ser criada no SGBD antes de exportar do Sqoop
MySQL: create table product_recommendations(...)

sqoop export \
--connect jdbc:mysql://database/employees\
--username root --password secret \
--export-dir /user/root/recommender_output \
--update-mode allowinsert \
--table product_recommendations



-- ### - Exercícios - Sqoop –Importação para o Hive e Exportação - BD Employees
-- ### - Correção - Exercícios de Importação para o Hive e Exportação - BD Employees

docker exec -it namenode bash

1. Importar a tabela employees.titles do MySQL para o diretório /user/aluno/<nome>/data com 1 mapeador.
sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret --warehouse-dir /user/aluno/ewerton/data -m 1
hdfs dfs -ls /user/aluno/ewerton/data/titles

2. Importar a tabela employees.titles do MySQL para uma tabela Hive no banco de dados seu nome com 1 mapeador.
sqoop import --table titles --connect jdbc:mysql://database/employees --username root --password secret -m 1 --hive-import --hive-table aula_hive.titles
hdfs dfs -ls /user/hive/warehouse/aula_hive.db
hdfs dfs -ls /user/hive/warehouse/aula_hive.db/titles

3. Selecionar os 10 primeiros registros da tabela titles no Hive.
hdfs dfs -cat /user/hive/warehouse/aula_hive.db/titles/part-m-00000 | head -n 10
docker exec -it hive-server bash
beeline -u jdbc:hive2://localhost:10000
use aula_hive;
select * from titles limit 10;

4. Deletar os registros da tabela employees.titles do MySQL e verificar se foram apagados, através do Sqoop
docker exec -it namenode bash
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from titles limit 10"
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "truncate table titles"

5. Exportar os dados do diretório /user/hive/warehouse/<nome>.db/data/titles para a tabela do MySQL  employees.titles.
sqoop export --table titles --connect jdbc:mysql://database/employees --username root --password secret --export-dir /user/aluno/ewerton/data/titles

6. Selecionar os 10 primeiros registros registros da tabela employees.titles do MySQL.
sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from titles limit 10"


-- ### - Introdução - HBase

https:db-engines.com/

HDFS - Filesystem e Armazenamento Estático

Apache HBASE - Armazenamento em Real TIME (Resposta em Segundos apenas) - NoSQL - Banco de Dados do Hadoop
Contruido sobre o HDFS(StoreFiles)
Base de Dados não Relacional
Armazenamento distribuido
Escalavel
Uso para acesso de leitura / gravacao aleatorio em tempo REAL
Banco de Dados Não Relacional - NoSQL
Orientado a Colunas
Schema da tabela são familias de colunas
Pares de chave-valor
internamente usa tabela hash
2006 - Google publicou sobre um sistema de armazenamento distribuido para dados estruturados
2007 - Criação do Apache HBase - Implementação open-source da arquitetura BigTable
2008 - Tornou um SubProjeto do Hadoop

Dados são distribuidos automaticamente no cluster
chave serve para distribuir os dados nos nós
cada nó armazena um subconjunto de dados (RegionServer)

RegionServer - Tabelas são divididas por região
HBase Master - Gerenciar os RegionServer
ZooKeeper - Monitoramento e Coordenação dos HBase MASTER - Arquivos de Configurações
HDFS - Namenode / Standby Namenode / Datanode

Estrutura dos Dados
Tabelas - Organizar os Dados
Chave de linha - identificador da Linha que armazena os dados
Familia da Coluna - Colunas são agrupadas em familias
Nome da Coluna - identificador da Colunas
Versão - valores em Célula são controlados pelo número da versão (TIMESTAMP)
Célula - Chave -> Valor - Id Linha, Familia Col. Coluna e timestamp = valor


-- ### - Comandos Básicos - HBase

Acessar através do HBase Shell ou API JAVA
HBase Shell
Script que auxilia a manipulação do HBase por linha de comando
Inicializar
$ hbase shell

status - status do Hbase - Números de Servidores
version - Versão do HBase
table_help - Ajuda sobre comandos de Tabelas
whoami - Informações sobre o usuário
help "comando" - Ajuda sobre o comando

Comandos de manipulacao de tabela
create
LIST
DISABLE
is_disabled
ENABLe
is_enabled
describe
ALTER
exists
drop
drop_all

Comandos de manipulação dados da tabela
put
GET
delete
deleteall
SCAN
count
truncate


-- ### - Acessar o HBase

docker ps
docker exec -it hbase-master bash
hbase version
hbase shell
status
version
table_help
whoami
help
help "list"


-- CONTINUAR AQUI... --------------------------------------------------------------------------
-- ### - Manipulação de Tabelas
Criar Tabela - Definir nome das familias de coluna
Sintaxe - create 'nomeTabela',{NAME=>'familia'},{NAME=>'familia'}
create 'nomeTabela','familia','familia'
Exemplo :
hbase> create 'clientes',{NAME=>'endereco', VERSIONS=>2},{NAME=>'pedido'}
hbase> create 'clientes','endereco','pedido'

hbase > list - Listar todas as tabelas
describe 'nomeTabela'
describe 'clientes'
drop 'nomeTabela' ou drop_all 'c.*'
hbase > drop 'clientes'
hbase > exists 'nomeTabela'
hbase > disable 'nomeTabela'
hbase > scan 'nomeTabela' (erro)
hbase > disable_all 'r.*'
hbase > is_disabled 'nomeTabela'
hbase > enable 'nomeTabela'
hbase > is_enable 'nomeTabela'
hbase > truncate 'nomeTabela'


-- ### - Inserção e Alteração de Dados

inserir dados
put 'nomeTabela','chave', 'familia:coluna','valor'
exemplo:
hbase > put 'clientes','emiranda','endereco:estado','BH'
hbase > put 'clientes','emiranda','endereco:estado','MG'
hbase > put 'clientes','emiranda','pedido:data','2/2/2016'
hbase > put 'clientes','emiranda','pedido:nitem','1234D'

Alterar Dados
hbase > put 'clientes','emiranda','pedido:nitem','1234A'

Leitura de Dados
Consultar valores, Colunas ou Familias de Colunas
Pela Chave - GET
Pela Tabela - SCAN

Consultar valore pela chave
get 'nomeTabela','chave'
hbase > get 'clientes', 'emiranda'

Consultar valores de chave pela familia de coluna
get 'nomeTabela','chave',{COLUMNS => ['familia'] }
hbase > get 'clientes','emiranda',{COLUMNS => ['endereco']}

Consultar valores da chave pela coluna
get 'nomeTabela','chave',{columns => ['familia:coluna']}
hbase > get 'clientes','emiranda',{COLUMNS => ['endereco:cidade'] }

Consultar Tabela
Consultar todas as linhas e colunas da tabela
scan 'nomeTabela'
hbase > scan 'clientes'

Consultar todas as linhas da tabela pela familia de coluna
scan 'nomeTabela',{COLUMNS => ['familia']}
hbase scan 'clientes',{COLUMNS => ['endereco']}

Consultar todas as linhas da tabela pela coluna
scan 'nomeTabela',{COLUMNS => ['familia:coluna']}
hbase scan 'clientes',{COLUMNS => ['endereco:cidade'] }

Colsutar Tabela - Por Versao
Consultar todas as linhas da tabela pela versão de uma coluna
scan 'nomeTabela',{COLUMNS => ['familia:valor'] }
hbase > scan 'clientes',{COLUMNS => ['pedido:nitem'], VERSIONS => 5}

Consultar todas as linhas da tabela pela chave
scan 'nomeTabela',{STARTROW => 'chave', COLUMNS => ['familia:valor']}
hbase scan 'clientes', {STARTROW => 'emi', COLUMNS => ['endereco']}

Deletar Dados
Deletar Coluna
delete 'nomeTabela','chave','familia:coluna'
hbase > delete 'clientes','emiranda','endereco:cidade'

Deletar Familia de Coluna
delete 'nomeTabela','chave','familia'
delete 'clientes','emiranda','endereco'

Deletar uma chave
deleteall 'nomeTabela','chave'
hbase > deleteall 'clientes','emiranda'

Alterar Schema - famila de uma tabela
Alterar a familia de coluna da tabela
alter 'nomeTabela', {NAME => 'familia', VERSIONS => Nº}
hbase > alter 'clientes',{NAME => 'pedido', VERSIONS => 5}

Alterar a tabela para deletar a familia de coluna
alter 'nomeTabela','delete' => 'familia'
hbase > alter 'employee','delete' => 'professional'


Contar o numero de registros na tabela
count 'nomeTabela'
hbase > count 'clientes'


-- ### - Exercícios - HBase
-- ### - Correção - Exercícios de HBase

Acessar o HBase

1. Criar a tabela ‘controle’ com os dados:
create 'controle', {NAME=>'produto'},{NAME=>'fornecedor'}
put 'controle','1','produto:nome','ram'
put 'controle','2','produto:nome','hd'
put 'controle','3','produto:nome','mouse'
scan 'controle'
put 'controle','1','produto:qtd','100'
put 'controle','2','produto:qtd','50'
put 'controle','3','produto:qtd','150'
scan 'controle'

put 'controle','1','fornecedor:nome','TI Comp'
put 'controle','2','fornecedor:nome','Peças PC'
put 'controle','3','fornecedor:nome','Inf Tec'
scan 'controle'
put 'controle','1','fornecedor:estado','SP'
put 'controle','2','fornecedor:estado','MG'
put 'controle','3','fornecedor:estado','SP'
scan 'controle'


Chave: id
Família de Coluna: produto e fornecedor
...

2. Listar as tabelas e verificar a estrutura da tabela ‘controle’
list
describe 'controle'

3. Contar o número de registros da tabela ‘controle’
count 'controle'

4. Alterar  a família de coluna produto para 3 versões
alter 'controle',{NAME=>'produto',VERSIONS=>3}
describe 'controle'

5. Alterar a quantidade para 200 do id 2
put 'controle','2','produto:qtd','200'

6. Pesquisar as versões do id 2  da coluna quantidade
get 'controle','2', {COLUMNS=>'produto', VERSIONS=>2}
get 'controle','2', {COLUMNS=>'produto:qtd', VERSIONS=>2}
get 'controle','2', {COLUMNS=>['produto:qtd','fornecedor:nome'], VERSIONS=>2}
get 'controle','2', {COLUMNS=>['produto:qtd','fornecedor'], VERSIONS=>2}
get 'controle','2'

7. Excluir os id do estado de SP
help 'get'
scan 'controle',{COLUMNS=>'fornecedor:estado'}
scan 'controle',{COLUMNS=>'fornecedor:estado', LIMIT => 5}
scan 'controle',{COLUMNS=>'fornecedor:estado', LIMIT => 5, FILTER => "ValueFilter(=, 'binary:SP') "}

deleteall 'controle', '1'
deleteall 'controle', '3'
count 'controle'


8. Deletar a coluna estado da chave 2
delete 'controle','2','fornecedor:estado'

9. Pesquisar toda a tabela controle
scan 'controle'


-- ### - Introdução - Spark

Processamento de Dados
Map reduce
Spark - processamento em Bach
Fink - processamento Real Time

Plataforma de computação em cluster
Suporte:
MapReduce / Streaming / Análises Interativas
Execução em Memória
Compátivel com Hadoop
Funciona com YARN
Acessar os Dados
HDFS
Tabelas HIVE
Tabelas HBase
Linguagem : Scala, Java, Python e R

História
2009 - Projeto de pesquisa na Universidade de California, Berkeley - AMPLab
2010 - Open Source
2013 - Apache
Representação dos Dados
DRR - 2011
DataFrame - 2013
DataSet - 2015


-- ### - Estrutura e Inicialização

Spark 		- ETL e Processamento em Batch
Spark SQL	- Consultas em Dados Estruturados
Spark Streaming - Processamento de Stream
Spark MLib 	- Machine Learning
Spark GraphX 	- Processamento de Grafos

Ambiente Spark Interativo
Inicialização no CLUSTER
pyspark para Python
spark-shell para Scala

Se existir a instalção da versão 1 e 2 no cluster
Versão 1:
pyspark para Python
spark-shell para Scala

Versão 2:
pyspark2 para Python
spark2-shell para Scala

Acessar o Spark
Adicionar o jar para salvar tabelas Hive:

curl -O https://repo1.maven.org/maven2/com/twitter/parquet-hadoop-bundle/1.6.0/parquet-hadoop-bundle-1.6.0.jar (Links para um site externo.)
docker cp parquet-hadoop-bundle-1.6.0.jar spark:/opt/spark/jars

JAR que estava faltando...
usando o curl para baixar o jar
curl -O https://repo1.maven.org/maven2/com/twitter/parquet-hadoop-bundle/1.6.0/parquet-hadoop-bundle-1.6.0.jar
ls
mandar o arquivo baixado para o Docker
docker cp parquet-hadoop-bundle-1.6.0.jar spark:/opt/spark/jars

docker exec -it spark bash
ls /opt/spark/jars

Abrir o SPARK
spark-shell
sc
spark


-- ### - Indrodução - DataFrame

Representação de Dados no SPARK
DataFrames
Dados Estruturados e SemiEstruturados emm Forma Tabulas
Java, Scala, Python
Operações
Transformações
Ação

Leitura - DataFrame
Dados Suportados para leitura e Escrita no DataFrame
Text Files :
CSV / JSON / Plain Text

Binary Format Files
Apache Parquet (Muito Utilizado)
Apache ORC

Tables
Hive MetaStore / JDBC

Configurar Outros Tipos


Criar / Ler um Arquivo / DataFrame
val <dataframe> = spark.read.<formato>("<arquivo>")

<formato>
textFile("arquivo.txt")
csv("arquivo.csv")
jdbc(jdbcUrl, "bd.tabela", connectionProperties)
load ou parquet("arquivo.parquet")
table("tabelaHive")
json("arquivo.json")
orc("arquivo.orc")

<arquivo>
"diretorio/"
"diretorio/ *.log"
"arq1.txt, arq2.txt"
"arq*"

val <dataframe> = spark.read.format("<formato>").\load("<arquivo>")
opções para configurar o arquivo de leitura
spark.read.option(...)

scala > val userDF = spark.read.json("user.json")
scala > val userDF = spark.read.format("json").load("urs.json")


-- ### - Ações - DataFrame

count - retornar o numero de linhas
first - retorna a primeira linha
take(n) - retorna as primeiras n linhas como um array
show(n) - exibe as primeiras n linhas da tabela
collect - trazer toda a informação dos nos do drive - cuiadado para não estourar a memória
distinct - retornar os registros, removendo os repetidos
write - salva os dados
printSchema() Visualizar a estrutura dos dados
DataFrama sempre tem um esquema associado

Exemplo Ações
<dataframe>.<ação>

scala > val clienteDF = spark.read.json("cliente.json")
scala > clienteDF.printSchema()
scala > clienteDF.count()
scala > clienteDF.first()
scala > clienteDF.take(5)
scala > clienteDF.show(5)
scala > clienteDF.distinct()
scala > clienteDF.collect()

Salvar Dados
dadosDF.write
save("arquivoParquet")
json("arquivoJson")
csv("arquivocsv")
saveAsTable("tableHive") * (/user/hive/warehouse)

scala > dadosDF.wirite.save("outputData")
hdfs dfs -ls /user/cloudera/outputData

scala > dadosDF.wirite. \
mode("append"). \
option("path","/user/root"). \
saveAsTable("outputData")

-- ### - Transformações - DataFrame

Dados no DataFrame nunca são modificados
Criar transformações criando outros DataFrames
Exemplos
select : Selecionar os Atributos
where : Filtrar os Atributos
OrderBy : ordernar os dados por Atributo
GroupBy : Agrupar os dados por atributo
Join : Mescar Dados
Limit(n) : Limitar a quantidade de registros

Tranformação Individual
<dataframe>.<ação>
Sequência de Transformações
<dataframe>.<ação>.<ação>.<ação>.<ação>

scala > val prodQtdDF  = prodDF.SELECT("nome","qtd")
scala > val qtd50DF    = prodQtdDF.where("qtd > 50")
scala > val qtd50ordDF = qtd50DF.orderBY("nome")
scala >     qtd50ordDF.show()
scala > prodDF.SELECT("nome","qtd").where("qtd > 50").orderBY("nome")

Funções de Agragação - (GroupBy)
count / max / min / mean / sum / pivot / agg (Função de Agragação Adicional)

scala > peopleDF.groupBy("setor").count()
scala > peopled.show()

Acessar o atributo do Dado
"<atributo>"
$"<atributo>"
<dataframe>("atributo")

scala > prodDF.select("nome","qtd").show()
scala > prodDF.select($"nome",$"qtd"*0,1).show()
scala > prodDF.where(prodDF("nome").startsWith("A")).show()

-- ### - Exercícios - Spark - DataFrame
-- ### - Correção - Exercícios de Spark - DataFrame

docker exec -it namenode bash

1. Enviar o diretório local “/input/exercises-data/juros_selic” para o HDFS em “/user/aluno/<nome>/data”
hdfs dfs -put /input/exercices-data/juros_selic/ /user/aluno/ewerton/data
hdfs dfs -ls /user/aluno/ewerton/data/juros_selic

2. Criar o DataFrame jurosDF para ler o arquivo no HDFS “/user/aluno/<nome>/data/juros_selic/juros_selic.json”
docker exec -it spark bash
spark-shell
val jurosDF = spark.read.json("/user/aluno/ewerton/data/juros_selic/juros_selic.json")

3. Visualizar o Schema do jurosDF
jurosDF.printSchema

4. Mostrar os 5 primeiros registros do jutosDF
jurosDF.show(5)
jurosDF.show(5, false)

5. Contar a quantidade de registros do jurosDF
jurosDF.count

6. Criar o DataFrame jurosDF10 para filtrar apenas os registros com o campo “valor” maior que 10
val jurosDF10 = jurosDF.where("valor > 10")
jurosDF10.show(10)

7. Salvar o DataFrame jurosDF10  como tabela Hive “<nome>.tab_juros_selic”
jurosDF10.write.saveAsTable("aula_hive.tab_juros_selic")

8. Criar o DataFrame jurosHiveDF para ler a tabela “<nome>.tab_juros_selic”
val jurosHiveDF = spark.read.table("aula_hive.tab_juros_selic")

9. Visualizar o Schema do jurosHiveDF
jurosHiveDF.printSchema

10. Mostrar os 5 primeiros registros do jurosHiveDF
jurosHiveDF.show(5)

11. Salvar o DataFrame jurosHiveDF no HDFS no diretório “/user/aluno/nome/data/save_juros” no formato parquet
jurosHiveDF.write.save("/user/aluno/ewerton/data/save_juros")

12. Visualizar o save_juros no HDFS
docker exec -it namenode bash
hdfs dfs -ls /user/aluno/ewerton/data/save_juros

hdfs dfs -ls /user/hive/warehouse/aula_hive/tab_juros_selic

13. Criar o DataFrame jurosHDFS para ler o diretório do “save_juros” da questão 8
docker exec -it spark bash
spark-shell
val jurosHDFS = spark.read.load("/user/aluno/ewerton/data/save_juros")
-- OU
val jurosHDFS = spark.read.load("hdfs://namenode:8020/user/aluno/ewerton/data/save_juros")
val jurosHDFS = spark.read.load("file://namenode:8020/user/aluno/ewerton/data/save_juros")

14. Visualizar o Schema do jurosHDFS
jurosHDFS.printSchema

15. Mostrar os 5 primeiros registros do jurosHDFS
jurosHDFS.show(5)


-- ### - Esquemas - DataFrame

Spark pode inferir os esquemas para os dados estruturados
parquet
tabela hive

Spark pode tentar inferir os esquemas para os dados semi estruturados
csv
json

Inferir esquema automaticamente em dados sem cabeçalho
setor.csv - 
1, vendas
2, TI
3, RH


scala > val sDF = spark.read.csv("setor.csv").printSchema()
_c0: string (nullable = true)
_c1: string (nullable = true)

scala > val sDF = spark.read.option("inferSchema","true").csv("setor.csv").printSchema
_c0: integer (nullable = true)
_c1: string (nullable = true)

Inferir esquema automaticamente em dados com cabeçalho
setor.csv - 
id, setor
1, vendas
2, TI
3, RH

scala > val sDF = spark.read.csv("setor.csv").printSchema
_c0: string (nullable = true)
_c1: string (nullable = true)

scala > val sDF = spark.read.option("inferSchema","true").option("header","true").csv("setor.csv").printSchema()
id: integer (nullable = true)
setor: string (nullable = true)

-- ### - Join - DataFrame

Tipos de JOINS
inner (padrão)
outer
left_outer
rigth_outer
leftsemi

scala > val clienteDF = spark.read.option("header", "true").csv("cliente.csv")
scala > val cidadeDF  = spark.read.option("header", "true").csv("cidade.csv")
scala > clienteDF.join(cidadeDF, "id_c").show()

Left Outer Join
scala > val clienteDF = spark.read.option("header", "true").csv("cliente.csv")
scala > val cidadeDF  = spark.read.option("header", "true").csv("cidade.csv")
scala > clienteDF.join(cidadeDF, clienteDF("id_c") === cidadeDF("id_c"), "left_outer" ).show()


-- ### - Exercícios - Spark - Esquema e Join
-- ### - Correção - Exercícios de Spark - Esquema e Join

1. Criar o DataFrame alunosDF para ler o arquivo no hdfs “/user/aluno/<nome>/data/escola/alunos.csv” sem usar as “option”
val alunosDF = spark.read.csv("/user/aluno/ewerton/data/escola/alunos.csv")
val alunosDF = spark.read.csv("/user/aluno/ewerton/data/escola/alunos.csv").show(3)

2. Visualizar o esquema do alunosDF
alunosDF.printSchema

3. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho
val alunosDF = spark.read.option("header","true").csv("/user/aluno/ewerton/data/escola/alunos.csv")

4. Visualizar o esquema do alunosDF
alunosDF.printSchema
alunosDF.show(3)

5. Criar o DataFrame alunosDF para ler o arquivo “/user/aluno/<nome>/data/escola/alunos.csv” com a opção de Incluir o cabeçalho e inferir o esquema
val alunosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/ewerton/data/escola/alunos.csv")

6. Visualizar o esquema do alunosDF
alunosDF.printSchema

7. Salvar o DaraFrame alunosDF como tabela Hive “tab_alunos” no banco de dados <nome>
alunosDF.write.saveAsTable("aula_hive.tab_alunos")

8. Criar o DataFrame cursosDF para ler o arquivo “/user/aluno/<nome>/data/escola/cursos.csv” com a opção de Incluir o cabeçalho e inferir o esquema
val cursosDF = spark.read.option("header","true").option("inferSchema","true").csv("/user/aluno/ewerton/data/escola/cursos.csv")

9. Criar o DataFrame alunos_cursosDF com o inner join do alunosDF e cursosDF quando o id_curso dos 2 forem o mesmo
val alunos_cursosDF = alunosDF.join(cursosDF, "id_curso")

10. Visualizar os dados, o esquema e a quantidade de registros do alunos_cursosDF
alunos_cursosDF.show(10)
alunos_cursosDF.printSchema
alunos_cursosDF.count


-- ### - Introdução - Spark SQL Queries

Realizar consultas com comandos SQL
Tabelas Hives
View de DataFrame e DataSet
Outros formatos de arquivos

Usar a função SparkSession.sql para executar uma consulta SQL
Retornar um DataFrame
scala > val myDF = spark.sql("select * from people")
scala > myDF.printSchema()
scala > myDR.show()

Default : Tabelas HIVE
Arquivo Parquet
Arquivo json

scala > val testDF = spark.sql("SELECT * FROM tabela")
scala > val testDF = spark.sql("SELECT * FROM parquet.'/bd/tabela.parquet' ")
scala > val testDf = spark.sql("SELECT * FROM json.'/bd/tabela.json' ")


-- ### - Consultas e Views - SQL Queries

Exemplos de Consultas
select / where / group by / having / order by / limit / count / sum / mean / as / subqueries

scala > val maAgeDF = spark.sql("SELECT MEAN(age) as mean_age, STDDEV(age) AS sdev_age FROM people WHERE pcode IN (SELECT pcode FROM pcodes WHERE state = 'MA')")

Possibilidade para executar queries em DataFrame e DataSet
São Temporárias
Views Regular - usar em apenas uma seção Spark
Views Global - user em multiplas seções Spark através de uma aplicação SPARK
Criar uma VIEW

DataFrame.createTempView(view-name)
DataFrame.createOrReplaceTempView(view-name)
DataFrame.createGlobalTempView(view-name)

scala > val clienteDF = spark.read.json("cliente.json").createTempView("clienteView")
scala > val tabDF = spark.sql("select * from clienteView").show(10)


-- ### - API Catalog

Explorar tabelas e gerenciar Views
Usar spark.catalog
Funções
listDatabases
Listar banco de Dados
Caso não apareça o BD desejado
problema de configuração do Spark
Importar package

setCurrentDataBase(nomeBD)
Setar o Banco de Dados Padrão de Leitura

listTables
Listar tabelas e views do BD atual
listColumns(nomeTabela)
Listar Colunas de uma tabela ou view
dropTempView(nomeView)
Remover VIEW


scala > val tabDF = spark.sql("select * from bdtest.user").show(10)

scala > spark.catalog.listDatabases.show()
scala > spark.catalog.setCurrentDataBase("bdtest")
scala > spark.catalog.listTables.show()

scala > val tabDF = spark.sql("select * from user").show(10)


-- ### - Exercícios - Spark - API Catalog
-- ### - Correção - Exercícios de Spark - API Catalog

1. Visualizar todos os banco de dados
spark.catalog.
spark.catalog.listDatabases
spark.catalog.listDatabases.show
spark.catalog.listDatabases.show(FALSE)

2. Definir o banco de dados “seu-nome” como principal
spark.catalog.setCurrentDataBase("aula_hive")

3. Visualizar todas as tabelas do banco de dados “seu-nome”
spark.catalog.listTables.show

4. Visualizar as colunas da tabela tab_alunos
spark.catalog.listColumns("tab_alunos").show

5.  Visualizar os 10 primeiros registos da tabela "tab_alunos" com uso do spark.sql
spark.read.table("tab_alunos").show(10)
spark.sql("select * from tab_alunos limit 10").show()


-- ### - SQL Queries vs Operações de DataFrame

Funcionalidade Equivalentes
otimizadas pelo Catalyst Optimizer
Transformação DataFrame
Maior Separabilidade do que as queries
SQL queries
Facilidade em programação com conhecimento apenas em SQL

// Transformação DataFrame
scala > val testDF = spark.read.table("cliente").where("id=10255")

// SQL Queries
scala > val testDF = spark.sql("SELECT * FROM cliente WHERE id = 10255")


-- ### - Exercícios - Spark - SQL Queries vs Operações de DataFrame
-- ### - Correção - Exercícios de Spark - SQL Queries vs Operações de DataFrame

Realizar as seguintes consultas usando SQL queries e transformações de DataFrame na tabela “tab_alunos” no banco de dados <nome>
spark.catalog.listColumns("tab_alunos").show

1. Visualizar o id e nome dos 5 primeiros registros
spark.sql("SELECT * from tab_alunos").show
spark.sql("SELECT id_discente, nome from tab_alunos limit 5").show
spark.read.table("tab_alunos").show

val alunosHiveDF = spark.read.table("tab_alunos")
alunosHiveDF.select("id_discente", "nome").limit(5).show

2. Visualizar o id, nome e ano quando o ano de ingresso for maior ou igual a 2018
spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018").show

alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").show

3. Visualizar por ordem alfabética do nome o id, nome e ano quando o ano de ingresso for maior ou igual a 2018
spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018 order by nome desc").show
spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018").orderBy("nome").show
spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018").orderBy($"nome".desc).show

alunosHiveDF.select("id_discente","nome","ano_ingresso").where("ano_ingresso >= 2018").show

4. Contar a quantidade de registros do item anterior
spark.sql("select id_discente, nome, ano_ingresso from tab_alunos where ano_ingresso >= 2018 order by nome desc").count
spark.sql("select count(id_discente) from tab_alunos where ano_ingresso >= 2018").show
