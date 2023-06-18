# ML-PUCP
En este repositorio se esta adjuntando diferentes tipos de entrenamiento.

## 1. Caso Paper:
  Se esta considerando como referencia el paper Obesity Level Estimation based on Machine Learning Methods and Artificial Neural Networks.
  Los integrantes del paper consideran los siguientes pasos para el entrenamiento del dataset:
   - No se especifica limpieza de data, por ejemplo que involucre eliminar data duplicada. Se realiza el entrenamiento con los 2111 datos.
   - Se usa un K=10 para examinar los resultados de la prueba.
   - Aplican la aliminacion Backward para eliminar la data irrelavante.
   - Luego de usar eliminacion Backward, proceden a eliminar las siguientes categorias: "CALC", "MTRANS", "FCVC" y "FAMILY_HISTORY".
   - En total son 9 variables categoricas, de las cuales 4 se eliminan con el analisis de Eliminacion Backward, por lo que los otros 5 se convierten a variables numericas usando el metodo LabelEncoder.
   - El entrenamiento se realiza con 12 variables.
   - El mejor accuracy fue de 97.8% aplicando el metodo SVM Cubic.
   - Los integrantes realizan el entrenamiento y las pruebas en Matlab.
  
  Por nuestro lado usamos como linea base el paper, se realizo el mismo procedimiento y entrenamiento del dataset, 
  pero los resultados no fueron los esperados. Obtuvimos un accuracy de 88.8%, se realizaron los mismo pasos mencionados en el punto 1.
  Consideremos que para este entrenamiento se uso Colab de Google.
  En el siguiente notebook, se muestran las evidencias con el entrenamiento realizado, teniendo como referencia la linea base del paper.

## 2. Casos experimentados:
2.1. Entrenamiento del dataset considerando Seleccion y extraccion de caracteristicas por filtrado [link], para este caso se consideran los siguientes pasor:
   - Limpieza de datos: Solo se valida que xisten 24 datos repetidos, en este caso no se considera la eliminacion de estos datos.
   - Se aplica LabelEncoder para las variables categoricas: CAEC, CALC, MTRANS, FAVC, SMOKE, SCC, family_history_with_overweight, Gender, NObeyesdad.
   - Se aplica Seleccion y Extraccion de Caracteristicas por Filtrado.
   - Se valido que las variables con bajo score son SMOKE, FAVC, SCC, MTRANS, se procede a dropear.
   - Se realiza el entrenamiento de los 12 atributos usando Ensamble con los siguientes estimadores: Random Forest, SVM Cubic, Arboles de Decision, k-NN y SVM de kernel gaussiano.

2.2. Entrenamiento del dataset considerando Selección de características por wrapping - Backward elimination [link], para este caso se consideran los siguientes pasor:
   - Limpieza de datos: Solo se valida que xisten 24 datos repetidos, en este caso no se considera la eliminacion de estos datos.
   - Se aplica LabelEncoder para las variables categoricas: CAEC, CALC, MTRANS, FAVC, SMOKE, SCC, family_history_with_overweight, Gender, NObeyesdad.
   - Se aplica Seleccion y Extraccion de Caracteristicas por Filtrado.
   - Se valido que las variables con bajo score son [ ingresar la data faltante ], se procede a dropear.
   - Se realiza el entrenamiento de los 12 atributos usando Ensamble con los siguientes estimadores: Random Forest, SVM Cubic, Arboles de Decision, k-NN y SVM de kernel gaussiano.

2.3. Entrenamiento usando el Ensamble, y como parte de ello se usa en algunos casos una nueva variable llamada IMC (Indice de Masa Corporal), para este metodo usamos los siguientes estimadores como parte del entrenamiento

  - Random Forest
  - SVM Cubic
  - Arbol de Decision
  - SVM de Kernel Gausiano
  - Redes Neuronales
    
2.3.1. Entrenamiento solo con 12 atributos, sin IMC, para análisis de estraccion de caracteristicas usamos Dummies [NoteBook01].

2.3.2. Entrenamiento solo con 12 arributos, sin IMC, para análisis de estraccion de caracteristicas usamos LabelEncoder [NoteBook02].

2.3.3. Entrenamiento solo con 12 arributos, con IMC, para análisis de estraccion de caracteristicas usamos Dummies [NoteBook03].

2.3.4. Entrenamiento solo con 12 arributos, con IMC, para análisis de estraccion de caracteristicas usamos LabelEncoder [NoteBook04].

En la siguiente grafica se muestran los entrenamientos que se han realizado desde 2.3.1 hasta 2.3.4.

  ![imagen](https://github.com/dennis-ancajima/ML-PUCP/assets/91444130/96cba719-bb3e-4978-b2eb-c5d1dfebe183)


2.3.5. Entrenamiento solo con 17 atributos, sin IMC, para análisis de estraccion de caracteristicas usamos Dummies [NoteBook05].

2.3.6. Entrenamiento solo con 17 arributos, sin IMC, para análisis de estraccion de caracteristicas usamos LabelEncoder [NoteBook06].

2.3.7. Entrenamiento solo con 17 arributos, con IMC, para análisis de estraccion de caracteristicas usamos Dummies [NoteBook07].

2.3.8. Entrenamiento solo con 17 arributos, con IMC, para análisis de estraccion de caracteristicas usamos LabelEncoder [NoteBook08].

En la siguiente grafica se muestran los entrenamientos que se han realizado desde 2.3.5 hasta 2.3.8.

  ![imagen](https://github.com/dennis-ancajima/ML-PUCP/assets/91444130/03a1ba46-2f43-43a4-8607-a4791033b97d)
