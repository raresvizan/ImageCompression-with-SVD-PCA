function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;

  % cast im la double.
  im = double(im);
  % aplic functia magic_with_pca setului de date de antrenament.
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  % scad din vectorul imagine media fiecarei coloane din train_mat.
  im = im - miu;
  % schimb baza inmultind cu matricea Vk.
  im = im * Vk;
  % calculez predictia folosindu-ma de metoda k nearest neighbour
  % implementata anterior cu k = 5.
  prediction = KNN(train_val, Y, im, 5);
endfunction
