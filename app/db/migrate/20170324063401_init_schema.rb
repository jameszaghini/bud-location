class InitSchema < ActiveRecord::Migration
  def up

    create_table "buds", force: :cascade do |t|
      t.string   "identifier"
      t.integer  "session_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "locations", force: :cascade do |t|
      t.float    "latitude"
      t.float    "longitude"
      t.float    "accuracy"
      t.integer  "bud_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "sessions", force: :cascade do |t|
      t.string   "platform"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
