-- Copyright 2004-2023 H2 Group. Multiple-Licensed under the MPL 2.0,
-- and the EPL 1.0 (https://h2database.com/html/license.html).
-- Initial Developer: H2 Group
--

CREATE TABLE TEST(ID BIGINT GENERATED BY DEFAULT AS IDENTITY, V INT);
> ok

INSERT INTO TEST(V) VALUES 10;
> update count: 1

VALUES IDENTITY();
> exception FUNCTION_NOT_FOUND_1

VALUES SCOPE_IDENTITY();
> exception FUNCTION_NOT_FOUND_1

SET MODE LEGACY;
> ok

INSERT INTO TEST(V) VALUES 20;
> update count: 1

VALUES IDENTITY();
>> 2

VALUES SCOPE_IDENTITY();
>> 2

SET MODE REGULAR;
> ok

DROP TABLE TEST;
> ok
