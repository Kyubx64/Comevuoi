/*Query 1
Calcolare il codice dei programmatori che sono stati autori di
almeno un programma scritto in Java dopo il 2000.*/

select autore.codice 
from autore join programmatore on autore.codice = programmatore.codice
    join programma on programma.id = autore.id
where programma.anno >= 2000 and programma.linguaggio = "Java"

/*Query 2
Calcolare il nome e la categoria dei programmatori
che sono stati autori di almeno un programma scritto
in un linguaggio diverso da Python, ordinando il
risultato rispetto al nome dei programmatori. */

select programmatore.nome, programmatore.categoria
from autore join programmatore on autore.codice = programmatore.codice
    join programma on programma.id = autore.id
where programma.Linguaggio != "Python" 
order by programmatore.nome

/*Query 3
Per ogni programmatore di categoria 10, calcolare il suo
codice e l'anno in cui ha scritto il primo programma in un
linguaggio diverso da Java.*/

select distinct programmatore.codice, programma.anno
from autore join programmatore on autore.codice = programmatore.codice
    join programma on programma.id = autore.id
where programmatore.categoria = 10 and programma.linguaggio != "Java"
