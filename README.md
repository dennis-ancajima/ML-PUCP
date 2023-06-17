# ML-PUCP
En este repositorio se esta adjuntando diferentes tipos de entrenamiento.

1.- Se esta considerando como referencia le paper Obesity Level Estimation based on Machine Learning Methods and Artificial Neural Networks.
  Los integrantes del paper consideran los siguientes pasos para el entrenamiento del dataset:
   - No se especifica la limpieza de data, por ejemplo que involucre eliminar data eliminada. Se realiza el entrenamiento con los 2111 datos.
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
  
  
  
