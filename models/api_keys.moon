
import Model from require "lapis.db.model"
import generate_key from require "helpers.models"

-- Generated schema dump: (do not edit)
--
-- CREATE TABLE api_keys (
--   user_id integer NOT NULL,
--   key character varying(255) NOT NULL,
--   source character varying(255),
--   actions integer DEFAULT 0 NOT NULL,
--   created_at timestamp without time zone NOT NULL,
--   updated_at timestamp without time zone NOT NULL,
--   comment text
-- );
-- ALTER TABLE ONLY api_keys
--   ADD CONSTRAINT api_keys_pkey PRIMARY KEY (key);
-- CREATE INDEX api_keys_user_id_idx ON api_keys USING btree (user_id);
--
class ApiKeys extends Model
  @primary_key: {"user_id", "key"}
  @timestamp: true

  @relations: {
    {"user", belongs_to: "Users"}
  }

  @generate: (user_id, source) =>
    key = generate_key 40
    @create { :user_id, :key, :source }

  url_key: => @key
