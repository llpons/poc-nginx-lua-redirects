CREATE TABLE redirect (
    src_path varchar(1024) PRIMARY KEY,
    dst_path varchar(1024) NOT NULL,
    code smallint NOT NULL DEFAULT 301 CHECK (code >= 300 AND code <= 308)
);

CREATE INDEX IF NOT EXISTS ix_redirect_btree_src_path
    ON redirect USING btree (src_path);

INSERT INTO redirect (src_path, dst_path, code) VALUES
    ('/postgres/test-foo', '/postgres/ok', 301),
    ('/postgres/test-hello', '/postgres/hello.html', DEFAULT)
;
