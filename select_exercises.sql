2. Use the albums_db database.

3. Explore the structure of the albums table.

a. How many rows are in the albums table?
-- There are 31 rows. The code I used is SELECT * FROM albums;
b. How many unique artist names are in the albums table?
-- There are 23 unique artists. I used SELECT DISTINCT artist FROM albums;
c. What is the primary key for the albums table?
-- the primary key is id. 
d. What is the oldest release date for any album in the albums table? What is the most recent release date?
-- The oldest release date 1967, the most recent release date is 2011.
4. Write queries to find the following information:

a. The name of all albums by Pink Floyd
-- Pink Floyd's albums are The Dark Side of the Moon and The Wall. Query used was SELECT * FROM albums WHERE artist = 'Pink Floyd';
b. The year Sgt. "Pepper's Lonely Hearts Club Band" was released
-- Sgt. Pepper's Lonely Hearts Club was released in 1967. Query used was SELECT * FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band"; I had to be very careful with quotation marks.
c. The genre for the album Nevermind
-- Nevermind is is the genre called Grunge, Alternative rock. Query used was SELECT * FROM albums WHERE name = 'Nevermind'; 

d. Which albums were released in the 1990s
-- The Bodyguard, Jagged Little Pill, Come On Over, Falling into You, 1, Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, Supernatural. Query used was SELECT name FROM albums WHERE release_date BETWEEN '1989' AND '2000';
e. Which albums had less than 20 million certified sales
-- Grease, Bad, Sgt. Pepper, Dirty Dancing, Let's Talk About Love, Danderous, The Immaculate Collection, Abbey Road, Born in the U.S.A, Brothers in Arms, Titanic, Nevermind, and The Wall. Query used was SELECT name FROM albums WHERE sales < 20;
f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
-- Sgt. Pepper, 1, Abbey Road, Born in the U.S.A, and Supernatural. Query used was SELECT name, genre FROM albums WHERE genre = 'rock'; The albums from branches of rock are not included because the genre value has other letters and my query looks ONLY for the exact string. 
