/*
6. Unique Constraints

Kristiyan Stoilov */

use aragon_library_kraj;

alter table Members
	add unique (memberID);
	
alter table MembershipTypes
	add unique (membershipTypeID);
    
alter table Adults
	add unique (adultID);

alter table Juveniles
	add unique (juvenileMemberID);

alter table Books
	add unique (bookID);

alter table ActiveLoans
	add unique (activeLoanBookID, activeLoanMemberID);

alter table Reservations
	add unique (reservationBookID, reservationMemberID);

alter table Statistics
	add unique (statisticID);

alter table History
	add unique (historyID);