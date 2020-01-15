function [W,WB]=calcClusters(we,clNr,epochs)
    
    n_scale = 0.90;
    n_scale_scale = 0.003; %winner takes most
    n= 0.5;
    %input normalization phase:
    WE = (we - min(we))./(max(we) - min(we));
    %roll initial weights
    W = rand(clNr,size(WE,2));
    WB = W;
    for e=1:epochs%epochs
        distances = [];
        for i=1:size(WE,1)% for each sample
            sample = WE(i,:);
            for j=1:clNr %for each cluster
                distances(i,j) = norm(W(j,:)-sample);
            end
            %get w that is the closest:
            min_val = min(distances(i,:));
            min_index = find(distances(i,:) == min_val);
            %update given w with n*(X-W)
            W(min_index,:) = W(min_index,:) + n*(sample-W(min_index,:));
            idx = distances(i,:) > min_val & distances(i,:) < min_val;
            W(~idx,:) = W(~idx,:) + n*n_scale_scale*(sample-W(~idx,:));

        end
        n = n*n_scale;
    end
    % de-normalize
    W = W .* (max(we) - min(we))+min(we);
    WB = WB .* (max(we) - min(we))+min(we);
end