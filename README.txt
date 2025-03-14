Am creat un carusel pe site care afișează poze și informații despre sălile de fitness, numărul de imagini afișate fiind dinamic, în funcție de câte poze sunt în script (camerele se se repeta, apar numai tipurile de camere din sali).
Am implementat un sistem pe site unde, la apăsarea butonului "Cumpără Abonament", dacă numărul de telefon al clientului este găsit în baza de date, acesta poate efectua plata, iar dacă nu este găsit, este ghidat să se înregistreze sau să își actualizeze informațiile; data înregistrării coincide cu data plății și marcajul de început pentru accesul la sală, iar clienții trebuie să actualizeze informațiile de fiecare dată când achiziționează un nou abonament.
Am integrat pe site un sistem care preia numărul de angajați și numărul de clienți fericiți din baza de date, actualizându-le automat la adăugarea fiecărui nou client.
La înregistrare/logare, dacă numărul de telefon nu este regăsit în baza de date, se adaugă o nouă înregistrare; dacă este regăsit, informațiile existente sunt actualizate.
Pentru cele trei tipuri de abonamente, le-am integrat în site similar cu caruselul de poze de la săli.
În secțiunea de istoric client, se caută numărul de telefon în tabelul tblclientisalifitness (unde doar administratorul poate introduce înregistrări atunci când clientul vine fizic la sală), și se afișează istoricul sălilor vizitate și datele la care clientul a venit, începând de la prima sa înregistrare în baza de date.
Pentru secțiunea „Ești administrator?”, am implementat un cod unic care, odată introdus corect, permite accesul la partea de administrator a site-ului. Aici avem urmatoarele actiuni:
Odata ajuns fizic la sala, administratorul introduce clientul cu ajutorul butonului "Inserare in tblsalifitness" in tabelul tblclientsalifitness.
Butoane de sortare in tblangajati in functie de salariu, nume (si daca numele este acelasi, in functie de prenume), id.
Butoane de sortare in tblclienti in functie de nume (si daca numele este acelasi, in functie de prenume), id, datacumparareabonament.
Buton care trimite catre tabelul tblclienti, insa atributul data este colorat cu verde daca inca este activ pana in prezent sau cu rosu daca nu mai este, in functie de tipul de abonament achizitionat.
Butoane de editare inregistrare si stergere (implicit actualizarea id-ului la stergere) pentru fiecare tabel din baza de date.
2 filtre de cautare dupa numarul de telefon (care este unic) in tabelele tblangajati si tblclienti.









