--################################################################################
--# Big Data Science - Módulo de Algoritmos Genéticos                            #
--# Desenvolvido por Ewerton Maik                                                #
--# Data: 10/08/2022                                                             #
--# Alterado por: Ewerton Maik                                                   #
--# Ultima Alteração: 10/08/2022                                                 #
--################################################################################


/*
Algoritmos Genéticos (Semana 11)

• Conceitos de AG
• Problema básico AG
• Aplicações
• Desenvolvimento em Python
• Bibliotecas de AG

*/

-- Professor - Rodrigo Augusto Reboucas
-- Emenda

Conceitos
Funcionamento
aplicações
Desenvolvimento em Python
Bibliotecas de AG
Exemplo prático de Otimização


Exercício - AG com PyGAD

1- Resolver o problema abaixo com Algoritmo Genético

Encontrar os valores de w1, w2, w3, w4, w5 e w6 para a seguinte equação

y = w1.x1 + w2.x2 + w3.x3 + w4.x4 + w5.x5 + 6w.x6
onde (x1,x2,x3,x4,x5,x6)=(-6, 5, 3.2, 7.8, -15, 9.4) e y=50


-- #######

!pip install pygad

import pygad
import numpy

imput_x  = [-6, 5, 3.2, 7.8, -15, 9.4]
output_y = 50

def fitness_func(solution, solution_idx):
	output = numpy.sum(solution * input_x)
	fitness = 1.0 / (numpy.abs(output - output_y) + 0.000001 )
	
	return fitness

ga_instance = pygad.GA(
	num_generations 	= 100,
	sol_per_pop		= 10,
	num_genes 		= 6,
	num_parents_mating 	= 2,
	fitness_func 		= fitness_func,
	mutation_type 		= "random"
)

ga_instance.run()
ga_instance.plot_result()

solution, solution_fitness, solution_idx = ga_instance.best_solution()
print("Parametros da melhor solução : {solution}".format(solution = solution) )

prediction = numpy.sum( numpy.array(input_x) * solution )
print("Predição da saida da melhor solução : {prediction}".format(prediction = prediction) )
