/*Query 1
Calcolare l'insieme (non il multi-insieme) delle coppie (A,B)
tali che A è uno scalatore e B è un continente in cui A ha
effettuato una scalata.*/

select scalata.scalatore, nazione.continente 
from nazione join scalata on scalata.nazione = nazione.nome 
order by scalata.scalatore

/*Query 2
Per ogni scalatore nato prima del 1980, calcolare
tutti i continenti in cui ha effettuato una scalata,
ordinando il risultato per codice fiscale e, a parità di
codice fiscale, per il nome del continente.*/


select nazione.continente, scalatore.cf
from scalatore join scalata on scalatore.cf = scalata.scalatore
    join nazione on nazione.nome = scalata.nazione
where scalatore.annoNascita < 1980
order by scalatore.cf, nazione.continente

/*Query 3
Calcolare le nazioni (mostrando, per ciascuna, anche il
continente) nelle quali è stata effettuata almeno una scalata
da uno scalatore minorenne.*/

select nazione.nome, nazione.continente 
from scalatore join scalata on scalatore.cf = scalata.scalatore
    join nazione on nazione.nome = scalata.nazione
where (scalata.anno - scalatore.annoNascita) < 18

/*Query 4
Per ogni nazione, calcolare il numero di scalate effettuate da
scalatori nati in quella nazione.*/

select nazione.nome, count(nazione.nome)
from scalatore join scalata on scalatore.cf = scalata.scalatore
    join nazione on nazione.nome = scalata.nazione
where scalatore.nazioneNascita = scalata.nazione
group by nazione.nome

/*Query 5
Per ogni continente, calcolare il numero di scalate effettuate
da scalatori nati in una nazione di quel continente.*/



/*Query 6
Calcolare codice fiscale, nazione di nascita, continente di
nascita di ogni scalatore nato in un continente diverso
dall’America, e, solo se egli ha effettuato almeno una scalata,
affiancare queste informazioni alle nazioni in cui ha effettuato
scalate.*/

select scalatore.cf, scalatore.nazioneNascita, n1.continente as continenteNascita, scalata.nazione as nazioneScalata
from scalatore join scalata on scalatore.cf = scalata.scalatore
   left join nazione on nazione.nome = scalata.nazione
   join nazione n1 on n1.nome = scalatore.nazioneNascita
where n1.continente != "America" 

/*Query 7
Per ogni nazione e per ogni anno, calcolare il numero di
scalate effettuate in quella nazione e in quell’anno, ma solo se
tale numero è maggiore di 1. Nel risultato le nazioni dello
stesso continente devono essere mostrati in tuple contigue, e
le tuple relative allo stesso continente devono essere ordinate
per anno.*/

select scalata.anno, scalata.nazione, count(scalata.nazione and scalata.anno) as numeroScalate
from scalatore join scalata on scalatore.cf = scalata.scalatore
    join nazione on nazione.nome = scalata.nazione
group by scalata.anno, scalata.nazione having count(*) > 1
order by scalata.anno

/*Query 8
Per ogni nazione N, calcolare il numero medio di
scalate effettuate all’anno in N da scalatori nati in
nazioni diverse da N.*/

select scalata.nazione, count(*)/count(scalata.anno) as Media 
from Scalatore join Scalata on scalatore.cf = scalata.scalatore 
where scalatore.nazioneNascita != scalata.nazione 

/*Query 9
Calcolare gli scalatori tali che tutte le scalate che
hanno effettuato nella nazione di nascita le hanno
effettuate quando erano minorenni.*/

select distinct scalatore.cf, scalatore.annoNascita, scalata.anno
from Scalatore join Scalata on scalatore.cf = scalata.scalatore 
where scalatore.nazioneNascita 
    in (select scalata.nazione 
         from scalata 
         where (scalata.anno - scalatore.annoNascita) < 18 );