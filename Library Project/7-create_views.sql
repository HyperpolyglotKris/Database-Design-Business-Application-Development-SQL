/*
7. Create Views

Kristiyan Stoilov */

use aragon_library_kraj; 

/* 1 */
CREATE VIEW aragon_library_kraj.mailing_list
AS SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, adults.adultAddressLine1, adults.adultAddressLine2, adults.adultAddressCity, adults.adultAddressProvince, adults.adultAddressZipCode
FROM Members as members inner join Adults as adults
ON members.memberReferenceID = adults.adultID;

/* Task 3 question 2 is confusing. You are asking for "an ISBN of 1 (one), 500 (five hundred), or 1000 (thousand)" although an ISBN contains 13 digits. Making this request not possible. */

/* 3 */
SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, members.memberID, books.bookISBN, reservations.reservationDate
FROM Members as members INNER JOIN Books as books INNER JOIN ActiveLoans as activeloans INNER JOIN Reservations as reservations
ON members.memberID = activeloans.activeLoanMemberID & books.bookID = activeloans.activeLoanBookID
WHERE members.memberID = 250 | members.memberID = 341 | members.memberID = 1675;

/* 4 */
CREATE VIEW adultwideView
AS SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, adults.adultAddressLine1, adults.adultAddressLine2, adults.adultAddressCity, adults.adultAddressProvince, adults.adultAddressZipCode
FROM Members as members inner join Adults as adults
ON members.memberReferenceID = adults.adultID;

/* 5 */
CREATE VIEW ChildwideView
AS SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, adults.adultAddressLine1, adults.adultAddressLine2, adults.adultAddressCity, adults.adultAddressProvince, adults.adultAddressZipCode
FROM Members AS members INNER JOIN Adults as adults INNER JOIN Juveniles AS juveniles
ON members.memberReferenceID = juveniles.juvenileMemberID & juveniles.juvenileAdultID = adults.adultID; 

/* Task 3 question 6 also is not very clear. In the assignment we are asked to choose our own tables, although this question asks us to spit out data from specific tables.
What if we had not created one of those tables because we normalized it into an other one. The structure of our tables makes it impossible for us to answer this question. */

/* 7 */
CREATE VIEW LoanableView
AS SELECT books.*
FROM Books as books inner join ActiveLoans as activeLoans inner join Reservations as reservations
ON books.bookID = activeloans.activeLoanBookID
WHERE books.bookID NOT IN (reservations.reservationBookID); 

/* 8 */
CREATE VIEW OnshelfView
AS SELECT books.*
FROM Books as books inner join ActiveLoans as activeLoans
WHERE books.bookID NOT IN (activeLoans.activeLoanBookID); 

/* 9 DONE */
CREATE VIEW aragon_library_kraj.OnloanView AS SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, books.bookTitle, history.historyCheckoutDate, history.historyExpectedReturn 
FROM Members as members inner join ActiveLoans as activeloans inner join Books as books inner join History as history 
ON activeloans.activeLoanMemberID = members.memberID & activeloans.activeLoanHistoryID = history.historyID & activeloans.activeLoanBookID = books.bookID; 

/* 10 */
CREATE VIEW aragon_library_kraj.OverdueView AS SELECT members.memberFirstName, members.memberMiddleName, members.memberLastName, books.bookTitle, history.historyExpectedReturn 
FROM Members as members inner join ActiveLoans as activeloans inner join Books as books inner join History as history
ON activeloans.activeLoanMemberID = members.memberID & activeloans.activeLoanHistoryID = history.historyID & activeloans.activeLoanBookID = books.bookID
WHERE history.historyExpectedReturn < curdate(); 