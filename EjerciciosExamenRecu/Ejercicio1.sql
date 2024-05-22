-- Active: 1715340009085@@127.0.0.1@5432@geo





SELECT ins.codi, pob.nom, com.nom_c
FROM ((instituts ins inner join poblacions pob 
on ins.cod_m = pob.cod_m) inner join comarques com on pob.nom_c = com.nom)
order by poblacions.normalize;

