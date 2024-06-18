# sketch_show_sql_project

Although SNL was my inspiration for this project, I simplified it to meet my level of SQL knowledge 😇😇

The task was simple:
- [x] Create a description and an ERD graph of a chosen database
- [x] Identify the **purpose** of such a database
- [x] Recreate the tables in SQL
- [x] Insert values into the tables
- [x] Create functions, procedures and views that are relevant to the purpose of the database


The relations between the entities are as follows:\
🎭	An actor can play many characters, but a character can only be played by one actor. \
🎭	A sketch can have many characters, and a character can appear in many sketches (and is always played by the same actor).  \
  A junction table “Character in Sketch” is utilised to portray this in the third normal form.  \
🎭	A host can be in multiple episodes, but an episode can have only one host.\
🎭	A musical guest can be in multiple episodes, but an episode can have only one musical guest.\
🎭	An episode can have many sketches (and at least one sketch to air), but a sketch can appear only in one episode.\
🎭	A sketch needs to be assigned one and only one category, but a category can apply to many (or none) sketches. \
