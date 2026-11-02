Hvordan jeg gikk frem på oppgaven:

første steget var oppsett:
    lagde repo i organisjasjonen basert på mal
    fikset federated credentials
    fikset environment and secrets
    satte opp kortnavn og backend.hcl (slet med å få det fra forrige oblig, men husket heldighvis hva det var)
    fikset CD dev og prod workflows
    beskyttet main med regler

lagde en kladdebranch og kladde-PR til å fikse koden
    satte opp en shared-network som skulle holde RG og Vnet
    Fikk network til å slippe RG og Vnet
    satte opp service
    network, data, og app brukte removed for å slippe resurser
    slettet de tomme stackene

migrering. her brukte jeg cherry-pick til å bruke kladdene
    først måtte ting bygges opp etter nattjobben
    fikset foer.txt
    brukte kladdene til å fikse shared-network og service
    slettet de gamle blobbene
    fikset etter.txt
    sammenlignet boot id (her var det uliheter, fordi jeg skjekket før og etter nattjobb)

endringsorde (EO 1, 2, 3)
    skapte nye (brannmur)regler, for TCP 8143
    gav shared-network utvidet adresserom
    satte opp betal tjeneste gjennom config

