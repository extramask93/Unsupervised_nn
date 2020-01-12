function W=calcClusters(we,clNr,epochs)
    n = 0.5;
    n_scale = 0.5;
    %input normalization phase:
    WE = normalize(we);
    %roll initial weights
    W = rand(clNr,size(WE,2));
    W
    %Winner takes all needs to calc dist of each point to each w
    for e=1:50%epochs
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
        end
        n = n*n_scale;
    end
end