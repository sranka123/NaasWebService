--Drop customer_group constraint in notification and customer_group_mapping table
alter table naas_db.notification drop constraint FK_r32efw9dgcchc2beo5na8ailb;
alter table naas_db.customer_group_mapping drop constraint FK_pspj4b07u96bwgfeixhgdf039;

drop table naas_db.customer_group;

RENAME TABLE naas_db.search_query TO naas_db.customer_group;



alter table naas_db.notification DROP FOREIGN KEY FK_r32efw9dgcchc2beo5na8ailb;

alter table naas_db.customer_group_mapping drop FOREIGN KEY FK_pspj4b07u96bwgfeixhgdf039;

drop table naas_db.customer_group;

RENAME TABLE naas_db.search_query TO naas_db.customer_group;

-- Data Migration Required otherwise foreign key constrinst fails
-- Use if required

-- select * from naas_db.notification nf where nf.group_id is not null and not exists(select * from naas_db.customer_group where nf.group_id=id);

-- update naas_db.notification nf set nf.group_id=null where nf.group_id is not null and not exists(select * from naas_db.customer_group where nf.group_id=id);


alter table naas_db.notification ADD FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`id`);
alter table naas_db.customer_group_mapping ADD FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`id`);

-- condition line update
alter table naas_db.condition_line DROP FOREIGN KEY FK66uqagw9vlpipfi2nuaq2i0hk;
ALTER TABLE naas_db.condition_line CHANGE search_query_id group_id bigint(20);
alter table naas_db.condition_line ADD FOREIGN KEY (`group_id`) REFERENCES `customer_group` (`id`);

