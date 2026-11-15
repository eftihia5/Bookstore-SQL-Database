CREATE TABLE ΣΥΓΓΡΑΦΕΑΣ (
  ID_Συγγραφέα INTEGER   NOT NULL ,
  Ονοματεπώνυμο VARCHAR(40)    ,
  e-mail VARCHAR(30)      ,
PRIMARY KEY(ID_Συγγραφέα));




CREATE TABLE ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ (
  ID_Εκδοτικού INTEGER   NOT NULL ,
  Όνομα VARCHAR(30)    ,
  Διεύθυνση VARCHAR(50)    ,
  URL VARCHAR(50)      ,
PRIMARY KEY(ID_Εκδοτικού));




CREATE TABLE ΑΠΟΘΗΚΗ (
  ID_Αποθήκης INTEGER   NOT NULL ,
  Πόλη VARCHAR(30)    ,
  Οδός VARCHAR(30)    ,
  Αριθμός VARCHAR(30)    ,
  ΤΚ VARCHAR(30)    ,
  Τηλέφωνο VARCHAR(10)      ,
PRIMARY KEY(ID_Αποθήκης));




CREATE TABLE ΠΕΛΑΤΗΣ (
  ID_Πελάτη INTEGER   NOT NULL ,
  Όνομα VARCHAR(30)    ,
  Επώνυμο VARCHAR(30)    ,
  Πατρώνυμο VARCHAR(30)    ,
  Πόλη VARCHAR(30)    ,
  Οδός VARCHAR(30)    ,
  Αριθμός VARCHAR(30)    ,
  ΤΚ VARCHAR(30)    ,
  Email VARCHAR(30)      ,
PRIMARY KEY(ID_Πελάτη));




CREATE TABLE ΤΗΛΕΦΩΝΑ_ΠΕΛΑΤΗ (
  ID_Πελάτη INTEGER   NOT NULL ,
  Τηλέφωνο VARCHAR(10)   NOT NULL ,
  ΠΕΛΑΤΗΣ_ID_Πελάτη INTEGER   NOT NULL   ,
PRIMARY KEY(ID_Πελάτη, Τηλέφωνο)  ,
  FOREIGN KEY(ΠΕΛΑΤΗΣ_ID_Πελάτη)
    REFERENCES ΠΕΛΑΤΗΣ(ID_Πελάτη));


CREATE INDEX ΤΗΛΕΦΩΝΑ ΠΕΛΑΤΗ_FKIndex1 ON ΤΗΛΕΦΩΝΑ_ΠΕΛΑΤΗ (ΠΕΛΑΤΗΣ_ID_Πελάτη);


CREATE INDEX IFK_Rel_03 ON ΤΗΛΕΦΩΝΑ_ΠΕΛΑΤΗ (ΠΕΛΑΤΗΣ_ID_Πελάτη);


CREATE TABLE ΤΗΛΕΦΩΝΑ_ΕΚΔΟΤΙΚΟΥ_ΟΙΚΟΥ (
  ID_Εκδοτικού INTEGER   NOT NULL ,
  Τηλέφωνο VARCHAR(10)   NOT NULL ,
  ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού INTEGER   NOT NULL   ,
PRIMARY KEY(ID_Εκδοτικού, Τηλέφωνο)  ,
  FOREIGN KEY(ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού)
    REFERENCES ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ(ID_Εκδοτικού));


CREATE INDEX ΤΗΛΕΦΩΝΑ ΕΚΔΟΤΙΚΟΥ ΟΙΚΟΥ_FKIndex1 ON ΤΗΛΕΦΩΝΑ_ΕΚΔΟΤΙΚΟΥ_ΟΙΚΟΥ (ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού);


CREATE INDEX IFK_Rel_05 ON ΤΗΛΕΦΩΝΑ_ΕΚΔΟΤΙΚΟΥ_ΟΙΚΟΥ (ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού);


CREATE TABLE ΚΑΛΑΘΙ_ΑΓΟΡΩΝ (
  ID_Καλαθιού INTEGER   NOT NULL ,
  ΠΕΛΑΤΗΣ_ID_Πελάτη INTEGER   NOT NULL ,
  ID_Πελάτη INTEGER    ,
  Ημερομηνία VARCHAR(10)      ,
PRIMARY KEY(ID_Καλαθιού)  ,
  FOREIGN KEY(ΠΕΛΑΤΗΣ_ID_Πελάτη)
    REFERENCES ΠΕΛΑΤΗΣ(ID_Πελάτη));


CREATE INDEX ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_FKIndex1 ON ΚΑΛΑΘΙ_ΑΓΟΡΩΝ (ΠΕΛΑΤΗΣ_ID_Πελάτη);


CREATE INDEX IFK_Rel_11 ON ΚΑΛΑΘΙ_ΑΓΟΡΩΝ (ΠΕΛΑΤΗΣ_ID_Πελάτη);


CREATE TABLE ΒΙΒΛΙΟ (
  ID_Βιβλίου INTEGER   NOT NULL ,
  ΑΠΟΘΗΚΗ_ID_Αποθήκης INTEGER   NOT NULL ,
  ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού INTEGER   NOT NULL ,
  Τίτλος VARCHAR(40)    ,
  Έτος_έκδοσης VARCHAR(4)    ,
  ISBN VARCHAR(13)    ,
  Κωδικός_εκδοτικού_οίκου VARCHAR(20)    ,
  Τιμή INTEGER    ,
  Ποσότητα INTEGER      ,
PRIMARY KEY(ID_Βιβλίου)    ,
  FOREIGN KEY(ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού)
    REFERENCES ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ(ID_Εκδοτικού),
  FOREIGN KEY(ΑΠΟΘΗΚΗ_ID_Αποθήκης)
    REFERENCES ΑΠΟΘΗΚΗ(ID_Αποθήκης));


CREATE INDEX ΒΙΒΛΙΟ_FKIndex1 ON ΒΙΒΛΙΟ (ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού);
CREATE INDEX ΒΙΒΛΙΟ_FKIndex2 ON ΒΙΒΛΙΟ (ΑΠΟΘΗΚΗ_ID_Αποθήκης);


CREATE INDEX IFK_Rel_04 ON ΒΙΒΛΙΟ (ΕΚΔΟΤΙΚΟΣ_ΟΙΚΟΣ_ID_Εκδοτικού);
CREATE INDEX IFK_Rel_06 ON ΒΙΒΛΙΟ (ΑΠΟΘΗΚΗ_ID_Αποθήκης);


CREATE TABLE ΒΣ (
  ΒΙΒΛΙΟ_ID_Βιβλίου INTEGER   NOT NULL ,
  ΣΥΓΓΡΑΦΕΑΣ_ID_Συγγραφέα INTEGER   NOT NULL   ,
PRIMARY KEY(ΒΙΒΛΙΟ_ID_Βιβλίου, ΣΥΓΓΡΑΦΕΑΣ_ID_Συγγραφέα)    ,
  FOREIGN KEY(ΒΙΒΛΙΟ_ID_Βιβλίου)
    REFERENCES ΒΙΒΛΙΟ(ID_Βιβλίου),
  FOREIGN KEY(ΣΥΓΓΡΑΦΕΑΣ_ID_Συγγραφέα)
    REFERENCES ΣΥΓΓΡΑΦΕΑΣ(ID_Συγγραφέα));


CREATE INDEX ΒΙΒΛΙΟ_has_ΣΥΓΓΡΑΦΕΑΣ_FKIndex1 ON ΒΣ (ΒΙΒΛΙΟ_ID_Βιβλίου);
CREATE INDEX ΒΙΒΛΙΟ_has_ΣΥΓΓΡΑΦΕΑΣ_FKIndex2 ON ΒΣ (ΣΥΓΓΡΑΦΕΑΣ_ID_Συγγραφέα);


CREATE INDEX IFK_Rel_01 ON ΒΣ (ΒΙΒΛΙΟ_ID_Βιβλίου);
CREATE INDEX IFK_Rel_02 ON ΒΣ (ΣΥΓΓΡΑΦΕΑΣ_ID_Συγγραφέα);


CREATE TABLE ΠΕΡΙΕΧΟΜΕΝΟ_ΚΑΛΑΘΙΟΥ (
  ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_ID_Καλαθιού INTEGER   NOT NULL ,
  ΒΙΒΛΙΟ_ID_Βιβλίου INTEGER   NOT NULL ,
  Αριθμός_βιβλίων INTEGER    ,
  Τελική_τιμή FLOAT      ,
PRIMARY KEY(ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_ID_Καλαθιού, ΒΙΒΛΙΟ_ID_Βιβλίου)    ,
  FOREIGN KEY(ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_ID_Καλαθιού)
    REFERENCES ΚΑΛΑΘΙ_ΑΓΟΡΩΝ(ID_Καλαθιού),
  FOREIGN KEY(ΒΙΒΛΙΟ_ID_Βιβλίου)
    REFERENCES ΒΙΒΛΙΟ(ID_Βιβλίου));


CREATE INDEX ΚΑΛΑΘΙ ΑΓΟΡΩΝ_has_ΒΙΒΛΙΟ_FKIndex1 ON ΠΕΡΙΕΧΟΜΕΝΟ_ΚΑΛΑΘΙΟΥ (ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_ID_Καλαθιού);
CREATE INDEX ΚΑΛΑΘΙ ΑΓΟΡΩΝ_has_ΒΙΒΛΙΟ_FKIndex2 ON ΠΕΡΙΕΧΟΜΕΝΟ_ΚΑΛΑΘΙΟΥ (ΒΙΒΛΙΟ_ID_Βιβλίου);


CREATE INDEX IFK_Rel_08 ON ΠΕΡΙΕΧΟΜΕΝΟ_ΚΑΛΑΘΙΟΥ (ΚΑΛΑΘΙ_ΑΓΟΡΩΝ_ID_Καλαθιού);
CREATE INDEX IFK_Rel_09 ON ΠΕΡΙΕΧΟΜΕΝΟ_ΚΑΛΑΘΙΟΥ (ΒΙΒΛΙΟ_ID_Βιβλίου);



