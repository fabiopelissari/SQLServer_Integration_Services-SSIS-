
Passos para criar o Catálogo SSIS em linha de comando:

1. Habilitar a Integração CLR 
sqlcmd -S SEU_SERVER\SUA_INSTANCIA -Q "sp_configure 'clr enabled', 1; RECONFIGURE;"


2. Criar o Catálogo SSIS (SSISDB)
sqlcmd -S SEU_SERVER\SUA_INSTANCIA -Q "
USE master;
GO
EXEC internal.create_catalog_internal 
    @catalog_name = N'SSISDB', 
    @environment_description = N'Catálogo de Integração de Serviços', 
    @catalog_description = N'SSIS Catalog Database', 
    @catalog_password = N'SUA_SENHA_MESTRA', 
    @catalog_retention_period = 365, 
    @catalog_max_versions = 1000, 
    @catalog_backup_enabled = 1, 
    @catalog_backup_path = N'C:\MSSQL\Backup', 
    @catalog_backup_overwrite = 1, 
    @catalog_backup_frequency = 7, 
    @catalog_backup_time = '23:00',
    @enable_automatic_startup = 1;
GO"

3. Verificar a criação
sqlcmd -S SEU_SERVER\SUA_INSTANCIA -Q "SELECT name FROM sys.databases WHERE name = 'SSISDB'"
