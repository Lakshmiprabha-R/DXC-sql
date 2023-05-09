Create Database KeepNote

use KeepNote 

-- user table

create Table UserRecords
(
user_id int,
user_name varchar(20),
user_added_date date,
user_password varchar(20),
user_mobile bigint
)

Alter Table UserRecords alter column user_id int not null
Alter Table UserRecords add constraint pk1 primary key(user_id)

Insert into UserRecords values(112233,'Maya','2019-01-02','Maya1214',8012345679),(112244,'Nair','2019-01-12','Welcome',9023778467)

select * from UserRecords

---note table

Create Table NoteRecords
(
note_id int,
note_title varchar(20),
note_content varchar(100),
note_status varchar(20),
note_creation_date date,
user_id int references UserRecords(user_id)
)


select * from NoteRecords
Insert into NoteRecords values(1,'Today Tasks','1.Check emails and reply to them 2.start the pro...','Inprogress','2019-01-21',112233) , (2,'Training to plan','1.Application realted 2.Technical realted','YetToStart','2019-01-31',112244),(3,'Things to have today','1.Fruits 2.More Water','Inprogress','2019-01-25',112244)


-- category table

Create Table CategoryRecords
(
category_id int,
category_name varchar(20),
category_descr varchar(50),
category_creation_date date,
catergory_creator int
)


Insert into CategoryRecords values(1,'Official','Office realted notes','2019-01-21',112233),(2,'Diet','Health related notes','2019-01-24',112244)

select * from CategoryRecords


---remainder table

Create Table ReminderRecords
(
reminder_id int,
reminder_name varchar(20),
reminder_descr varchar(50),
reminder_type varchar(30),
reminder_creation_date date,
reminder_creator int
)


select * from ReminderRecords
Insert into ReminderRecords values(1,'KT reminder','Session on technical queries','Office Reminders','2019-02-12',112233),(2,'personal reminder','pick childern','Personal Reminders','2019-02-14',112244)

--NoteCategory

Alter Table NoteRecords alter column note_id int not null
Alter Table NoteRecords add constraint pk2 primary key(note_id)

Alter Table CategoryRecords alter column category_id int not null
Alter Table CategoryRecords add constraint pk3 primary key(category_id)

Create Table NoteCategory
(
notecategory_id int,
note_id int references NoteRecords(note_id),
category_id int references CategoryRecords(category_id)
)

Insert into NoteCategory values (1,1,1),(2,2,1),(3,3,2) 
select * from NoteCategory


---NoteReminder table

create Table NoteReminder
(
notereminder_id int,
note_id int references NoteRecords(note_id),
reminder_id int references CategoryRecords(category_id)
)

Insert into NoteReminder values (1,3,2),(2,2,1)

select * from NoteReminder

--Query1 Fetch the row from User table with Id=112233 and Password=’Maya1214’.
select * from UserRecords where user_Id = 112233 AND user_Password = 'Maya1214'

--Query2 Fetch all the rows from Note table with note_creation_date=’01/31/2019’.
select * from NoteRecords where note_creation_date ='2019-01-31'

--Query3 Fetch all the Categories created after ‘01/22/2019’.
select * from CategoryRecords where category_creation_date > '2019-01-22'

--Query4 Fetch all category details which belongs to note with note id=1.
select CategoryRecords. * from CategoryRecords INNER JOIN NoteCategory ON note_id = CategoryRecords.category_id where NoteCategory.note_id = 1

--Query5 Fetch all the Notes from the Note table with userId=112244.
select * from NoteRecords where user_id = 112244

--Query6 Fetch all the Notes from the Note table for category_id=1.
select* from NoteRecords inner join CategoryRecords on NoteRecords.note_id= CategoryRecords.category_id where category_id = 1

--Query7 Fetch all the reminder details for note id=2.
select ReminderRecords.* from ReminderRecords inner join NoteReminder on ReminderRecords.reminder_id = NoteReminder.reminder_id where NoteReminder.note_id = 2;

--Query8 Write a query to change the note_status to ‘Completed’ with note Id=3.
update NoteRecords set note_status = 'Completed' where note_id = 3
select * from NoteRecords

--Query9 Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]
 update ReminderRecords set reminder_type='Personal Reminders' from ReminderRecords inner join NoteRecords on reminder_id=note_id
 select * from ReminderRecords

--Query10 Write a query to remove all reminders from Note with note_id=2.

delete ReminderRecords from ReminderRecords inner join NoteRecords on ReminderRecords.reminder_id=NoteRecords.note_id where note_id=2
Select * from NoteReminder