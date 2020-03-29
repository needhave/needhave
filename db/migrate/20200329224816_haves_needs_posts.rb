class HavesNeedsPosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :haves, :have_posts
    rename_table :needs, :need_posts
  end
end
