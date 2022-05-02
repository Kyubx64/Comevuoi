select Romanzo.Titolo
from Romanzo
where Romanzo.AnnoPubblicazione < 1900
    and  Romanzo.Titolo like "%Sposi%" or "%sposi%"