function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % initializare train
  train = zeros (m, n);

  % initializare miu
  miu = zeros (1, n);

  % initializare Y
  Y = zeros (m, pcs);

  % initializare Vk
  Vk = zeros (n, pcs);

  % cast train_mat la double.
  train_mat = double(train_mat);
  % calculez media fiecarei coloane a matricii.
  miu = mean(train_mat);
  % scad media din matricea initiala.
  train_mat = train_mat - miu;
  % calculez matricea de covarianta.
  cov_matrix = train_mat' * train_mat / (m - 1);
  % calculez vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig(cov_matrix);
  % ordonez descrescator valorile proprii si creez o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  diag_S = diag(S);
  [S, index] = sort(diag_S, 'descend');
  S = V(:, index);
  % pastrez doar primele pcs coloane din matricea obtinuta anterior.
  Vk = S(:, 1:pcs);
  % creez matricea Y schimband baza matricii initiale.
  Y = train_mat * Vk;
  % calculez matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';
endfunction
