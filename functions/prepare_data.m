function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;

  % initializare train_mat.
  train_mat = zeros (no_train_images, n);

  %initializare train_val.
  train_val = zeros (1, no_train_images);

  % incarc datele din tabelul primit ca argument.
  d = load(name);
  % salvez in matricea train_mat primele no_train_images linii din
  % tabelul de imagini de antrenament.
  X = d.trainX;
  train_mat = X(1:no_train_images,:);
  % salvez in vectorul train_val primele no_train_images valori ale
  % vectorului de etichete.
  y = d.trainY;
  train_val = y(1:no_train_images);
endfunction
