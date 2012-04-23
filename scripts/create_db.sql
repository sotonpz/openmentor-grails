/*create the database */
create database openmentor;
/*grant openmentor users access to this database*/
grant all on openmentor.* to 'openmentor'@'localhost' identified by 'openmentor';