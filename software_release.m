% Probability and Statistics for Computer Scientists P132

N = 1000; % number of Monte Carlo runs
Times = zeros(N, 1); % store times for each simulation
Nerrors = zeros(N, 1); % store number of total errors for each simulation
for k = 1:N;
    Last3 = [28, 22, 18];
    DE = sum(Last3); % detected error so far
    T = 0; X = min(Last3); % parameter lambda for day T
    while X > 0; % while loop until no errors are found
        lambda = min(Last3);
        U = rand; X = 0; % initial values
        while U > exp(-lambda);
            U = U * rand; X = X + 1;
        end; % generate Poisson according to (5.4)

        T = T + 1; DE = DE + X; % update after day T
        Last3 = [Last3(2:3), X];
    end; % the loop ends when X = 0 on day T
    Times(k) = T - 1;
    Nerrors(k) = DE;
end;

mean(Times)
mean(Nerrors)

B = (Times > 21);
sum(B) / N