declare
  granttorole varchar2(254);
  granttoreadrole varchar2(254);
  granttoreflexrole varchar2(254);
begin
	granttorole := 'dspc_role_CMDM';
	granttoreadrole := 'dspc_read_role_CMDM';
	granttoreflexrole := 'dspc_reflex_role_CMDM';
	
	-- Выдать ролям права на таблицы (table)
	for i in (select t.table_name
				from sys.all_tables t
				where t.owner = 'DSPC_CMDM'
				  and NOT (t.table_name like ('DATABASECHANGE%')))
	loop
		-- Выдать права роли dspc_role_CMDM на SELECT, INSERT, UPDATE, DELETE
		execute immediate 'grant SELECT, INSERT, UPDATE, DELETE ON ' || i.table_name || ' to ' || granttorole;
		
		-- Выдать права роли granttoreadrole на SELECT
		execute immediate 'grant SELECT ON ' || i.table_name || ' to ' || granttoreadrole;
	end loop;
	
	-- Выдать всем ролям права на просмотр (SELECT) представлений (View)
	for i in (select t.view_name
				from sys.all_views t
				where t.owner = 'DSPC_CMDM'
				  and NOT (t.view_name like ('DATABASECHANGE%')))
	loop
		execute immediate 'grant SELECT ON ' || i.view_name || ' to ' || granttorole;
		execute immediate 'grant SELECT ON ' || i.view_name || ' to ' || granttoreadrole;
		execute immediate 'grant SELECT ON ' || i.view_name || ' to ' || granttoreflexrole;
	end loop;	
end;
/
