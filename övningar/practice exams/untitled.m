clc,clear
% Define A and b
A = [1 0 0 1; 2 1 0 -3; -2 0 1 0];

syms X
eq = A*X == 0;
fsolve(eq, X)

%%

% Compute the null space
N = null(A, 'r'); % Null space basis for A

% Generate integer solutions
x_whole_numbers = []; % Store valid solutions
max_search = 2; % Search range for integers in c

% Loop over possible integer combinations for c
for c1 = -max_search:max_search
    for c2 = -max_search:max_search
        c = [c1; c2]; % Form the integer vector c
        x = N * c; % Compute solution
        if all(mod(x, 1) == 0) % Check if all elements of x are integers
            x_whole_numbers = [x_whole_numbers, x]; % Store valid solution
        end
    end
end

% Transpose for easier sorting (convert columns to rows)
x_whole_numbers = x_whole_numbers';

% Remove duplicates (in case multiple c's lead to the same solution)
x_whole_numbers = unique(x_whole_numbers, 'rows');

% Sort solutions lexicographically (row-wise sorting)
x_sorted = sortrows(x_whole_numbers);

% Display sorted solutions
disp('Sorted whole number solutions (lexicographically):');
disp(x_sorted);

% ändra max_search om du vill beräkna fler antalet lösningar

%%
% Define A and b
A = [1 1 -3 -1; -1 -1 0 -2; 0 0 1 1];
b = [0; 0; 0];

% Compute the null space
N = null(A, 'r'); % Null space basis for A

% Generate integer solutions
x_whole_numbers = []; % Store valid solutions
max_search = 1; % Search range for integers in c

% Loop over possible integer combinations for c
for c1 = -max_search:max_search
    for c2 = -max_search:max_search
        c = [c1; c2]; % Form the integer vector c
        x = N * c; % Compute solution
        if all(mod(x, 1) == 0) % Check if all elements of x are integers
            x_whole_numbers = [x_whole_numbers, x]; % Store valid solution
        end
    end
end

% Transpose for easier sorting (convert columns to rows)
x_whole_numbers = x_whole_numbers';

% Remove duplicates (in case multiple c's lead to the same solution)
x_whole_numbers = unique(x_whole_numbers, 'rows');

% Sort solutions lexicographically (row-wise sorting)
x_sorted = sortrows(x_whole_numbers);

% Display sorted solutions
disp('Sorted whole number solutions (lexicographically):');
disp(x_sorted);

% ändra max_search om du vill beräkna fler antalet lösningar