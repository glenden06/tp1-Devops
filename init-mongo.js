db = db.getSiblingDB('blog_db');

db.createCollection('posts', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['titre', 'auteur', 'vues'],
      properties: {
        titre: {
          bsonType: 'string'
        },
        auteur: {
          bsonType: 'string'
        },
        vues: {
          bsonType: 'int'
        }
      }
    }
  }
});

db.posts.insertMany([
  {
    titre: 'FLASH-BACK',
    auteur: 'Nono la grinta',
    vues: 1185611
  },
  {
    titre: 'PROMENADE',
    auteur: 'La rvfleuze ft koba la d',
    vues: 7492008
  },
  {
    titre: 'Fitness Park',
    auteur: 'La rvfleuze',
    vues: 1883411
  },
  {
    titre: 'OLYMPIAN',
    auteur: 'Playboi Carti',
    vues: 81578934
  },
  {
    titre: 'Black Beatles',
    auteur: 'Rae Sremmurd',
    vues: 12014860
  }
]);