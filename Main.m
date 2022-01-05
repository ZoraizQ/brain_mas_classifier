%% Loading HFD data
clear
load data_hfd14.mat

NCLUSTERS = 3;
y_test = y_test';
y_train = y_train';
y_test = double(y_test);
y_train = double(y_train);


%% Genfis3, FCM clustering

[train_output, fis] = Create_GENFIS(x_train, y_train, NCLUSTERS);  
y_pred_genfis = evalfis(fis, x_test);

%% Visualize GENFIS results

figure;
plot(y_test,'b-');
hold on;
plot(y_pred_genfis,'r-','Linewidth',0.5);
hold on;
xlabel('data point'); ylabel('Output value');
legend({'Actual Output','Genfis Prediction'});   

%% Genfis1 + Anfis

EPOCHS = 1000; % for ANFIS

x_train(isinf(x_train)|isnan(x_train)) = 0; % convert nan/inf to 0

train_data = horzcat(x_train, y_train); % zip training inputs and labels together
[fis_anfis, out_anfis_train, rmse] = Create_ANFIS(train_data, fis, EPOCHS);
y_pred_anfis = evalfis(x_test, fis_anfis);


%% Visualize ANFIS results

figure;
plot(y_test,'b-');
hold on;
plot(round(y_pred_anfis),'r-','Linewidth',0.5);
hold on;
xlabel('data point'); ylabel('Output value');
legend({'Actual','Anfis Prediction'});  

[accuracy, sensitivity, specificity, precision, recall, f_measure, gmean] = Evaluate(y_test, round(y_pred_anfis));
