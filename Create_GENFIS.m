function [Out_fis,fis] = Create_GENFIS(x, y, nCluster)

    if ~exist('nCluster','var')
        nCluster='auto';
    end
    
%     opt = genfisOptions('SubtractiveClustering');
    opt = genfisOptions('FCMClustering','NumClusters', nCluster);
%     opt.NumMembershipFunctions = [3 5 3 5 3 5 3 3 5 3 5 3 5 3];
%     opt.InputMembershipFunctionType = ["gaussmf" "trimf" "gaussmf" "trimf" "gaussmf" "trimf" "gaussmf" "gaussmf" "trimf" "gaussmf" "trimf" "gaussmf" "trimf" "gaussmf"];
	fis = genfis(x,y,opt);
    Out_fis=evalfis(fis, x);

end