const express = require("express");
const { PrismaClient } = require("@prisma/client");
const PORT = process.env.PORT || 3000;
const app = express();
app.use(express.json());
const { apprenant, ordinateur } = new PrismaClient();
app.get("/", (req, res) => {
  res.send("Hello");
});
app.get("/ordinateurs", async (req, res) => {
  try {
    const ordinateurs = await ordinateur.findMany({
      include: {
        apprenants: {
          select: {
            nom: true,
          },
        },
      },
    });
    res.send(ordinateurs);
  } catch (error) {
    console.log(error.message);
    res.status(500).send("Nous avons un probleme technique");
  }
});
app.post("/ordinateurs", async (req, res) => {
  try {
    const newOrdinateur = req.body;
    const addedOrdinateur = await ordinateur.create({ data: newOrdinateur });
    res.status(200).send(addedOrdinateur);
  } catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
});
app.post("/apprenants", async (req, res) => {
  try {
    const newApprenant = {
      matricule: "007",
      ordinateurId: 1,
      prenom: "Joe",
      nom: "Kangoma",
      postnom: "Katunda",
      dateDeNaissance: new Date(),
      adresse: "justen une adresse",
      email: "joekangoma@gmail.com",
      telephone: "0895128557",
    };
    const addedApprenant = await apprenant.create({ data: newApprenant });
    res.status(200).send(addedApprenant);
  } catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
});
app.listen(PORT, () => {
  console.log(`le serveur écoute sur le port ${PORT}`);
});