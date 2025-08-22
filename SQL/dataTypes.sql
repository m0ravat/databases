NOTE - These are mySQL oriented, other SQL based ones will have similar syntax but best to refer to documentation or 
https://www.w3schools.com/sql/sql_datatypes.asp

VARCHAR(100) - defines max length 
CHAR(10) - defines fixed length, if input is 7 characters the last 3 will be empty spaces
TINYTEXT - string with max length of 255 characters
MEDIUMTEXT - string with max 16,777,215 characters
TEXT()
LONGTEXT - 4,294,967,295 characters /* use varchar for standard string and TEXT for large texts like blogs/descriptions*/

BOOL/BOOLEAN - 0 is false, rest is true

INT(size)/INTEGER(size) - A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. 
The size parameter specifies the maximum display width (which is 255)

BIGINT(size) - A large integer. Signed range is from -9223372036854775808 to 9223372036854775807. Unsigned range 
is from 0 to 18446744073709551615. 
The size parameter specifies the maximum display width (which is 255)

FLOAT(p) - floating point number that behaves differently in databases based off p, if 0-24 used as float and if 25-53
typically used as another data type. p is precision in bits not characters, used as approximate like for science.

DOUBLE(size, d) - floating point number, **. 
DECIMAL(size, d) - Fixed point number, size - exact size, d - digits after decimal point. max size is 65 max d is 30

/*may also use UNSIGNED/ZEROFILL for numeric values, UNSIGNED stops negative values. ZEROFILL does the same and makes sure 
number is padded with zeroes to fill display width. eg. userID INT(6) means 6 display width not size so 46 ZEROFILL is 000046*/
/*in MYSQL ZEROFILL is depreciated, achieve the above with LPAD(userID, 6, '0')*/

DATE - A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'
DATETIME(fsp) - A date and time combination. Format: YYYY-MM-DD hh:mm:ss. 
The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. 
Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time

TIMESTAMP(fsp) -  Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. 
Automatic initialization and updating to the current date and time can be specified using 
DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition 

TIME(fsp) - A time. Format: hh:mm:ss. The supported range is from '-838:59:59' to '838:59:59'
YEAR - A year in four-digit format. Values allowed in four-digit format: 1901 to 2155, and 0000.
MySQL 8.0 does not support year in two-digit format.
/*fsp is precision for seconds, default is 0. 0-6, 3 is millisecpnds, 6 microseconds.*/


Can INSERT(CURRENT_DATE(), CURRENT_TIME(), NOW()) - for date, time and date/time. 
CURRENT_DATE() + 1 = tomorrow and time in seconds. 






