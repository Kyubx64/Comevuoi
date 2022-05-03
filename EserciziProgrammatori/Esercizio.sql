/*Query 1
Calcolare il codice dei programmatori che sono stati autori di
almeno un programma scritto in Java dopo il 2000.*/

select autore.codice 
from autore join programmatore on autore.codice = programmatore.codice
    join programma on programma.id = autore.id
where programma.anno >= 2000 and programma.linguaggio = "Java"