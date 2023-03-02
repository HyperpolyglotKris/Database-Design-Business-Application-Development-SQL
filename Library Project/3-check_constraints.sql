/*
3. Check Constraints

Kristiyan Stoilov */

use aragon_library_kraj;

alter table Adults
    add check (adultPhoneNumber <= 5149999999),
    add check (adultPhoneNumber >= 5140000000); 
    
alter table Books
	add check (LENGTH(BookISBN) = 13);
    
alter table Juveniles
	add check ((select TIMESTAMPDIFF(year,juvenileDateOfBirth, curdate() )) < 6570);
