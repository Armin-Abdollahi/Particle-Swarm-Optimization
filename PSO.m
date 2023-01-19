clc             % Clear command window
clear           % Clear workspace
close all       % Close all figure

%% Problem definition

nVar = 5;                              % Number of decision variable
max_Var = 10;                          % Upper bound of decision variable
min_Var = -10;                         % Lower bound of decision variable
ObjectiveFunction = @(x) Sphere(x);    % Cost function (Sphere or Rosen_Brock)

%% PSO Parameter

nPop = 50;                             % Population size
w = 0.99;                              % Inertial coefficient
w_damp = 0.1;                          % Damp coefficient
c1 = 2;                                % Private coefficient
c2 = 2;                                % Social coefficient
max_Iteration = 1000;                  % Maximum iteration of PSO algorithm

%% Initialization

% Template for each particle
empty_particle.position = [];
empty_particle.cost = [];
empty_particle.velocity = [];
empty_particle.best.position = [];
empty_particle.best.cost = [];

% Repeat the structure for all particle
particle = repmat(empty_particle, nPop, 1);

% Global best first value
globalBest.cost = inf;

% Initialize each particle
for i = 1:nPop

    particle(i).position = unifrnd(min_Var, max_Var, [1 nVar]);
    particle(i).cost = ObjectiveFunction(particle(i).position);
    particle(i).velocity = zeros(1, nVar);
    particle(i).best.position = particle(i).position;
    particle(i).best.cost = particle(i).cost;


    % Find global best particle
    if particle(i).best.cost < globalBest.cost
        globalBest = particle(i).best;
    end

end

%% Main loop

best_cost = zeros(max_Iteration, 1);

for iteration = 1:max_Iteration

    for i = 1:nPop

        particle(i).velocity = w * particle(i).velocity + ...
            c1*rand(1, nVar).*(particle(i).best.position - particle(i).position) + ...
            c2*rand(1, nVar).*(globalBest.position - particle(i).position);

        particle(i).position = particle(i).position + particle(i).velocity;

        particle(i).cost = ObjectiveFunction(particle(i).position);

        % Update the best position of each particle and update global best
        if particle(i).cost < particle(i).best.cost

            % Update the best position of each particle
            particle(i).best.cost = particle(i).cost;
            particle(i).best.position = particle(i).position;

            % Update the global best
            if particle(i).best.cost < globalBest.cost
                globalBest = particle(i).best;
            end

        end

    end

    w = w * w_damp;
    best_cost(iteration) = globalBest.cost;
    fprintf('Iteration = %i , Best Cost = %d \n', iteration, best_cost(iteration))
    fprintf('--------------------------------------------\n')

end

%% Result

iter = 1:max_Iteration;
plot(iter,best_cost)
