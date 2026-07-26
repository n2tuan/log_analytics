create table log_raw.locations 
as 
select * 
from read_csv_auto('data/locations.csv')
;