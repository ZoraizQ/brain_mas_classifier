function [fis_Anfis,Out_Anfis,rmse] = Create_ANFIS(train_data, in_fis, epochs)

    [fis_Anfis,rmse] = anfis(train_data, in_fis, epochs);
    x=train_data(:,1:end-1);
    Out_Anfis=evalfis(x,fis_Anfis);

end