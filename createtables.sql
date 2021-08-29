
create table if not exists owners(
owner_name varchar(20) not null,
owner_wing varchar(1) not null,
flat_number numeric not null,
number_of_slots numeric,
primary key(flat_number,owner_wing)
);
create table if not exists vehicle(
vehicle_type text not null,
plate_number blob not null,
vehicle_model varchar(20),
flat_number numeric not null,
owner_wing varchar(1) not null,
primary key(plate_number),
foreign key (flat_number) references owners,
foreign key (owner_wing) references owners
);
create table if not exists parking_slot(
parking_number numeric,
status varchar(8) not null,
flat_number numeric not null,
owner_wing varchar(1) not null,
primary key(parking_number),
foreign key (flat_number) references owners,
foreign key (owner_wing) references owners
);
create table if not exists visitors(
visitor_name varchar(15) not null, 
visitor_vehicle_type text not null,
visitor_parking_number numeric,
visitor_in time not null,
visitor_out time not null ,
no_of_visitors numeric,
primary key(visitor_name,visitor_parking_number)
);
create table if not exists visiting(
flat_number numeric not null,
owner_wing varchar(1) not null,
visitor_name varchar(15) not null,
visitor_parking_number numeric,
primary key(flat_number,owner_wing,visitor_name,visitor_parking_number),
foreign key (flat_number) references owners,
foreign key (owner_wing) references owners,
foreign key (visitor_name) references visitors,
foreign key (visitor_parking_number) references visitors
);

