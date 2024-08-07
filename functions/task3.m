function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % cast photo la double.
  photo = double(photo);
  % calculez media fiecarui rand al matricii.
  miu = mean(photo, 2);
  % normalizez matricea initiala scazand din ea media fiecarui rand.
  photo = photo - miu;
  % calculez matricea de covarianta.
  Z = photo * photo' / (n-1);
  % calculez vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig(Z);
  % ordonez descrescator valorile proprii si creez o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  diag_S = diag(S);
  [S, index] = sort(diag_S, 'descend');
  V = V(:, index);
  % pastrez doar primele pcs coloane
  V = V(:, 1:pcs);
  % creez matricea Y schimband baza matricii initiale.
  Y = V' * photo;
  % calculez matricea new_X care este o aproximatie a matricii initiale
  new_X = V * Y;
  % adun media randurilor scazuta anterior.
  new_X = new_X + miu;
  % transform matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
