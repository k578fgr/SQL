-- Создать роль для АС Рефлекс
create role dspc_reflex_role_CMDM;

-- Отнять все роли у пользователя DSA_CMDM_APPL
REVOKE dspc_role_CMDM FROM DSA_CMDM_APPL;
REVOKE dspc_read_role_CMDM FROM DSA_CMDM_APPL;

-- Дать роль dspc_reflex_role_CMDM пользователю DSA_CMDM_APPL
grant dspc_reflex_role_CMDM to DSA_CMDM_APPL;
