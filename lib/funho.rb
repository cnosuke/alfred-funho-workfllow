require 'mysql2-cs-bind'
require 'yaml'

class Funho
  DB_CONFIG_PATH = 'config/database.yml'

  class << self
    def db
      @@db ||= Mysql2::Client.new(db_config)
    end

    def db_config
      @@db_config ||= YAML.load_file(DB_CONFIG_PATH)
    end

    def table_name
      db_config['tablename']
    end

    def x(*args)
      new.add_comment(*args)
    end
  end

  def query(*args)
    self.class.db.xquery(*args)
  end

  def add_comment(kind:, comment:, time: Time.now)
    query(
      "INSERT INTO #{self.class.table_name}
        (kind, comment, created_at, updated_at)
       VALUES (?, ?, ?, ?)",
       kind.to_s, comment, time, time
    )
  end

  def initialize
  end
end
