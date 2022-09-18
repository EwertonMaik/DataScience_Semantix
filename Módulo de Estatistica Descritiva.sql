--################################################################################
--# Big Data Science - Módulo de Estatistica Descritiva                          #
--# Desenvolvido por Ewerton Maik                                                #
--# Data: 11/07/2022                                                             #
--# Alterado por: Ewerton Maik                                                   #
--# Ultima Alteração: 11/07/2022                                                 #
--################################################################################


/*
Estatística Descritiva (Semana 7)
• Aplicando medidas de dispersão (Média, Mediana, Moda, Quartis, Desvio padrão e variância) para descrever dados
• Usando correlação e covariância para descrever relações entre features
• Histograma para descrever distribuição de dados
• Probabilidade de eventos simples
• Teorema de Bayes aplicado a raciocinico de inferência
• Amostragem para representatividade estatisitica
• Apresentação de Distribuição de Probabilidade
• O uso de Likelihood

*/

-- Professora - Talita Costa Dias

-- ### Conceitos Básicos
Ementa
Neste tópico, você aprenderá
Quais quantidades numéricas você pode usar para descrever e resumir seus conjuntos de dados
Como obter estatisticas descritivas com biblioteca Python
Como visualizar seus conjuntos de dados

-- Hipóteses
Dois tratamentos, experimental e controle, tem a mesma eficácia no tratamento do cancêr
A obesidade é um fator de risco na morte por COVID-19
O numero de vacinados teve aumento significativo de um mês para o outro

-- Objetivo da Análise de Dados
Entender o que aconteceu e o que esta acontecendo
Prever o que vai acontecer no futuro ou circunstâncias que ainda não conhecemos
Guiar a tomada de decisão

-- Estatística Descritiva
Conjunto de Técnicas
Objetivo - Descrever, resumir e representar os dados visualmente.
Gerar insights sobre o fenômeno em análise.

-- População
Conjunto de pessoas, objetos, transações... que possuem caracteristicas que estamos interessados em estudar.

-- Amostra
Subconjunto representativo de uma população.
Unidade Amostral - Objetivo sobre o qual coletamos informações.
Variável - Caracteristica de uma unidade amostral.

Outliers ou Valores Atípicos
Ponto de dados que difere significativamente da maioria.
Variação natural nos dados
Mudança no comportamento do sistema observado
Erros na coleta de dados

-- Natureza das variáveis
Qualitativa - descreve qualidades
Nominal - Sem ordenação
Região Geografica
Estado Civil

Ordinal - Com ORdenação
Grau de Instrução
Estágio de uma Doença

-- Quantitativa
Descreve quantidades
Discreta - Processoss de Contagem - Valores finitos em um intervalo.
# Sementes germinadas / área
# Pacientes que se recuperam / semana

-- Contínua - Processos de medição - Valores infinitos em um intervalo
Rendimento / mês de investimento
Consumo / mês de energia
CRISP - DM - Cross industry Standard Process for Data Mining

-- ### Medidas de Posição ou Localização

Medidas-Resumo
Caracteristicas importantes de qualquer conjunto de dados
Centro / Variação / Distribuição / Valores atípicos

Medidas de Posição ou Localização
Média - Ponto de equilibrio
mediana - Centro dos dados
moda - Ponto de concentração
Quantis - Caracterização da distribuição dos dados

Vantagens
Tem boas propriedades estatisticas
Facilidade de cálculo e compreensão

Desvantagens
Influencia por valores atípicos
Bastante afetada por distribuições assimetricas
Só pode ser calculada para dados quantitativos

-- Mediana
Vantagens
mais resistente a valores atípicos
Pouco afetada por distribuições assimetricas

Desvantagens
Menos conhecida que a média
Não tem boas propriedade estatísticas.

Moda - É o valor mais frequente da amostra. Uma amostra pode ter uma moda, mais de uma moda, ou a moda pode não existir
vantagens
Não existe cálculo, apenas contagem
Pode ser determinada também para variáveis qualitativa

Desvantagens
Deixa sem representação todos os valores do conjunto de dados que não forem iguais a ela
Não tem boas propriedades estatísticas

Dedidas de Assimetria
Distribuição simétrica - média = mediana = moda
Distribuição Assimétrica à direita: moda < mediana < média
Distribuição assimetrica à esquerda: media <mediana < moda

Quando usar a média, mediana ou moda
Média - Maior eficiencia quando simétrica for a distribuição
Mediana - Mesmo com valores assimétricos em todo da média, ele será o centro da distribuição
Moda - Quando o interesse é conhecer os valores que aparecem com maior frequencia

Quantis ou Separatrizes
Indicam limites para proporções de observações em um conjunto

Quartis - dividem o conjunto de dados em 4 partes iguais
Devis - dividem o conjunto de dados em 10 partes iguais
Percentis - dividem o conjunto de dados em 100 partes iguais

-- ### Medidas de Dispersão
Indicam o quanto os valores diferem entre si ou quanto eles se afastam da média
Amplitude / Desvio- Padrão / Variância / Coeficiente de Variação

Amplitude

Desvantagens
Pouco precisa
Extramamente influenciada por valores discrepantes

Variância Amostral

Vantagens
Facilidade de compreensão
Propriedades estatísticas importantes para inferência
Considera o desvio ..., que mede o quanto cada valor desvia da média

Desvantagens
Calculada a partir da média, medida pouco resistente, ou seja, muito influenciada por valores atipicos
Interpretação dificil, pois o valor da variância é a unidade de medida da variável ao quadrado.
Ou seja, se a variável y é a altura em cm dos estudantes, então a variância será cm²

Desvio-padrão amostral
surge para solucionar o problema de interpretação da variância

Significado : Variação média em torno da média aritmética

Coeficiente de Variação (CV)
O coeficiente de variação (amostral) é representado por

Medida de variabilidade relativa à média
É uma medida adimensional, e geralmente apresentada na forma de porcentagem
Ideal para comparar a variabilidade de variáveis com unidade de medidas diferentes

Exemplo:

Alguns autores consideram as seguintes regras:
Baixa Dispersão : CV < 15%
Média : 15% =< CV < 30%
Alta : CV >= 30%


-- ### Medidas de Associação
Quando o interesse é avaliar o comportamento conjunto de duas variáveis

Qual o tipo de relacionamento entre elas
qual a intensidade da relação

exemplos:
Relação entre a altura dos pais X e altura dos filhos Y
Relação entre renda familiar X e numero de filhos Y

--Covariância
Representa o quanto X e Y estão variando em conjunto
Covariância Positiva: Relação entre X e Y na mesma direção
Covariância Negativa: Relação entre X e Y na direção contrária

--Coeficiente de correlação de Pearson
Deve ser calculado quando existe uma relação linear entre X e Y
Intepretação:
r positivo = correlação positiva ou direta entre X e Y
r negativo = correlação negativa ou inversa entre X e Y
Ausência de correlação (não implica em independência) : r = 0
Fraca : 0 < r =< 0,4
regular : 0,4 < r =< 0,6
Boa : 0,6 < r =< 0,8
Alta : CV > 0,8
Perfeita : r = 1

--Correlação não implica em Casualidade

O coeficiente de correlação não mede a relação causa e efeito entre as variáveis, mas essa relação pode esta presente.
Exemplo : forte relação positiva entre as venda anuais de chicletes e a taxa de criminalidade nos 

desvantagem
Por ser em função da média é altamente afetado por valores atípicos.

Coeficiente de Correlação de Spearman
É igual ao Coeficiente de pearson aplicado aos valores da ordem de duas variáveis

Vantagens
Não é possível a assimetria e nem a valores atípicos
Mede relações lineares e não-lineares

Desvantagem
Quando temos muitas observações com a mesma ordem (Coeficiente de Correlação de kendall)

Regra geral para escolha da medida mais adequada
Qual o objetivo de aálise
A medida é intuitiva e facil de interpretar
Existem valores que possam afetá-la
A análise é meramente descritiva ou pretende-se fazer inferência


-- ### Aplicação 1

Pratica Medidas-Resumo
import statistics
import numpy as np
import pandas as pd

1 - Média
dados = [28, 12, 2.5, 4, 1]
dados_sem_outlier_1 = [12, 2.5, 4, 1]
dados_sem_outlier_2 = [2.5, 4, 1]

dados_mean = statistics.mean(dados)
mean_sem_outlier_1 = statistics.mean(dados_sem_outlier_1)
mean_sem_outlier_2 = statistics.mean(dados_sem_outlier_2)

print('Média: \n', dados_mean)
print('Média sem Outlier 1: \n', round(mean_sem_outlier_1, 2) )
print('Média sem Outlier 2: \n', round(mean_sem_outlier_2, 2) )

Média : 9.5
Média sem Outlier 1: 4.88
Média sem Outlier 2: 2.5

--#######

dados_med = statistics.median(dados)
med_sem_outlier_1 = statistics.median(dados_sem_outlier_1)
med-sem_outlier_2 = statistics.median(dados_sem_outlier_2)

print('Mediana: \n', dados_med)
print('Mediana sem Outlier 1: \n', med_sem_outlier_1)
print('Mediana sem Outlier 2: \n', med_sem_outlier_2)

Mediana: 4
Mediana sem Outlier 1: 3.25
Mediana sem Outlier 2: 2.5

2 - Variancia
# populacional coloca o p
var_dados == round(statistics.variance(dados), 2 )
var_dados_sem_outlier_1 = round(statistics.variance(dados_sem_outlier_1), 2 )
var_dados_sem_outlier_2 = round(statistics.variance(dados_sem_outlier_2), 2 )

print('Variância: \n', var_dados)
print('Variância sem Outlier 1: \n', var_dados_sem_outlier_1)
print('Variância sem Outlier 2: \n', var_dados_sem_outlier_2)

Variância: 125.0
Variância sem Outlier 1: 24.06
Variância sem Outlier 2: 2.25

var_dados_pop = round(statistics.pvariance(dados), 2)
print('Variância: \n', var_dados_pop)

Variância: 100.0

-- # Populacional coloca o p
std_dados = round(statistics.stdev(dados), 2)
std_dados_sem_outlier_1 = round(statistics.stdev(dados_sem_outlier_1), 2)
std_dados_sem_outlier_2 = round(statistics.stdev(dados_sem_outlier_2), 2)

print('Desvio Padrão: \n', std_dados) -- 11.18
print('Desvio Padrão sem Outlier: \n', std_dados_sem_outlier_1) -- 4.91
print('Desvio Padrão sem Outlier: \n', std_dados_sem_outlier_2) -- 1.5

dados = [28, 12, 2.5, 4, 1]
dados_sem_outlier_1 = [12, 2.5, 4, 1]
dados_sem_outlier_2 = [2.5, 4, 1] # Em média, cada elemento desse conjunto esta se distanciando da média de 1,5 unidades.

statistics.mean(dados_sem_outlier_2)

-- ### Aplicação 2

3 - Moda
u = [2, 3, 2, 8, 12]

moda_1 = statistics.mode(u)
moda_2 = statistics.multimode(u)

print('Moda_1: \n', moda_1)
print('Moda_2: \n', moda_2)

v = [1, 1, 2, 3, 2, 8, 12, 12]

moda_1 = statistics.mode(v)
moda_2 = statistics.multimode(v)

print('Moda_1: \n', moda_1)
print('Moda_2: \n', moda_2)

4 - Quantis (Partes iguais)

x = [-5.0, -1.1, 0.1, 2.0, 8.0, 12.8, 21.0, 25.8, 41.0]

di = statistics.quantiles(x, n = 10, method = 'inclusive' )
qi = statistics.quantiles(x, n = 4, method = 'inclusive')

print('Decis: \n', di)
print('Quartis: \n', di)

5. Matriz de Covariância

x = list( range(-10, 11) )
y = [0, 2, 2, 2, 2, 3, 3, 6, 7, 4, 7, 6, 6, 9, 4, 5, 5, 10, 11, 12, 14]
x_, y_ = np.array(x), np.array(y)
x__, y__ = pd.Series(x_), pd.Series(y_)

cov_matrix = np.cov(x_, y_)
cov_matrix

# Elementos da Matriz
var_x  = cov_matrix[0, 0]
var_y  = cov_matrix[1, 1]
cov_xy = cov_matrix[0, 1]
#cov_xy = cov_matrix[1, 0]

print('Variância de x: \n', var_x)
print('variância de y: \n', round(var_y, 2) )
print('Covariância de x e y: \n', cov_xy)

# Dados em Série
cov_xy_1 = x__.cov(y__)
cov_xy_2 = y__.cov(x__)

print('Covariância de x e y: \n', cov_xy_1)
print('Covariância de x e y: \n', cov_xy_2)

6 - Matriz de Correlação

corr_matrix = np.corrcoef(x_, y_)
corr_matrix

# Elementos da matriz

r = corr_matrix[0, 1]
#r = corr_matrix[1, 0]

print('Correlação entre x e y: \n', round(r, 2) )

# Dados em Serie

r_1 = x__.corr(y__)
r_2 = y__.corr(x__)

print('Correlação entre x e y: \n', round(r_1, 2) )
print('Correlação entre x e y: \n', round(r_2, 2) )

7 - Coeficiente de Variação

CV_idade  = (0.82 / 41.6) * 100
CV_altura = (0.2 / 1.67) * 100

print(f'Coeficiente de Variação de idade:: {CV_idade:.1f}'"%")
print(f'Coeficiente de Variação de altura:: {CV_altura:.1f}'"%")

--- ### Análise Gráfica

1 Histograma
Estudo de variáveis quantitativas, principalmente as contínuas.
Distribuição de frequência por intervalo.
Comportamento de variáveis.
Propor distribuição teóricas com objetivo de fazer modelagem.

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy.stats import pearsonr

np.random.seed(seed)
x = np.random.normal(size = 1000)
y = np.random.gamma(2, 2, 1000)
z = np.random.weibull(10.,1000)

fig, ax = plt.subplots(1, 3, figsize = (10, 5) )
plt.tight_layout(2)

sns.distplot(x, bins = 10, ax = ax[0], color = 'darkviolet').set_title('X')
sns.distplot(y, bins = 10, ax = ax[1]).set_title('Z')

Text(0.5, 1.0, 'Z')

2 - BoxPlot

Visualização Baseada em Quartis
Estudo de variáveis quantitativas
Relação entre variáveis quantitativas e qualitativas
Comportamento das variáveis
Visualização de outliers

fig, ax = plt.subplots(1, 3, figsize = (15, 5) )
plt.tigth_layout(2)

sns.boxplot(x, ax = ax[0], showmeans = True, color = 'darkviolet' ).set_title('X')
sns.boxplot(y, ax = ax[1], showmeans = True).set_title('Y')
sns.boxplot(z, ax = ax[2], showmeans = True, color = 'volet').set_title('Z')

-- ### Diagrama de Dispersão
Relação e intensidade entre duas variáveis quantitativas

--- ### Revisão
Prática Análise de Dados

import pandas as pd
import numpy  as np
import seaborn as sns
import statistics as sts
import matplotlib.pyplot as plt

df = pd.read_csv("churn.csv")
df.head()

df = df.drop(columns = ['Patrimonio', 'Produtos'] )
df.head()

def show_info(data):
	print('DATASET SHAPE: ', data.shape, '\n')
	print('-'*50)
	print('FEATURE DATA TYPES:')
	print(data.info() )
	print('\n', '-'*50)
	print('NUMBER OF UNIQUE VALUES PER FEATURE:', '\n')
	print(data.nunique() )
	print('\n', '-'*50)
	print('NULL VALUES PER FEATURE')
	print(data.isnull().sum() )

show_info(df)

-- ### Análise Descritiva
df.COLUMNS

df["Cartao_Credito"] = df["Cartao_Credito"].map({ 0 : 'Não', 1 : 'Sim'})
df["Ativo"] = df["Ativo"].map({ 0 : 'Não', 1 : 'Sim'})
df["Churn"] = df["Churn"].map({ 0 : 'Não', 1 : 'Sim'})

numerical = ['Score', 'Idade', 'Saldo', 'Salario']

#Substituir
df.loc[ (df['Idade'] == 0, 'Idade') ] = sts.median( df['Idade'] )

df[numerical].describe().round(2).T


CV_Score	= sts.stdev(df['Score'])/sts.mean(df['Score'])
CV_Idade 	= sts.stdev(df['Idade'])/sts.mean(df['Idade'])
CV_Saldo 	= sts.stdev(df['Saldo'])/sts.mean(df['Saldo'])
CV_Salario      = sts.stdev(df['Salario'])/sts.mean(df[Salario])

print('CV_Score:   \n', round(CV_Score,   2) )
print('CV_Idade:   \n', round(CV_Idade,   2) )
print('CV_Saldo:   \n', round(CV_Saldo,   2) )
print('CV_Salario: \n', round(CV_Salario, 2) )

Perfil dos Clientes
A idade dos clientes varia de 18 á 82 anos.
Com média de 39 e 75% tem idade até 44 anos.
53% são homens
48% são do Rio Grande do Sul
70% possuem cartão de crédito
51% estão ativos
25% possuem score entre 721 e 850

df['Estado'].value_counts(normalize = True)

df['Genero'].value_counts(normalize = True)

df['Cartao_Credito'].value_counts(normalize = True)

df['Ativo'].value_counts(normalize = True)

sns.countplot( df['Churn'], palette = 'magma' ).set_title('Churn')

Text(0.5, 1.0, 'Churn')
Text(0.5, 1.0, 'Idade')

sns.boxplot(df['Idade'], showmeans = True).set_title('Idade')

Text(0.5, 1.0, 'Idade')

-- ### Análise Biváriada

Será que estamos perdendo mais clientes algum estado
sns.countplot( df['Estado'], hue = df.Churn, palette = 'Blues' )

Será que a idade pode influenciar na perda de clientes
sns.boxplot(data = df, x = "Churn", y = "Idade", palette = 'flare')

sns.boxplot(x = "Estado", y = "Idade", hue = "Churn", data = df, palette = 'flare')


va_correlacao = df[ ['Score', 'Idade', 'Saldo', 'Salario', 'Churn'] ]
va_correlacao.corr()

plt.figure(figsize = (10,7) )
sns.pairplot(data = va_correlacao, hue = "Churn")

-- ### Exercício de Analise Descritiva

Um grande banco tem o objetivo de desenvolver um modelo para identificar maior probabilidade de default.
Sua tarefa será realizar uma análise descritiva e tratamento dos dados para entender o perfil dos clientes e
quais fatores podem influenciar no risco de crédito.
Link - $CANVAS_COURSE_REFERENCE$/file_ref/g662390d335267696c59d7020ea622b63/download?download_frd=1

-- ### Correção de Exercícios

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import missingno as msno
import warnings
warnings.filterwarnings("ignore")

Seção 1 - Importando Arquivos
df = pd.read_csv('risco_credito.csv')
df.head()

def show_info(data):
	print('DATASET SHAPE: ', data.shape, '\n')
	print('-'*50)
	print('FEATURE DATA TYPES:')
	print(data.info())
	print('\n', '-'*50)
	print('NUMBER OF UNIQUE VALUES PER FEATURE:', '\n')
	print(data.nunique())
	print('\n', '-'*50)
	print('NULL VALUES PER FEATURE')
	print(data.isnull().sum() )

show_info(df)

Seção 2 - Tratamento dos dados 1

msno.bar(df)

1 - Exclusão das linhas referentes a default que estão nulas
df = df.dropna( subset = ["default"] )

2 - Pelo resumo das variáveis quantitativas, o ideal é substituir os valores faltantes
do limite de crédito e do número de empréstimos com inadiplência pela mediana
df.describe()

valores_preenchimento = {'limite_credito': df['limite_credito'].median(), 'n_emprestimos_inadiplentes': df['n_emprestimos_inadiplentes'] }

3 - Substituindo as qualitativas pela moda
df['genero'].value_counts()

df['perfil_facebook'].value_counts()

df['signo'].value_counts()

df['genero'] = df['genero'].fillna( df['genero'].mode()[0] )
df['perfil_facebook'] = df['perfil_facebook'].fillna( df['perfil_facebook'].mode()[0] )

df.isnull().sum()

Seção 3 - Análise exploratória e tratamento dos dados 2
1 - Variáveis Qualitativas

va_nominal = ['object', 'bool']
qualitativas = list(df.select_dtypes(include = va_nominal).columns )
qualitativas

df_quali = df[qualitativas]
df_quali.head()

for va_nominal in df_quali:
	print(va_nominal)
	sns.countplot( df_quali[va_nominal], palette = 'flare' )
	plt.show()

1 - A variável resposta (Default) possui classes desbalanceadas
2 - Signo, as classes possuem contagens bem parecidas, só se destacando as contagens dos
desconhecidos que representa 31% dos dados, logo vou preferir apagar essas coluna
do que perder informação dessas linhas.
3 - Genero, o desenvolvimento será substituído por masculino, pois possui uma frequencia bem superior
4 - Perfil_facebook, o desconhecido será substituído por falso.

df = df.drop(columns = ['signo'])
df.info()

df.describe()

va_quantitativa = ['float64']
quantitativas = list(df.select_dtypes(include = va_quantitativa).columns )
quantitativas #tirar n_bankruptcies, n_defaulted_loans,

df_quanti = df[quantitativas]

for va_quantitativa in df_quanti:
	print(va_quantitativa)
	df_quanti[va_quantitativa].hist(bins = 10)
	plt.show()

t_risco

valor_emprestimo

prazo_pagamento

limite_credito

renda

n_emprestimos_inadiplentes

plt.figure(figsize = (20,5))
plt.title('correlação entre as features', size = 15)
sns.heatmap(df_quanti.corr(), cmap = 'flare', center = 0, annot = True )

plt.figure(figsize = (15,7) )
sns.pairplot(data = df, hue = 'default')

df.head()

4 - Transformando em variáveis binárias

df = pd.get_dummies(df, columns = ['prazo_pagamento', 'genero', 'perfil_facebook', 'default'], drop_first = True )
df.head()

5 - Substituíndo outlier por quantil

sns.boxplot(data = df, x = "default_True", y = "t_risco", palette = 'flare')

out_max = df['t_risco'].quantile(0.975)
out_max

df.loc[df['t_risco'] > out_max, 't_risco'] = out_max

out_min = df['t_risco'].quantile(0.025)
out_min

df.loc[df[t_risco] < out_min, 't_risco'] = out_min

sns.boxplot(data = df, x = "default_True", y = "t_risco", palette = 'flare')
