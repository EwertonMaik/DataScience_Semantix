--################################################################################
--# Big Data Science - Módulo de Introdução as Redes Neurais Artificiais         #
--# Desenvolvido por Ewerton Maik                                                #
--# Data: 25/07/2022                                                             #
--# Alterado por: Ewerton Maik                                                   #
--# Ultima Alteração: 25/07/2022                                                 #
--################################################################################


/*
Redes Neurais (Semana 9)
• Fundamentos de Redes Neurais
• Uso básico de PyTorch
• Uso básico de Keras
• Uso básico de Tensor Flow
*/

Bem-vindas e bem-vindos todos ao nosso módulo de Redes Neurais!
Trabalhamos para trazer pra vocês um conteúdo interessante para despertar o interesse pela área, cuja pesquisa ainda está nos primórdios e é bastante ativa! O curso foi pensado para pessoal que não tiveram contato com redes neurais nem possui um conhecimento profundo sobre otimização matemática, então não se preocupem que para todo ferramental que precisar faremos uma abordagem prévia. Por outro lado, assumimos que vocês já tenham absorvido os conhecimentos do módulo de python e não entraremos em detalhes de implementação, mas qualquer dúvida nos escrevam no fórum que ficaremos felizes em ajudar!

Como pontos principais iremos falar sobre:

A história do desenvolvimento da Neurociência Computacional
Introdução às Redes Neurais Biológicas e Artificiais
O Percéptron
TensorFlow/Keras
Pytorch
 
Desejamos a vocês um bom curso!



-- Introdução as RNAs
Bem-vindos ao nosso primeiro encontro!
Nesta aula vamos fazer uma breve introdução ao assunto das estruturas que conhecemos como redes neurais biológicas, ou seja, aquelas que encontramos nos animais, em contraste com as estruturas matemáticas que nelas se inspiram.
Espero que gostem do conteúdo e qualquer dúvida escrevam-nos no fórum!
Obrigado e boa aula!

--Redes Neurais Artificiais (RNAs)

Definição - Redes neurais artificiais são um grupo interconectado de unidades de processamento
biologicamente inspirados em neuronios biologicos.

--Histórico - A Era de Ouro
Marcadas por promessas e aplicações inalcançáveis para a época, a Era de Ouro do desenvolvimento das redes neurais artificiais foi o primeiro passo para o que temos hoje de avanços neurocomputacionais.
Embasados por conhecimentos anteriores que remontam à Grécia Antiga, psicólogos, médicos, filósofos, matemáticos, dentre outros, saíram de suas áreas para em um esforço conjunto tentar entender como fazemos as coisas que fazemos, como aprendemos, e como nos adaptamos a novas situações como resultado de processos internos e respostas ao ambiente.
Como iremos ver, a grandiosidade dos feitos prometida pelos pesquisadores da área causou um desinteresse geral pelas redes neurais quando tais promessas não foram cumpridas, e apenas algum tempo depois que o interesse na área foi renovado.

--Histórico - Perceptron, o Fim da Era de Ouro e o Hiato
Nesta seção iremos ver o Perceptron, uma máquina fabulosa que implementava com componentes eletrônicos o primeiro modelo de RNAs.

Além disso iremos tratar do descredito em que a área caiu quando as promessas grandiosas da Era de Ouro não foram cumpridas.


-- A Volta dos Mortos Vivos e a Era Criativa
Durante o período de baixo interesse das potências mundiais pela neurocomputação, a continuidade dos estudos por alguns
pesquisadores e por alguns países, principalmente o Japão, despertou um interesse estratégico nas potências ocidentais,
que não queriam ficar para trás. Esse movimento estratégico, e o melhor entendimento do que a neurocomputação poderia realmente fazer,
trouxeram um desenvolvimento meticuloso e organizado que transformaram a agora neurociência computacional em uma área indispensável do conhecimento.

--Continuação da Era Criativa, Deep Learning, Big Data e Modelos Estado-da-Arte
Finalizamos aqui nosso histórico com o desenvolvimento das Deep Neural Networks e outras técnicas estado-da-arte.

Por fim, vamos ver como conjuntos de tecnologias que conhecemos como Big Data permitiu finalmente que modelos da Era Criativa
fossem treinados com a quantidade de dados necessária e apresentassem os resultados que antes tínhamos somente na teoria.


--Exemplos de Aplicações das RNAs em Processamento de Linguagem Natural
Aqui fica um gostinho do que podemos fazer com as redes neurais no campo da linguagem.
Obviamente temos chão para percorrer e também muito o que aprender com nossos colegas linguistas, pedagogos,
fonoaudiólogos, dentre outros, mas vários problemas antes impossíveis de resolver automaticamente estão se mostrando
mais palatáveis com as abordagens da neurociência computacional.

Ah, e para os que tiverem paciência, veremos um exemplo completo na semana do NLP!

-- Leitura adicional
Para os curiosos, segue uma lista com leituras adicionais sobre a área e sua história:

https://aijourn.com/the-history-and-future-of-neural-networks/
https://towardsdatascience.com/the-complete-interesting-and-convoluted-history-of-neural-networks-2764a54e9e76

Anderson JA, Rosenfeld E, editors. Talking nets: An oral history of neural networks. MiT Press; 2000.
Park WJ, Park JB. History and application of artificial neural networks in dentistry. European journal of dentistry. 2018 Oct;12(04):594-601.
Girardi-Schappo M, Tragtenberg MH, Kinouchi O. A brief history of excitable map-based neurons and neural networks. Journal of neuroscience methods. 2013 Nov 15;220(2):116-30.
Cios KJ. Deep neural networks—a brief history. InAdvances in Data Analysis with Computational Intelligence Methods 2018 (pp. 183-200). Springer, Cham.

-- O Neurônio como Unidade Computacional Biológica

Bem-vindos novamente! Hoje iremos aprender um pouco sobre a complexidade biológica das redes neurais.
No final da aula iremos comparar o quão complexo é um neurônio biológico com relação ao seu modelo matemático (artificial).

Iremos abordar aqui o neurônio e suas capacidades bioeletrônicas.


-- Microanatomia Funcional do Neurônio
Iremos iniciar aqui o tema da microanatomia funcional do neurônio e suas propriedades bioquímicas e elétricas.

--Propriedades Elétricas das RNBs
Uma diferença crucial dos neurônios com relação às outras células é a sua capacidade de criar
e transmitir um pulso elétrico. Vamos ver aqui como esse pulso se comporta em seu ciclo de
vida no neurônio.

-- Sinapses
Da neurociência médica sabemos que é principalmente das adaptações nas sinapses entre neurônios é que
derivamos nosso aprendizado e memória. Neste módulo vamos falar um pouco sobre os mecanismos bioquímicos por trás delas

-- A Complexidade das RNBs em Comparação ao Modelo Matemático
Agora que sabemos um pouco sobre a complexidade biológica dos neurônios surge um pergunta pertinente:

podemos comparar a capacidade e complexidade de um neurônio biológico com um neurônio artificial?

Links Interessantes
Alguns links interessantes para os curiosos:

 

Artigo da Nature - How AI and neuroscience drive each other forwards
https://www.nature.com/articles/d41586-019-02212-4

Aprendizados mais próximos do biológico
https://www.quantamagazine.org/artificial-neural-nets-finally-yield-clues-to-how-brains-learn-20210218/

Open Neuroscience Initiative
https://www.austinlim.com/open-neuroscience-initiative

Canadian Open Neuroscience Platform (CONP)
https://conp.ca/

Neuroscience Online, an Open-Access Neuroscience Electronic Textbook
https://nba.uth.tmc.edu/neuroscience/

OpenNEURO - A free and open platform for sharing MRI, MEG, EEG, iEEG, ECoG, ASL, and PET data
https://openneuro.org/

NeuroDATA Without Borders
https://www.nwb.org/example-datasets/

Data-driven database of open neuroscience projects
https://open-neuroscience.com/


Nova Revista aberta da Universidade de Oxford - Aguardando primeira publicação
https://academic.oup.com/oons/pages/About

Curso da Universidade de Duke de Neurociência Médica, muito bom para quem quer se entender com detalhes os mecanismos neurobiológicos.
https://www.coursera.org/learn/medical-neuroscience

-- Introdução e Definições
Hoje iremos - finalmente - colocar a mão na massa! Preparem-se que iremos implementar, treinar e testar um Perceptron do zero. 
Como plataforma do notebook da aula eu utilizei o Google Colab (https://colab.research.google.com (Links para um site externo.)), uma plataforma online
com python, notebook e diversas bibliotecas já configuradas para focarmos apenas no conteúdo da aula.

Sintam-se livres para usar o ambiente local que vocês já criaram para o curso se vocês estão confortáveis com a configuração
do ambiente e instalação de pacotes.

Vou deixar o arquivo do notebook disponível na pasta da aula 3. Para quem usar o colab abra a página inicial do Colab (link acima) e
faça o upload do arquivo ipynb dessa aula (na pasta Aula 3  no menu Arquivos). Instruções na imagem dessa mesma pasta.

Neste vídeo faremos as devidas definições matemáticas do modelo e iremos dar início à implementação. 
Boa aula!

-- Estudo de Caso - Operadores Booleanos
Operadores booleanos são operadores clássicos da lógica bivalorada bastante conhecida pela área de computação. Estamos

falando aqui de operadores como AND, OR, NOT e XOR. Vamos discutir um pouco de como um classificador binário como o Perceptron

pode implementar alguns desses operadores.

-- Descobrindo os Pesos da Rede e o Problema do XOR
Continuação dos operadores, observações da reta de separação de classes e o problema XOR.

-- Resolucao do Problema XOR - Parte 1
Tentem realmente antes de ver a explicação!!!

-- Treinamento de Redes Neurais - Teoria
Vamos nos preparar para dar vida própria ao nosso Perceptron! Mas antes, vamos ver
algumas modalidades de treinamento de algoritmos de Redes Neurais ou Aprendizado 
de Máquina em geral.

-- Regra de Aprendizado do Perceptron e Implementação
Nesse vídeo vamos ver a regra de aprendizado do Perceptron e a implementação de tal regra em uma classe própria.

-- reinamento - Resolução Automática do OR
Aplicação da classe implementada para modelar o operador OR.

Tentem fazer o mesmo para os outros operadores, em especial para o XOR, e nos contém o que aconteceu :D

--Exercícios Perceptron

Nesse vídeo proponho alguns tópicos para vocês pensarem a respeito, discutirem entre si e chegarem juntos em uma solução. Chamamos
aqui de exercícios por falta de uma palavra melhor, pois nossa ideia é apenas fazê-los pensar a respeito de como melhorar nosso modelo e 
também nosso entendimento do processo de treinamento.
Aqueles que forem resolvendo coloquem seus achados e respostas no fórum para compartilhar com os colegas!
Vale frizar, esses exercícios não valerão nota nem são obrigatórios (e nem terão respostas, apenas discussão no fórum). Estão aqui apenas para ajudá-los :)

-- Introdução ao Tensorflow
Salve!
Nesta aula iremos tratar do Tensorflow, um framework de machine learning bastante utilizado na indústria e na pesquisa. 
Aproveitem, naveguem junto comigo e explorem no site a documentação e exemplos disponibilizados, eles ajudam
e muito no dia-a-dia.
Vale a dica aqui: bons projetos sempre são bem documentados!
Boa aula!

-- Introdução ao Tensorflow
Salve!
Nesta aula iremos tratar do Tensorflow, um framework de machine learning bastante utilizado na indústria e na pesquisa. 
Aproveitem, naveguem junto comigo e explorem no site a documentação e exemplos disponibilizados, eles ajudam
e muito no dia-a-dia.
Vale a dica aqui: bons projetos sempre são bem documentados!
Boa aula!

-- Estudo de Caso: Classificação de Imagens no AIRBNB
Encontramos no portfólio do Tensorflow diversos casos de uso de grandes empresas. Vamos
acompanhar aqui uma aplicação do AIRBNB em processamento de imagens,


--Definições, Colab e Dados Utilizados
Vamos aprender a utilizar a ferramenta na prática!
Neste notebook vamos acompanhar a aplicação do Tensorflow na classificação de imagens,
que passa por todas as etapas de um pipeline comum: carregamento dos dados, exploração,
preprocessamento, treinamento, teste e uso do modelo treinado.

-- Exploração
Exploração dos dados. Neste exemplo nossos dados estão bem limpos, possuem a mesma dimensão, ou seja,
estamos no melhor dos mundos. Em geral, as bases de dados tem de tudo, imagens ruins, vários
objetos na mesma figura, ruído e imagens de diferentes tamanhos. Nesta etapa, precisamos
entender bem nossos dados para que na próxima etapa possamos deixá-los prontos para o modelo.

-- Preprocessamento
Agora já conhecemos nossos dados e vamos tratá-los nesse módulo. Novamente iremos
fazer poucos ajustes pois nossos dados são bem comportados e limpos.
No caso mais comum, poderíamos até usar outro modelo (rede neural, filtros clássicos....) para
filtrar o ruído dos dados, outro para extrair características das imagens e treinar o modelo
principal não na imagem mas sim nos vetores de características extraídas, dentre outras coisas.
Esse passo é crucial para o bom desempenho do modelo, como vimos no caso do AIRBNB.

-- Preprocessamento - Camada de Transformação

-- Overfitting
Precisamos falar sobre Overfitting

-- Construção do Modelo
Vamos montar nossa rede neural, ou seja, especificar a arquitetura (neurônios de 
entrada, camadas escondidas e de saída) além de qualquer outra camada adicional
de processamento, se necessário.

-- Compilação do Modelo

-- Treinamento

-- Previsões
Podemos usar o vetor de saída da nossa rede para fazer previsões ao invés de classificação "dura".
Por exemplo, podemos ter um vetor com as previsões de a entrada pertencer a cada classe.  Além
disso, podemos usar esse vetor como entrada para outro modelo! Não que a gente vá fazer isso aqui....
mas lembrem-se que podemos usar nosso modelo apenas como parte de outro modelo maior ou até fazer
um comitê de modelos diferentes e fazer uma votação para ter a melhor resposta!

-- Como utilizar o modelo treinado

Treinamos um modelo por um motivo: usá-lo em algum processo. Vamos dar um
exemplo de como podemos usar nosso modelo em uma imagem avulsa.

1. Professor fala na aula sobre um artigo explicando a categorização de fotos do Airbnb, quem quiser ler o artigo , segue o link :

                               https://medium.com/airbnb-engineering/categorizing-listing-photos-at-airbnb-f9483f3ab7e3 (Links para um site externo.)

2. Link para artigo científico para o modelo ResNet50 :

                             Deep Residual Leaning for Image Recognition   https://arxiv.org/pdf/1512.03385.pdf (Links para um site externo.)

3. E para quem tiver interesse em ler um livro (gratuito) sobre matemática para machine learning :

                             https://mml-book.github.io/book/mml-book.pdf (Links para um site externo.) 
							 


-- Pytorch: Introdução
Observação Importante! Essa aula é uma atividade extra e seu conteúdo não irá cair na prova.
Por outro lado, esperamos que vocês sigam os tutoriais e coloquem suas dúvidas e comentários no fórum!

Vimos na aula anterior o Tensorflow, um framework de aprendizado de máquina bastante popular na indústria.
Como parte do escopo, vamos deixar aqui uma introdução e referências do PyTorch, outro framework de aprendizado de máquina mantido pelo Facebook [PyTorch],
(Links para um site externo.) que, segundo o próprio site é:

"An open source machine learning framework that accelerates the path from research prototyping to production deployment."

A princípio estamos falando de uma estrutura que se propõe a fazer o mesmo que o TensorFlow.
Várias comparações são feitas e é difícil escolher o melhor. Deixamos aqui o link (Links para um site externo.) de um artigo que se propõe a
comparar os dois frameworks.

No momento da preparação do material dessa aula, implementar modelos de machine learning com PyTorch não era tão simples como
com o TensorFlow/Keras, por isso tínhamos decidido não abordar o tema, de maneira a evitar confusão. No entanto, como um equivalente do Keras,
o PyTorch agora possuí o PyTorch Lightning. (Links para um site externo.) Com ele a escrita de modelos ficou tão simples quanto com o Keras.
Vale a pena seguir aqui alguns tutoriais da própria página do Lightning [Tutoriais].

https://pytorch.org/
https://towardsdatascience.com/pytorch-vs-tensorflow-2021-d403504d7bc3
https://www.pytorchlightning.ai/
https://www.pytorchlightning.ai/tutorials

-- Transfer Learning com Pytorch
A seguir colocamos a referência de um tutorial do PyTorch que implementa um modelo de classificação de imagem baseado em uma rede convolucional pré-treinada.
Para os que não conhecem, recomendo antes de pular para o tutorial do PyTorch dar uma olhada na teoria das redes convolucionais
[link (Links para um site externo.)], que tem obtido bons resultados em problema com imagens,
e também na teoria e definição do Transfer Learning  [link (Links para um site externo.)], no qual um modelo treinado para uma tarefa é reutilizado em outra tarefa, em geral relacionada. 

Para os que forem seguir o tutorial, sugiro seguir o link do colab, assim como fizemos no TensorFlow:
PyTorch TL Tutorial (Links para um site externo.).

https://en.wikipedia.org/wiki/Convolutional_neural_network
https://en.wikipedia.org/wiki/Transfer_learning
https://pytorch.org/tutorials/beginner/transfer_learning_tutorial.html

-- Pytorch - Como Preparar o seu Modelo para a Produção
Selecionei este tutorial para chamar a atenção de um passo importante da criação do modelo: colocá-lo em produção!
Existem diversas maneiras de expor um modelo à outras partes do projeto, como o frontend, backend,
ou até mesmo outro modelo. Vamos ver aqui como criar uma interface (API) do tipo REST [link (Links para um site externo.)],
que usa representação do tipo http://api.example.com/ (Links para um site externo.) e métodos html como PUT, GET, DELETE...
para se comunicar com módulos externos: PyTorch com uma API REST - Tutorial. (Links para um site externo.)

 
Fica aqui também a referência de como criar um serviço REST para qualquer projeto em python com o Flask [link (Links para um site externo.)]
e o FastAPI [link (Links para um site externo.)].

https://en.wikipedia.org/wiki/Representational_state_transfer
http://api.example.com/
https://pytorch.org/tutorials/intermediate/flask_rest_api_tutorial.html
https://www.analyticsvidhya.com/blog/2020/04/how-to-deploy-machine-learning-model-flask/
https://towardsdatascience.com/deploying-your-first-machine-learning-api-1649236c695e


-- Papers e Tópicos Interessantes de Pesquisa (nov/2021)
Facebook AI (Links para um site externo.) 

 

A-rapid-and-efficient-learning-rule-for-biological-neural-circuits (Links para um site externo.) 

 

Referências histórico

https://aijourn.com/the-history-and-future-of-neural-networks/ (Links para um site externo.)

 (Links para um site externo.)https://towardsdatascience.com/the-complete-interesting-and-convoluted-history-of-neural-networks-2764a54e9e76 (Links para um site externo.)

 

Anderson JA, Rosenfeld E, editors. Talking nets: An oral history of neural networks. MiT Press; 2000.
Park WJ, Park JB. History and application of artificial neural networks in dentistry. European journal of dentistry. 2018 Oct;12(04):594-601.
Girardi-Schappo M, Tragtenberg MH, Kinouchi O. A brief history of excitable map-based neurons and neural networks. Journal of neuroscience methods. 2013 Nov 15;220(2):116-30.
Cios KJ. Deep neural networks—a brief history. InAdvances in Data Analysis with Computational Intelligence Methods 2018 (pp. 183-200). Springer, Cham.

 

 

Artigo da Nature - How AI and neuroscience drive each other forwards
https://www.nature.com/articles/d41586-019-02212-4 (Links para um site externo.)

 

Aprendizados mais próximos do biológico
https://www.quantamagazine.org/artificial-neural-nets-finally-yield-clues-to-how-brains-learn-20210218/ (Links para um site externo.)

 

Open Neuroscience Initiative
https://www.austinlim.com/open-neuroscience-initiative (Links para um site externo.)

 

Canadian Open Neuroscience Platform (CONP)
https://conp.ca/ (Links para um site externo.)

 

Neuroscience Online, an Open-Access Neuroscience Electronic Textbook
https://nba.uth.tmc.edu/neuroscience/ (Links para um site externo.)

 

OpenNEURO - A free and open platform for sharing MRI, MEG, EEG, iEEG, ECoG, ASL, and PET data
https://openneuro.org/ (Links para um site externo.)

 

NeuroDATA Without Borders
https://www.nwb.org/example-datasets/ (Links para um site externo.)

 

Data-driven database of open neuroscience projects
https://open-neuroscience.com/ (Links para um site externo.)

 

Nova Revista aberta da Universidade de Oxford - Aguardando primeira publicação
https://academic.oup.com/oons/pages/About (Links para um site externo.)

 

Curso da Universidade de Duke de Neurociência Médica, muito bom para quem quer se entender com detalhes os mecanismos neurobiológicos.
https://www.coursera.org/learn/medical-neuroscience (Links para um site externo.)


Mais Referência da Aula 3

https://home.csulb.edu/~cwallis/artificialn/History.htm (Links para um site externo.)
https://news.cornell.edu/stories/2019/09/professors-perceptron-paved-way-ai-60-years-too-soon (Links para um site externo.)

 

Regras de Aprendizado
https://en.wikipedia.org/wiki/Learning_rule (Links para um site externo.)


Referências interessantes

Brain Facts - Site interessantíssimo de artigos curtos de divulgação sobre neurociências
https://www.brainfacts.org/ (Links para um site externo.)

 

NLP
https://www.scielo.br/j/ea/a/63sbv5qSnnrqg8WpVwpgXzD/?lang=pt (Links para um site externo.)

 

Deep Mind - Learning Rule
https://deepmind.com/research/publications/2021/A-rapid-and-efficient-learning-rule-for-biological-neural-circuits
