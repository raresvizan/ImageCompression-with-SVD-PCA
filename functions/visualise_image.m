function im = visualise_image (train_mat, number)
  % initializare matrice finala.
  im = zeros (28, 28);

  % citesc din matricea de antrenament linia cu numarul number.
  image_line = train_mat(number, :);
  % transform linia citita intr-o matrice 28x28 care trebuie apoi
  % transpusa.
  matrix = reshape(image_line, 28, 28);
  matrix = matrix';
  % transform matricea in uint8 pentru a fi o imagine valida.
  im = uint8(matrix);
endfunction
