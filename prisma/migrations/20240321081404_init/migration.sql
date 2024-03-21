-- CreateTable
CREATE TABLE "Apprenant" (
    "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Matricule" TEXT NOT NULL,
    "Tag_Ordinateur" TEXT NOT NULL,
    "Code_Cohorte" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Nom" TEXT NOT NULL,
    "Postnom" TEXT NOT NULL,
    "Date_de_naissance" DATETIME NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Telephone" TEXT NOT NULL,
    CONSTRAINT "Apprenant_Tag_Ordinateur_fkey" FOREIGN KEY ("Tag_Ordinateur") REFERENCES "Ordinateur" ("Tag") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Apprenant_Code_Cohorte_fkey" FOREIGN KEY ("Code_Cohorte") REFERENCES "Cohorte" ("Code") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Ordinateur" (
    "Tag" TEXT NOT NULL,
    "Modele" TEXT NOT NULL,
    "Fabriquant" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Session" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Annee" DATETIME NOT NULL,
    "Type" TEXT NOT NULL,
    "Ville" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Cohorte" (
    "Code" TEXT NOT NULL PRIMARY KEY,
    "Id_Session" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    CONSTRAINT "Cohorte_Id_Session_fkey" FOREIGN KEY ("Id_Session") REFERENCES "Session" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Apprenant_Matricule_key" ON "Apprenant"("Matricule");

-- CreateIndex
CREATE UNIQUE INDEX "Ordinateur_Tag_key" ON "Ordinateur"("Tag");

-- CreateIndex
CREATE UNIQUE INDEX "Session_Id_key" ON "Session"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Cohorte_Code_key" ON "Cohorte"("Code");
