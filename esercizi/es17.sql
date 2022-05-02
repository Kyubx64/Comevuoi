select Romanzo.Titolo
from Romanzo, Autore
where Romanzo.Autore = Autore.ID and
    Autore.nome = "Alessandro" and Autore.Cognome = "Manzoni"
