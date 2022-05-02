select Romanzo.TItolo 
from Romanzo, Autore
where Romanzo.Autore = Autore.ID and
    Autore.nome = "Don" and Autore.Cognome = "DeLillo"
