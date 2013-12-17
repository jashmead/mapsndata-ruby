class AddForeignKeyFromMapsToUser < ActiveRecord::Migration
  def up
    keep = " on delete set null on update cascade "
    remove = " on delete cascade on update cascade "
    execute("alter table maps add constraint map2to_user_fk foreign key (user_id) references users (id) #{remove}")
  end
  def down
    execute("alter table maps drop constraint map2to_user_fk foreign key")
  end
end
