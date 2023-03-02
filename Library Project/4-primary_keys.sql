/*
4. Primary Keys

Kristiyan Stoilov */

use aragon_library_kraj;

alter table Members
	add primary key (memberID);
	
alter table MembershipTypes
	add primary key (membershipTypeID);
    
alter table Adults
	add primary key (adultID);

alter table Juveniles
	add primary key (juvenileMemberID);

alter table Books
	add primary key (bookID);

alter table ActiveLoans
	add primary key (activeLoanBookID, activeLoanMemberID);

alter table Reservations
	add primary key (reservationBookID, reservationMemberID);

alter table Statistics
	add primary key (statisticID);

alter table History
	add primary key (historyID);