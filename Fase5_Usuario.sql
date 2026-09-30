USE master;

CREATE LOGIN CrediAdmin WITH PASSWORD = 'Password_Fuerte2026!';

USE CrediCoreDB;

CREATE USER CrediAdmin FOR LOGIN CrediAdmin;
ALTER ROLE db_owner ADD MEMBER CrediAdmin;
