function cost = hungarian_algorithm(cost_matrix)
    [n, m] = size(cost_matrix);
    cost_matrix = cost_matrix - min(cost_matrix, [], 2) * ones(1, m);
    cost_matrix = cost_matrix - min(cost_matrix, [], 1);
    marked = zeros(n, m);
    while sum(sum(marked == 0)) > 0
        for i = 1:n
            for j = 1:m
                if cost_matrix(i, j) == 0 && sum(marked(i, :) == 0) == 1 && sum(marked(:, j) == 0) == 1
                    marked(i, j) = 1;
                end
            end
        end
    end
    total_cost = 0;
    for i = 1:n
        total_cost = total_cost + cost_matrix(i, find(marked(i, :) == 1));
    end
    cost = total_cost;
end

cost_matrix = [4, 2, 8; 6, 4, 3; 2, 7, 3];
result = hungarian_algorithm(cost_matrix);
disp(result);