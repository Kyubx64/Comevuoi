select Romanzo.Titolo
from Romanzo, Autore
where Autore.nome is null or Autore.cognome is null
