%% 1. Importar el dataset
dataset = readtable('ObesityDataSet_raw_and_data_sinthetic.csv');


%% 2. Leer el dataset importado
disp(dataset);


%% 4. Aplicar LabelEncoder para 7 columnas categóricas del dataset
categoricalColumns = {'CAEC','CALC','MTRANS','FAVC', 'SMOKE', 'SCC','family_history_with_overweight','Gender','NObeyesdad'};
for i = 1:numel(categoricalColumns)
    column = categorical(dataset.(categoricalColumns{i}));
    [encodedColumn, ~] = grp2idx(column);
    dataset.(categoricalColumns{i}) = encodedColumn;
end


%% Leer el dataset con LabelEncoder
disp(dataset);


%% 5. Eliminar 4 columnas categóricas del dataset
dataset(:, {'CALC','MTRANS','FCVC','family_history_with_overweight'}) = [];


%% Leer el dataset 12 atributos
disp(dataset);


%% 6. Dividir la data de entrenamiento y test
rng(1);  % Fijar la semilla aleatoria para reproducibilidad
trainRatio = 0.7;  % Proporción de datos para entrenamiento
nRows = size(dataset, 1);
nTrain = round(trainRatio * nRows);
indices = randperm(nRows);
trainData = dataset(indices(1:nTrain), :);
testData = dataset(indices(nTrain+1:end), :);


%% 7. Escalar los datos
numericColumns = dataset.Properties.VariableNames(1:end-1);
trainData{:, numericColumns} = normalize(trainData{:, numericColumns});
testData{:, numericColumns} = normalize(testData{:, numericColumns});

%% 8. Aplicar SVM Lineal con validación cruzada k=10
XTrain = trainData{:, 1:end-1};
YTrain = trainData{:, end};
cv = cvpartition(YTrain, 'KFold', 10);  % Crear particiones para validación cruzada (10 folds)
accuracy = zeros(cv.NumTestSets, 1);  % Inicializar vector para almacenar las exactitudes

for i = 1:cv.NumTestSets
    trainIdx = cv.training(i);
    testIdx = cv.test(i);
    
    XTrainCV = XTrain(trainIdx, :);
    YTrainCV = YTrain(trainIdx);
    XTestCV = XTrain(testIdx, :);
    YTestCV = YTrain(testIdx);
    
    svmModel = fitcecoc(XTrainCV, YTrainCV, 'Learners', templateSVM('KernelFunction', 'linear'));  % Entrenar el modelo de SVM Lineal
    
    YTestPredicted = predict(svmModel, XTestCV);  % Realizar la predicción
    accuracy(i) = sum(YTestCV == YTestPredicted) / numel(YTestCV);  % Calcular la exactitud
end

meanAccuracy = mean(accuracy);  % Calcular la exactitud promedio
disp(['Exactitud promedio con validación cruzada (Árbol de decisión): ', num2str(meanAccuracy*100), '%']);

% Acurracy = 0.9486

%% Referencias:
% El codigo implementado ha sido elaborado bajo las recomendaciones y
% ejemplos de la siguiente documentacion:

% https://www.mathworks.com/matlabcentral/answers/473459-data-partition-using-cvpartition_-warning
% https://stackoverflow.com/questions/23904179/calculate-cross-validation-for-generalized-linear-model-in-matlab
% https://www.mathworks.com/help/stats/fitcecoc.html
% https://www.mathworks.com/help/stats/grp2idx.html#d124e503594
% https://www.mathworks.com/help/matlab/ref/double.normalize.html