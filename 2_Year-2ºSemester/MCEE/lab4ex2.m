% Carregar e exibir a imagem original
imagem = imread('coins.png');
imshow(imagem);
title('Imagem Original');

% Criar a primeira imagem: fundo branco
limiar = 100; % Definir um limiar para distinguir fundo e moedas
imagem_fundo_branco = imagem; 
imagem_fundo_branco(imagem < limiar) = 255; % Substituir fundo por branco

figure;
imshow(imagem_fundo_branco);
title('Imagem com Fundo Branco');

% Criar a segunda imagem: segmentação (fundo preto, moedas brancas)
imagem_segmentada = imagem >= limiar; % Binarização com o limiar

figure;
imshow(imagem_segmentada);
title('Imagem Segmentada (Moedas Brancas, Fundo Preto)');

% Salvar as imagens resultantes (opcional)
imwrite(imagem_fundo_branco, 'coins_fundo_branco.png');
imwrite(imagem_segmentada, 'coins_segmentada.png');
