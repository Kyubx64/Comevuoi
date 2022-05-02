/*es1.*/
select Romanzo.Titolo
from Romanzo
where Romanzo.AnnoPubblicazione = 2009

/*es2.*/
select Romanzo.Titolo
from Romanzo
where Romanzo.AnnoPubblicazione >= 1990

/*es3.*/
select Romanzo.Titolo
from Romanzo , Autore
where Romanzo.Autore = Autore.ID and Autore.DataNascita >= 1900 and
    Autore.DataNascita <=2000
order by Autore.Cognome, Autore.Nome Romanzo.AnnoPubblicazione 

/*es4.*/
select Romanzo.Titolo , Autore.Nome , Autore.Cognome
from Romanzo , Autore
where Romanzo.Autore = Autore.ID

/*es5.*/
select Romanzo.Titolo , Autore.Nome , Autore.Cognome
from Romanzo , Autore
where Romanzo.Autore = Autore.ID
order by Autore.Cognome, Autore.Nome

/*es6.*/
select Romanzo.Titolo , Autore.Nome , Autore.Cognome
from Romanzo , Autore
where Romanzo.Autore = Autore.ID and Autore.Nazionalità = "Russo"
order by Autore.Cognome, Autore.Nome

/*es7.*/
select Romanzo.Titolo
from Romanzo , Autore
where Romanzo.Autore = Autore.ID and Autore.DataNascita >= 1900 and
    Autore.DataNascita <=2000
order by Autore.Cognome, Autore.Nome, Romanzo.AnnoPubblicazione 

/*es8.*/
select Romanzo.Titolo
from Romanzo , Autore
where Romanzo.Autore = Autore.ID and Autore.DataMorte is null
