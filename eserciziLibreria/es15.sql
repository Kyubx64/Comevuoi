select Romanzo.Titolo
from Romanzo
where (Romanzo.AnnoPubblicazione >= 1901 and  Romanzo.AnnoPubblicazione <=2000)
    and  Romanzo.Titolo like "%Zeno%"