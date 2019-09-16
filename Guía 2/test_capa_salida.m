test_capa_gaussiana

part_trn=yg(1:50,:);
part_tst=yg(50+1:end,:);
cant_entradas=2;
nro_epocas=100;
criterio=0.7;
tasa_apr=0.1;

[desempenio]=capa_salida(part_trn,part_tst,cant_entradas,nro_epocas,criterio,tasa_apr)