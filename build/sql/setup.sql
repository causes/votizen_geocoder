-- create temporary tables to hold the TIGER/Line data before it's
--   transformed and loaded into the permanent tables.
--
-- this file was made by running 'shp2pgsql -p' on each of the 
--   TIGER/Line shapefiles and then massaging the result by hand.
--
PRAGMA temp_store=MEMORY;
PRAGMA journal_mode=MEMORY;
PRAGMA synchronous=OFF;
PRAGMA cache_size=500000;
PRAGMA count_changes=0;

CREATE TEMPORARY TABLE "tiger_addrfeat" (
"tlid" numeric(10,0),
"aridl" varchar(22),
"aridr" varchar(22),
"linearid" varchar(22),
"fullname" varchar(100),
"lfromhn" varchar(12),
"ltohn" varchar(12),
"rfromhn" varchar(12),
"rtohn" varchar(12),
"zipl" varchar(5),
"zipr" varchar(5),
"edge_mtfcc" varchar(5),
"parityl" varchar(1),
"parityr" varchar(1),
"plus4l" varchar(4),
"plus4r" varchar(4),
"lfromtyp" varchar(1),
"ltotyp" varchar(1),
"rfromtyp" varchar(1),
"rtotyp" varchar(1),
"offsetl" varchar(1),
"offsetr" varchar(1));

CREATE TEMPORARY TABLE "tiger_featnames" (
"tlid" int8,
"fullname" varchar(100),
"name" varchar(100),
"predirabrv" varchar(15),
"pretypabrv" varchar(50),
"prequalabr" varchar(15),
"sufdirabrv" varchar(15),
"suftypabrv" varchar(50),
"sufqualabr" varchar(15),
"predir" varchar(2),
"pretyp" varchar(3),
"prequal" varchar(2),
"sufdir" varchar(2),
"suftyp" varchar(3),
"sufqual" varchar(2),
"linearid" varchar(22),
"mtfcc" varchar(5),
"paflag" varchar(1));
