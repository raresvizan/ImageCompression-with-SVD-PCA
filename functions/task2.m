function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % cast photo la double.
  photo = double(photo);
  % normalizez matricea initiala scazand din ea media fiecarui rand.
  miu = mean(photo, 2);
  photo = photo - miu;
  % construiesc matricea Z.
  Z = photo' / sqrt(n-1);
  % calculez matricile U, S si V din SVD aplicat matricii Z
  [U, S, V] = svd(Z);
  % construiesc matricea W din primele pcs coloane ale lui V
  W = V(:, 1:pcs);
  % caclulez matricea Y
  Y = W' * photo;
  % aproximez matricea initiala
  new_X = W * Y + miu;
  % transform matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
