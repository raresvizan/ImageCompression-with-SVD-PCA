function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);

  % inversez pixelii imaginii im.
  im = 255 - im;
  % transpun imaginea, iar apoi transform imaginea intr-un vector linie.
  im = im';
  sir = reshape(im, 1, 784);
endfunction
