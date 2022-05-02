select Romanzo.Titolo
from Personaggio , PersonaggioRomanzo , Romanzo
where (romanzo.id = PersonaggioRomanzo.romanzo) and (personaggio.id = PersonaggioRomanzo.personaggio) and
     Personaggio.Nome = "Benjamin" and Personaggio.Cognome = "Malaussène"
